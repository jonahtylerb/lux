# Neovim Lux

## Screenshots

![dark](screenshots/dark.png)

## Commands

To apply the colorscheme, you can call `require('lux').colorscheme()` from lua or use `:colorscheme lux` command.

## Configuration

To configure the plugin, you can call `require('lux').setup(values)`, where `values` is a dictionary with the parameters you want to override. Here are the defaults:

```lua
require('lux').setup({
    terminal = true, -- Set to `false` to let terminal manage its own colors.
    overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
```

Alternatively, `overrides` can be a function that returns a dictionary of the same format. You can use the function to override based on a dynamic condition, such as the value of `'background'`.

Colorscheme also provides a theme for [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim). You can set in `setup` lualine:

```lua
require('lualine').setup({
  options = {
    theme = 'lux',
  },
})
```

### Overrides examples

#### Transparency

```lua
require('lux').setup({
    overrides = {
        Normal = { bg = "None" },
        NormalFloat = { bg = "none" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },
    },
})
```

**Tip:** You can use `:source $VIMRUNTIME/syntax/hitest.vim` to see all highlighting groups.

#### Re-use colors from the colorscheme

```lua
local colors = require('lux.colors')
colors.generate()

require('lux').setup({
  overrides = {
    IncSearch = { fg = colors.fg }
  }
})
```

**Tip:** You can use `:lua print(vim.inspect(require('lux.colors')))` command to check all available colors.

#### Set background color of non-active windows for both light and dark backgrounds

In this case you need to use a function to dynamically generate colors:

```lua
require('lux').setup({
  overrides = function()
    return { NormalNC = {bg = '#0f151e', fg = '#808080'} }
  end
})
```

#### Disable _italic_ for comments

```lua
local colors = require('lux.colors')
colors.generate()

require('lux').setup({
  overrides = function()
    return { Comment = { fg = colors.comment } }
  end
})
```
