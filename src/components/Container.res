open Llama
@react.component
let make = (
  ~children: React.element,
  ~contentCenter: bool=false,
  ~m: responsive<Spacing.t>=0->#px,
  ~mb: responsive<Spacing.t>=0->#px,
  ~h: responsive<Size.t>=#content,
  ~maxW=1000->#px,
) => {
  <Box
    align={contentCenter ? #center : #start}
    justify={contentCenter ? #center : #start}
    direction=#column
    d=#flex
    mx=#auto
    px={16->#px}
    tag=#main
    w=#full
    maxW
    h
    mb
    m>
    {children}
  </Box>
}
