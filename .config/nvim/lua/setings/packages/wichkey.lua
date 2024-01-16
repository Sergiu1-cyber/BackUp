local wk = require("which-key")

wk.register({

  ["<leader>"] = {
    f = {
      name = "find",
      f = {"file"},
      d = {"string"},
      g = {"from git"},
      r = {"string grep"},
      t = {"tags"},
    },
    q = {"quit"},
    u = {"istoria"},
    a = {"harpon add"},
    h = {"harpon togle"},
    ["1"] = {"har. 1"},
    ["2"] = {"har. 2"},
    ["3"] = {"har. 3"},
    ["4"] = {"har. 4"},
  },

})
