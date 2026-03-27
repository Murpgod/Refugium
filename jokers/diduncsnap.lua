if Cryptid then

SMODS.Joker{ --Did Unc Snap
    key = "diduncsnap",
    config = {
        extra = {
            odds = 41
        }
    },
    loc_txt = {
        ['name'] = 'Did Unc Snap',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to {C:attention}force-trigger{}',
            [2] = '{C:attention}Joker{} to the left when {C:red}ANYTHING{} happens'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_sholextra_diduncsnap') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable or context.post_trigger)   then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c127eee4', 1, card.ability.extra.odds, 'j_sholextra_diduncsnap', false) then
     			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if Cryptid.demicolonGetTriggerable(G.jokers.cards[i-1])[1] then
						local results = Cryptid.forcetrigger(G.jokers.cards[i-1], context)
						if results and results.jokers then
							return results.jokers
						end
					end
				end
			end
            return true
                end
            end
        end
    end
}
end
