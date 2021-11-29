-- Se utiliza la funcion Nub, del Modulo Data.List
module Asignacion where
import Vars
import Sintax
import AsVals
import Gen_bools
import EvalProp
import Taut
import Fnd
import Bonita
  
-- import Data.Map (Map, fromList, lookup)

-- data Var = Var Char
--     deriving (Eq, Show)

a :: Proposition
aa :: Proposition
b :: Proposition

-- c = ~True
c = Negacion (Constante True)

-- a = True ^ B
--a = Conjuncion (Constante True) (Variable "B")
--a = Conjuncion (Variable "C") (Variable "B")

-- b = A v B
b = Disyuncion (Variable "A") (Variable "B")

-- aa = (A v B) -> (True ^ B)
aa = Equivalencia b a
-- a = Negacion a
a = Negacion(Implicacion(Conjuncion (Constante True) (Variable "B")) (Disyuncion (Variable "A") (Variable "B")))
len = 4

-- proposición que según la ley de absorción de leyes lógicas es verdadera
-- propTaut = (A ^ B) -> A
propTaut = Implicacion (Conjuncion (Variable "A") (Variable "B")) (Variable "A")

listaB :: [Bool]
listaA = vars aa
listaB = [False, False]
test = as_vals listaA listaB

-- Para mostrar las pruebas de cada funcion
r = "vars -> "++(imprimir aa) ++ "  ->   " ++ show(vars aa) 
s = "gen_bools -> "++ show(len) ++ "  ->   " ++ show(gen_bools len) 
t = "as_vals -> " ++ show(vars aa) ++ " + " ++ show(listaB) ++ "  ->   " ++ show(as_vals (vars aa) listaB)
tt = "evalProp -> " ++ imprimir propTaut ++ " , " ++ show(as_vals (vars propTaut) listaB) ++ "  ->   " ++ show(evalProp propTaut (as_vals (vars propTaut) listaB)) 
u = "taut -> " ++ taut propTaut
v = "fnd -> " ++ imprimir propTaut ++ "   ->   " ++ imprimir( fnd propTaut)
w = "bonita -> " ++ imprimir aa ++ "  ->   " ++ bonita aa

main = print tt
-- Ejemplo de llamado a funcion
-- main = print (r)