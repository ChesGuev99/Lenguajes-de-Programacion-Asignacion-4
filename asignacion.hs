data Proposition =  
      Constante    Bool
    | Variable     String
    | Negacion     String
    | Conjuncion   Proposition Proposition
    | Disyuncion   Proposition Proposition
    | Implicacion  Proposition Proposition
    | Equivalencia Proposition Proposition
    deriving (Eq, Show)


imprimir :: Proposition -> String
imprimir (Constante    False)     = "False"
imprimir (Constante    True)      = "True"
imprimir (Variable     var)       = var   
imprimir (Negacion     expr)      = "~"
imprimir (Conjuncion   prop1 prop2) = imprimirPropAux "/\\" prop1 prop2
imprimir (Disyuncion   prop1 prop2) = imprimirPropAux "\\/" prop1 prop2
imprimir (Implicacion  prop1 prop2) = imprimirPropAux "=>" prop1 prop2
imprimir (Equivalencia prop1 prop2) = imprimirPropAux "<=>" prop1 prop2


imprimirPropAux :: String -> Proposition -> Proposition -> String
imprimirPropAux operation prp1 prp2= show(prp1) ++ " " ++ operation ++ " " ++ show(prp2)

aa = True :: Bool
--a = aa :: Proposition

main =
    -- todavia no se como probarlo, pero creeeeo que funciona ;-;
    imprimir Negacion(aa)
    putStrLn "Hello World"  

