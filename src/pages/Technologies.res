open React
open Technologies__Parts
open Llama

module TechList = {
  @react.component
  let make = (~title, ~items) => {
    let content = items->Belt.Array.map(item => {
      <Box
        minW={240->#px}
        p={8->#px}
        radius={8->#px}
        d=#flex
        align=#center
        h={50->#px}
        w=#full
        bg="bg.800"
        key={item}>
        {item->string}
      </Box>
    })

    <Box d=#flex direction=#column w=#full>
      <SubTitle> {title->string} </SubTitle>
      <Box mt={20->#px} d=#flex direction=#column gap={12->#px} w=#full> {content->array} </Box>
    </Box>
  }
}

@react.component
let make = () => {
  <Container mb={160->#px} maxW={1000->#px}>
    <Hero
      title="Projetos. Open source. Hobby"
      description={[
        `Escrever códigos deixou de ser uma obrigação e se tornou um hobby.`,
        `Aqui você vai encontrar sobre meus projetos open source e as tecnologias que utilizo no meu dia a dia.`,
      ]}
    />
    <Products
      title="Tecnologias"
      items={[
        {
          title: "Arch Linux",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 2",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 3",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
      ]}
    />
    <Text mt={60->#px} size={14->#px}>
      {"Algumas metodologias/arquiteturas que gosto e aplico no meu dia a dia."->string}
    </Text>
    <Box d=#flex gap={60->#px} mt={24->#px}>
      <TechList
        title="Metodologias"
        items={["agil", "Component Driven Development", "Atomic Design", "Server Driven UI"]}
      />
      <TechList title="Arquiteturas" items={["micro frontends", "Event-driven"]} />
    </Box>
    <Products
      title="Minhas iniciativas open source"
      items={[
        {
          title: "Arch Linux",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 2",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 3",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
      ]}
    />
    <Products
      title="Projetos Open source que acompanho"
      items={[
        {
          title: "Arch Linux",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 2",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
        {
          title: "Arch Linux 3",
          description: "Um headless CMS completamente customizavel.",
          link: "https://archlinux.org",
        },
      ]}
    />
  </Container>
}
