module Goat.Email exposing
    ( Email
    , Error(..)
    , decoder
    , errorField
    , toString
    )

import Email
import Form.Decoder as Decoder exposing (Decoder)


type alias Email =
    Email.Email


toString : Email -> String
toString =
    Email.toString


type Error
    = Invalid Email.Invalid


{-| Display error on input fields.
-}
errorField : Error -> List String
errorField err =
    case err of
        Invalid Email.NoAtmark ->
            [ "Email address should contain exactly one '@'."
            , "Please input valid email."
            ]

        Invalid Email.TooManyAtmark ->
            [ "Email address should contain exactly one '@'."
            , "Please input valid email."
            ]

        Invalid Email.NoLocal ->
            [ "Email address must not start with '@'."
            , "Please input valid email."
            ]

        Invalid Email.NoDomain ->
            [ "Email address must not end with '@'."
            , "Please input valid email."
            ]


decoder : Decoder String Error Email
decoder =
    Decoder.mapError Invalid Email.decoder
