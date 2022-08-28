-- includes files in luascript
require('base')
require('highlights')
require('maps')
require('plugins')

-- function return an integer if a condition is met
local has = function(x)
  return vim.fn.has(x) == 1
end

-- uses the has function to determine operating system
local is_unix = has "unix"
local is_mac = has "macunix"
local is_win = has "win32"

-- loads correct config based on said condition
if is_unix then
  require('unix')
end

if is_mac then 
  require('macos')
end

if is_win then
  require('windows')
end
