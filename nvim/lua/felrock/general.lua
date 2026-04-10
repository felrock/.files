-- COLOR SETTINGS
vim.cmd [[
  try
    colorscheme tokyonight-moon
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

if not vim.env.DISPLAY and not vim.env.WAYLAND_DISPLAY then
  local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")
  if ok then
    local function paste(reg)
      return function()
        return vim.fn.getreg(reg), vim.fn.getregtype(reg)
      end
    end

    vim.g.clipboard = {
      name = "OSC52",
      copy = {
        ["+"] = osc52.copy("+"),
        ["*"] = osc52.copy("*"),
      },
      paste = {
        ["+"] = paste("+"),
        ["*"] = paste("*"),
      },
    }
  end
end
