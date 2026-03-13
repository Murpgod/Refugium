SMODS.Joker{ --Doreo stream
    key = "doreostream",
    config = {
        extra = {
            source_rank_type = "all",
            target_rank = "7"
        }
    },
    loc_txt = {
        ['name'] = 'Doreo stream',
        ['text'] = {
            [1] = 'All cards count as {C:attention}7s{}',
            [2] = '{C:inactive,s:0.7}\"new pixel art for sholatro joker\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_sholextra_doreostream")) then
        return 7
    end
    return original_id
end
