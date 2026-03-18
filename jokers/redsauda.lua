
SMODS.Joker{ --Red Sauda
    key = "redsauda",
    loc_txt = {
        ['name'] = 'Red Sauda',
        ['text'] = {
            [1] = 'Swap {C:blue}Chips{} and {C:red}Mult{}',
            [2] = 'before hand starts scoring'
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
        if context.before then
            return {
                swap = true
            }
        end
        if context.forcetrigger then
            return {
                swap = true
            }
        end
    end
}
