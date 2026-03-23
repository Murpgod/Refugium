if not Talisman then
    return nil
end

SMODS.Joker{ --Overclock
    key = "overclock",
    config = {
    },
    loc_txt = {
        ['name'] = 'Overclock',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative{}',
            [2] = '{C:attention}Boss Farming Guide{}',
            [3] = 'at the end of {C:green}shop{}',
            [4] = '{X:legendary,C:white}^1{} Mult for every digit',
            [5] = 'of money you currently have'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "sholextra_peculiar",
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'rta' and args.source ~= 'sou' and args.source ~= 'uta' and args.source ~= 'wra' 
            or args.source == 'sho'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {math.floor(math.log(math.max((10 * (G.GAME.dollars or 0)),10)))}}
    end,
    
    calculate = function(self, card, context)
        if context.ending_shop then
            return {
                func = function()
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sholextra_bossfarmingguide' })
                            if joker_card then
                                joker_card:set_edition(card.ability.extra.e_negative, true)
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                e_mult = lenient_bignum(math.floor(math.log(math.max((10 * (G.GAME.dollars or 0)),10))))
            }
        end
        if context.forcetrigger then
            return {
                e_mult = lenient_bignum(math.floor(math.log(math.max((10 * (G.GAME.dollars or 0)),10))))
                func = function()
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sholextra_bossfarmingguide' })
                            if joker_card then
                                joker_card:set_edition(card.ability.extra.e_negative, true)
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
    end
}
