# AGENTS.md

Personal Neovim config: fork of kickstart.nvim managed by lazy.nvim. No build/tests — verify changes by loading the config, not by hunting for test scripts.

## Layout

- `init.lua` — entry point: base options/keymaps, lazy.nvim bootstrap, then imports three spec dirs: `custom.plugins`, `custom.themes`, `kickstart.plugins`.
- `lua/custom/plugins/*.lua` — one lazy.nvim spec (`return { ... }`) per personal plugin. Files are auto-imported: to add a plugin, create a new file here; nothing is registered in `init.lua` and the spec dirs have no `init.lua`.
- `lua/custom/themes/` — colorscheme specs.
- `lua/kickstart/` — vendored upstream kickstart modules, but they have been modified locally (e.g. the `servers` table in `plugins/lsp-config.lua`); don't assume they match upstream or pull cleanly from it.
- Disabled plugins are toggled in place with `enabled = false` in their spec file (e.g. `lua/custom/plugins/copilot.lua`; Supermaven is the active inline completion).

## Verifying changes

- `nvim --headless +qa` — exits 0 without error messages when the config loads cleanly.
- `:checkhealth kickstart` — checks nvim >= 0.10 and `git`, `make`, `unzip`, `rg` on PATH.
- After changing plugin specs: `nvim --headless "+Lazy! sync" +qa` (first run also bootstraps lazy.nvim itself).
- Format with `stylua .`; `.stylua.toml` sets single quotes, 2-space indent, no call parens, width 160. conform.nvim autoformats on save (Lua uses stylua).

## Gotchas

- Mason installs every LSP server/tool automatically on startup (`mason-tool-installer` in `lua/kickstart/plugins/lsp-config.lua`) — first launches can download packages. The `servers` table in that file is applied via `vim.lsp.config` + `vim.lsp.enable` (the old mason-lspconfig `handlers` API is silently ignored by the pinned v2.x — don't reintroduce it).
- Java: jdtls is started manually by `lua/custom/plugins/jdtls.lua`, not via lspconfig. It wires java-debug-adapter/java-test bundles from Mason and `jdtls.dap.setup_dap()` registers the nvim-dap `java` adapter; main-class launch configs are auto-discovered by `dap.continue` (F5). Python/Go DAP lives in `lua/kickstart/plugins/debug.lua`.
- Colorscheme is tokyonight-storm, applied in `lua/custom/themes/tokyonight.lua` and hardcoded in `lua/custom/plugins/lualine.lua`. The README still says onedark — stale, trust the theme files.
- `lazy-lock.json` and `.luarc.json` are gitignored (local-only pins / LSP settings); their changes won't show in `git status`.
- `vim.g.python3_host_prog` is hardcoded to `/usr/bin/python3` in `init.lua`.
- Leader is `<Space>` (also localleader); most keymaps live in the plugin spec files, not `init.lua`.
