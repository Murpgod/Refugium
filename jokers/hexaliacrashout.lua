
SMODS.Joker{ --Hexalia crashout
    key = "hexaliacrashout",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hexalia crashout',
        ['text'] = {
            [1] = 'When Blind is selected, create {C:enhanced}Polychrome Tag{},',
            [2] = 'then destroy this joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["refugeiu_refugeiu_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local tag = Tag("tag_polychrome")
                            if tag.name == "Orbital Tag" then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end
                                tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                            end
                            tag:set_ability()
                            add_tag(tag)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end
                    }))
                    return true
                end,
                message = "Created Tag!",
                extra = {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:explode({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}
