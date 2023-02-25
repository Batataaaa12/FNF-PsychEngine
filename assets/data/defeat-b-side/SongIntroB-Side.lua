--easy script configs
IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 24 --size of the text for the Song Name.
IntroSubText2Size = 23 --size of the text for the Song Name.
IntroTagColor = '000000'	--Color of the tag at the end of the box.
IntroTagWidth = 17	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBox', 300, 100, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Composer: H-say Studios', 300, -305-IntroTagWidth, 80)
		setProperty('JukeBox.alpha', 0.0)
		setProperty('JukeBoxTag.alpha', 0.5)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')

	makeLuaText('JukeBoxSubText2', '[Remix]', 450, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxSubText2', 'center')
	setObjectCamera('JukeBoxSubText2', 'other')
	setTextSize('JukeBoxSubText2', IntroSubText2Size)
	addLuaText('JukeBoxSubText2')

end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxSubText2', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxSubText2', -550, 1.5, 'CircInOut')
	end
end