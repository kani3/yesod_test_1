{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
import           Data.Text
import           Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/       HomeR GET
/about  AboutR  GET
|]

instance Yesod HelloWorld

data MyRoute = Home | About

renderMyRoute :: MyRoute -> Text
renderMyRoute Home = "/"
renderMyRoute About = "/about"

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|
        <h1>Hello World!
        <p>sample page
        <a href="@{AboutR}">about
    |]

getAboutR :: Handler Html
getAboutR = defaultLayout [whamlet|
        <h1>About!
        <p>sample page
        <a href="@{HomeR}">home
    |]

main :: IO ()
main = warpEnv HelloWorld
