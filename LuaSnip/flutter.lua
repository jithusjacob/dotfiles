local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function copy(args)
  return args[1]
end

ls.add_snippets("dart", {
    snip({
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
    snip({
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
    snip({
      trig = "bloc",
      namr = "bloc",
      dscr = "bloc"
    },
      {
        t({ "class " }), i(1, "Subject"), t({ "Bloc extends Bloc<" }), f(copy, { 1 }),
        t({ "Event, " }), f(copy, { 1 }),t({ "State> {" ,""}),
        f(copy, { 1 }), t({ "Bloc() : super(" }), f(copy, { 1 }), t({ "Initial()) {","" }),
        f(copy, { 1 }), t({ "Event>((event, emit) {","" }),
        i(2, "TODO: implement event handler"),
        t({"", "});","" }),
        t({ "}","" }),
        t({ "}" })
      }
    ),
    snip({
      trig = "blocstate",
      namr = "blocstate",
      dscr = "blocstate"
    },
      {
        t({ "class " }), i(1, "Subject"), t({ "State extends Equatable {","" }),
        t({ "const " }), f(copy, { 1 }),t({ "State();" ,""}),
        t({"",}), f(copy, { 1 }),t({ "State copyWith( ){" ,""}),
        t({ "return","" }),f(copy, { 1 }),t({ "State();" ,""}),
        t({ "}" }),
        t({"", "@override","" }),
        t({ "List<Object> get props => [];","" }),
        t({ "}" })
      }
    ),
    snip({
      trig = "bloceventabstract",
      namr = "abstract blocevent",
      dscr = "abstract blocevent"
    },
      {
        t({ "abstract class " }), i(1, "Subject"), t({ "State extends Equatable {","" }),
        t({ "const " }), f(copy, { 1 }),t({ "State();" ,""}),
        t({"", "@override","" }),
        t({ "List<Object> get props => [];","" }),
        t({ "}" })
      }
    ),
    snip({
      trig = "blocevent",
      namr = "blocevent",
      dscr = "blocevent"
    },
      {
        t({ "class " }), i(1, "Subject"),i(2, "Verb"),t({ " extends "}),
        f(copy,{1}),  t({"Event{","" }),
        t({ "const " }), f(copy, {1}),f(copy, {2}),t({ "();" ,""}),
        t({"", "@override","" }),
        t({ "List<Object> get props => [];","" }),
        t({ "}" })
      }
    ),
})
