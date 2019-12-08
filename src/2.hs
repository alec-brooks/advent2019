import IntCode
memoryString :: [Char]
memoryString = "1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,5,19,23,2,6,23,27,1,27,5,31,2,9,31,35,1,5,35,39,2,6,39,43,2,6,43,47,1,5,47,51,2,9,51,55,1,5,55,59,1,10,59,63,1,63,6,67,1,9,67,71,1,71,6,75,1,75,13,79,2,79,13,83,2,9,83,87,1,87,5,91,1,9,91,95,2,10,95,99,1,5,99,103,1,103,9,107,1,13,107,111,2,111,10,115,1,115,5,119,2,13,119,123,1,9,123,127,1,5,127,131,2,131,6,135,1,135,5,139,1,139,6,143,1,143,6,147,1,2,147,151,1,151,5,0,99,2,14,0,0"


main :: IO ()
main = do
  --let memory = map read $ wordsWhen (==',') memoryString
  let memory = [1, 0, 0, 0, 99]
  let memory = [2,3,0,3,99]
  let memory = [2,4,4,5,99,0]
  let memory = [1, 1, 1, 4, 99, 5, 6, 0, 99]
  -- Part 1
  print $ intCode 0 0 (memory, [])
  --let possibleNounVerb = [ (x,y) | x<-[0..99], y<-[0..99] ]
  --let restoredMemories = map (uncurry $ restoreMemory memory) possibleNounVerb
  --print $ map (take 3) restoredMemories
  --print $ filter (\x -> x!!0 == 19690720) $  map (intCode 0) restoredMemories

