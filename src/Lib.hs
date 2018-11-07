module Lib
    ( listen
    , start
    , write
    ) where

import Network
import System.IO
import Text.Printf

start :: String -> String -> String -> Int -> IO ()
start nickname channel server port = do
    handle <- connectTo server (PortNumber (fromIntegral port))
    hSetBuffering handle NoBuffering
    write handle "NICK" nickname
    write handle "USER" (nickname ++ " 0 * :dude bot")
    write handle "JOIN" channel
    listen handle

listen :: Handle -> IO ()
listen handle = forever $ do
    output <- hGetLine handle
    putStrLn output
  where
    forever a = do a; forever a

write :: Handle -> String -> String -> IO ()
write handle action command = do
    hPrintf handle "%s %s\r\n" action command
    printf         "> %s %s\n" action command
