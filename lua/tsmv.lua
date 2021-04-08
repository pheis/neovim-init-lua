local ts_utils = require 'nvim-treesitter.ts_utils'

local M = {}

function M.get_root_node()
  parser = vim.treesitter.get_parser(0)
  tstree = parser:parse()

  local root_node = tstree[1]:root()

  return root_node
end


function get_import_strings(root_node)
  local nodes = {}
  for node in root_node:iter_children() do
    if node:type() == 'import_statement' then
      for child_node in node:iter_children() do
        if child_node:type() == 'string' then
          local str = get_node_text(child_node)
          print(str)
        end
      end
    end
end


function M.print_node_types()
  local root_node = M.get_root_node()
  for node in root_node:iter_children() do
    if node:type() == 'import_statement' then

      for n in node:iter_children() do

        if n:type() == 'string' then

          local str = get_node_text(node)

          print(str)

        end

      end

    end
  end
end


-- _import ??

-- tsnode:type()						*tsnode:type()*
-- 	Get the node's type as a string.
----
--tsnode:start()						*tsnode:start()*
--	Get the node's start position. Return three values: the row, column
--	and total byte count (all zero-based).

--tsnode:end_()						*tsnode:end_()*
--	Get the node's end position. Return three values: the row, column
--	and total byte count (all zero-based).
-- local match_me_please = 1 + 2
--

-- local query = [[
-- (jk (number_literal) (number_literal))
-- ]]

-- vim.treesitter.parse_query('lua', query)
--


return M
