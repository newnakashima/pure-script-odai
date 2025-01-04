module Odai.Odai4
  (
    fibonacci
  , fibonacci2
  )
  where

import Prelude

import Data.Array (foldl, index, length, (..))
import Data.Maybe (fromMaybe)

{--
お題4: フィボナッチ数列の生成

概要:
最初の n 個のフィボナッチ数列を生成する関数を作成する。

課題内容:
1. 入力として整数 n を受け取り、長さ n のフィボナッチ数列を返す関数 fibonacci を作成する。
2. 再帰を使わず、foldl を活用して実装する。

例:
```
fibonacci 5 -- [0, 1, 1, 2, 3]
fibonacci 10 -- [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

ポイント:
イミュータブルなデータ構造を使って、効率よく数列を生成する。
--}

op :: Array Int -> Int -> Int
op arr i = fromMaybe 0 (index arr i)

fibonacci :: Int -> Array Int
fibonacci n =
  foldl step [0, 1] (1 .. (n - 2))
  where
    step acc _ =
        let a = acc `op` (length acc - 2)
            b = acc `op` (length acc - 1)
        in acc <> [a + b]

{--
普通の実装
--}
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibonacci2 :: Int -> Array Int
fibonacci2 n = map (\i -> fib i) (0 .. (n - 1))
