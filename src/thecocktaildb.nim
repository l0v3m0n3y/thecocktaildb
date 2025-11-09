import asyncdispatch, httpclient, json

const api = "https://www.thecocktaildb.com/api"
var headers = newHttpHeaders({
  "Connection": "keep-alive", 
  "Host": "thecocktaildb.com",
  "Content-Type": "application/json", 
  "accept": "application/json", 
  "user-agent": "okhttp/4.12.0"
})

proc get_categorys*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/list.php?c=list")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_drink_by_ingredient*(ingredient:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/filter.php?i=" & ingredient)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_cocktail_by_id*(id:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/lookup.php?i=" & $id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_req*(q:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/search.php?f=" & q)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc random_cocktail*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/randomselection.php")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc popular_cocktails*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/popular.php")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc latest_cocktail*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/json/v2/9973533/latest.php")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
