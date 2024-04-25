-- This function should have a return value of true/false since either specified players have a chance to be invalid
function removePlayerFromParty(playerId, membername) -- The name of this function is inconsistent with previous naming conventions and confusing, considering it removes a specified player from a specified player id's party. Renamed to removePlayerFromParty
    currPlayer = Player(playerId) -- 'player' variable is confusing with Player objects; renamed to currPlayer
    if currPlayer then -- Verify that player exists
        local party = currPlayer:getParty() -- Assuming that every valid player is apart of a party (even if the only member is themselves) so we don't need to check validity
        for k, v in pairs(party:getMembers()) do
            if v == Player(membername) then
                party:removeMember(Player(membername)) -- If removeMember() has a true/false return value, it should be checked in case it failed
                return true
            end
        end
    else
        error("Player does not exist")
    end
    return false -- This return false will be hit if no players in the party match membername, so no additional checks for it are needed
end
