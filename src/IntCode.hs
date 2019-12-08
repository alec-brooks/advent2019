module IntCode where
exitInt=99

opIdx=0
firstParamIdx=1
secondParamIdx=2
outputIdx=3

type Output = [Int]
type Memory = [Int]


replaceNth :: Int -> a -> [a] -> [a]
replaceNth _ _ [] = []
replaceNth n newVal (x:xs)
 | n == 0 = newVal:xs
 | otherwise = x:replaceNth (n-1) newVal xs


operation :: Int -> Int -> [Int] -> Maybe (Maybe ([Int] -> Int), Int)
operation _ 1 m     = Just $ (Just (sum . take 2), 4)
operation _ 2 m     = Just $ (Just (product . take 2), 4)
operation input 3 m = Just $ (Just (\_ -> input), 2)
operation _ 4 m     = Just $ (Nothing, 2)
operation _ 99 m    = Nothing
operation _ x m     = Nothing

lookupMemAddress m i = m!!(m!!(i))

paramSize :: Int -> Int
paramSize instructSize = instructSize - 2 -- opcode and outputId not included

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

operateOnMemory :: Memory -> Int -> (Maybe ([Int] -> Int), Int) -> Output -> (Memory, Output)
operateOnMemory memory instructionPointer  (Nothing, nInstructions) output  = 
  let out = output ++ [(lookupMemAddress memory (instructionPointer+nInstructions-1))]
  in (memory, out)
operateOnMemory memory instructionPointer (Just op, nInstructions) output =  
  let value  = op $ map (lookupMemAddress memory) $ slice instructionPointer (instructionPointer + paramSize nInstructions) memory
  in (replaceNth (memory!!(instructionPointer+nInstructions-1)) value memory, output)
  


intCode :: Int -> Int -> (Memory, Output) -> (Memory, Output)
intCode input instructionPointer (memory, output) = do
  let opcode = operation input ( memory!!(instructionPointer+opIdx) ) memory
  case opcode of 
    Just op -> intCode input ((+) instructionPointer $ snd op) $ operateOnMemory memory instructionPointer op output
    Nothing -> (memory, output)

wordsWhen p s = case dropWhile p s of
  "" -> []
  s' -> w : wordsWhen p s''
        where (w,s'') = break p s'

restoreMemory memory noun verb =
  replaceNth 1 noun $ replaceNth 2 verb memory

