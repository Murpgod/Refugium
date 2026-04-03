
SMODS.Back {
    key = 'deck_of_peam',
    pos = { x = 4, y = 9 },
    config = {
    },
    loc_txt = {
        name = 'Deck of Peam',
        text = {
            [1] = 'Start run with a {C:dark_edition}Peculiar{} Joker',
            [2] = 'Score requirement scales',
            [3] = '{X:red,C:white}EXTREMELY{} fast'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomJokers',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'refugium_peculiar' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
        local gba = get_blind_amount
        function sigFig(num,figures)
            local x=figures - math.ceil(math.log10(math.abs(num)))
            return(math.floor(num*10^x+0.5)/10^x)
        end
        function get_blind_amount(ante)
        	local amount = 1
        	if ante - math.floor(ante) ~= 0 then
	        	local a = gba(math.floor(ante)) ^ (ante - math.floor(ante))
	        	local b = gba(math.ceil(ante)) ^ (1 - (ante - math.floor(ante)))
		        amount = a * b
	        else
	        	amount = gba(ante)
	        end
	        	if ante >= 2 then 
	        		amount = sigFig(amount * 20 ^ ((ante - 1) / 7) , 2)
	        	end
	        return amount
        end
                return true
            end
        }))
    end
}

