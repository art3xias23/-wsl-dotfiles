local dap = require("dap")
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return "/mnt/c/Users/kmilchev/source/repos/Balternative/src/AgePartnership.Tel.App/AgePartnership.Tel.App/bin/Debug/net8.0/AgePartnership.Tel.App.dll"
end,
      justMyCode = false,
    stopAtEntry = false,
    env = {
      ASPNETCORE_ENVIRONMENT = function()
        -- todo: request input from ui
        return "Development"
      end,
      ASPNETCORE_URLS = function()
        -- todo: request input from ui
        return "http://localhost:8080"
      end,
    },
  },
}
