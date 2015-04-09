{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import  Data.Text
import           Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]

instance Yesod HelloWorld

data MyRoute = Home | About

renderMyRoute :: MyRoute -> Text
renderMyRoute Home = "/"
renderMyRoute About = "/about.html"

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|<h1>Hello World!<br>
                                                      <p>sample page<br>
                                                                        <a href="/about.html">about
                                         |]

main :: IO ()
main = warpEnv HelloWorld