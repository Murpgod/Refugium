
SMODS.Joker{ --Red Sauda
    key = "redsauda",
    loc_txt = {
        ['name'] = 'Red Sauda (v46+)',
        ['text'] = {
            [1] = 'Swap {C:blue}Chips{} and {C:red}Mult{}',
            [2] = 'when the {C:attention}first{} played',
            [3] = 'card is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    swap = true
                }
            end
        end
        if context.forcetrigger then
            return {
                swap = true
            }
        end
    end
}
