open React
open Llama

type product = {
  title: string,
  description: string,
  link: string,
}

module SubTitle = {
  @react.component
  let make = (~children, ~size=20) => {
    <Box d=#flex align=#center gap={8->#px}>
      <Box h={(size + 4)->#px} w={4->#px} radius={1->#px} bg="primary.800" />
      <Heading tag=#h4 size={size->#px}> {children} </Heading>
    </Box>
  }
}

module Card = {
  @react.component
  let make = (~title, ~description, ~link) => {
    <Box w=#full maxW={250->#px}>
      <Heading tag=#p size={16->#px}> {title->string} </Heading>
      <Text size={14->#px} mt={8->#px}> {description->string} </Text>
      <Box mt={20->#px} d=#block tag=#a href=link target="_blank" size={14->#px}>
        {"site"->string}
      </Box>
    </Box>
  }
}

module Products = {
  @react.component
  let make = (~title, ~items: array<product>) => {
    let content = items->Belt.Array.map(item => {
      <Card key={item.title} title={item.title} description={item.description} link={item.link} />
    })

    <Box mt={80->#px} w=#full>
      <Heading size={24->#px}> {title->string} </Heading>
      <Box gap={20->#px} mt={16->#px} d=#flex w=#full> {content->array} </Box>
    </Box>
  }
}
