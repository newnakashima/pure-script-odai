module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Odai.Odai1 (calculate)
import Odai.Odai2 (reverseWords)
import Odai.Odai3 (Tasks, addTask, completeTask, showTasks)
import Odai.Odai4 (fibonacci, fibonacci2)
import Odai.Odai5 (filterOdd)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

testTasks :: Tasks
testTasks = [{index: 1, description: "hoge"}, {index: 2, description: "fuga"}]

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
    suite "tasks" do
      test "addTask" do
        Assert.equal testTasks
          $ addTask [{index: 1, description: "hoge"}] "fuga"
      test "completeTask" do
        Assert.equal [{index: 1, description: "hoge"}]
          $ completeTask testTasks 2
        Assert.equal [{index: 2, description: "fuga"}]
          $ completeTask testTasks 1
      test "showTasks" do
        -- 簡易的なテスト
        liftEffect $ showTasks testTasks
    suite "fibonacci" do
      test "fibonacci" do
        Assert.equal [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
          $ fibonacci 10
      test "fibonacci2" do
        Assert.equal [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
          $ fibonacci2 10
    suite "filterOdd" do
      test "filterOdd" do
        Assert.equal [1, 3, 5]
          $ filterOdd [1, 2, 3, 4, 5]
