local buff = {}
local c = C_CharacterAdvancement
c.SetFilteredEntries("", { FILTER_KNOWN = false })
for i=1,c.GetNumFilteredEntries() do
   local id = c.GetFilteredEntryAtIndex(i)
   if id.RequiredLevel <= 60 then
      if id.Type == "TalentAbility" then id.Type = "Ability" end
      local str = string.gsub(id.Name, '^%s*(.-)%s*$', '%1')
      str = string.gsub(str, '"', "'")
      local desc = string.gsub(GetSpellDescription(id.Spells[#id.Spells]), '[\n\r]', ' ')
      desc = string.gsub(desc, '|c%x%x%x%x%x%x%x%x(.-)|r', '%1')
      desc = string.gsub(desc, '|TInterface.-|t', '')
      desc = string.gsub(desc, '"', "'")
      table.insert(buff, id.Class .. "," .. id.Tab .. "," .. id.Type .. ',"' .. str .. '",' .. id.Spells[1] .. ',"' .. desc .. '",'..id.RequiredLevel.. ','..id.RequiredClassAEInvestment.. ','..id.RequiredTabAEInvestment.. ','..id.RequiredClassPoints.. ','..id.RequiredAEInvestment.. ','..id.RequiredClassTEInvestment.. ','..id.RequiredTabTEInvestment.. ','..id.RequiredTEInvestment)
   end
end

table.sort(buff, function(a,b) return string.lower(a) < string.lower(b) end)
table.insert(buff, 1, "Class,Tab,Type,Name,ID,Description,RequiredLevel,RequiredClassAEInvestment,RequiredTabAEInvestment,RequiredClassPoints,RequiredAEInvestment,RequiredClassTEInvestment,RequiredTabTEInvestment,RequiredTEInvestment")
Internal_CopyToClipboard(table.concat(buff, "\n"))
buff = nil
print(GetTime())





-- Run separately
local buff = {}
for _, m in pairs(C_MysticEnchant.QueryEnchants(9999, 1, "", {})) do
   local quality = EnchantCollectionUtil:GetQualityFromQualityName(m.Quality)
   local desc = string.gsub(GetSpellDescription(m.SpellID), '[\n\r]', ' ')
   desc = string.gsub(desc, '|c%x%x%x%x%x%x%x%x(.-)|r', '%1')
   desc = string.gsub(desc, '|TInterface.-|t', '')
   desc = string.gsub(desc, '"', "'")
   table.insert(buff, _G["MYSTIC_ENCHANT_QUALITY"..quality.."_DESC"]..',"'..m.SpellName..'","'..desc..'"')
end

table.sort(buff, function(a,b) return string.lower(a) < string.lower(b) end)
table.insert(buff, 1, "Rarity,Name,Description")
Internal_CopyToClipboard(table.concat(buff, "\n"))
buff = nil
print(GetTime())