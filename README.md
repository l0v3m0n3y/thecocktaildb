# thecocktaildb
api for thecocktaildb.com site and app for get cocktail recept
# Example
```nim
import asyncdispatch, thecocktaildb, json, strutils

let data = waitFor popular_cocktails()
let drinks = data["drinks"]
for drink in drinks:
  echo drink["strDrink"].getStr()
  echo drink["strGlass"].getStr()
  echo drink["strInstructions"].getStr()
  echo ".".repeat(40)
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
