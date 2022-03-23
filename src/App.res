open Llama

@module("./libs/llama/theme.ts") external theme: {..} = "default"
@module("./libs/llama/styles.ts") external styles: {..} = "default"

module Routes = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{} => <Home />
    | list{a, ..._rest} => <div> {React.string("Page " ++ a ++ " Error")} </div>
    }
  }
}

@react.component
let default = () => {
  <Provider theme> <GlobalStyle styles /> <Header /> <Routes /> </Provider>
}
