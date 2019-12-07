import Data.List

validPassword :: [Int] -> Bool
validPassword password = (onlyIncrease password) && (containsRepeatingDigits password)

validPasswordPart2 :: [Int] -> Bool
validPasswordPart2 password = (onlyIncrease password) && (contains2RepeatingDigits password)

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

contains2RepeatingDigits :: [Int] -> Bool
contains2RepeatingDigits password =
  any allTheSame $ (unique . allPairs) password

onlyIncrease :: [Int] -> Bool
onlyIncrease password = 
  all (\[a,b] -> a<=b) $ allPairs password

digits :: Int -> [Int]
digits n = map (\x -> read [x] :: Int) (show n)

countValidPasswords :: [[Int]] -> Int
countValidPasswords = 
  foldl (\count p -> if (validPasswordPart2 p) then count + 1 else count) 0
  
filterByLength :: Ord a => (Int -> Bool) -> [a] -> [[a]]
filterByLength p = filter (p . length) . group . sort

unique :: Ord a => [a] -> [a]
unique = concat . filterByLength (==1)

windows m = foldr (zipWith (:)) (repeat []) . take m . tails

main :: IO ()
main = do
  print $ countValidPasswords $ map digits [353096..843212]
  -- print $ validPassword [1,1,1,1,1,1]
  -- print $ validPassword [2,2,3,4,5,0]
  -- print $ validPassword [1,2,3,7,8,9]
