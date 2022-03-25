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
    | #calc_sum(array<t>)
  ]

  let rec toString = (x: option<t>) =>
    switch x {
    | Some(a) =>
      switch a {
      | #px(v) => Belt.Int.toString(v) ++ "px"
      | #vh(v) => Belt.Int.toString(v) ++ "vh"
      | #full => "100%"
      | #content => "fit-content"
      | #calc_sum =>
        "calc(" ++ Belt.Array.reduce(a, (acc, current) => {acc + current->toString}) ++ ")"
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
  type size = int
  type weight = int

  let toString = (x: option<int>) =>
    switch x {
    | Some(a) => Belt.Int.toString(a) ++ "px"
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
