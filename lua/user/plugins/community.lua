return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  
  -- 添加各种编程语言支持
  -- ts,js
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.vue"},
  -- go
  { import = "astrocommunity.pack.go" },
  -- rust
  { import = "astrocommunity.pack.rust" },
  -- python
  {import = "astrocommunity.pack.python"},
  -- markdown
  { import = "astrocommunity.pack.markdown" },
  -- yaml
  { import = "astrocommunity.pack.yaml" },

  -- 添加主题配色插件
  -- nord主题
  {import = "astrocommunity.colorscheme.nord-nvim"},
  -- tokyonight 主题
  {import = "astrocommunity.colorscheme.tokyonight-nvim"},
}
