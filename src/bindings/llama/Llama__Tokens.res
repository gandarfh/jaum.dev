type responsive<'t> = 't

module Align = {
  type t = [
    | #center
    | #start
    | #end
  ]

  let toString = (x: option<t>) =>
    switch x {
    | Some(a) =>
      switch a {
      | #center => "center"
      | #start => "flex-start"
      | #end => "flex-end"
      }
    | None => ""
    }
}

module Justify = {
  type t = [
    | #center
    | #start
    | #end
    | #between
    | #around
  ]

  let toString = (x: option<t>) =>
    switch x {
    | Some(a) =>
      switch a {
      | #center => "center"
      | #start => "flex-start"
      | #end => "flex-end"
      | #between => "space-between"
      | #around => "space-around"
      }
    | None => ""
    }
}

module Spacing = {
  type t = [
    | #px(int)
    | #auto
    | #none
  ]

  let toString = (x: option<t>) =>
    switch x {
    | Some(a) =>
      switch a {
      | #px(v) => Belt.Int.toString(v) ++ "px"
      | #auto => "auto"
      | #none => "none"
      }
    | None => ""
    }
}

module Size = {
  type rec t = [
    | #px(int)
    | #vh(int)
    | #full
    | #content
    | #calc([#sum | #sub], t, t)
  ]

  let rec toString = (x: option<t>) =>
    switch x {
    | Some(result) =>
      switch result {
      | #px(v) => Belt.Int.toString(v) ++ "px"
      | #vh(v) => Belt.Int.toString(v) ++ "vh"
      | #full => "100%"
      | #content => "fit-content"
      | #calc(#sum, a, b) => "calc(" ++ (Some(a)->toString ++ (" + " ++ (Some(b)->toString ++ ")")))
      | #calc(#sub, a, b) => "calc(" ++ (Some(a)->toString ++ (" - " ++ (Some(b)->toString ++ ")")))
      }
    | None => ""
    }
}

module Display = {
  type t = [
    | #flex
    | #grid
    | #block
    | #none
  ]
}

module Fonts = {
  type size = [#px(int)]
  type weight = [#thin | #light | #regular | #medium | #semi | #bold]
  type align = [#start | #center | #end | #justify]

  type t = [
    | size
    | align
    | weight
  ]
  let toAlign = (x: option<align>) =>
    switch x {
    | Some(y) =>
      switch y {
      | #start => "left"
      | #end => "right"
      | #center => "center"
      | #justify => "justify"
      }
    | None => ""
    }
  let toWeight = (x: option<weight>) =>
    switch x {
    | Some(y) =>
      switch y {
      | #thin => "100"
      | #light => "300"
      | #regular => "400"
      | #medium => "500"
      | #semi => "600"
      | #bold => "700"
      }
    | None => ""
    }

  let toString = (x: option<size>) =>
    switch x {
    | Some(y) =>
      switch y {
      | #px(value) => value->Belt.Int.toString ++ "px"
      }
    | None => ""
    }
}

module Radius = {
  type t = [
    | #px(int)
  ]
}

module Border = {
  type t = string
}

module Flex = {
  type direction = [
    | #column
    | #row
  ]
}
