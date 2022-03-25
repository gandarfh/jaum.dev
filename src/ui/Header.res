open React
open Llama

type item = {
  label: string,
  path: string,
}

module Item = {
  @react.component
  let make = (~label: string, ~path: string) => {
    let redirect = _e => RescriptReactRouter.push(path)

    <Element
      size={14}
      weight={600}
      align=#center
      justify=#center
      px={16->#px}
      d=#flex
      h={36->#px}
      tag=#button
      color="black.200"
      radius={8->#px}
      border="none"
      bg="bg.900"
      transition="all 0.2s"
      _hover={pseudo(~bg="bg.800", ~color="black.0", ())}
      onClick=redirect>
      {label->string}
    </Element>
  }
}

module Links = {
  let items = [
    {label: "projetos e tecnologias", path: "/tecnologies"},
    {label: "artigos", path: "/articles"},
    {label: "sobre", path: "/about"},
  ]

  let content = items->Belt.Array.map(({label, path}) => {
    <Item key=path label path />
  })

  @react.component
  let make = () => {
    <Element mt={20->#px} justify=#center gap={40->#px} d=#flex w=#full maxW={700->#px}>
      {content->array}
    </Element>
  }
}

@react.component
let make = () => {
  <Container contentCenter=true> <Links /> </Container>
}
