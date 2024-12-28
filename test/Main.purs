module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main (calculate, reverseWords)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  runTest do 
    suite "calculate" do
      test "add" do
        Assert.equal (Just 3)
          $ calculate 1 2 "add"
      test "sub" do
        Assert.equal (Just 4)
          $ calculate 10 6 "sub"
      test "multiply" do
        Assert.equal (Just 24)
          $ calculate 4 6 "multiply"
      test "divide" do
        Assert.equal (Just 5)
          $ calculate 20 4 "divide"
      test "zero divide" do
        Assert.equal Nothing
          $ calculate 10 0 "divide"
      test "invalid operator" do
        Assert.equal Nothing
          $ calculate 1 2 "invalid"
    suite "reverseWords" do
      test "reverseWords" do
        Assert.equal ["olleh", "dlrow", "tpircserup"]
          $ reverseWords ["hello", "world", "purescript"]
