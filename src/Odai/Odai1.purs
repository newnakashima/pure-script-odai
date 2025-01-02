module Odai.Odai1 where

import Prelude
import Data.Maybe (Maybe(..))

{--
お題1: 簡易な四則演算プログラム
概要:
整数を2つ入力し、加算、減算、乗算、除算を行う関数を作成するプログラム。

課題内容:
1. 2つの整数を受け取る関数 calculate を定義する。
2. 計算方法（加算、減算など）を文字列で受け取り、その結果を返すようにする。
3. 不正な入力（例: 除算で0を指定）を型安全に処理する。

ポイント:
- パターンマッチを活用する。
- Maybe 型で安全な処理を試みる。

例:
```
calculate 10 5 "add"    -- Just 15
calculate 10 5 "divide" -- Just 2
calculate 10 0 "divide" -- Nothing
```
--}

calculate :: Int -> Int -> String -> Maybe Int
calculate a b op  
  | op == "add"              = Just (a + b)
  | op == "sub"              = Just (a - b)
  | op == "multiply"         = Just (a * b)
  | op == "divide" && b /= 0 = Just (a / b)
  | op == "divide" && b == 0 = Nothing
  | otherwise                = Nothing