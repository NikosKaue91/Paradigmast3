--Exemplos Práticos: Programação funcional com Haskell
--Nome: Nikollas Kauê Soares Gomes
--Matrícula: 201020867

-- 1. As funções de alta ordem any e all são pré-definidas na biblioteca Prelude do Haskell (veja seção Special Folds). 
-- Estude e teste essas funções e apresente 2 exemplos de uso de cada uma delas.

--any verifica se um predicado é verdadeiro para pelo menos um elementto da lista
ex_1_an :: String -> [String] -> Bool
ex_1_an x y = any(x==)y

ex_2_an :: Int -> [Int] -> Bool  
ex_2_an x y = any (== x) y

--all verifica se um predicado é verdadeiro paratodos os elementto da lista

ex_1_al :: Int -> [Int] -> Bool
ex_1_al x y = any (>x) y

ex_2_al :: Int -> [Int] -> Bool
ex_2_al x y = all(x==)y

-- 2. Em Haskell, o símbolo '$' pode ser usado para escrever códigos ainda mais curtos. Descubra seu significado e apresente 2 exemplos de uso.


-- Alem de livrar de parênteses, $ significa que a aplicação de função pode ser tratada como apenas outra função.
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

--Solução 1: map (negate . sum . tail) [[1..5],[3..6],[1..7]]    Composição de funções é associativo à direita, então nós podemos compor muitas funções ao mesmo tempo. A expressão f (g (z)) é o equivalente a (f . g . z).
--Solução 2: Na sessão sobre mapas e filtros, resolvemos um problema encontrando a soma de todos os quadrados ímpares que são menores do que 10.000. 
ex_3 :: Integer  
ex_3 = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]  
	
	
-- REFERÊNCIAS USADAS

-- http://haskell.tailorfontela.com.br/syntax-in-functions
-- http://shuklan.com/haskell/lec06.html#/0/14
	