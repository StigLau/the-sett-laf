module Main exposing (main)

import Body
import Cards
import DebugStyle
import GridDemo
import Html exposing (program)
import Html.Styled exposing (toUnstyled, div, input, text)
import Html.Styled.Attributes exposing (type_, checked)
import Html.Styled.Events exposing (onCheck)
import Layout
import Logo
import MkDown
import State exposing (Model, Msg(..))
import Structure exposing (Template(..))
import TheSettLaf exposing (fonts, responsiveMeta, devices)
import Typography


main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init =
    ( False, Cmd.none )


subscriptions _ =
    Sub.none


update msg model =
    case msg of
        Toggle state ->
            ( state, Cmd.none )


view model =
    styledView model
        |> toUnstyled


styledView model =
    let
        innerView =
            [ responsiveMeta
            , fonts
            , TheSettLaf.style devices
            , case
                (Layout.layout <|
                    Body.view
                        [ Typography.view
                        , GridDemo.view
                        , Cards.view
                        , MkDown.view
                        ]
                )
              of
                Dynamic fn ->
                    fn devices model

                Static fn ->
                    fn devices
            ]

        debugStyle =
            DebugStyle.style devices
    in
        case model of
            True ->
                div [] (debugStyle :: innerView)

            False ->
                div [] innerView
