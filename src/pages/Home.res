open React

let s = string

@react.component
let make = () => {
  <Container maxW={600->#px} h={#calc(#sub, 100->#vh, 56->#px)} contentCenter=true>
    <Heading center=true> {"João, Frontend Enginner"->s} </Heading>
    <Text center=true>
      {"Olá, eu sou o João, desenvolvedor frontend, gosto de animes, linguagens funcionais, gatos, de ler documentações e conversar sobre cultura geek."->s}
    </Text>
  </Container>
}
