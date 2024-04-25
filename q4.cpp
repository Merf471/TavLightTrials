void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) // This currently doesn't return if successful or not, but depending on its use it might be beneficial to have it return true/false depending on success/fail
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr); // Created pointer will need to be deleted
        if (!IOLoginData::loadPlayerByName(player, recipient)) { 
            delete(player); // If alternative failed, cleanup player pointer
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        delete(player); // Cleanup
        return; 
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
    
    delete(player); // Cleanup
}