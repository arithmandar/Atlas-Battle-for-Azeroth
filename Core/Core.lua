--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2020 ~ 2026 - Arith Hsu, Atlas Team 

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]
-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
-- Libraries
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local _, private = ...

private.addon_name = "Atlas_BattleforAzeroth"
private.module_name = "BattleforAzeroth"

local LibStub = _G.LibStub
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")
---@type AtlasDataModule
local addon = Atlas:NewModule(private.module_name)
local UnitFactionGroup = _G.UnitFactionGroup

---@class AtlasDataModule
---@field OnInitialize fun(self: AtlasDataModule)
---@field OnEnable fun(self: AtlasDataModule)
---@field Refresh fun(self: AtlasDataModule)

local function copy_faction_tables(faction)
	local faction_tables = private[faction]
	if not faction_tables or not faction_tables.maps or not faction_tables.coords then
		error("Missing faction-specific map data for " .. tostring(faction), 2)
	end

	for k, v in pairs(faction_tables.maps) do
		private.db.AtlasMaps[k] = v
	end
	for k, v in pairs(faction_tables.coords) do
		private.db.AtlasMaps_NPC_DB[k] = v
	end
end

-- //////////////////////////////////////////////////////////////////////////
function addon:OnInitialize()
	local faction = UnitFactionGroup("player")
	copy_faction_tables(faction and faction:lower())
	addon.db = private.db
end

function addon:OnEnable()

end

function addon:Refresh()

end