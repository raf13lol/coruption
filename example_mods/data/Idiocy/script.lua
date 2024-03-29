local funni = true;
local thefunny = true;
local amogus = true;

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
    makeLuaSprite('phoned', 'phone', -600, -300);
    addLuaSprite('phoned', true);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
  removeLuaSprite('phoned', true);
  triggerEvent('Add Camera Zoom', '0, 0', '6, 6');
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'canzies');
	end
end


function onUpdate(elapsed)
  setProperty('timeBar.color', getColorFromHex('AAF0D1'))
  setProperty('timeBarBG.color', getColorFromHex('AAF0D1'))

  if amogus == true then
    if curStep >= 0 then
        songPos = getSongPosition()
      local currentBeat = (songPos/2000)*(bpm/90)
      setProperty('dad.angle',0+currentBeat*70)
  end
  end
    
    if funni == true then
    songPos = getSongPosition()
    local currentBeat = (songPos/500)*(curBpm/200)
    local currentBeat2 = (songPos/200)*(curBpm/100)
    setProperty('camFollowPos.x',getProperty('camFollowPos.x') + (math.sin(currentBeat2) * 0.2))
    setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.cos(currentBeat2) * 0.2))
  end
end

function onUpdatePost()
  setProperty('introSoundsSuffix', '-bandumb')
  setProperty('ratingsData[0].image', 'anomoly-sick')
  setProperty('ratingsData[1].image', 'anomoly-good')
  setProperty('ratingsData[2].image', 'anomoly-bad')
  setProperty('ratingsData[3].image', 'anomoly-shit')
  setProperty("comboSuffix", "-anomoly") -- HEY IF YOU ARE GONNA USE THIS TYPE OF SCRIPT TO YOUR MOD, THIS WAS ONLY CODED FOR THIS MOD. Thanks Raf
end

function onCountdownTick(tick)
  if tick == 1 then
      loadGraphic('countdownReady', 'anomoly-ready')
         elseif tick == 2 then
      loadGraphic('countdownSet', 'anomoly-set')
        elseif tick == 3 then
      loadGraphic('countdownGo', 'anomoly-go')
  end
end