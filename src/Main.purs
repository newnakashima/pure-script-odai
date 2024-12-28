module Main where

import Prelude

import Data.Array (reverse)
import Data.Maybe (Maybe(..))
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "🍝"

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

{--
お題2: 単語の逆順並び替え
概要:
文字列のリストを入力し、それぞれの単語を逆順にして返すプログラムを作成する。

課題内容:
1. リストの各要素を逆順に並べ替える関数 reverseWords を作成する。
2. 入力は文字列のリスト、出力はそれぞれ逆順にした文字列のリスト。
3. map を使って実装する。

例:
```
reverseWords ["hello", "world", "purescript"] 
-- ["olleh", "dlrow", "tpircesrup"]
```

ポイント:
Data.String モジュールの関数を活用する。
--}

reverseWords :: Array String -> Array String
reverseWords = map (\elm -> fromCharArray $ reverse $ toCharArray elm)
