if not vim.fn.has("win32") then
  return {}
end

return {
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
