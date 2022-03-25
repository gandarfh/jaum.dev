open React

@react.component
let make = () => {
  let name = "Jo" ++ Js.String.fromCharCode(227) ++ "o"

  <Container h={100->#vh} m={80->#px} contentCenter=true>
    <h1> {(name ++ ", Frontend Enginner")->string} </h1>
  </Container>
}
