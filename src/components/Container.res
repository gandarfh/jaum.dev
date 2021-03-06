open Llama
@react.component
let make = (
  ~children: React.element,
  ~tag=#main,
  ~contentCenter: bool=false,
  ~m: responsive<Spacing.t>=0->#px,
  ~mt: responsive<Spacing.t>=0->#px,
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
    tag
    w=#full
    maxW
    h
    mb
    mt
    m>
    {children}
  </Box>
}
