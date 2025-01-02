module Odai.Odai2 where

import Prelude
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Data.Array (reverse)

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