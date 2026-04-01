SMODS.Joker{ --Pop and Awe
    key = "popandawe",
    config = {
        extra = {
            chips = 8,
            xchips = 4
        }
    },
    loc_txt = {
        ['name'] = 'Pop and Awe (v39)',
        ['text'] = {
            [1] = '{C:blue}-#1#{} Chips',
            [2] = '{X:blue,C:white}X#2#{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)

        return {vars = {card.ability.extra.chips, card.ability.extra.xchips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
                return {
                    chips = -card.ability.extra.chips,
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}
