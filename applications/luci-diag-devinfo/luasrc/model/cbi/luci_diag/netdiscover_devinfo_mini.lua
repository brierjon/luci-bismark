--[[
netdiscover_devinfo - SIP Device Information

(c) 2009 Daniel Dickinson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

require("luci.i18n")
require("luci.util")
require("luci.sys")
require("luci.model.uci")

local debug = false

m = SimpleForm("luci_devinfo", translate("l_d_d_nd_mini_netdiscover_to_devinfo"), translate("l_d_d_nd_mini_netdiscover_to_devinfo_descr"))
m.reset = false
m.submit = false

local outnets = luci.controller.luci_diag.netdiscover_common.get_params()
luci.controller.luci_diag.devinfo_common.run_processes(outnets, luci.controller.luci_diag.netdiscover_common.command_function)
luci.controller.luci_diag.devinfo_common.parse_output(m, outnets, false, "netdiscover", true, debug)
luci.controller.luci_diag.netdiscover_common.action_links(m, true)

return m