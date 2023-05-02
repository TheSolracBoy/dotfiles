local present, _ = pcall(require, "harpoon")
local wk_present, wk = pcall(require, "which-key")
if not present or not wk_present then
  return
end

wk.register({
  h = {
    name = "harpoon", -- optional group name
    h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Harpoon" }, -- create a binding with label
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Mark file to harpoon" },

    q = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Go to mark 1" },
    w = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Go to mark 2" },

    e = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Go to mark 3" },

    r = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Go to mark 4" },

    u = { "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Go to mark 5" },

    i = { "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", "Go to mark 6" },

    j = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Go to prev mark" },

    k = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Go to next mark", },
  },
}, { prefix = "<leader>" })
