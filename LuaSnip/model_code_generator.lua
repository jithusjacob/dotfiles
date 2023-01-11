
local ls        = require("luasnip")
-- some shorthands...
local s         = ls.snippet
local t         = ls.text_node
local i         = ls.insert_node
local fmta      = require("luasnip.extras.fmt").fmta
local rep       = require("luasnip.extras").rep
local sn        = ls.snippet_node
local d         = ls.dynamic_node
local r         = ls.restore_node

---------------model
local model = function(args, parent)
	-- this could also be outside the dynamicNode.
	local nodes = { t "" }
	-- keep track of which insert-index we're at.
	local ins_indx = 1
	--local argc = tonumber(parent.captures[1])
	---- snip.argc is controlled via c-t/c-g
	local argc = parent.argc
	if not argc then
		parent.argc = 1
		argc = 1
	end

	-- store jump_indx separately and increase for each insertNode.
	local jump_indx = 1
	local jump_indx_n = 2
	-- generate variables
	for j = 1, argc do
		table.insert(nodes,t "\t final ")
		table.insert(nodes,r(jump_indx,"datatype" .. j,i(jump_indx,"datatype" .. j)))
		table.insert(nodes,t " ")
		table.insert(nodes,r(jump_indx_n,"var" .. j,i(jump_indx_n,"var" .. j)))
		table.insert(nodes,t ";")
		table.insert(nodes,t {"",""})
		jump_indx = jump_indx + 2
		jump_indx_n = jump_indx_n + 2
	end

	nodes[#nodes + 1] = t { "" }
	nodes[#nodes + 1] = t { "const " }
	nodes[#nodes + 1] = t { args[1][1] }
	nodes[#nodes + 1] = t { "({", "" }
	local jump_indx_n = 2

	-- generate constructor
	for _ = 1, argc do
		vim.list_extend(nodes, {
			t "\t required this.",
			rep(jump_indx_n),
			t { ",", "" }
		})
		jump_indx_n = jump_indx_n + 2
	end

	nodes[#nodes + 1] = t { "});", "" }
	-- generate copyWith
	nodes[#nodes + 1] = t { args[1][1] }
	nodes[#nodes + 1] = t { " copyWith " }
	nodes[#nodes + 1] = t { "({", "" }
	local jump_indx = 1
	local jump_indx_n = 2
	for _ = 1, argc  do
		vim.list_extend(nodes, {
			t "\t ",
			rep(jump_indx),
			t "? ",
			rep(jump_indx_n),
			t { ",", "" }
		})
		jump_indx = jump_indx + 2
		jump_indx_n = jump_indx_n + 2
	end

	nodes[#nodes + 1] = t { "}){", "" }
	nodes[#nodes + 1] = t { " return " }
	nodes[#nodes + 1] = t { args[1][1] }
	nodes[#nodes + 1] = t { "(", "" }
	local jump_indx_n = 2
	for j = 1, argc  do
		vim.list_extend(nodes, {
			rep(jump_indx_n),
			t ": ",
			rep(jump_indx_n),
			t "?? this.",
			rep(jump_indx_n),
			t { ",", "" }
		})
		jump_indx_n = jump_indx_n + 2
	end
	nodes[#nodes + 1] = t { ");", "" }
	nodes[#nodes + 1] = t { "}", "" }
	---- Equatable override
	nodes[#nodes + 1] = t { " @override", "" }
	nodes[#nodes + 1] = t { " List<Object> get props => [", "" }
	local jump_indx_n = 2
	for _ = 1, argc  do
		vim.list_extend(nodes, {
			rep(jump_indx_n),
			t { ",", "" }
		})
		jump_indx_n = jump_indx_n + 2
	end
	nodes[#nodes + 1] = t { "];", "" }
	nodes[#nodes + 1] = t { "}", "" }

	-- remove last linebreak.
	--nodes[#nodes] = nil

	return sn(nil, nodes)
end
--------------------model
ls.add_snippets("dart", {
 	s({ trig = "model", }, fmta(
 		[[
import 'package:equatable/equatable.dart';

class <> extends Equatable {
 <>
  


]], { i(1), d(2, model, { 1 }, {

		user_args = { function(parent) parent.argc = parent.argc + 1 end,
			function(parent) parent.argc = math.max(parent.argc - 1, 1) end }



	})} )

	)
})
