local function TagAdmins(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if Manager(msg) then
if text == "admin" or text == "@admin" or text == "#all" then
if DevRio:get(DevX.."Rio:TagAdmins:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, '⌁︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevRio:setex(DevX..'Rio:TagAdmins:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100 },function(extra,result,success)
DevX = 0
tags = 0
local list = result.members_  
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,dp)
if DevX == 1 or DevX == tags or k == 0 then
tags = DevX + 5
t = "#Admins"
end
DevX = DevX + 1
TagName = dp.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if DevX == 1 or DevX == tags or k == 0 then
local Text = t:gsub('#Admins,','#Admins\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end
end
end

end
return {
DevX = TagAdmins
}
