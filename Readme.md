# codestats.nvim

A [CodeStats.net](https://codestats.net/) client written for [NeoVIM](https://github.com/neovim/neovim) in LUA.

## Preqrequisites

This plugin is only available for NeoVIM with LUA support (version 0.5 and above).

## Installation

### Packer

```lua
-- Until https://github.com/nvim-lua/plenary.nvim/pull/167 got merged into plenary
use {
    'YannickFricke/plenary.nvim',
    branch = "patch-1"
}

-- Initialize with explicit token
use {
    'YannickFricke/codestats.nvim',
    rocks = "lunajson",
    config = function()
        require('codestats-nvim').setup({
            token = "MY-CODESTATS-MACHINE-TOKEN"
        })
    end,
    -- Comment the next line in, when the pull request got merged
    -- requires = {{'nvim-lua/plenary.nvim'}}

}

-- Initialize via the CODESTATS_API_KEY environment variable
use {
    'YannickFricke/codestats.nvim',
    rocks = "lunajson",
    config = function()
        require('codestats-nvim').setup()
    end,
    -- Comment the next line in, when the pull request got merged
    -- requires = {{'nvim-lua/plenary.nvim'}}
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
