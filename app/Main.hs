module Main where

import Lib
import Network
import System.IO
import Text.Printf

channel  = "#gremax"
nickname = "dudebot"
port     = 6667
server   = "irc.freenode.org"

main :: IO ()
main = do
    handle <- connectTo server (PortNumber (fromIntegral port))
    hSetBuffering handle NoBuffering
    write handle "NICK" nickname
    write handle "USER" (nickname ++ " 0 * :dude bot")
    write handle "JOIN" channel
    listen handle

write :: Handle -> String -> String -> IO ()
write handle action command = do
    hPrintf handle "%s %s\r\n" action command
    printf         "> %s %s\n" action command

listen :: Handle -> IO ()
listen handle = forever $ do
    output <- hGetLine handle
    putStrLn output
  where
    forever a = do a; forever a
