# LuaDispatch

This helper will let you register functions to event calls.

```lua
function registeredFunction(data)
  print(data.data)
end

dispatcher.register("dispatch", registeredFunction)
local event = {type = "dispatch", data = "hello"}
dispatcher.dispatch(event)
-- "hello"
```
