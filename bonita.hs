module Bonita where

import Sintax

bonita :: Proposition -> String
bonita (Constante     True)      =  "True"
bonita (Constante     False)      =  "False"
bonita (Variable      prop1)      =  prop1
bonita (Negacion      prop1)      = '~' : bonita prop1
bonita (Conjuncion    prop1 prop2)= bonitaAux "/\\" prop1 prop2
bonita (Disyuncion   prop1 prop2) = bonitaAux "\\/" prop1 prop2
bonita (Implicacion   prop1 prop2) = bonitaAux "->" prop1 prop2
bonita (Equivalencia prop1 prop2) = bonitaAux "<->" prop1 prop2
    
--showOperador :: String -> Proposition -> Proposition -> String
--showOperador operador prop1 prop2= "(" ++ (bonita prop1) ++ operador ++ (bonita prop2) ++ ")"

muestraConectivos :: (Proposition -> String) -> String -> Proposition -> Proposition -> String
muestraConectivos show_ conectivo prop1 prop2 =
  '(' : show_ prop1 ++ " " ++ conectivo ++ " " ++ show_ prop2 ++ ")"

bonitaAux :: String -> Proposition -> Proposition -> String
bonitaAux = muestraConectivos bonita