import System.Environment

get_working_hours :: [[Int]] -> Int

get_working_hours [] = 0
get_working_hours (x:xs) = get_hour x + get_working_hours xs

get_hour :: [Int] -> Int
get_hour [] = 0
get_hour (x:xs) = get_diff xs

get_diff :: [Int] -> Int
get_diff x = x!!1 - x!!0

get_employer_income x y = x * y

main = do
  [x] <- map read `fmap` getArgs
  print $ get_working_hours x
