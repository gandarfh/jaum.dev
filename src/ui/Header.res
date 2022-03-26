open React
open Llama

type item = {
  label: string,
  path: string,
}

module Item = {
  @react.component
  let make = (~label: string, ~path: string) => {
    let url = RescriptReactRouter.useUrl()

    let redirect = _e => RescriptReactRouter.push(path)
    let isActive = switch url.path {
    | list{item, ..._rest} => Js.String.includes(item, path)
    | _ => false
    }

    <Box
      textAlign=#center
      weight=#semi
      align=#center
      justify=#center
      d=#flex
      tag=#button
      size={16->#px}
      px={16->#px}
      h={36->#px}
      radius={8->#px}
      color={isActive ? "black.0" : "black.200"}
      border="none"
      bg={isActive ? "bg.800" : "bg.900"}
      transition="all 0.2s"
      _hover={pseudo(~bg="bg.800", ~color="black.0", ())}
      onClick=redirect>
      {label->string}
    </Box>
  }
}

module Links = {
  let items = [
    {label: "projetos e tecnologias", path: "/technologies"},
    {label: "artigos", path: "/articles"},
    {label: "sobre", path: "/about"},
  ]

  let content = items->Belt.Array.map(({label, path}) => {
    <Item key=path label path />
  })

  @react.component
  let make = () => {
    <Box justify=#center gap={40->#px} d=#flex w=#full maxW={700->#px}> {content->array} </Box>
  }
}

@react.component
let make = () => {
  <Container mt={20->#px} contentCenter=true>
    <Box w=#full d=#flex justify=#between align=#center>
      <Item path="/" label="Pagina inicial" /> <Links /> <div />
    </Box>
  </Container>
}
