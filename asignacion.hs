-- Se utiliza la funcion Nub, del Modulo Data.List
module Asignacion where
import Vars
import Sintax
import AsVals
import EvalProp
  
  
-- import Data.Map (Map, fromList, lookup)

-- data Var = Var Char
--     deriving (Eq, Show)

a :: Proposition
aa :: Proposition
b :: Proposition
a = Conjuncion (Constante False) (Variable "B")
b = Disyuncion (Variable "A") (Variable "B")
aa = Implicacion b a
-- a = Negacion a
-- a = Negacion(Implicacion(Conjuncion (Constante True) (Variable "B")) (Disyuncion (Variable "A") (Variable "B")))


listaB :: [Bool]
listaA = vars aa
listaB = [True, True]
test = as_vals listaA listaB

main = print (evalProp aa test)
   -- putStrLn "Hello World"  