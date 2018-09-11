module TheSettLaf exposing (snippets, style, fonts)

{-| The Sett Look and Feel

@docs snippets, style

-}

import Css
import Css.Foreign
import DebugStyle
import Html
import Html.Attributes
import Html.Styled exposing (Html)
import Utilities exposing (DeviceProps, Device(..))


mobile : DeviceProps
mobile =
    { device = Mobile
    , baseFontSize = 14.0
    , breakWidth = 480
    }


tablet : DeviceProps
tablet =
    { device = Tablet
    , baseFontSize = 15.0
    , breakWidth = 840
    }


desktop : DeviceProps
desktop =
    { device = Desktop
    , baseFontSize = 16.0
    , breakWidth = 960
    }


desktopWide : DeviceProps
desktopWide =
    { device = DesktopWide
    , baseFontSize = 17.0
    , breakWidth = 1280
    }


{-| Links for loading fonts.
-}
fonts : Html.Html msg
fonts =
    Html.node "link"
        [ Html.Attributes.href "https://fonts.googleapis.com/css?family=Roboto:400,300,500|Roboto+Mono|Roboto+Condensed:400,700&subset=latin,latin-ext"
        , Html.Attributes.rel "stylesheet"
        ]
        []


{-| The CSS as an HTML <style> element.
-}
style : Html msg
style =
    Css.Foreign.global snippets


{-| The global CSS.
-}
snippets : List Css.Foreign.Snippet
snippets =
    Utilities.reset
        ++ Utilities.normalize
        ++ Utilities.baseSpacing
        ++ (Utilities.typography
                { mobile = mobile
                , tablet = tablet
                , desktop = desktop
                , desktopWide = desktopWide
                }
                Utilities.minorThird
           )
