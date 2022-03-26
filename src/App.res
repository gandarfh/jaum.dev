open React
open Llama

@module("./libs/llama/theme.ts") external theme: {..} = "default"
@module("./libs/llama/styles.ts") external styles: {..} = "default"

module Routes = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{} => <Home />
    | list{"technologies"} => <Technologies />
    | value => {
        let path =
          <Box tag=#span color="red.600">
            {(":/" ++ value->Belt.List.toArray->Js.Array2.joinWith("/"))->string}
          </Box>

        <Layout contentCenter=true>
          <Heading center=true> {"Page "->string} {path} {" Not Found :("->string} </Heading>
        </Layout>
      }
    }
  }
}

@react.component
let default = () => {
  <Provider theme> <GlobalStyle styles /> <Header /> <Routes /> <Footer /> </Provider>
}
