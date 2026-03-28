
SMODS.Joker{ --3+2=6
    key = "_326",
    config = {
        extra = {
            xchips0 = 2,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = '3+2=6',
        ['text'] = {
            [1] = '{X:mult,C:white}x#2#{} Mult',
            [2] = '{X:chips,C:white}x#1#{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips0, card.ability.extra.xmult0}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
            return {
                x_chips = card.ability.extra.xchips0,
                extra = {
                    Xmult = card.ability.extra.xmult0
                }
            }
        end
    end
}
