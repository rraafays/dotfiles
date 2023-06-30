local status, colorizer = pcall(require, 'colorizer')
if (not status) then return end

if os.getenv("DISPLAY") ~= nil then
    colorizer.setup( { '*'; }, { mode = 'foreground' })
end
