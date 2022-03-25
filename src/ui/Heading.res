open Llama

@react.component
let make = (
  ~tag=#h1,
  ~children,
  ~weight=#bold,
  ~center=false,
  ~color="black.50",
  ~size=36->#px,
) => {
  <Element tag color size weight textAlign={center ? #center : #start}> {children} </Element>
}
