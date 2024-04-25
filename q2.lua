function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount)) -- db.storeQuery supopsedly returns table of values
    if resultId then -- Check if resultId isn't empty
        for id in resultId do
            print(id.getString("name")) -- Use of general print() function is most likely not appropriate, and should be replaced by formatted output or return a list of names as data to be handled better
        end
    else
        print("No guilds found") -- An error might be better here, but since all the function does is print, and not return potentially empty data, this should be appropriate
    end
end
