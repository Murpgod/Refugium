
SMODS.Joker{ --Piglin
    key = "piglin",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Piglin',
        ['text'] = {
            [1] = 'Grant a {C:tarot}Tarot{} if played hand',
            [2] = 'contains a {C:attention}Gold Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    demicoloncompat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.enchancement and playing_card.enhancement.key == "k_gold" then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(1)
            end)() then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_tarot') or nil
            }
            end
        end
        if context.forcetrigger then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_tarot') or nil
            }
        end
    end
}
