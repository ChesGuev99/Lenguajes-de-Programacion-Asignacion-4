module Sintax where

-- Se define el contenido posible para el dato de tipo Proposition
data Proposition =       
      Constante    Bool
    | Variable     String
    | Negacion     Proposition
    | Conjuncion   Proposition Proposition
    | Disyuncion   Proposition Proposition
    | Implicacion  Proposition Proposition
    | Equivalencia Proposition Proposition
    deriving (Eq, Show)
    -- Se declara que este tipo de dato puede acceder a Eq y a Show
    -- Es decir que podra hacer uso de ==, /= y Show

-- Imprimir recibe un dato de tipo Proposition y segun el dato, muestra su contenido 
imprimir :: Proposition -> String
imprimir (Constante    False)       = "False"
imprimir (Constante    True)        = "True"
imprimir (Variable     var)         = var   
imprimir (Negacion     prop1)       = "~" ++ imprimir prop1
imprimir (Conjuncion   prop1 prop2) = "Conjuncion (" ++ imprimirPropAux "/\\" prop1 prop2 ++ ")"
imprimir (Disyuncion   prop1 prop2) = "Disyuncion (" ++ imprimirPropAux "\\/" prop1 prop2 ++ ")"
imprimir (Implicacion  prop1 prop2) = "Implicacion (" ++ imprimirPropAux "=>" prop1 prop2 ++ ")"
imprimir (Equivalencia prop1 prop2) = "Equivalencia (" ++ imprimirPropAux "<=>" prop1 prop2 ++ ")"

--Funcion Auxuliar para mostrar los datos
imprimirPropAux :: String -> Proposition -> Proposition -> String
imprimirPropAux operation prp1 prp2= imprimir(prp1) ++ " " ++ operation ++ " " ++ imprimir(prp2)
