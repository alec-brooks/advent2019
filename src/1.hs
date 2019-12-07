fuelForMass mass = (quot mass 3) - 2
fuelForRocketMass mass =  
  let curFuel = fuelForMass mass in
  if curFuel < 0 then 0 else curFuel + fuelForRocketMass curFuel

main :: IO ()
main = do
  stdIn <- getContents
  let numbers = map read $ lines stdIn
  print $ sum $ map fuelForRocketMass numbers
