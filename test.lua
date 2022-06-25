local IDs = {}

for i = 0, 10 do
	IDs[i] = require("randomID")("TEST", true, 12); print("ID "..i.." : "..IDs[i])
end
