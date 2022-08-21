local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local alpha = require("alpha")
local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
  local version = vim.version()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local print_version = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")

  return datetime .. "   " .. total_plugins .. " plugins" .. print_version

end

-- Banner
local banner = {
    [[=================     ===============     ===============   ========  ========]],
    [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
    [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
    [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
    [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
    [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
    [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
    [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
    [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
    [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
    [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
    [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
    [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
    [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
    [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
    [[||.=='    _-'                                                     `' |  /==.||]],
    [[=='    _-'                        N E O V I M                         \/   `==]],
    [[\   _-'                                                                `-_   /]],
    [[ `''                                                                      ``' ]],
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('n', '  > New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('t', '  > File Explorer', ':NvimTreeOpen<CR>' ),
  dashboard.button('f', '  > Find file', ':Telescope.find_files<CR>'),
  dashboard.button("r", '  > Recent', ':Telescope oldfiles<CR>'),
  dashboard.button('s', '  > Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  > Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  > Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)

