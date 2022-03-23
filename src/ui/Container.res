@react.component
let make = (~children: React.element, ~contentCenter: bool=false) => {
  <Llama.Element
    align={contentCenter ? "center" : "flex-start"}
    direction=#column
    d=#flex
    mx=#auto
    px={16->#px}
    tag=#main
    w=#full
    maxW={1000->#px}>
    {children}
  </Llama.Element>
}
