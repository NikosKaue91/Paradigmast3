--Trabalho de Lista de Logins: Programação funcional com Haskell
--Nome: Nikollas Kauê Soares Gomes
--Matrícula: 201020867
import Data.Char
main :: IO ()
main = do
    strcontent <- readFile "nomes.csv"
    let strlist = lines strcontent
        strnew = [str ++ "," ++ userName str | str <- strlist]
    writeFile "logins.csv" (unlines strnew)
	
userName :: String -> String
userName name = map (toLower)(takeWhile (/= name !! 1)name ++ (reverse (takeWhile (/=' ')(reverse name))))

lastName :: String -> String
lastName name 
	| filter (==' ')  name == [] = name
	| otherwise = lastName (tail name)

