local function releaseStorage(player)
    -- Verfiy valid player object
    if player then
        player:setStorageValue(1000, -1) -- I can assume -1 is required in releasing the storage values,
    else -- however the 1000 value seems to be either player info or a specific ID for specific data to be stored
        error("Invalid Player") -- either way, the 1000 would probably benefit from being a variable read in by the releaseStorage function as a parameter
    end
end

function onLogout(player)
    if player then
        if player:getStorageValue(1000) ~= -1 then -- Is the storage value only ever 0 or 1? If yes, use of bool might make it easier to comprehend. Changed to ~= -1 to account for values greater than 1 just in case
            addEvent(releaseStorage, 1000, player) -- Again, is 1000 needing to be hardcoded? It's most likely more modular to have it as a parameter for the onLogout and releaseStorage methods
        end
        return true
    else
        error("Invalid Player")
    end
    return false -- Returning false to indicate that an error occured, and to hopefully prevent additional breaking from the invalid player
end
