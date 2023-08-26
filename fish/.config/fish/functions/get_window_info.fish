function get_window_info
    swaymsg -t get_tree | jq 'recurse(.nodes[]?, .floating_nodes[]?) | select(.type == "con") | if .app_id then {"type": "app_id", "value": .app_id} else {"type": "class", "value": .class} end'
end
# function get_window_info
#     swaymsg -t get_tree | jq 'recurse(.nodes[]?, .floating_nodes[]?) | select(.type == "con") | if .app_id then .app_id else .class end'
# end
