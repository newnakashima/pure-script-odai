module Odai.Odai5 where

import Prelude

import Data.Array (filter)

{--
お題5: 奇数フィルタリング

概要:
整数のリストから奇数のみを取り出すプログラムを作成する。

課題内容:
1. 整数リストを受け取り、奇数のみを返す関数 filterOdd を作成する。
2. filter を使用して実装する。

例:
```
filterOdd [1, 2, 3, 4, 5] -- [1, 3, 5]
filterOdd [2, 4, 6, 8]    -- []
```

ポイント:
パイプライン処理を意識してコードを組む。
--}

filterOdd :: Array Int -> Array Int
filterOdd = filter (\i -> eq 1 $ mod i 2)
