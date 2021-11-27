-- Se utiliza la funcion Nub, del Modulo Data.List
module Asignacion where
import Vars
import Sintax
import AsVals
import Gen_bools
import EvalProp
import Fnd
import Bonita
import Taut
  
-- import Data.Map (Map, fromList, lookup)

-- data Var = Var Char
--     deriving (Eq, Show)

a :: Proposition
aa :: Proposition
b :: Proposition
c = Constante True
a = Conjuncion (Constante True) (Variable "B")
--a = Conjuncion (Variable "C") (Variable "B")
b = Disyuncion (Variable "A") (Variable "B")
aa = Equivalencia b a
-- a = Negacion a
-- a = Negacion(Implicacion(Conjuncion (Constante True) (Variable "B")) (Disyuncion (Variable "A") (Variable "B")))
len = 4

propTaut = Implicacion (Conjuncion (Variable "A") (Variable "B")) (Variable "A")

listaB :: [Bool]
listaA = vars aa
listaB = [True, True]
test = as_vals listaA listaB

-- Para mostrar las pruebas de cada funcion
r = "vars -> "++(imprimir c) ++ "  ->   " ++ show(vars c) 
s = "gen_bools -> "++ show(len) ++ "  ->   " ++ show(gen_bools len) 
t = "as_vals -> " ++ show(vars aa) ++ " + " ++ show(listaB) ++ "  ->   " ++ show(as_vals (vars aa) listaB) 
u = "fnd -> " ++ imprimir aa ++ "   ->                                                       " ++ show( fnd aa)
v = "bonita -> " ++ imprimir b ++ "  ->   " ++ bonita b
w = "taut -> " ++ taut propTaut


main = print (w)
   -- putStrLn "Hello World"  