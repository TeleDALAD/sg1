do
-- Will leave the group if be added
local function run(msg, matches)
local bot_id = our_id -- your bot id
   -- like local bot_id = 164756659
    if matches[1] == 'leave' and is_admin(msg) then
       chat_del_user("chat#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
    elseif msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
      send_large_msg("chat#id"..msg.to.id, 'متاسفیم این گروه متعلق به تیم A H D نیست و فرد ادد کننده از طرف بات بلاک میشود تا نتواند در گروه دیگری ربات را اد کند', ok_cb, false)
      chat_del_user("chat#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
      block_user("user#id"..msg.from.id,ok_cb,false)
    end
end
 
return {
  patterns = {
    "^#leave$",
    "^!!tgservice (.+)$",
  },
  run = run
}
end
