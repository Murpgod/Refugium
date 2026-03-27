
SMODS.Joker{ --32 degrees in cornelius
    key = "_32degreesincornelius",
    config = {
        extra = {
            dollars0 = 1
        }
    },
    loc_txt = {
        ['name'] = '32 degrees in cornelius',
        ['text'] = {
            [1] = '{X:spectral,C:white}@icicle{} bro lives in cornelius',
            [2] = '(each icicle alt earns {C:money}$2{} when triggered)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 0.7
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Joker',
    pools = { ["modprefix_refugeiu_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.post_trigger  then
            if context.other_joker.config.center.key == "j_iciclezalt" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 1
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}