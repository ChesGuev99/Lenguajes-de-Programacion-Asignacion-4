-- Se utiliza la funcion Nub, del Modulo Data.List
module Asignacion where
import Vars
import Sintax
import AsVals
  
  
-- import Data.Map (Map, fromList, lookup)

-- data Var = Var Char
--     deriving (Eq, Show)

a :: Proposition
aa :: Proposition
b :: Proposition
a = Conjuncion (Constante True) (Variable "B")
b = Disyuncion (Variable "A") (Variable "B")
aa = Implicacion a b
-- a = Negacion a
-- a = Negacion(Implicacion(Conjuncion (Constante True) (Variable "B")) (Disyuncion (Variable "A") (Variable "B")))

listaA :: [Proposition]
listaB :: [Bool]
listaA = [Variable "A",Variable "B"]
listaB = [True, False]

main = print (as_vals listaA listaB)
   -- putStrLn "Hello World"  