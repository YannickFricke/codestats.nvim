# codestats.nvim

A [CodeStats.net](https://codestats.net/) client written for [NeoVIM](https://github.com/neovim/neovim) in LUA.

## Preqrequisites

This plugin is only available for NeoVIM with LUA support (version 0.5 and above).

## Installation

### Packer

```lua
-- Initialize with explicit token
use {
    'YannickFricke/codestats.nvim',
    rocks = "lunajson",
    config = function()
        require('codestats-nvim').setup({
            token = "MY-CODESTATS-MACHINE-TOKEN"
        })
    end,
    requires = {{'nvim-lua/plenary.nvim'}}
}

-- Initialize via the CODESTATS_API_KEY environment variable
use {
    'YannickFricke/codestats.nvim',
    rocks = "lunajson",
    config = function()
        require('codestats-nvim').setup()
    end,
    requires = {{'nvim-lua/plenary.nvim'}}
}
```

## Defaults

```lua
require('codestats-nvim').setup({
    token = nil, -- When the token is not provided, codestats.nvim will fallback to the CODESTATS_API_KEY environment variable
    endpoint = "https://codestats.net", -- The endpoint which should be used. Mostly you dont want to overwrite it
    interval = 60, -- The interval in seconds between pushes to the CodeStats API
})
```

## FAQ

### Getting the filetype of the current buffer

```vim
:lua print(vim.bo.filetype)
```

The filetype will then be printed at the bottom left side.

### The plugin doesn't detect the correct language

Every known filetype which maps to the correct language are defined in `./lua/codestats-nvim/filetypes.lua` in the `mapped_filetypes` variable.

To get the filetype of the current buffer see [Getting the filetype of the current buffer](#getting-the-filetype-of-the-current-buffer).

Feel free to send a pull request to make your alias available to everyone else!

Beware: I won't merge pull request with wrong mappings.
For example `vimwiki` maps the `markdown` to `vimwiki` (which is absolutely wrong)

Otherwise you have the possibility to remap existing languages in Code::Stats itself.

1. Go to your [preferences](https://codestats.net/my/preferences)
2. Click on `Language aliases`
3. Follow the instructions on the page

### The plugin sends XP where it shouldn't

All filetypes which should be ignored are defined in `./lua/codestats-nvim/filetypes.lua` in the `ignored_filetypes` variable.

To get the filetype of the current buffer see [Getting the filetype of the current buffer](#getting-the-filetype-of-the-current-buffer).

### The plugin doesn't count deletions

Yes this is a serious thing. Currently I didn't found a nice way to detect deletions.

Sadly the `autocmd`s don't offer an event way to detect single deletions.
