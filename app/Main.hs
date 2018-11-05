module Main where

import Lib
import Network
import System.IO

server = "irc.freenode.org"
port   = 6667

main :: IO ()
main = do
    h <- connectTo server (PortNumber (fromIntegral port))
    hSetBuffering h NoBuffering
    t <- hGetContents h
    print t
