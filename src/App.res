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
    | list{a, ..._rest} =>
      <Layout contentCenter=true> {React.string("Page " ++ a ++ " Error")} </Layout>
    }
  }
}

@react.component
let default = () => {
  <Provider theme> <GlobalStyle styles /> <Header /> <Routes /> <Footer /> </Provider>
}
