module Main where

import Lib

channel  = "#gremax"
nickname = "dudebot"
port     = 6667
server   = "irc.freenode.org"

main :: IO ()
main = do
  start nickname channel server port
