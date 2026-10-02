local SOURCE_PATH = "XXtejo/bankroll_ftap.lua"

assert(type(isfile) == "function", "XXtejo: executor does not provide isfile")
assert(type(readfile) == "function", "XXtejo: executor does not provide readfile")
assert(type(loadstring) == "function", "XXtejo: executor does not provide loadstring")
assert(isfile(SOURCE_PATH), "XXtejo: missing " .. SOURCE_PATH)

local source = readfile(SOURCE_PATH)
assert(type(source) == "string" and #source > 100000, "XXtejo: local source is empty or incomplete")

local chunk, compileError = loadstring(source, "@XXtejo/local")
assert(chunk, "XXtejo compile error: " .. tostring(compileError))
return chunk()
