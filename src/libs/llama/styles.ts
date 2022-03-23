import { CSSObject } from "@emotion/react";
import theme from "./theme";

type StylesType = (globalTheme: typeof theme) => CSSObject;

const styles: StylesType = (theme) => ({
  body: {
    backgroundColor: theme.colors["bg"][900],
    color: theme.colors.black[200],
    transition: "none",
  },
  "*": {
    fontFamily: theme.fonts.family,
    color: theme.colors.black[200],
  },
});

export default styles;
