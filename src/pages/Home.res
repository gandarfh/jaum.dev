open React


@react.component
let make = () => {
  let name = "Jo" ++ Js.String.fromCharCode(227) ++ "o"

  <main>
    <h1> {(name ++ ", Frontend Enginner")->string} </h1>
  </main>
}
