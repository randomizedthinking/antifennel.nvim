# antifennel.nvim

This plugin is an extension of [aniseed](https://github.com/Olical/aniseed), and
it uses [antifennel](https://github.com/rgeorgiev/antifennel) to make
conversions between Fennel and lua.

## Usage

Two keybindings are provided:

-   `<C-c><C-l>`: Convert Fennel to Lua (in a Fennel buffer).
-   `<C-c><C-f>`: Convert Lua to Fennel (in a Lua buffer).

The results are displayed in a floating window. Press `q` or `<ESC>` to close the window.

**Note:** The keymaps are only set for buffers with filetype `lua` or `fennel` and are not configurable.

## Commands

The plugin provides two commands:

- `:AniseedAntifennelBuffer`: Convert Lua to Fennel.
- `:AniseedAntiluaBuffer`: Convert Fennel to Lua.

## License

MIT

