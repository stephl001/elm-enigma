module Letter exposing (Letter(..), LetterList, fromLetterList, letterToIndex, toLetterList,letterFromIndex)


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


charToLetter : Char -> Maybe Letter
charToLetter c =
    case Char.toUpper c of
        'A' ->
            Just A

        'B' ->
            Just B

        'C' ->
            Just C

        'D' ->
            Just D

        'E' ->
            Just E

        'F' ->
            Just F

        'G' ->
            Just G

        'H' ->
            Just H

        'I' ->
            Just I

        'J' ->
            Just J

        'K' ->
            Just K

        'L' ->
            Just L

        'M' ->
            Just M

        'N' ->
            Just N

        'O' ->
            Just O

        'P' ->
            Just P

        'Q' ->
            Just Q

        'R' ->
            Just R

        'S' ->
            Just S

        'T' ->
            Just T

        'U' ->
            Just U

        'V' ->
            Just V

        'W' ->
            Just W

        'X' ->
            Just X

        'Y' ->
            Just Y

        'Z' ->
            Just Z

        _ ->
            Nothing


letterToChar : Letter -> Char
letterToChar letter =
    case letter of
        A ->
            'A'

        B ->
            'B'

        C ->
            'C'

        D ->
            'D'

        E ->
            'E'

        F ->
            'F'

        G ->
            'G'

        H ->
            'H'

        I ->
            'I'

        J ->
            'J'

        K ->
            'K'

        L ->
            'L'

        M ->
            'M'

        N ->
            'N'

        O ->
            'O'

        P ->
            'P'

        Q ->
            'Q'

        R ->
            'R'

        S ->
            'S'

        T ->
            'T'

        U ->
            'U'

        V ->
            'V'

        W ->
            'W'

        X ->
            'X'

        Y ->
            'Y'

        Z ->
            'Z'


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
            Just Q

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
            12

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


onlyLetters : String -> String
onlyLetters =
    identity


toLetterList : String -> LetterList
toLetterList =
    always []


fromLetterList : LetterList -> String
fromLetterList =
    always ""


