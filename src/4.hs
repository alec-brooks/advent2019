import Data.List

validPassword :: [Int] -> Bool
validPassword password = (onlyIncrease password) && (containsRepeatingDigits password)

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
  
filterByLength :: Ord a => (Int -> Bool) -> [a] -> [[a]]
filterByLength p = filter (p . length) . group . sort

unique :: Ord a => [a] -> [a]
unique = concat . filterByLength (==1)

windows m = foldr (zipWith (:)) (repeat []) . take m . tails

main :: IO ()
main = do
  print $ map (unique . allPairs) $ windows 4 [1,1,1,4,5,6]
  -- print $ unique $ allPairs [1,1,2,2,1,1]
  -- print $ unique $ allPairs [1,2,2,2,4,1]
  -- print $ countValidPasswords $ map digits [353096..843212]
  -- print $ validPassword [1,1,1,1,1,1]
  -- print $ validPassword [2,2,3,4,5,0]
  -- print $ validPassword [1,2,3,7,8,9]
