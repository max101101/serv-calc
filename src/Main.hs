{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Response = Response {
	operator  :: String,
	arguments :: [Float],
	result    :: Maybe Float,
	error     :: Maybe String
} deriving (Show, Generic)
instance ToJSON Response
instance FromJSON Response

divResponse :: Float -> Float -> Response
divResponse a 0 = Response { operator = "div",  arguments = [a, 0], result = Nothing, Main.error = (Just "Division by zero") }
divResponse a b = Response { operator = "div",  arguments = [a, b], result = (Just (a / b)), Main.error = Nothing }

sqrtResponse :: Float -> Response
sqrtResponse a
	| a < 0     = Response { operator = "sqrt",  arguments = [a], result = Nothing, Main.error = (Just "Sqrt from negative number") }
	| otherwise = Response { operator = "sqrt",  arguments = [a], result = (Just (sqrt a)), Main.error = Nothing }


powResponse :: Float -> Int -> Response
powResponse a b
	| a == 0 && b <= 0 = Response { operator = "pow",  arguments = [a, (fromIntegral b)], result = Nothing, Main.error = (Just "Zero to non positive power") }
	| otherwise        = Response { operator = "pow",  arguments = [a, (fromIntegral b)], result = (Just (a ^^ b)), Main.error = Nothing }

main = do
	putStrLn "Starting Server... at 3000"
	scotty 3000 $ do
		get "/hello/:name" $ do
			name <- param "name"
			text name

		get "/add/:a/:b" $ do
			a <- param "a"
			b <- param "b"
			let res = Response { operator = "add",  arguments = [a, b], result = (Just (a + b)), Main.error = Nothing }
			json res

		get "/sub/:a/:b" $ do
			a <- param "a"
			b <- param "b"
			let res = Response { operator = "sub",  arguments = [a, b], result = (Just (a - b)), Main.error = Nothing }
			json res

		get "/mul/:a/:b" $ do
			a <- param "a"
			b <- param "b"
			let res = Response { operator = "mul",  arguments = [a, b], result = (Just (a * b)), Main.error = Nothing }
			json res

		get "/div/:a/:b" $ do
			a <- param "a"
			b <- param "b"
			let res = divResponse a b
			json res

		get "/sqrt/:a" $ do
			a <- param "a"
			let res = sqrtResponse a
			json res


		get "/pow/:a/:b" $ do
			a <- param "a"
			b <- param "b"
			let res = powResponse a b
			json res
