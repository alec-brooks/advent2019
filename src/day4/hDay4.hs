import Data.List

validPassword :: [Int] -> Bool
validPassword password = (onlyIncrease password) && (containsRepeatingDigits password)

arrayToNumber :: [Int] -> Int
arrayToNumber [a,b] = a*10 + b

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)

chunks :: Int -> [a] -> [[a]]
chunks n = takeWhile (not.null) . unfoldr (Just . splitAt n)

allPairs :: [Int] -> [[Int]]
allPairs password = 
  (chunks 2 password) ++ (chunks 2 $ init  $ tail password)

containsRepeatingDigits :: [Int] -> Bool
containsRepeatingDigits password = 
  any allTheSame $ allPairs password

onlyIncrease :: [Int] -> Bool
onlyIncrease password = 
  all (\[a,b] -> a<=b) $ allPairs password

digits :: Int -> [Int]
digits n = map (\x -> read [x] :: Int) (show n)

countValidPasswords :: [[Int]] -> Int
countValidPasswords = 
  foldl (\count p -> if (validPassword p) then count + 1 else count) 0
main :: IO ()
main = do
  print $ countValidPasswords $ map digits [353096..843212]
  -- print $ validPassword [1,1,1,1,1,1]
  -- print $ validPassword [2,2,3,4,5,0]
  -- print $ validPassword [1,2,3,7,8,9]
