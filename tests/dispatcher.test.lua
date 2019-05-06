describe(
  "dispatcher",
  function()
    describe(
      "register",
      function()
        it(
          "should call function when receiving dispatched event",
          function()
            local dispatchImport = require("../dispatcher")
            local dispatcher = dispatchImport()
            local s =
              spy.new(
              function()
              end
            )

            dispatcher.register("dispatch", s)
            local event = {type = "dispatch", data = "yes"}
            dispatcher.dispatch(event)

            assert.spy(s).was.called()
            assert.spy(s).was.called_with(event)
          end
        )
      end
    )
  end
)
