module Provider = {
  @module("@llama-ui/react") @react.component
  external make: (~children: React.element=?, ~theme: {..}=?, unit) => React.element =
    "LlamaProvider"
}
@module("@llama-ui/react") external llama: {..} = "llama"

module GlobalStyle = {
  @module("@llama-ui/react") @react.component
  external make: (~styles: {..}=?, unit) => React.element = "Global"
}
type sizes = [
  | #px(int)
  | #max
  | #content
]

module Align = {
  type t = [
    | #center
    | #start
    | #end
  ]

  let toString = x =>
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
  type t = [
    | #px(int)
    | #full
    | #content
  ]

  let toString = (x: option<t>) =>
    switch x {
    | Some(a) =>
      switch a {
      | #px(v) => Belt.Int.toString(v) ++ "px"
      | #full => "100%"
      | #content => "fit-content"
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

type responsive<'t> = 't

let pseudo = (~bg: option<responsive<string>>=?, ()): {..} => {"bg": bg}

module Element = {
  type llamaElement

  type tags = [
    | #div
    | #main
    | #span
    | #ul
    | #li
    | #img
    | #button
    | #h1
    | #h2
    | #h3
    | #h4
    | #h5
    | #h6
    | #p
  ]

  type colors = [
    | #hex(string)
    | #token(string)
  ]

  type radius = [
    | #px(int)
  ]
  type margin = [
    | #px(int)
    | #auto
  ]
  type flex = [
    | #column
    | #row
  ]

  type border = string

  let getElementByTag = element =>
    switch element {
    | #div => llama["div"]
    | #main => llama["main"]
    | #span => llama["section"]
    | #ul => llama["ul"]
    | #li => llama["li"]
    | #img => llama["img"]
    | #button => llama["button"]
    | #h1 => llama["h1"]
    | #h2 => llama["h2"]
    | #h3 => llama["h3"]
    | #h4 => llama["h4"]
    | #h5 => llama["h5"]
    | #h6 => llama["h6"]
    | #p => llama["p"]
    }

  type teste = [
    | tags
    | Align.t
    | colors
    | radius
    | margin
  ]

  @module("react")
  external createElement: (llamaElement, {..}, option<React.element>) => React.element =
    "createElement"

  @react.component
  let make = (
    ~tag as element: tags=#div,
    ~children: option<React.element>=?,
    ~onClick=?,
    ~style=?,
    ~innerRef=?,
    ~color: option<responsive<string>>=?,
    /* background api */
    ~bg: option<responsive<string>>=?,
    ~bgColor: option<string>=?,
    /* border radius */
    ~radius: option<radius>=?,
    /* border */
    ~border: option<border>=?,
    /* margins */
    ~m: option<responsive<Spacing.t>>=?,
    ~my: option<responsive<Spacing.t>>=?,
    ~mx: option<responsive<Spacing.t>>=?,
    ~mt: option<responsive<Spacing.t>>=?,
    ~mb: option<responsive<Spacing.t>>=?,
    ~ml: option<responsive<Spacing.t>>=?,
    ~mr: option<responsive<Spacing.t>>=?,
    /* paddings */
    ~p: option<responsive<Spacing.t>>=?,
    ~py: option<responsive<Spacing.t>>=?,
    ~px: option<responsive<Spacing.t>>=?,
    ~pt: option<responsive<Spacing.t>>=?,
    ~pb: option<responsive<Spacing.t>>=?,
    ~pl: option<responsive<Spacing.t>>=?,
    ~pr: option<responsive<Spacing.t>>=?,
    /* alignment */
    ~align: option<responsive<string>>=?,
    ~alignSelf: option<responsive<string>>=?,
    ~alignContent: option<responsive<string>>=?,
    ~justify: option<responsive<string>>=?,
    ~justifyItems: option<responsive<string>>=?,
    ~justifySelf: option<responsive<string>>=?,
    ~place: option<responsive<string>>=?,
    ~placeItems: option<responsive<string>>=?,
    ~placeSelf: option<responsive<string>>=?,
    ~placeContent: option<responsive<string>>=?,
    /* layout */
    ~w: option<responsive<Size.t>>=?,
    ~minW: option<responsive<Size.t>>=?,
    ~maxW: option<responsive<Size.t>>=?,
    ~h: option<responsive<Size.t>>=?,
    ~minH: option<responsive<Size.t>>=?,
    ~maxH: option<responsive<Size.t>>=?,
    ~d: option<responsive<Display.t>>=?,
    ~gap: option<responsive<Size.t>>=?,
    /* flex */
    ~direction: option<responsive<flex>>=?,
    /* fonts */
    ~size: option<responsive<Fonts.size>>=?,
    ~weight: option<responsive<Fonts.weight>>=?,
    /* pseudos */
    ~_hover: {..}={"transition": "all 0.4s"},
  ) => {
    createElement(
      getElementByTag(element),
      {
        "style": style,
        "ref": innerRef,
        "onClick": onClick,
        "color": color,
        "bg": bg,
        "bgColor": bgColor,
        "radius": radius,
        "border": border,
        "m": m->Spacing.toString,
        "mY": my->Spacing.toString,
        "mX": mx->Spacing.toString,
        "mTop": mt->Spacing.toString,
        "mBottom": mb->Spacing.toString,
        "mLeft": ml->Spacing.toString,
        "mRight": mr->Spacing.toString,
        "p": p->Spacing.toString,
        "pY": py->Spacing.toString,
        "pX": px->Spacing.toString,
        "pTop": pt->Spacing.toString,
        "pBottom": pb->Spacing.toString,
        "pLeft": pl->Spacing.toString,
        "pRight": pr->Spacing.toString,
        "alignItems": align,
        "alignSelf": alignSelf,
        "alignContent": alignContent,
        "justifyContent": justify,
        "justifyItems": justifyItems,
        "justifySelf": justifySelf,
        "place": place,
        "placeItems": placeItems,
        "placeSelf": placeSelf,
        "placeContent": placeContent,
        "w": w->Size.toString,
        "minW": minW->Size.toString,
        "maxW": maxW->Size.toString,
        "h": h->Size.toString,
        "minH": minH->Size.toString,
        "maxH": maxH->Size.toString,
        "d": d,
        "gap": gap->Size.toString,
        "flexDirection": direction,
        "fontSize": size->Fonts.toString,
        "fontWeight": weight,
        "_hover": _hover,
      },
      children,
    )
  }
}
