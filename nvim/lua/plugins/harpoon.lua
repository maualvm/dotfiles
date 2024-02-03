return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>a",  function() require("harpoon"):list():append() end,    desc = "Append file to harpoon", },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          }):find()
        end
        toggle_telescope(harpoon:list())
      end,
      desc = "Toggle harpoon quick menu",
    },
    { "<leader>1",  function() require("harpoon"):list():select(1) end,   desc = "Set file to item 1" },
    { "<leader>2",  function() require("harpoon"):list():select(2) end,   desc = "Set file to item 2" },
    { "<leader>3",  function() require("harpoon"):list():select(3) end,   desc = "Set file to item 3" },
    { "<leader>4",  function() require("harpoon"):list():select(4) end,   desc = "Set file to item 4" },
    { "<leader>5",  function() require("harpoon"):list():select(5) end,   desc = "Set file to item 5" },
    { "<leader>d1", function() require("harpoon"):list():removeAt(1) end, desc = "Delete item 1 from list" },
    { "<leader>d2", function() require("harpoon"):list():removeAt(2) end, desc = "Delete item 2 from list" },
    { "<leader>d3", function() require("harpoon"):list():removeAt(3) end, desc = "Delete item 3 from list" },
    { "<leader>d4", function() require("harpoon"):list():removeAt(4) end, desc = "Delete item 4 from list" },
    { "<leader>d5", function() require("harpoon"):list():removeAt(5) end, desc = "Delete item 5 from list" },
    { "<leader>dc", function() require("harpoon"):list():remove() end,    desc = "Delete current file from list" },
  }
}
