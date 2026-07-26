return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function(plugin)
    local install_script = plugin.dir .. "/app/install.sh"
    local output = vim.fn.system({ install_script })

    if vim.v.shell_error ~= 0 then
      error(output)
    end
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
