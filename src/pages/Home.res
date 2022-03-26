open React
open Llama

@react.component
let make = () => {
  <Layout contentCenter=true>
    <Box w=#full maxW={600->#px}>
      <Heading center=true> {`João, Frontend Enginner`->string} </Heading>
      <Text mt={20->#px} center=true>
        {`Olá, eu sou o João, desenvolvedor frontend, gosto de animes, linguagens funcionais, gatos, de ler documentações e conversar sobre cultura geek.`->string}
      </Text>
    </Box>
  </Layout>
}
