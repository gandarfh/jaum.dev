open React
open Llama

type item = {
  label: string,
  path: string,
}

module Item = {
  @react.component
  let make = (~label: string, ~path: string) => {
    <Box
      textDecoration=#none
      size={16->#px}
      weight=#semi
      color="black.200"
      tag=#a
      target="_blank"
      _hover={pseudo(~textDecoration=#underline, ())}
      href=path>
      {label->string}
    </Box>
  }
}

module Links = {
  let items = [
    {label: "github", path: "https://github.com/gandarfh"},
    {label: "linkedin", path: "https://www.linkedin.com/in/jgdferreira/"},
    {label: "instagram", path: "https://www.instagram.com/jaum_joao_joao/"},
  ]

  let content = items->Belt.Array.map(({label, path}) => {
    <Item key=path label path />
  })

  @react.component
  let make = () => {
    <Box gap={40->#px} d=#flex justify=#center align=#center> {content->array} </Box>
  }
}

@react.component
let make = () => {
  <Container contentCenter=true h={80->#px}> <Links /> </Container>
}
