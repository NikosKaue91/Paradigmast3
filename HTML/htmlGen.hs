--Gerando HTML: Programação funcional com Haskell
--Nome: Nikollas Kauê Soares Gomes
--Matrícula: 201020867

{- Este programa lê um arquivo CSV, com 2 dados por linha. Cada linha é transformada numa tupla. 
  A lista de tuplas são passada para uma função que vai gerar uma longa string representando um
  documento HTML. -}

main :: IO ()
main = do
    strcontent <- readFile infile
    let listofstrlist = map (splitOnChar ',') (lines strcontent)
        strtuplelist = map (\lis -> (head lis, last lis)) listofstrlist
    writeFile outfile (mkHtmlURLItemsDoc "Usuarios Cadastrados no NCC:" strtuplelist)
    where 
    infile = "logins.csv"
    outfile = "cadastros-NCC.html"


{- Esta função deve ser alterada para chamar outras funções que vão
  construir o documento HTML. 
  <a href="nome-do-lugar-a-ser-levado">descrição</a> -}
mkHtmlURLItemsDoc :: String -> [(String,String)] -> String
mkHtmlURLItemsDoc title lis = title ++ "<html><body><ul>" ++ (foldr1 (++) (end (link (map fst lis) (map snd lis)))) ++ "<html><body><ul>"

--começo da implementação
link :: [String] -> [String] -> [String]
link x y
    | (x == []) || (y == []) = []
    | otherwise = ("<li><a href=http://www.inf.ufsm.br/~"++ (head y)++ ">" ++ (head x)) : link (tail x) (tail y) --irá montar o link de redirecionamento do usuario cadastrado no arquivo logins

end :: [String] -> [String]
end s = map (++"</a></li>\n") s --encerramento da implementação 


-- Decompoe string usando um caracter delimitador
splitOnChar :: Char -> String -> [String]
splitOnChar x y = auxSplitOnChar x y [[]]

auxSplitOnChar :: Char -> String -> [String] -> [String]
auxSplitOnChar x [] z = reverse (map reverse z)
auxSplitOnChar x (y:ys) (z:zs) = 
	if y == x then 
            auxSplitOnChar x ys ([]:(z:zs)) 
        else 
            auxSplitOnChar x ys ((y:z):zs)
