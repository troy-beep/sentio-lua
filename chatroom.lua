
-- Modify `chatroom.lua` to include a handler for `Members`
-- to register to the chatroom with the following code:

  Handlers.add(
    "Register",
    { Action = "Register"},
    function (msg)
      table.insert(Members, msg.From)
      print(msg.From .. " Registered")
      msg.reply({ Data = "Registered." })
    end
  )
