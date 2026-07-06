/**
 * Generates strudel-core.d.ts global declarations from @strudel/* JSDoc @name tags.
 * Preserves descriptions, @param, and @example text for LSP completion/hover docs.
 * Run via: node generate-types.mjs (after npm ci in this directory).
 */
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const OUT = path.join(__dirname, "strudel-core.d.ts");

const PACKAGES = ["@strudel/core", "@strudel/webaudio", "@strudel/mini", "@strudel/draw"];
const RESERVED = new Set(["constructor", "prototype", "function"]);

/** @typedef {{ description: string, params: { name: string, text: string }[], examples: string[] }} SymbolDoc */

function walk(dir, acc = []) {
  if (!fs.existsSync(dir)) {
    return acc;
  }
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name === "test" || entry.name === "bench" || entry.name === "dist") {
        continue;
      }
      walk(full, acc);
    } else if (/\.(m?js)$/.test(entry.name)) {
      acc.push(full);
    }
  }
  return acc;
}

/**
 * @param {string} block
 * @returns {string[]}
 */
function blockLines(block) {
  return block
    .split("\n")
    .map((line) => line.replace(/^\s*\*\s?/, "").trim());
}

/**
 * @param {string} content
 * @returns {Map<string, SymbolDoc>}
 */
function collectSymbols(content) {
  /** @type {Map<string, SymbolDoc>} */
  const symbols = new Map();
  const re = /\/\*\*([\s\S]*?)\*\//g;
  let match;

  while ((match = re.exec(content)) !== null) {
    const lines = blockLines(match[1]);
    const nameLine = lines.find((line) => /^@name\s+/.test(line));
    if (!nameLine) {
      continue;
    }

    const name = nameLine.replace(/^@name\s+/, "").trim();
    if (!name || RESERVED.has(name)) {
      continue;
    }

    /** @type {SymbolDoc} */
    const doc = { description: "", params: [], examples: [] };
    let inExample = false;
    let exampleLines = [];

    for (const line of lines) {
      if (line.startsWith("@name")) {
        continue;
      }
      if (line.startsWith("@param")) {
        inExample = false;
        const paramMatch = line.match(/^@param\s+(?:\{[^}]*\}\s+)?(\S+)\s+(.*)$/);
        if (paramMatch) {
          doc.params.push({ name: paramMatch[1], text: paramMatch[2].trim() });
        }
        continue;
      }
      if (line.startsWith("@example")) {
        if (inExample && exampleLines.length > 0) {
          doc.examples.push(exampleLines.join("\n").trim());
        }
        inExample = true;
        exampleLines = [];
        continue;
      }
      if (/^@/.test(line)) {
        inExample = false;
        continue;
      }
      if (inExample) {
        exampleLines.push(line);
        continue;
      }
      if (line.length > 0) {
        doc.description = doc.description ? `${doc.description}\n${line}` : line;
      }
    }

    if (inExample && exampleLines.length > 0) {
      doc.examples.push(exampleLines.join("\n").trim());
    }

    const existing = symbols.get(name);
    symbols.set(name, existing ? mergeSymbolDocs(existing, doc) : doc);
  }

  return symbols;
}

/**
 * @param {SymbolDoc} left
 * @param {SymbolDoc} right
 * @returns {SymbolDoc}
 */
function mergeSymbolDocs(left, right) {
  const description =
    left.description.length >= right.description.length ? left.description : right.description;

  /** @type {Map<string, { name: string, text: string }>} */
  const params = new Map();
  for (const param of [...left.params, ...right.params]) {
    if (!params.has(param.name)) {
      params.set(param.name, param);
    }
  }

  const examples = [...left.examples];
  for (const example of right.examples) {
    if (!examples.includes(example)) {
      examples.push(example);
    }
  }

  return {
    description,
    params: [...params.values()],
    examples,
  };
}

/**
 * @param {string} name
 * @param {SymbolDoc} doc
 * @returns {string}
 */
function formatTsDoc(name, doc) {
  if (!doc.description && doc.params.length === 0 && doc.examples.length === 0) {
    return "";
  }

  const lines = ["/**"];
  if (doc.description) {
    for (const line of doc.description.split("\n")) {
      lines.push(` * ${line}`);
    }
  }
  lines.push(` * @name ${name}`);
  for (const param of doc.params) {
    lines.push(` * @param ${param.name} ${param.text}`);
  }
  for (const example of doc.examples) {
    lines.push(" * @example");
    for (const line of example.split("\n")) {
      lines.push(` * ${line}`);
    }
  }
  lines.push(" */");
  return lines.join("\n");
}

/** @type {Map<string, SymbolDoc>} */
const symbols = new Map();
const files = [];

for (const pkg of PACKAGES) {
  walk(path.join(__dirname, "node_modules", pkg), files);
}

if (files.length === 0) {
  console.error("No @strudel sources found. Run npm ci in strudel/lsp first.");
  process.exit(1);
}

for (const file of files) {
  const content = fs.readFileSync(file, "utf8");
  for (const [name, doc] of collectSymbols(content)) {
    const existing = symbols.get(name);
    symbols.set(name, existing ? mergeSymbolDocs(existing, doc) : doc);
  }
}

const names = [...symbols.keys()].sort();
const header = `// Generated by generate-types.mjs from @strudel/* JSDoc @name tags.
// Regenerate: :StrudelLspBuild (or npm run generate in strudel/lsp via Nix).
// Based on https://github.com/gruvw/strudel.nvim/pull/11

`;

const methods = names
  .map((name) => {
    const doc = formatTsDoc(name, symbols.get(name));
    const body = `  ${name}(...args: any[]): Pattern;`;
    return doc ? `${doc}\n${body}` : body;
  })
  .join("\n");

const globals = names
  .map((name) => {
    const doc = formatTsDoc(name, symbols.get(name));
    const body = `declare function ${name}(...args: any[]): Pattern;`;
    return doc ? `${doc}\n${body}` : body;
  })
  .join("\n\n");

const aliases = `
/** Alias for \`s\` — sample playback. */
declare function sound(...args: any[]): Pattern;
`;

const body = `declare class Pattern {
${methods}
}

${globals}
${aliases}`;

fs.writeFileSync(OUT, header + body);
console.log(`Wrote ${OUT} (${names.length} Strudel symbols)`);
