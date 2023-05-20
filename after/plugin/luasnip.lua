local ls = require("luasnip")
ls.config.set_config({
  history = true, --keep around last snippet local to jump back
  updateevents = "TextChanged,TextChangedI", --update changes as you type
  enable_autosnippets = true,
}) --}}}

require("luasnip.loaders.from_lua").load(
  { paths = "C:/Users/jithu/AppData/Local/nvim/LuaSnip" })

vim.keymap.set({"i","s"},"<c-j>",function ()
  if ls.expand_or_jumpable then
    ls.expand_or_jump()
  end
end,{silent = true})


vim.keymap.set({"i","s"},"<c-k>",function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end,{silent = true})

vim.keymap.set({"i","s"},"<c-l>",function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end,{silent = true})
