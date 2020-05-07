-- General settings

function ROLE:PreInitialize()
	self.color = Color(093, 071, 139, 255) -- rolecolour
	
	self.abbr = 'classa' -- Abbreviation
	self.unknownTeam = false -- No teamchat
	self.defaultTeam = TEAM_CULT -- no team, own team
	self.preventFindCredits = true
	self.preventKillCredits = true
	self.preventTraitorAloneCredits = true
	self.preventWin = false -- cannot win unless he switches roles
	self.scoreKillsMultiplier       = 1
    self.scoreTeamKillsMultiplier   = -6
    self.traitorCreditAward = false
    self.defaultEquipment = SPECIAL_EQUIPMENT

	-- ULX convars

	self.conVarData = {
		pct = 0.10, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 9, -- minimum amount of players until this role is able to get selected
		credits = 0, -- the starting credits of a specific role
		shopFallback = SHOP_DISABLED,
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 20
	}
end
if SERVER then
	-- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentItem("item_ttt_tracker")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:RemoveEquipmentItem("item_ttt_tracker")
    end
end

function ROLE:Initialize()
    roles.SetBaseRole(self, ROLE_CULTIST)
end