return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local ignore = { "^node_modules/", "^.git/", "^.terraform/" }

    fzf.setup({
      { "default" },
      file_ignore_patterns = ignore,
      defaults = {
        formatter = "path.dirname_first",
      },
      oldfiles = {
        cwd_only = true,
        stat_file = true,
        include_current_session = true,
      },
      files = {
        cwd_prompt = false,
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
      },
      grep = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
      },
    })
    fzf.register_ui_select()
  end,
  keys = {
    {
      "<leader>sh",
      function()
        require("fzf-lua").help_tags({ resume = true })
      end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>sk",
      function()
        require("fzf-lua").keymaps({ resume = true })
      end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>sf",
      function()
        require("fzf-lua").files({
          resume = true,
          git_icons = false,
          file_icons = false,
          no_headers_i = true,
          winopts = {
            preview = { hidden = "hidden" },
          },
        })
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sg",
      function()
        require("fzf-lua").live_grep_glob({ resume = true })
      end,
      desc = "[S]earch [G]rep",
    },
    {
      "<leader>sr",
      function()
        require("fzf-lua").live_grep_resume({ resume = true })
      end,
      desc = "[S]earch Resume",
    },
    {
      "<leader>s.",
      function()
        require("fzf-lua").oldfiles({
          resume = true,
          file_icons = false,
          no_header_i = true,
          winopts = {
            preview = { hidden = "hidden" },
          },
        })
      end,
      desc = "[S]earch Recent Files",
    },
    {
      "<leader>sw",
      function()
        require("fzf-lua").grep_cWORD({ resume = true })
      end,
      desc = "[S]earch [W]ord",
    },
    {
      "<leader>sC",
      function()
        require("fzf-lua").colorschemes({ resume = true })
      end,
      desc = "[S]earch [C]olorschemes",
    },
    {
      "<leader>sc",
      function()
        require("fzf-lua").commands({ resume = true })
      end,
      desc = "[S]earch [C]ommands",
    },
    {
      "<leader><leader>",
      function()
        require("fzf-lua").buffers({
          resume = true,
          git_icons = false,
          file_icons = false,
          no_header_i = true,
          winopts = {
            preview = { hidden = "hidden" },
          },
        })
      end,
      desc = "[S]earch Buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").grep_curbuf({ resume = true })
      end,
      desc = "Search current [b]uffer",
    },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches({
          resume = true,
          cmd = "git branch --color",
        })
      end,
      desc = "Change [G]it branch",
    },
  },
}
