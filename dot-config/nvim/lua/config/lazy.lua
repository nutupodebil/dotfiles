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

local lualine_opts_ref = nil
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

        -- Читаем палитру. Если JSON ещё не дописан matugen'ом — вернём nil.
        local function load_palette()
          local f = io.open(palette_path, "r")
          if not f then
            return nil
          end
          local content = f:read("*a")
          f:close()
          if not content or #content == 0 then
            return nil
          end
          local ok, c = pcall(vim.json.decode, content)
          if not ok or not c then
            return nil
          end
          c = c.colors or c.palette or c
          -- Валидация: без этих ключей тема бессмысленна
          if not (c.surface and c.primary and c.on_primary) then
            return nil
          end
          return c
        end

        -- Строим таблицу темы. Используется и в opts, и в init.
        local function build_theme(c)
          local function section(a_bg, a_fg)
            return {
              a = { bg = a_bg, fg = a_fg, gui = "bold" },
              b = { bg = c.surface_container, fg = c.on_surface_variant },
              c = { bg = "NONE", fg = c.outline },
              x = { bg = "NONE", fg = c.outline },
              y = { bg = c.surface_container, fg = c.on_surface_variant },
              z = { bg = c.surface_container, fg = c.on_surface_variant },
            }
          end
          return {
            normal = section(c.primary, c.on_primary),
            insert = section(c.tertiary, c.on_primary),
            visual = section(c.secondary, c.on_primary),
            replace = section(c.error, c.surface),
            command = section(c.secondary_container, c.on_primary),
            inactive = {
              a = { bg = c.surface_container, fg = c.on_surface_variant },
              b = { bg = c.surface_container, fg = c.on_surface_variant },
              c = { bg = "NONE", fg = c.on_surface_variant },
              x = { bg = "NONE", fg = c.on_surface_variant },
              y = { bg = c.surface_container, fg = c.on_surface_variant },
              z = { bg = c.surface_container, fg = c.on_surface_variant },
            },
          }
        end

        -- Первичная установка темы при старте
        opts.options = opts.options or {}
        local c = load_palette()
        if c then
          opts.options.theme = build_theme(c)
        end

        -- Отключаем раскраску filetype в секции c (как было у вас)
        for i, sect in ipairs(opts.sections.lualine_c) do
          if type(sect) == "table" and sect[1] == "filetype" then
            opts.sections.lualine_c[i].colored = false
            break
          end
        end

        -- Сохраняем opts, чтобы init мог их переиспользовать
        lualine_opts_ref = opts
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
          if not content or #content == 0 then
            return nil
          end
          local ok, c = pcall(vim.json.decode, content)
          if not ok or not c then
            return nil
          end
          c = c.colors or c.palette or c
          if not (c.surface and c.primary and c.on_primary) then
            return nil
          end
          return c
        end

        local function build_theme(c)
          local function section(a_bg, a_fg)
            return {
              a = { bg = a_bg, fg = a_fg, gui = "bold" },
              b = { bg = c.surface_container, fg = c.on_surface_variant },
              c = { bg = "NONE", fg = c.outline },
              x = { bg = "NONE", fg = c.outline },
              y = { bg = c.surface_container, fg = c.on_surface_variant },
              z = { bg = a_bg, fg = a_fg, gui = "bold" },
            }
          end
          return {
            normal = section(c.primary, c.on_primary),
            insert = section(c.tertiary, c.on_primary),
            visual = section(c.secondary, c.on_primary),
            replace = section(c.error, c.surface),
            command = section(c.secondary_container, c.on_primary),
            inactive = {
              a = { bg = c.surface_container, fg = c.on_surface_variant },
              b = { bg = c.surface_container, fg = c.on_surface_variant },
              c = { bg = "NONE", fg = c.on_surface_variant },
              x = { bg = "NONE", fg = c.on_surface_variant },
              y = { bg = c.surface_container, fg = c.on_surface_variant },
              z = { bg = c.surface_container, fg = c.on_surface_variant },
            },
          }
        end

        -- Прямая установка highlight-групп (копия шаблона matugen.nvim
        -- + перекраска StatusLine и пронумерованных компонентов секции c).
        local function apply_matugen(c)
          c = c or load_palette()
          if not c then
            return
          end

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

          vim.api.nvim_set_hl(0, "StatusLine", { bg = c.surface, fg = c.on_surface })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = c.surface_container, fg = c.on_surface_variant })

          for i = 1, 30 do
            for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
              local group = string.format("lualine_c_%d_%s", i, mode)
              if vim.fn.hlexists(group) == 1 then
                vim.api.nvim_set_hl(0, group, { fg = c.outline, bg = nil })
              end
            end
          end

          for i = 1, 30 do
            for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
              local group = string.format("lualine_x_%d_%s", i, mode)
              if vim.fn.hlexists(group) == 1 then
                vim.api.nvim_set_hl(0, group, { fg = c.outline, bg = nil })
              end
            end
          end
        end

        -- Полный цикл обновления: пересобираем тему, пере-вызываем setup(),
        -- заново ставим группы. Всё это — поверх того, что сделал matugen.nvim.
        local function full_refresh()
          local c = load_palette()
          if not c then
            return
          end

          if lualine_opts_ref then
            lualine_opts_ref.options = lualine_opts_ref.options or {}
            lualine_opts_ref.options.theme = build_theme(c)
            pcall(function()
              require("lualine").setup(lualine_opts_ref)
            end)
          end

          apply_matugen(c)

          -- Пинаем перерисовку статусной строки
          pcall(function()
            require("lualine").refresh()
          end)
        end

        -- Многократный запуск с разными задержками:
        -- 150 мс — обычно уже после matugen.nvim,
        -- 400 мс — на случай, если файл ещё писался,
        -- 800 мс — «страховочный» прогон, покрывающий редкие гонки.
        local function schedule_refresh()
          vim.defer_fn(full_refresh, 150)
          vim.defer_fn(full_refresh, 400)
          vim.defer_fn(full_refresh, 800)
        end

        vim.api.nvim_create_autocmd("User", {
          pattern = "VeryLazy",
          once = true,
          callback = function()
            vim.defer_fn(full_refresh, 300)
          end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
          callback = schedule_refresh,
        })

        vim.api.nvim_create_autocmd("Signal", {
          pattern = "SIGUSR1",
          callback = function()
            vim.schedule(schedule_refresh)
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
