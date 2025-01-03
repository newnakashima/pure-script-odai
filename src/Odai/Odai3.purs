module Odai.Odai3
  ( Task
  , Tasks
  , addTask
  , completeTask
  , showTasks
  )
  where

import Prelude

import Data.Array (deleteAt, findIndex, last)
import Data.Maybe (fromMaybe)
import Data.String (joinWith)
import Effect (Effect)
import Effect.Console (log)

{--
お題3: 簡易なTodoリスト
概要:
リストを使って、簡単なTodoリスト管理プログラムを作成する。

課題内容:
1. タスクを追加する関数 addTask を作成する。
2. 特定のタスクを完了（リストから削除）する関数 completeTask を作成する。
3. リスト内のタスクをすべて表示する関数 showTasks を作成する。

例:
```
let tasks = []
let tasks1 = addTask tasks "Buy groceries"
let tasks2 = addTask tasks1 "Study PureScript"
showTasks tasks2
-- ["1: Buy groceries", "2: Study PureScript"]
let tasks3 = completeTask tasks2 1
showTasks tasks3
-- ["2: Study PureScript"]
```

ポイント:
純粋関数型プログラミングらしく、リストを不変に保ちながら新しいリストを生成する。
--}

type Task = {index :: Int, description :: String}

type Tasks = Array Task

lastTask :: Tasks -> Task
lastTask tasks = fromMaybe {index: 0, description: ""} (last tasks)

lastIndexOfTasks :: Tasks -> Int
lastIndexOfTasks tasks = (lastTask tasks).index

addTask :: Tasks -> String -> Tasks
addTask tasks task = tasks <> [{index: nextIndex, description: task}]
    where nextIndex = (lastIndexOfTasks tasks) + 1

realIndexOfTask :: Tasks -> Int -> Int
realIndexOfTask tasks index = fromMaybe 0 $ findIndex (\task -> task.index == index) $ tasks

completeTask :: Tasks -> Int -> Tasks
completeTask tasks index =
    fromMaybe tasks $ deleteAt (realIndexOfTask tasks index) $ tasks

showTask :: Task -> String
showTask task = (show task.index) <> ": " <> task.description

showTasks :: Tasks -> Effect Unit
showTasks tasks = do
    let formatted = "[" <> joinWith ", " (map showTask tasks) <> "]"
    log formatted
