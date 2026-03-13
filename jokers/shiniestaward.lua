SMODS.Joker{ --Shiniest award (v38)
    key = "shiniestaward",
    config = {
        extra = {
            req = 38,
            played = 0,
            mult = 2000000
        }
    },
    loc_txt = {
        ['name'] = 'Shiniest award (v38)',
        ['text'] = {
            [1] = '{C:red}+2,000,000{} Mult only',
            [2] = 'after playing {C:attention}#1#{} hands',
            [3] = '{C:inactive}(#2#/#1#){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.req, card.ability.extra.played}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.played or 0) >= card.ability.extra.req then
                return {
                    mult = card.ability.extra.mult
                }
            else
                card.ability.extra.played = (card.ability.extra.played) + 1
                return {
                    message = "Update!"
                }
            end
        end
        if context.forcetrigger then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
