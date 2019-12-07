module IntCode  where
exitInt=99

opIdx=0
firstParamIdx=1
secondParamIdx=2
outputIdx=3
instructionSize=4

replaceNth :: Int -> a -> [a] -> [a]
replaceNth _ _ [] = []
replaceNth n newVal (x:xs)
 | n == 0 = newVal:xs
 | otherwise = x:replaceNth (n-1) newVal xs

operation :: Int -> Maybe (Int -> Int -> Int)
operation 1  = Just (+)
operation 2  = Just (*)
operation 99 = Nothing
operation x = Nothing

lookupMemAddress m i = m!!(m!!(i))

operateOnMemory :: [Int] -> Int -> (Int -> Int -> Int) -> [Int]
operateOnMemory memory instructionPointer op =  
  let value  = op (lookupMemAddress memory $ instructionPointer+firstParamIdx) (lookupMemAddress memory $ instructionPointer+secondParamIdx) 
  in replaceNth (memory!!(instructionPointer+outputIdx)) value  memory
  

intCode :: Int -> [Int] -> [Int]
intCode instructionPointer memory = do
  let opcode = operation $ memory!!(instructionPointer+opIdx) 
  case opcode of 
    Just op -> intCode (instructionPointer + instructionSize) $ operateOnMemory memory instructionPointer op 
    Nothing -> memory

wordsWhen p s = case dropWhile p s of
  "" -> []
  s' -> w : wordsWhen p s''
        where (w,s'') = break p s'

restoreMemory memory noun verb =
  replaceNth 1 noun $ replaceNth 2 verb memory

