# SymbolDiff

Library for symbolic differentiation of polynomials. The input is a string of the form "x^2+4*x+3+y" and a variable for differentiation, e.g. 'x'. In this case the result should be "2*x+4".

## Usage

To use you need call SymbolDiff.diff( inputString, variable ) where: 

inputString - symbolic  polynomials in string format like “x^2+4*x+3+y” without spaces and only in downcase

variable - variable to differentiate, e.g. 'x'

