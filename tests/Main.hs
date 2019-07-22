module Main (main) where

import Test.Tasty
-- import Test.Tasty.ExpectedFailure
-- import Test.Tasty.HUnit
-- import Test.Tasty.QuickCheck

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests"
  [
  ]
