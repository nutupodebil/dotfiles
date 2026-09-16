local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "c",
          "cpp",
          "css",
        },
      },
    },
    {
      "Senal-D-A-Gunaratna/matugen.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        palette_path = "~/.cache/matugen/nvim-colors.json",
        -- load_theme = false,
      },
    },

    {
      "nvim-lualine/lualine.nvim",
      opts = function(_, opts)
        local palette_path = vim.fn.expand("~/.cache/matugen/nvim-colors.json")

        local f = io.open(palette_path, "r")
        if not f then
          return opts
        end
        local content = f:read("*a")
        f:close()
        local ok, c = pcall(vim.json.decode, content)
        if not ok or not c then
          return opts
        end
        c = c.colors or c.palette or c

        -- Секция со всеми шестью подсекциями a..z, чтобы ни одна не тянулась
        -- из fallback-темы lualine (именно там и жил голубой).
        local function section(a_bg, a_fg)
          return {
            a = { bg = a_bg, fg = a_fg, gui = "bold" },
            b = { bg = c.surface_container, fg = c.on_surface_variant },
            c = { bg = "NONE", fg = c.outline }, -- прозрачная середина
            z = { bg = a_bg, fg = a_fg, gui = "bold" },
            y = { bg = c.surface_container, fg = c.on_surface_variant },
            x = { bg = "NONE", fg = c.outline },
          }
        end

        opts.options = opts.options or {}
        opts.options.theme = {
          normal = section(c.primary, c.on_primary),
          insert = section(c.tertiary, c.on_primary),
          visual = section(c.secondary, c.on_primary),
          replace = section(c.error, c.surface),
          command = section(c.secondary_container, c.on_primary),
          inactive = {
            a = { bg = c.surface_container, fg = c.on_surface_variant },
            b = { bg = c.surface_container, fg = c.on_surface_variant },
            c = { bg = "NONE", fg = c.on_surface_variant },
            x = { bg = c.surface_container, fg = c.on_surface_variant },
            y = { bg = c.surface_container, fg = c.on_surface_variant },
            z = { bg = c.surface_container, fg = c.on_surface_variant },
          },
        }

        local filetype_idx = nil
        for i, sect in ipairs(opts.sections.lualine_c) do
          if type(sect) == "table" and sect[1] == "filetype" then
            filetype_idx = i
            break
          end
        end
        if filetype_idx then
          opts.sections.lualine_c[filetype_idx].colored = false
        end

        return opts
      end,

      init = function()
        local palette_path = vim.fn.expand("~/.cache/matugen/nvim-colors.json")

        local function load_palette()
          local f = io.open(palette_path, "r")
          if not f then
            return nil
          end
          local content = f:read("*a")
          f:close()
          local ok, c = pcall(vim.json.decode, content)
          if not ok or not c then
            return nil
          end
          return c.colors or c.palette or c
        end

        -- Точная копия шаблона matugen.nvim/lua/matugen/templates/lualine.lua
        -- + перекраска StatusLine, чтобы убрать голубую подложку.
        local function apply_matugen()
          local c = load_palette()
          if not c then
            return
          end

          -- Группы ровно как в шаблоне matugen.nvim
          vim.api.nvim_set_hl(0, "lualine_a_normal", { fg = c.on_primary, bg = c.primary, bold = true })
          vim.api.nvim_set_hl(0, "lualine_a_insert", { fg = c.on_primary, bg = c.tertiary, bold = true })
          vim.api.nvim_set_hl(0, "lualine_a_visual", { fg = c.on_primary, bg = c.secondary, bold = true })
          vim.api.nvim_set_hl(0, "lualine_a_replace", { fg = c.surface, bg = c.error, bold = true })
          vim.api.nvim_set_hl(0, "lualine_a_command", { fg = c.on_primary, bg = c.secondary_container, bold = true })
          vim.api.nvim_set_hl(0, "lualine_b_normal", { fg = c.on_surface_variant, bg = c.surface_container })
          vim.api.nvim_set_hl(0, "lualine_c_normal", { fg = c.outline, bg = nil })
          vim.api.nvim_set_hl(0, "lualine_b_diagnostics_error", { fg = c.error, bg = c.surface_container })
          vim.api.nvim_set_hl(0, "lualine_b_diagnostics_warn", { fg = c.tertiary, bg = c.surface_container })
          vim.api.nvim_set_hl(0, "lualine_b_diagnostics_info", { fg = c.secondary, bg = c.surface_container })
          vim.api.nvim_set_hl(0, "lualine_b_diagnostics_hint", { fg = c.primary, bg = c.surface_container })

          -- StatusLine — фон surface вместо голубого
          vim.api.nvim_set_hl(0, "StatusLine", { bg = c.surface, fg = c.on_surface })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = c.surface_container, fg = c.on_surface_variant })

          -- Приводим все пронумерованные компоненты секции c
          -- (lualine_c_2_normal, lualine_c_6_normal, lualine_c_12_normal и т.д.)
          -- к тому же виду, что и lualine_c_normal: прозрачный фон, цвет outline.
          for i = 1, 30 do
            for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
              local group = string.format("lualine_c_%d_%s", i, mode)
              if vim.fn.hlexists(group) == 1 then
                vim.api.nvim_set_hl(0, group, { fg = c.outline, bg = nil })
              end
            end
          end
        end

        vim.api.nvim_create_autocmd("User", {
          pattern = "VeryLazy",
          once = true,
          callback = function()
            vim.defer_fn(apply_matugen, 200)
          end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
          callback = function()
            vim.defer_fn(apply_matugen, 200)
          end,
        })

        vim.api.nvim_create_autocmd("Signal", {
          pattern = "SIGUSR1",
          callback = function()
            vim.schedule(function()
              vim.defer_fn(apply_matugen, 300)
            end)
          end,
        })
      end,
    },
  },

  --

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
