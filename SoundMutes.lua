-- Mute Annoying WoW Sounds - Generated  (v1.0 - Build Date 14/12/2019)
-- Sounds Found: 8845.
local SoundIDs = {

}

-- Print Message
local function MAWS_Print(text, prefix)
	local tag = "MuteAnnoyingWoWSounds"
	local frame = DEFAULT_CHAT_FRAME
	if prefix ~= false then
		frame:AddMessage(("|cffffd480<|r|cffaaff80%s|r|cffffd480>|r %s"):format(tostring(tag), tostring(text)), 1, 0.46, 0.2)
	else
		frame:AddMessage(text, 1, 0.46, 0.2);
	end
end

local function MuteAllSounds()
   count = 0
   customcount = 0
   if MAWowSoundsCustom ~= nil then
      for _, soundID in pairs (MAWowSoundsCustom) do
         MuteSoundFile(soundID)
         customcount = customcount + 1
      end
   end
   return count, customcount
end

local MuteAnnoyingWoWSoundsCore = CreateFrame("Frame", "MuteAnnoyingWoWSoundsCore")
MuteAnnoyingWoWSoundsCore:RegisterEvent("PLAYER_LOGIN")
MuteAnnoyingWoWSoundsCore:SetScript("OnEvent",
  function(self, event, ...)
   local count, customcount = MuteAllSounds()
   if customcount > 0 then
      MAWS_Print(count+customcount.." sounds have been muted. ("..customcount.." custom sounds)")
   else 
      MAWS_Print(count.." Sounds have been muted.")
   end
end)

