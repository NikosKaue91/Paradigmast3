import Data.Char

--Exercícios Práticos: Programação funcional com Haskell
--Nome: Nikollas Kauê Soares Gomes
--Matrícula: 201020867


-- 1. Escreva uma função recursiva firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. 
-- Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
firstName :: String -> String
firstName name
	|head name == ' ' = " "
	|otherwise = head name : firstName(tail name)
	
-- 2. Escreva uma função firstName' :: String -> String com o mesmo resultado do exercício anterior, mas sem usar recursão. 
-- Dica: estude funções pré-definidas em Haskell (List operations -> Sublists) em http://hackage.haskell.org/package/base-4.8.0.0/docs/Prelude.html.

firstName2 :: String -> String
firstName2 name = takeWhile (/= ' ') name

-- 3. Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome. 
-- Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.

lastName :: String -> String
lastName name = reverse (takeWhile (/= ' ') (reverse name))

-- 4. Escreva uma função não-recursiva userName :: String -> String que, dado o nome completo de uma pessoa, 
-- crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas.
-- Dica: estude as funções pré-definidas no módulo Data.Char, para manipulação de maiúsculas e minúsculas.

userName :: String -> String
userName name = toLower (head name) : map toLower (lastName name)

-- 5. Escreva uma função não-recursiva encodeName :: String -> String que substitua vogais em uma string, 
-- conforme o esquema a seguir: a = 4, e = 3, i = 1, o = 0, u = 00.

encodeName :: String -> String
encodeName name = concat (map (tradeWords) name)
	where tradeWords name
		| name == 'a' = "4" 
		| name == 'A' = "4"
		| name == 'e' = "3" 
		| name == 'E' = "3" 
		| name == 'i' = "1"
		| name == 'I' = "1" 
		| name == 'o' = "0"
		| name == 'O' = "0" 
		| name == 'u' = "00"
		| name == 'U' = "00"
		| otherwise = [name]
		
-- 6. Escreva uma função isElem :: Int -> [Int] -> Bool que verifique se um dado elemento pertence a uma lista.

-- 7. Escreva uma função recursiva que retorne o número de vogais em uma string.

-- 8. Escreva uma função não-recursiva que retorne o número de consoantes em uma string.

-- 9. Escreva uma função não-recursiva isInt :: String -> Bool que verifique se uma dada string só contém dígitos (0 a 9).

isInt :: String -> Bool
isInt [] = False
isInt x = if length(x)/=length(filter (\x->(x=='0')||(x=='1')||(x=='2')||(x=='3')||(x=='4')||(x=='5')||(x=='6')||(x=='7')||(x=='8')||(x=='9')&&(x/=' ')) x) then False else True


-- 10. Escreva uma função não-recursiva strToInt :: String -> Int que converta uma string em um número inteiro,
-- fazendo operações aritméticas com seus dígitos (p.ex.: "356" = 3*100 + 5*10 + 6*1 = 356). 
-- Considere que a string seja um número válido, isto é, só contenha dígitos de 0 a 9. 
-- Dica: se não souber por onde começar, estude o exemplo de validação de CPF visto em aula.