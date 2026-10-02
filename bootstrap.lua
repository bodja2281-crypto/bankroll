local URL = "https://raw.githubusercontent.com/bodja2281-crypto/bankroll/main/xxtejo.lua"

local ok, source = pcall(function()
	return game:HttpGet(URL .. "?v=" .. tostring(os.time()), true)
end)

assert(ok, "XXtejo download failed: " .. tostring(source))
assert(
	type(source) == "string"
		and #source > 100
		and source ~= "404: Not Found"
		and not source:find("<html", 1, true),
	"XXtejo file is unavailable. Check the public bankroll repository and main branch."
)

assert(type(loadstring) == "function", "XXtejo requires an executor with loadstring support")
local chunk, compileError = loadstring(source, "@XXtejo")
assert(chunk, "XXtejo compile error: " .. tostring(compileError))
return chunk()
