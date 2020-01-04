-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2020 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

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
-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local pairs = _G.pairs
-- Libraries
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local LibStub = _G.LibStub
local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas")
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")
local BfA = Atlas:GetModule(private.module_name)

local db = {}
BfA.db = db

local BLUE = "|cff6666ff"
local GREN = "|cff66cc33"
local GREY = "|cff999999"
local LBLU = "|cff33cccc"
local _RED = "|cffcc3333"
local ORNG = "|cffcc9933"
local PINK = "|ccfcc33cc"
local PURP = "|cff9900ff"
local WHIT = "|cffffffff"
local YLOW = "|cffcccc33"
local INDENT = "      "

db.AtlasMaps = {
	-- /////////////////////////////////
	-- Kul Tiras instances
	-- /////////////////////////////////
	-- Crucible of Storms, Raid
	CrucibleofStorms = {
		ZoneName = { BZ["Crucible of Storms"] },
		Location = { BZ["Stormsong Valley"] },
		DungeonID = 1952,
		DungeonHeroicID = 1953,
		DungeonMythicID = 1954,
		PlayerLimit = { 10, 30 },
--		Acronym = "",
		WorldMapID = 1345, -- 1346
		JournalInstanceID = 1177,
		ZoneID = 10057,
		Module = "Atlas_BattleforAzeroth",
		{ WHIT.." 1) "..Atlas:GetBossName("The Restless Cabal", 2269), 2269},
		{ WHIT.." 2) "..Atlas:GetBossName("Uu'nat, Harbinger of the Void", 2273), 2273},
	},
	-- Freehold
	Freehold = {
		ZoneName = { BZ["Freehold"] },
		Location = { BZ["Tiragarde Sound"] },
		DungeonID = 1672,
		DungeonHeroicID = 1773,
		DungeonMythicID = 1704,
--		Acronym = "",
		WorldMapID = 936,
		JournalInstanceID = 1001,
		Module = "Atlas_BattleforAzeroth",
		{ WHIT.." 1) "..Atlas:GetBossName("Skycap'n Kragg", 2093), 2093},
		{ WHIT.." 2) "..Atlas:GetBossName("Council o' Captains", 2094), 2094},
		{ WHIT.." 3) "..Atlas:GetBossName("Ring of Booty", 2095), 2095},
		{ WHIT.." 4) "..Atlas:GetBossName("Harlan Sweete", 2096), 2096},
	},
	-- Siege of Boralus
	SiegeofBoralus = {
		ZoneName = { BZ["Siege of Boralus"] },
		Location = { BZ["Tiragarde Sound"] },
		DungeonID = 1700,
--		DungeonHeroicID = 0,
--		DungeonMythicID = 0,
--		Acronym = "",
		WorldMapID = 1162,
		JournalInstanceID = 1023,
		ZoneID = 9354,
		Module = "Atlas_BattleforAzeroth",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Chopper Redhook", 2132), 2132 },
		{ WHIT..INDENT..Atlas:GetBossName("Sergeant Bainbridge", 2132, 2)  },
		{ WHIT.." 2) "..Atlas:GetBossName("Dread Captain Lockwood", 2173), 2173 },
		{ WHIT.." 3) "..Atlas:GetBossName("Hadal Darkfathom", 2134), 2134 },
		{ WHIT.." 4) "..Atlas:GetBossName("Viq'Goth", 2140), 2140 },
	},
	-- Shrine of the Storm
	ShrineoftheStormA = {
		ZoneName = { BZ["Shrine of the Storm"]..ALC["MapA"] },
		Location = { BZ["Stormsong Valley"] },
		DungeonID = 1709,
		DungeonHeroicID = 1774,
		DungeonMythicID = 1710,
		--Acronym = "",
		WorldMapID = 1039,
		JournalInstanceID = 1036,
		ZoneID = 9525,
		Module = "Atlas_BattleforAzeroth",
		NextMap = "ShrineoftheStormB",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Connection"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Aqu'sirr", 2153), 2153 },
		{ WHIT.." 2) "..Atlas:GetBossName("Tidesage Council", 2154), 2154 },
		{ WHIT.." 4) "..Atlas:GetBossName("Vol'zith the Whisperer", 2156), 2156 },
	},
	ShrineoftheStormB = {
		ZoneName = { BZ["Shrine of the Storm"]..ALC["MapB"] },
		Location = { BZ["Stormsong Valley"] },
		DungeonID = 1709,
		DungeonHeroicID = 1774,
		DungeonMythicID = 1710,
		--Acronym = "",
		WorldMapID = 1040,
		JournalInstanceID = 1036,
		ZoneID = 9525,
		Module = "Atlas_BattleforAzeroth",
		PrevMap = "ShrineoftheStormA",
		{ BLUE.." B) "..ALC["Connection"], 10002 },
		{ WHIT.." 3) "..Atlas:GetBossName("Lord Stormsong", 2155), 2155 },
	},
	-- Tol Dagor
	TolDagorA = {
		ZoneName = { BZ["Tol Dagor"]..ALC["MapA"] },
		Location = { BZ["Tol Dagor"] },
		DungeonID = 1713,
		DungeonHeroicID = 1778,
		DungeonMythicID = 1714,
--		Acronym = "",
		WorldMapID = 974,
		JournalInstanceID = 1002,
		Module = "Atlas_BattleforAzeroth",
		NextMap = "TolDagorB",
		{ WHIT.." 1) "..Atlas:GetBossName("The Sand Queen", 2101), 2101},
		{ WHIT.." 3) "..Atlas:GetBossName("Knight Captain Valyri", 2103), 2103},
		{ WHIT.." 4) "..Atlas:GetBossName("Overseer Korgus", 2104), 2104},
	},
	TolDagorB = {
		ZoneName = { BZ["Tol Dagor"]..ALC["MapB"] },
		Location = { BZ["Tol Dagor"] },
		DungeonID = 1713,
		DungeonHeroicID = 1778,
		DungeonMythicID = 1714,
--		Acronym = "",
		WorldMapID = 977,
		JournalInstanceID = 1002,
		Module = "Atlas_BattleforAzeroth",
		PrevMap = "TolDagorA",
		{ BLUE.." B-D) "..ALC["Connection"], 10002 },
		{ WHIT.." 2) "..Atlas:GetBossName("Jes Howlis", 2102), 2102},
	},
	-- Waycrest Manor
	WaycrestManorA = {
		ZoneName = { BZ["Waycrest Manor"]..ALC["MapA"] },
		Location = { BZ["Tiragarde Sound"] },
		DungeonID = 1705,
		DungeonHeroicID = 1779,
		DungeonMythicID = 1706,
--		Acronym = "",
		WorldMapID = 1015,
		JournalInstanceID = 1021,
		Module = "Atlas_BattleforAzeroth",
		NextMap = "WaycrestManorB",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Connection"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Heartsbane Triad", 2113), 2113},
		{ WHIT.." 2) "..Atlas:GetBossName("Soulbound Goliath", 2114), 2114},
		{ WHIT.." 3) "..Atlas:GetBossName("Raal the Gluttonous", 2115), 2115},
	},
	WaycrestManorB = {
		ZoneName = { BZ["Waycrest Manor"]..ALC["MapB"] },
		Location = { BZ["Tiragarde Sound"] },
		DungeonID = 1705,
		DungeonHeroicID = 1779,
		DungeonMythicID = 1706,
--		Acronym = "",
		WorldMapID = 1018,
		JournalInstanceID = 1021,
		Module = "Atlas_BattleforAzeroth",
		PrevMap = "WaycrestManorA",
		{ BLUE.." B-D) "..ALC["Connection"], 10002 },
		{ WHIT.." 4) "..Atlas:GetBossName("Lord and Lady Waycrest", 2116), 2116},
		{ WHIT.." 5) "..Atlas:GetBossName("Gorak Tul", 2117), 2117},
	},
	
	-- /////////////////////////////////
	-- Zuldazar instances
	-- /////////////////////////////////
	-- Atal'Dazar
	AtalDazar = {
		ZoneName = { BZ["Atal'Dazar"] },
		Location = { BZ["Zuldazar"] },
		DungeonID = 1668,
		DungeonHeroicID = 1772,
		DungeonMythicID = 1669,
		--Acronym = "",
		WorldMapID = 934,
		JournalInstanceID = 968,
		ZoneID = 9028,
		Module = "Atlas_BattleforAzeroth",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Priestess Alun'za", 2082), 2082 },
		{ WHIT.." 2) "..Atlas:GetBossName("Vol'kaal", 2036), 2036 },
		{ WHIT.." 3) "..Atlas:GetBossName("Rezan", 2083), 2083 },
		{ WHIT.." 4) "..Atlas:GetBossName("Yazma", 2030), 2030 },
	},
	-- Kings' Rest
	-- Battle of Dazar'alor, Raid
	BattleofDazaralor = {
		ZoneName = { BZ["Battle of Dazar'alor"] },
		Location = { BZ["Nazmir"] },
		DungeonID = 1942,
		DungeonHeroicID = 1943,
		DungeonMythicID = 1944,
		PlayerLimit = { 10, 30 },
--		Acronym = "",
		WorldMapID = 1352,
		JournalInstanceID = 1176,
		ZoneID = 0,
		Module = "Atlas_BattleforAzeroth",
		{ WHIT.." 1) "..Atlas:GetBossName("Champion of the Light", 2265), 2265},
		{ WHIT.." 1) "..Atlas:GetBossName("Champion of the Light", 2265), 2265},
		{ WHIT.." 2) "..Atlas:GetBossName("Jadefire Masters", 2285), 2285},
		{ WHIT.." 2) "..Atlas:GetBossName("Grong, the Jungle Lord", 2263), 2263},
		{ WHIT.." 2) "..Atlas:GetBossName("Grong, the Revenant", 2284), 2284},
		{ WHIT.." 3) "..Atlas:GetBossName("Jadefire Masters", 2266), 2266},
		{ WHIT.." 3) "..Atlas:GetBossName("Opulence", 2271), 2271},
		{ WHIT.." 4) "..Atlas:GetBossName("Conclave of the Chosen", 2268), 2268},
		{ WHIT.." 6) "..Atlas:GetBossName("King Rastakhan", 2272), 2272},
		{ WHIT.." 7) "..Atlas:GetBossName("High Tinker Mekkatorque", 2276), 2276},
		{ WHIT.." 8) "..Atlas:GetBossName("Stormwall Blockade", 2280), 2280},
		{ WHIT.." 9) "..Atlas:GetBossName("Lady Jaina Proudmoore", 2281), 2281},
	},
	KingsRest = {
		ZoneName = { BZ["Kings' Rest"] },
		Location = { BZ["Zuldazar"] },
		DungeonID = 1784,
		DungeonHeroicID = 1785,
--		DungeonMythicID = 1785,
--		Acronym = "",
		WorldMapID = 1004,
		JournalInstanceID = 1041,
		Module = "Atlas_BattleforAzeroth",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("The Golden Serpent", 2139), 2139},
		{ WHIT.." 2) "..Atlas:GetBossName("Mchimba the Embalmer", 2142), 2142},
		{ WHIT.." 3) "..Atlas:GetBossName("The Council of Tribes", 2140), 2140},
		{ WHIT.." 4) "..Atlas:GetBossName("Dazar, The First King", 2143), 2143},
	},
	-- The MOTHERLODE!!
	TheMOTHERLODE = {
		ZoneName = { BZ["The MOTHERLODE!!"] },
		Location = { BZ["Zuldazar"] },
		DungeonID = 1707,
		DungeonHeroicID = 1776,
		DungeonMythicID = 1708,
--		Acronym = "",
		WorldMapID = 1010,
		JournalInstanceID = 1012,
		Module = "Atlas_BattleforAzeroth",
		{ WHIT.." 1) "..Atlas:GetBossName("Coin-Operated Crowd Pummeler", 2105), 2105},
		{ WHIT.." 2) "..Atlas:GetBossName("Azerokk", 2106), 2106},
		{ WHIT.." 3) "..Atlas:GetBossName("Rixxa Fluxflame", 2107), 2107},
		{ WHIT.." 4) "..Atlas:GetBossName("Mogul Razdunk", 2108), 2108},
	},
	-- Temple of Sethraliss
	TempleofSethraliss = {
		ZoneName = { BZ["Temple of Sethraliss"] },
		Location = { BZ["Vol'dun"] },
		DungeonID = 1694,
		DungeonHeroicID = 1775,
		DungeonMythicID = 1695,
--		Acronym = "",
		WorldMapID = 1038,
		JournalInstanceID = 1030,
		Module = "Atlas_BattleforAzeroth",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Adderis and Aspix", 2124), 2124},
		{ WHIT.." 2) "..Atlas:GetBossName("Merektha", 2125), 2125},
		{ WHIT.." 3) "..Atlas:GetBossName("Galvazzt", 2126), 2126},
		{ WHIT.." 4) "..Atlas:GetBossName("Avatar of Sethraliss", 2127), 2127},
	},
	-- Uldir
	Uldir = {
		ZoneName = { BZ["Uldir"] },
		Location = { BZ["Nazmir"] },
		DungeonID = 1887,
		DungeonHeroicID = 1888,
		DungeonMythicID = 1889,
		PlayerLimit = { 10, 30 },
--		Acronym = "",
		WorldMapID = 1148,
		JournalInstanceID = 1031,
		Module = "Atlas_BattleforAzeroth",
		{ WHIT.." 1) "..Atlas:GetBossName("Taloc", 2144), 2144},
		{ WHIT.." 2) "..Atlas:GetBossName("MOTHER", 2141), 2141},
		{ WHIT.." 3) "..Atlas:GetBossName("Fetid Devourer", 2128), 2128},
		{ WHIT.." 4) "..Atlas:GetBossName("Zek'voz, Herald of N'zoth", 2136), 2136},
		{ WHIT.." 5) "..Atlas:GetBossName("Vectis", 2134), 2134},
		{ WHIT.." 6) "..Atlas:GetBossName("Zul, Reborn", 2145), 2145},
		{ WHIT.." 7) "..Atlas:GetBossName("Mythrax the Unraveler", 2135), 2135},
		{ WHIT.." 8) "..Atlas:GetBossName("G'huun", 2122), 2122},
	},
	-- The Underrot
	TheUnderrot = {
		ZoneName = { BZ["The Underrot"] },
		Location = { BZ["Nazmir"] },
		DungeonID = 1711,
		DungeonHeroicID = 1777,
		DungeonMythicID = 1712,
--		Acronym = "",
		WorldMapID = 1041,
		JournalInstanceID = 1022,
		Module = "Atlas_BattleforAzeroth",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Elder Leaxa", 2111), 2111},
		{ WHIT.." 2) "..Atlas:GetBossName("Cragmaw the Infested", 2118), 2118},
		{ WHIT.." 3) "..Atlas:GetBossName("Sporecaller Zancha", 2112), 2112},
		{ WHIT.." 4) "..Atlas:GetBossName("Unbound Abomination", 2123), 2123},
	},
}

--[[ /////////////////////////////////////////
 Atlas Map NPC Description Data
 zoneID = {
	{ ID or letter mark, encounterID or customizedID, x, y, x_largeMap, y_largeMap, color of the letter mark };
	{ "A", 10001, 241, 460 };
	{ 1, 1694, 373, 339 };
 };
/////////////////////////////////////////////]]
db.AtlasMaps_NPC_DB = {
--[[
	AntorustheBurningThroneA = {
		{ "A", 10001, 475, 404 }, -- Entrance
		{  1, 1992, 404, 370 }, -- Garothi Worldbreaker
		{  2, 1987, 105, 341 }, -- Felhounds of Sargeras
	},
]]
}

--[[
	AssocDefaults{}

	Default map to be auto-selected when no SubZone data is available.

	For example, "Dire Maul" has a subzone called "Warpwood Quarter" located in East Dirl Maul, however, there are also 
	some areas which have not been named with any subzone, and we would like to pick a proper default map in this condition.

	Define this table entries only when the instance has multiple maps.

	Table index is zone name, it need to be localized value, but we will handle the localization with BabbleSubZone library.
	The table value is map's key-name.
]]
db.AssocDefaults = {
--	[BZ["Black Rook Hold"]] = 		"BlackRookHoldA",
}

--[[
	SubZoneData{}

	Define SubZone data for default map to be selected for instance which has multiple maps.
	Subzone data should be able to be pulled out from WMOAreaTable for indoor areas, or from AreaTable for outdoor areas.

	Array Syntax: 
	["localized zone name"] = {
		["atlas map name"] = {
			["localized subzone name 1"],
			["localized subzone name 2"],
		},
	},
]]
db.SubZoneData = {
--	[BZ["Trial of Valor"]] = {
--		["TrialofValorA"] = {
--		
--		},
--		["TrialofValorB"] = {
--		
--		},
--	},
}

--[[
	OutdoorZoneToAtlas{}

	Maps to auto-select to from outdoor zones.

	Table index is sub-zone name, it need to be localized value, but we will handle
	the localization with BabbleSubZone library.
	The table value is map's key-name.

	Duplicates are commented out.
	Not for localization.
]]
db.OutdoorZoneToAtlas = {
--	[BZ["Dalaran"]] = 			"AssaultonVioletHold",
}

db.EntToInstMatches = {
--	["TheNightholdEnt"] = 			{"TheNightholdA", "TheNightholdB", "TheNightholdC", "TheNightholdD", "TheNightholdE", "TheNightholdF", "TheNightholdG" },
}

db.InstToEntMatches = {
--	["TheArcway"] = 			{"TheArcwayEnt"},
}

db.MapSeries = {
	["ShrineoftheStormA"] = 		{"ShrineoftheStormA", "ShrineoftheStormB"},
	["ShrineoftheStormB"] = 		{"ShrineoftheStormA", "ShrineoftheStormB"},
	["TolDagorA"] = 			{"TolDagorA", "TolDagorB"},
	["TolDagorB"] = 			{"TolDagorA", "TolDagorB"},
	["WaycrestManorA"] = 			{"WaycrestManorA", "WaycrestManorB"},
	["WaycrestManorB"] = 			{"WaycrestManorA", "WaycrestManorB"},
}

db.SubZoneAssoc = {
--	["BlackRookHoldA"] = 			BZ["Black Rook Hold"],
}

db.DropDownLayouts_Order = {
	[ATLAS_DDL_CONTINENT] = {
		ATLAS_DDL_CONTINENT_KULTIRAS,
		ATLAS_DDL_CONTINENT_ZANDALAR,
	},
	[ATLAS_DDL_LEVEL] = {
		ATLAS_DDL_LEVEL_110TO120,
		ATLAS_DDL_LEVEL_120PLUS,
	},
	[ATLAS_DDL_EXPANSION] = {
		ATLAS_DDL_EXPANSION_BFA,
	},
	[ATLAS_DDL_PARTYSIZE] = {
		ATLAS_DDL_PARTYSIZE_5,
		ATLAS_DDL_PARTYSIZE_10,
		ATLAS_DDL_PARTYSIZE_20TO40,
	},
	[ATLAS_DDL_TYPE] = {
		ATLAS_DDL_TYPE_INSTANCE,
		ATLAS_DDL_TYPE_ENTRANCE,
	},
}
db.DropDownLayouts = {
	[ATLAS_DDL_CONTINENT] = {
		[ATLAS_DDL_CONTINENT_KULTIRAS] = {
--			"CrucibleofStorms", -- Raid
			"Freehold",
			"SiegeofBoralus",
			"ShrineoftheStormA",
			"ShrineoftheStormB",
			"TolDagorA",
			"TolDagorB",
			"WaycrestManorA",
			"WaycrestManorB",
		},
		[ATLAS_DDL_CONTINENT_ZANDALAR] = {
			"AtalDazar",
--			"BattleofDazaralor", -- Raid
			"KingsRest",
			"TheMOTHERLODE",
			"TempleofSethraliss",
--			"Uldir", -- Raid
			"TheUnderrot",
		},
	},
	[ATLAS_DDL_EXPANSION] = {
		[ATLAS_DDL_EXPANSION_BFA] = {
			"AtalDazar",
			"SiegeofBoralus",
--			"BattleofDazaralor",
--			"CrucibleofStorms",
			"Freehold",
			"ShrineoftheStormA",
			"ShrineoftheStormB",
			"TolDagorA",
			"TolDagorB",
			"WaycrestManorA",
			"WaycrestManorB",
			"KingsRest",
			"TheMOTHERLODE",
			"TempleofSethraliss",
--			"Uldir",
			"TheUnderrot",
		},
	},
	[ATLAS_DDL_LEVEL] = {
		[ATLAS_DDL_LEVEL_110TO120] = {
			"AtalDazar",
			"SiegeofBoralus",
			"Freehold",
			"ShrineoftheStormA",
			"ShrineoftheStormB",
			"TolDagorA",
			"TolDagorB",
			"WaycrestManorA",
			"WaycrestManorB",
			"TheMOTHERLODE",
			"TempleofSethraliss",
			"TheUnderrot",
		},
		[ATLAS_DDL_LEVEL_120PLUS] = {
--			"BattleofDazaralor",
--			"CrucibleofStorms",
			"KingsRest",
--			"Uldir",
		},
	},
	[ATLAS_DDL_PARTYSIZE] = {
		[ATLAS_DDL_PARTYSIZE_5] = {
			"AtalDazar",
			"SiegeofBoralus",
			"Freehold",
			"ShrineoftheStormA",
			"ShrineoftheStormB",
			"TolDagorA",
			"TolDagorB",
			"WaycrestManorA",
			"WaycrestManorB",
			"KingsRest",
			"TheMOTHERLODE",
			"TempleofSethraliss",
			"TheUnderrot",
		},
		[ATLAS_DDL_PARTYSIZE_10] = {
--			"BattleofDazaralor",
--			"CrucibleofStorms",
--			"Uldir",
		},
		[ATLAS_DDL_PARTYSIZE_20TO40] = {
		},
	},
	[ATLAS_DDL_TYPE] = {
		[ATLAS_DDL_TYPE_INSTANCE] = {
			"AtalDazar",
			"SiegeofBoralus",
--			"BattleofDazaralor",
--			"CrucibleofStorms",
			"Freehold",
			"ShrineoftheStormA",
			"ShrineoftheStormB",
			"TolDagorA",
			"TolDagorB",
			"WaycrestManorA",
			"WaycrestManorB",
			"KingsRest",
			"TheMOTHERLODE",
			"TempleofSethraliss",
--			"Uldir",
			"TheUnderrot",
		},
		[ATLAS_DDL_TYPE_ENTRANCE] = {
		},
	},
}
