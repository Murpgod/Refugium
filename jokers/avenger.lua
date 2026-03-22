
SMODS.Joker{ --Avrejer
    key = "avenger",
    config = {
    },
    loc_txt = {
        ['name'] = 'Avenger (v52)',
        ['text'] = {
            [1] = '{C:blue}+1{} hand this round if played',
            [2] = '{C:attention}poker hand{} has already been',
            [3] = 'played this round before',
            [4] = '{C:inactive}Ah yes common pt.2{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main or context.forcetrigger then
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end
                }
            end
        end
    end
}
