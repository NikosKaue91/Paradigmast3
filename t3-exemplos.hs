--Exemplos Práticos: Programação funcional com Haskell
--Nome: Nikollas Kauê Soares Gomes
--Matrícula: 201020867

-- 1. As funções de alta ordem any e all são pré-definidas na biblioteca Prelude do Haskell (veja seção Special Folds). 
-- Estude e teste essas funções e apresente 2 exemplos de uso de cada uma delas.

--any
ex_1_an :: String -> [String] -> Bool
ex_1_an x y = any(x==)y

ex_2_an :: Int -> [Int] -> Bool  
ex_2_an x y = any (== x) y

--all



-- 2. Em Haskell, o símbolo '$' pode ser usado para escrever códigos ainda mais curtos. Descubra seu significado e apresente 2 exemplos de uso.

e_2_1 :: [Int] -> [Int]
e_2_1 [] = []
e_2_1 n = map(\n -> 2015 - n) $ filter(>20)n

e_2_2 :: Char -> String -> Bool
e_2_2 x y 
		| y == [] = False
		| x == head y = True
		| x /= head y = e_2_2 x $ tail y

-- 3. Haskell permite composição de funções, exatamente como em matemática.
-- Descubra como fazer isso e apresente 2 exemplos de aplicação de funções compostas.

ex_3 :: Integer  
ex_3 =   
    let ex_3 = filter odd $ map (^2) [1..]  
        belowLimit = takeWhile (<10000) ex_3  
    in  sum belowLimit  