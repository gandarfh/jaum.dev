open Llama

@react.component
let make = (
  ~tag=#p,
  ~children,
  ~center=false,
  ~weight=#regular,
  ~color="black.200",
  ~size=16->#px,
  ~mt=0->#px,
  ~mb=0->#px,
) => {
  <Box mt mb tag color size weight textAlign={center ? #center : #start}> {children} </Box>
}
