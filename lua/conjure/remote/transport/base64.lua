local _2afile_2a = "fnl/conjure/remote/transport/base64.fnl"
local _2amodule_name_2a = "conjure.remote.transport.base64"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function encode(data)
  local function _1_(x)
    local r, b0 = "", x:byte()
    for i = 8, 1, ( - 1) do
      r = (r .. (((((b0 % (2 ^ i)) - (b0 % (2 ^ (i - 1)))) > 0) and "1") or "0"))
    end
    return r
  end
  local function _2_(x)
    if (#x < 6) then
      return ""
    else
    end
    local c = 0
    for i = 1, 6 do
      c = (c + (((x:sub(i, i) == "1") and (2 ^ (6 - i))) or 0))
    end
    return b:sub((c + 1), (c + 1))
  end
  return (((data:gsub(".", _1_) .. "0000")):gsub("%d%d%d?%d?%d?%d?", _2_) .. ({"", "==", "="})[((#data % 3) + 1)])
end
_2amodule_2a["encode"] = encode
local function decode(data)
  data = string.gsub(data, ("[^" .. b .. "=]"), "")
  local function _4_(x)
    if (x == "=") then
      return ""
    else
    end
    local r, f = "", (b:find(x) - 1)
    for i = 6, 1, ( - 1) do
      r = (r .. (((((f % (2 ^ i)) - (f % (2 ^ (i - 1)))) > 0) and "1") or "0"))
    end
    return r
  end
  local function _6_(x)
    if (#x ~= 8) then
      return ""
    else
    end
    local c = 0
    for i = 1, 8 do
      c = (c + (((x:sub(i, i) == "1") and (2 ^ (8 - i))) or 0))
    end
    return string.char(c)
  end
  return data:gsub(".", _4_):gsub("%d%d%d?%d?%d?%d?%d?%d?", _6_)
end
_2amodule_2a["decode"] = decode
return _2amodule_2a