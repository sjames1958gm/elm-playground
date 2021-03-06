module Track.Update exposing (update)

import Track.Msg exposing (Msg(..))
import Track.Model exposing (Track)
import Ports.Ports exposing (play)


update : Msg -> Track -> ( Track, Cmd Msg )
update msg track =
    case msg of
        NoOp ->
            ( track, Cmd.none )

        PlayTrack trackToPlay ->
            let
                current =
                    (track == trackToPlay)

                cmd =
                    case current of
                        True ->
                            play current

                        False ->
                            Cmd.none
            in
                ( { track | current = current }, cmd )
