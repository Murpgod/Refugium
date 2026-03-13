SMODS.Joker{ --Cave Monkey
    key = "cavemonkey",
    loc_txt = {
        ['name'] = 'Cave Monkey',
        ['text'] = {
            [1] = 'Me Hit Rock'
            [2] = '{C:inactive, s:0.6}and it went negative{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_stone
                }, G.discard, true, false, nil, true)
            new_card:set_seal("Red", true)
            new_card:set_edition("e_negative", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "Added Card to Hand!"
                }
        end
    end
}
