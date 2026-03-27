
SMODS.Joker{ --32 degrees in cornelius
    key = "_32degreesincornelius",
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = '32 degrees in cornelius',
        ['text'] = {
            [1] = '{X:spectral,C:white}@icicle{} bro lives in cornelius',
            [2] = '(each icicle alt earns {C:money}$#1#{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 0.7
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars } }
	end,
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if context.other_card.config.center.key == "j_sholextra_iciclezalt" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+$"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.dollars))
			return { message = "$" .. number_format(card.ability.extra.dollars), colour = G.C.MONEY }
		end
    end
}
