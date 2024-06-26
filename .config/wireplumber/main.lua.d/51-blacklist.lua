rule = {
  matches = {
    {
      { "device.name", "equals", "alsa_card.usb-Sony_Interactive_Entertainment_Wireless_Controller-00" },
    },
  },
  apply_properties = {
    ["device.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules,rule)
