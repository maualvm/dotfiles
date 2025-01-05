local keys = {
  {
    "<leader>h",
    function()
      local harpoon = require("harpoon")
      local telescope_config = require("telescope.config").values
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
          previewer = telescope_config.file_previewer({}),
          sorter = telescope_config.generic_sorter({}),
        }):find()
      end
      toggle_telescope(harpoon:list())
    end,
    desc = "Toggle harpoon quick menu",
  },
  { "<leader>a",  function() require("harpoon"):list():append() end, desc = "Append file to harpoon", },
  { "<c-h><c-u>", function() require("harpoon"):list():next() end,   desc = "Go to next item in list" },
  { "<c-h><c-d>", function() require("harpoon"):list():prev() end,   desc = "Go to previous item in list" },
  { "<leader>da", function() require("harpoon"):list():clear() end,  desc = "Delete all items from list" },
}

for i = 1, 9 do
  table.insert(keys,
    { "<leader>" .. i, function() require("harpoon"):list():select(i) end, desc = "Set file to item " .. i })
  table.insert(keys,
    { "<leader>d" .. i, function() require("harpoon"):list():removeAt(i) end, desc = "Delete item " .. i .. " from list" })
end


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
  keys = keys,
}
