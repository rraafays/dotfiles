return {
  "artemave/workspace-diagnostics.nvim",
  config = function(_)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        local bufnr = args.buf
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
      end,
    })
  end,
}
