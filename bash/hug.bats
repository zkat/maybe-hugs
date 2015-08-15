#!/usr/bin/env bats

@test "Cutie who would like hugs recives hugs" {
    export SAM_HUGGABLE=1
    [[ "$("$BATS_TEST_DIRNAME/hug" sam)" = "Hugs for sam!" ]]
}

@test "Cutie who would like empathy recives empathy" {
    export SKY_HUGGABLE=0
    [[ "$("$BATS_TEST_DIRNAME/hug" sky)" = "Empathy for sky!" ]]
}

@test "Cutie who has not expressed a preference recives empathy" {
    [[ "$("$BATS_TEST_DIRNAME/hug" sue)" = "Empathy for sue!" ]]
}

@test "Cutie with a long name can be hugged" {
    export A_CUTIE_HUGGABLE=1
    [[ $("$BATS_TEST_DIRNAME/hug" "a cutie") = "Hugs for a cutie!" ]]
}

@test "Usage information is shown" {
    run "$BATS_TEST_DIRNAME/hug"
    [[ $status -eq 1 ]]
    [[ "${lines[0]}" = "Usage: $BATS_TEST_DIRNAME/hug <cutie...>" ]]
}
