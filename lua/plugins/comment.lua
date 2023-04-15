return {
  "numToStr/Comment.nvim",
  keys = {
    "gc",
    "gb",
  },
  config = function (_, opts)
    require('Comment').setup()
  end
}
