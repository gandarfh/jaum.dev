@react.component
let make = (~children, ~contentCenter=false) => {
  <Container contentCenter h={#calc(#sub, #vh(100), #px(136))} maxW={#px(1000)}>
    {children}
  </Container>
}
