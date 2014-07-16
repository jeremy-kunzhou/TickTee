# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# animals = 'baboons badgers antelopes cobras crocodiles'.split /[ ]/
# others = 'rumpus cete herd quiver bask'.split /[ ]/
#
# combine = (x,y) -> "A #{x} of #{y}"
# aa = (x) -> "A #{x}"
# result = []
# i = 0
# while i < animals.length
# 	result = result.concat combine others[i],animals[i++]
#
# result
#
# result = (combine x,y for x in others for y in animals)
#
#
# result
#
# countWords = (text, num) ->
# 	return 0 unless text.length > 0
# 	text_list = ( x for x in text.split /[ ]/ when x.length >= num )
# 	text_list.length
#
# result = countWords "aaa bbbbb cccccc ddd", 3
#
# result
#
# only_second_word = (text, num) ->
# 	text_list = text.split /[ ]/
# 	new_text_list = (x for x in text_list by num)
# 	new_text_list.join " "
#
# result = only_second_word "I like am like big",2
#
# result
