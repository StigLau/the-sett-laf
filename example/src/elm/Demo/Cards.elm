module Demo.Cards exposing (view)

import Css
import Grid
import Html.Styled exposing (div, h1, styled, text)
import Html.Styled.Attributes exposing (id)
import Html.Styled.Lazy exposing (lazy)
import Structure exposing (Template(..))
import Styles exposing (lg, md, sm, xl)
import TheSett.Buttons as Buttons
import TheSett.Cards as Cards


view : Template msg model
view =
    (\devices ->
        div
            []
            [ div [ id "cards" ] []
            , styled h1
                [ Css.textAlign Css.center ]
                []
                [ text "Cards" ]
            , Grid.grid
                [ sm [ Grid.columns 12 ] ]
                []
                [ Grid.row
                    []
                    []
                    [ Grid.col
                        [ sm [ Grid.columns 6 ]
                        , md [ Grid.columns 4, Grid.offset 2 ]
                        ]
                        []
                        [ card devices "Card1" "images/more-from-4.png" ]
                    , Grid.col
                        [ sm [ Grid.columns 6 ]
                        , md [ Grid.columns 4 ]
                        ]
                        []
                        [ card devices "Card2" "images/more-from-3.png" ]
                    ]
                ]
                devices
            ]
    )
        |> lazy
        |> Static


card devices title imageUrl =
    Cards.card []
        []
        [ Cards.image
            [ Styles.height 5
            , sm [ Cards.src imageUrl ]
            ]
            []
            []
        , Cards.title title
        , Cards.body [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " ]
        , Cards.controls [ Buttons.button [ sm [ Buttons.raised ] ] [] [ text "Button" ] devices ]
        ]
        devices
