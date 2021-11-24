data Proposition =  
      Constante    Bool
    | Variable     String
    | Negacion     String
    | Conjuncion   Proposition Proposition
    | Disyuncion   Proposition Proposition
    | Implicacion  Proposition Proposition
    | Equivalencia Proposition Proposition
    deriving Eq


imprimir :: Proposition -> String
imprimir (Constante    False)     = "False"
imprimir (Constante    True)      = "True"
imprimir (Variable     var)       = var   
imprimir (Negacion     expr)      = "~"
imprimir (Conjuncion   exp1 exp2) = '(' : show(exp1) ++ " /\\" ++ " " ++ show(exp2) ++ ")"
-- show exp1 ++ "/\\" ++ exp2
imprimir (Disyuncion   exp1 exp2) = "\\/" exp1 exp2
imprimir (Implicacion  exp1 exp2) = "=>" exp1 exp2
imprimir (Equivalencia exp1 exp2) = "<=>" exp1 exp2


main =
    putStrLn "Hello World"  

