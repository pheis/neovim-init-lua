-- local ts_utils = require 'nvim-treesitter.ts_utils'

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
          table.insert(nodes, child_node)
        end
      end
    end
  end
  return nodes
end


function M.print_node_types()
  local root_node = M.get_root_node()
  local lols = get_import_strings(root_node)
  -- print(lols)

  for _, node in pairs(lols) do
    local start_row, start_col, end_row, end_col = node:range()
    local line = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, true)[1]
    local str = string.sub(line, start_col, end_col)


    local reversed = string.reverse(str)

    vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {reversed})

    -- print(str)
    -- print(start_row)
  end
end

-- vim.api.nvim_get_buf({window})

-- To edit nvim_buf_set_text
--
--
-- HOw to get buffer handle


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
