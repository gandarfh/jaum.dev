import { theme as baseTheme } from "@llama-ui/react";

const theme = {
  ...baseTheme,
  fonts: {
    ...baseTheme.fonts,
    family: "'Inter', sans-serif",
  },
  colors: {
    ...baseTheme.colors,
    bg: {
      900: "#08090A",
      800: "#171A1C",
    },
  },
};

export default theme;
