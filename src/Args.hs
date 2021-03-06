module Args where

import Base


parse :: Props -> [String] -> Props

parse p [] = p

parse p ("-v" : rest) = 
    parse
        ( p { isVerbose = True } )
        rest

parse p ("-o" : path : rest) = 
    parse
        ( p { getOutput = path } )
        rest


parse p ("-s" : n : rest) = 
    parse
        ( p { getSamples = read n } )
        rest

parse p ("-w" : n : rest) = 
    parse
        ( p { getSize = (read n, snd $ getSize p) } )
        rest

parse p ("-h" : n : rest) = 
    parse
        ( p { getSize = (fst $ getSize p, read n) } )
        rest

parse p ("-F" : n : rest) = 
    parse 
        ( p { getFOVdeg = read n} ) 
        rest

parse p ("-B" : n : rest) = 
    parse 
        ( p { getMaxBounces = read n} ) 
        rest

parse p ("-S" : n : rest) = 
    parse 
        ( p { getMaxSteps = read n} ) 
        rest

parse p ("--min-collide" : n : rest) = 
    parse 
        ( p { getMinCollide = read n} ) 
        rest

parse p ("--collide-shrink" : n : rest) =
    parse 
        ( p { getCollideShrink = read n} ) 
        rest

parse p ("--empty-increase" : n : rest) =
    parse 
        ( p { getEmptyIncrease = read n} ) 
        rest
