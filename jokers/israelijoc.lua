
SMODS.Joker{ --israeli joc
    key = "israelijoc",
    config = {
        extra = {
            sell_value0 = 0,
            sell_value = 50,
            mult0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'israeli joc',
        ['text'] = {
            [1] = 'fore i get {C:attention}RICH{} like israeli joc'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if to_big(G.GAME.dollars) > to_big(939) then
                error("EasternFarmer Was Here")
            else
                return {
                    func = function()
                        for i, target_card in ipairs(G.jokers.cards) do
                            if target_card.set_cost then
                                target_card.ability.extra_value = 0
                                target_card:set_cost()
                            end
                        end
                        return true
                    end,
                    message = "All Jokers Sell Value: $"..tostring(0),
                    extra = {
                        func = function()local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_card = G.jokers.cards[my_pos]
                            target_card.ability.extra_value = 50
                            target_card:set_cost()
                            return true
                        end,
                        message = "Sell Value: $"..tostring(50),
                        colour = G.C.MONEY
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 50
            }
        end
    end
}
