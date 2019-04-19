module Letter exposing (Letter, fromLetterList, toLetterList)


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
    | L


type UpperChar
    = UpperChar Char


type alias LetterList =
    List Letter


toUpperChar : Char -> UpperChar
toUpperChar =
    Char.toUpper >> UpperChar


charToLetter : UpperChar -> Maybe Letter
charToLetter (UpperChar c) =
    case c of
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


onlyLetters : String -> String
onlyLetters =
    String.filter Char.isAlpha


toLetterList : String -> LetterList
toLetterList =
    onlyLetters >> String.toList >> List.filterMap (toUpperChar >> charToLetter)


fromLetterList : LetterList -> String
fromLetterList =
    List.map letterToChar >> String.fromList
