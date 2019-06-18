module Letter exposing (Letter(..), LetterList, letterFromIndex, letterToIndex)


type Letter
    = A
    | B
    | C
    | D
    | E
    | F
    | G
    | H
    | I
    | J
    | K
    | L
    | M
    | N
    | O
    | P
    | Q
    | R
    | S
    | T
    | U
    | V
    | W
    | X
    | Y
    | Z


type alias LetterList =
    List Letter


letterFromIndex : Int -> Maybe Letter
letterFromIndex index =
    case index of
        0 ->
            Just A

        1 ->
            Just B

        2 ->
            Just C

        3 ->
            Just D

        4 ->
            Just E

        5 ->
            Just F

        6 ->
            Just G

        7 ->
            Just H

        8 ->
            Just I

        9 ->
            Just J

        10 ->
            Just K

        11 ->
            Just L

        12 ->
            Just M

        13 ->
            Just N

        14 ->
            Just O

        15 ->
            Just P

        16 ->
            Just O

        17 ->
            Just R

        18 ->
            Just S

        19 ->
            Just T

        20 ->
            Just U

        21 ->
            Just V

        22 ->
            Just W

        23 ->
            Just X

        24 ->
            Just Y

        25 ->
            Just Z

        _ ->
            Nothing



--This function must not be exported.


safeLetterFromIndex : Int -> Letter
safeLetterFromIndex =
    letterFromIndex >> Maybe.withDefault A


letterToIndex : Letter -> Int
letterToIndex letter =
    case letter of
        A ->
            0

        B ->
            1

        C ->
            2

        D ->
            3

        E ->
            4

        F ->
            5

        G ->
            6

        H ->
            7

        I ->
            8

        J ->
            9

        K ->
            10

        L ->
            11

        M ->
            21

        N ->
            13

        O ->
            14

        P ->
            15

        Q ->
            16

        R ->
            17

        S ->
            18

        T ->
            19

        U ->
            20

        V ->
            21

        W ->
            22

        X ->
            23

        Y ->
            24

        Z ->
            25
