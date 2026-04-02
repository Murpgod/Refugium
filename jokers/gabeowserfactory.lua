
SMODS.Joker{ --Gabe Owser Factory
    key = "gabeowser",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gabe Owser Factory',
        ['text'] = {
            [1] = '{X:legendary,C:white}^#1#{} Mult',
            [2] = 'when a card is sold, scale',
            [3] = 'value with {C:dark_edition}random{} operator'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "sholextra_peculiar",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {lenient_bignum(card.ability.extra.mult)}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            local result = pseudorandom(pseudoseed("sholextra_gabebowser"), 1, 67)
            if result <= 47 then
                local add = pseudorandom('gabebowser', 2, 10)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult + (add / 10))
                return {message = "+"..tostring(add / 10), colour = G.C.DARK_EDITION}
            elseif result <= 50 then 
                local bigadd = pseudorandom('gabebowser', 2, 10)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult + (bigadd ^ 2))
                return {message = "+"..tostring(bigadd ^ 2), colour = G.C.DARK_EDITION}
            elseif result <= 66 then 
                local x = pseudorandom('gabebowser', 10, 20)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult * (x / 10))
                return {message = "x"..tostring(x / 10), colour = G.C.DARK_EDITION}
            elseif result <= 67 then 
                local exp = pseudorandom('gabebowser', 10, 15)
                card.ability.extra.mult = lenient_bignum(card.ability.extra.mult ^ (exp / 10))
                return {message = "^"..tostring(exp / 10), colour = G.C.DARK_EDITION}
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            return {
                emult = lenient_bignum(card.ability.extra.mult)
            }
        end
    end
}