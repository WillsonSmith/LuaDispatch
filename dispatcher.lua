local function luaDispatch()
  local dispatcher = {}
  local listeners = {}
  function dispatcher.register(type, callback)
    if not listeners[type] then
      listeners[type] = {}
    end
    table.insert(listeners[type], callback)
  end

  function dispatcher.remove(type, callback)
    listeners[type] =
      filter(
      listeners[type],
      function(listener)
        return listener ~= callback
      end
    )
  end

  function dispatcher.dispatch(event)
    local listenerEvent = listeners[event.type] or {}

    if (#listenerEvent > 0) then
      for i, listener in pairs(listenerEvent) do
        listener(event)
      end
    end
  end

  return dispatcher
end

local function filter(t, fn, retainkeys)
  fn = iteratee(fn)
  local iter = getiter(t)
  local rtn = {}
  if retainkeys then
    for k, v in iter(t) do
      if fn(v) then
        rtn[k] = v
      end
    end
  else
    for _, v in iter(t) do
      if fn(v) then
        rtn[#rtn + 1] = v
      end
    end
  end
  return rtn
end

return luaDispatch
