
SMODS.Joker{ --Literally The Soul
    key = "literallythesoul",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Literally The Soul',
        ['text'] = {
            [1] = 'Creates a {C:legendary}Legendary{} Joker',
            [2] = 'when {C:attention}this{} Joker is {C:red}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    demicolon_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

-- stolen from entropy
    calculate = function(self, card, context)
        if context.selling_self then card.ability.no_destroy = true end
        if context.card_being_destroyed and context.card == card then
            card_eval_status_text(
                self,
                "extra",
                nil,
                nil,
                nil,
                {}
            )
            local c = create_card("Joker", G.jokers, nil, 4)
            c:add_to_deck()
            G.jokers:emplace(c)
        end
    end
}
