open React
open Llama

@react.component
let make = (~title, ~description: array<string>) => {
  let content = Belt.Array.map(description, text => {
    <Text key=text weight=#semi> {text->string} </Text>
  })

  <Box w=#full mt={100->#px}>
    <Heading weight=#bold> {title->string} </Heading>
    <Box mt={20->#px} gap={12->#px} d=#flex direction=#column w=#full> {content->array} </Box>
  </Box>
}
