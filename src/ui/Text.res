open Llama

@react.component
let make = (
  ~tag=#p,
  ~children,
  ~center=false,
  ~weight=#regular,
  ~color="black.200",
  ~size=14->#px,
) => {
  <Element tag color size weight textAlign={center ? #center : #start}> {children} </Element>
}
