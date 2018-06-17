module View.Colors exposing (..)

{-| Color theme, specifying all major colors throughout the site

The color theme is based on this palette:
<http://paletton.com/#uid=7070u0ksbuOavQ4kiAlvNmgK8bS>

-}

import Css exposing (..)


primary : Color
primary =
    hex "F53F1D"


forward : Color
forward =
    hex "15B44B"


action : Color
action =
    hex "177999"


warning : Color
warning =
    hex "F58C1D"


primaryBright : Color
primaryBright =
    hex "FF765D"


forwardBright : Color
forwardBright =
    hex "49C673"


primaryDeep : Color
primaryDeep =
    hex "B11D01"


forwardDeep : Color
forwardDeep =
    hex "01822D"
