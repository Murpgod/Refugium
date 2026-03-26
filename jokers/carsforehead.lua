
SMODS.Joker{ --Cars forehead
    key = "carsforehead",
    config = {
        extra = {
            cardssold = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cars forehead',
        ['text'] = {
            [1] = 'Why is it so      {s:2.9}LARGE{}',
            [2] = '',
            [3] = 'when card is sold, gain {X:mult,C:white}X1{}',
            [4] = '{X:mult,C:white}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 0.5
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cardssold}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardssold
            }
        end
        if context.selling_card  then
            return {
                func = function()
                    card.ability.extra.cardssold = (card.ability.extra.cardssold) + 1
                    return true
                end,
                message = "Largened forehead!"
            }
        end
    end
}
