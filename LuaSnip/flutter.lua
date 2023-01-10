local ls        = require("luasnip")
-- some shorthands...
local s         = ls.snippet
local fmt       = require("luasnip.extras.fmt").fmt
local sn        = ls.snippet_node
local text      = ls.text_node
local insert    = ls.insert_node
local t         = ls.text_node
local i         = ls.insert_node
local f         = ls.function_node
local fmta      = require("luasnip.extras.fmt").fmta
local rep       = require("luasnip.extras").rep
local sn        = ls.snippet_node
local c         = ls.choice_node
local d         = ls.dynamic_node
local r         = ls.restore_node
local util      = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function copy(args)
	return args[1]
end

---------------model
local model = function(args, parent)
	-- this could also be outside the dynamicNode.
	local nodes = { t "" }

	-- snip.argc is controlled via c-t/c-g
	--local argc = parent.argc
	local argc = tonumber(parent.captures[1])
	-- snip.argc is not set on the first call.
	if not argc then
		parent.argc = 1
		argc = 1
	end

	-- store jump_indx separately and increase for each insertNode.
	local jump_indx = 1
	local jump_indx_n = 2
	-- generate variables
	for j = 1, argc do
		vim.list_extend(nodes, {
			t "\t final ",
			i(jump_indx, "datatype"),
			t "  ",
			i(jump_indx_n, " var" .. j),
			t ";",
			t { "", "" }
		})
                jump_indx = jump_indx + 2
                jump_indx_n = jump_indx_n + 2
	end

	nodes[#nodes + 1] = t { "" }
	nodes[#nodes + 1] = t { "const " }
	nodes[#nodes + 1] = t { args[1][1] }
	nodes[#nodes + 1] = t { "({", "" }
	 local jump_indx_n = 2

	-- generate constructor
	for _ = 1, argc+2,2 do
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
	for j = 1, argc+2,2 do
		vim.list_extend(nodes, {
                        t"\t ",
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
	for j = 1, argc+2,2 do
		vim.list_extend(nodes, {
			rep(jump_indx_n),
			t ": ",
			rep(jump_indx_n),
			t "?? this.",
			rep(j+1),
			t { ",", "" }
		})
                jump_indx_n = jump_indx_n + 2
	end
	nodes[#nodes + 1] = t { ");", "" }
	nodes[#nodes + 1] = t { "}", "" }
  ---- Equatable override
	nodes[#nodes + 1] = t { " @override","" }
	nodes[#nodes + 1] = t { " List<Object> get props => [","" }
	local jump_indx_n = 2
	for j = 1, argc+2,2 do
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
	s({
		trig = "stless",
		namr = "StatelessWidget",
		dscr = "StatelessWidget"
	},
		{
			t({ "class " }), i(1, "class_name"), text({ " extends StatelessWidget {",
				"const " }), f(copy, { 1 }), text({ "({ Key? key }) : super(key: key);",
				"@override",
				"Widget build(BuildContext context) {",
				"return Container(" }),
			insert(0), text({ "",
				");",
				"}",
				"}" })
		}),
	s({
		trig = "yyy",
		namr = "StatefulWidget",
		dscr = "StatefulWidget"
	},
		{
			t({ "class " }), i(1, "class_name"), text({ " extends StatelessWidget {",
				"const " }), f(copy, { 1 }), text({ "({ Key? key }) : super(key: key);",
				"@override",
				"Widget build(BuildContext context) {",
				"return Container(" }),
			insert(0), text({ "",
				");",
				"}",
				"}" })
		}),
	s({
		trig = "bloc",
		namr = "bloc",
		dscr = "bloc"
	},
		fmta(
			[[
        import 'package:bloc/bloc.dart';

        class <>Bloc extends Bloc<<<>Event, <>State>> {
          <>Bloc() : super(const <>State()) {
    
        }
      ]], { i(1), rep(1), rep(1), rep(1), rep(1) }

		)
	),
	s({
		trig = "blocstate",
		namr = "blocstate",
		dscr = "blocstate"
	}, fmta(
		[[	
   import 'package:equatable/equatable.dart' 

    class <>State extends Equatable {
     const <>State(

     );


    <>State copyWith(

    }) {
      return <>State(

      );
    }

    @override
    List<<Object>> get props =>> [];
  }
]]
		, { i(1), rep(1), rep(1), rep(1), })
	),
	s({
		trig = "bloceventabstract",
		namr = "abstract blocevent",
		dscr = "abstract blocevent"
	},
		fmta(
			[[
        import 'package:equatable/equatable.dart'

        abstract class <>Event extends Equatable {
        const <>Event();

        @override
        List<<Object>> get props =>> [];

        }


      ]], { i(1), rep(1) }

		)
	),
	s({
		trig = "blocevent",
		namr = "blocevent",
		dscr = "blocevent"
	},
		fmta(

			[[
        class <><> extends <>Event {
        const <><>(

        );

        @override
        List<<Object>> get props =>> [];
        }
      ]], { i(1, "subject"), i(2, "verb"), rep(1), rep(1), rep(2) }
		)
	),
	s({
		trig = "bloceventHandler",
		namr = "eventHandler",
		dscr = "eventHandler"
	},
		fmta(
			[[
      void <>(<> event, Emitter<<<>State>> emit) {
    
      emit(
        state.copyWith(
       
            ),
         );
      }
      ]], { i(1, "function name"), i(2, "event name"), i(3, "state name"), }

		)
	),
	s({ trig = "model(%d+)", regTrig = true }, fmta(
		[[
import 'package:equatable/equatable.dart';

class <> extends Equatable {
 <>
  


]], { i(1), d(2, model, { 1 }), })

	)
})
