SMODS.Joker{ --Boss Farming Guide
    key = "bossfarmingguide",
    config = {
        extra = {
            eor = 2,
            thenumerator = 1,
            money÷10 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Boss Farming Guide',
        ['text'] = {
            [1] = 'Earn {C:gold}$#1#{} at the end of round',
            [2] = 'Payout increases by {C:gold}$1{} for every {C:gold}$10{}',
            [3] = 'you have at the end of round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = false,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.eor}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.eor = lenient_bignum(card.ability.extra.eor) + lenient_bignum(math.floor(math.max(G.GAME.dollars / 10) , 0))
                    return true
                end,
                    message = localize('k_upgrade_ex'),
                    extra = {
                        colour = G.C.MONEY
                        }
                }
        end
        if context.forcetrigger then
            card.ability.extra.eor = lenient_bignum(card.ability.extra.eor) + lenient_bignum(math.floor(math.max(G.GAME.dollars / 10) , 0))
                return {
                    dollars = lenient_bignum(card.ability.extra.eor),
                }
        end
    end,

    calc_dollar_bonus = function(self, card)
        if to_big(card.ability.extra.eor) > to_big(0) then
            return lenient_bignum(card.ability.extra.eor)
        end
    end
}
