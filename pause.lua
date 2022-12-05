--by sloow (IF YOU USE LEAVE THE CREDITS PLS)
--thx MTFUTURE your code helped me a lot

local time = 0.1
local timet = time + 0.01
local all = 50

function onPause()
	return Function_Stop;
end

function onCreate()
    paused = false
	resume = false
	restart = false
	exi = false
	exit = false
	
	makeAnimatedLuaSprite('Bg', 'BoardX', -430, 0) -- 0 -430
    makeLuaSprite('point', 'pointy', 210, 420)
    addAnimationByPrefix('Bg', 'idle', 'Idle', 24, true) 
    setObjectCamera('Bg', 'other')      
    setObjectCamera('point', 'other')         
    addLuaSprite('Bg')
    addLuaSprite('point')
    
    makeLuaText('pau', 'PAUSED', 600, -215, 100) -- 60 -215
    makeLuaText('res', 'RESUME', 600, -200, 210) -- 5 -200
    makeLuaText('rest', 'RESTART', 600, -210, 280) -- 5 -210
    makeLuaText('exi', 'EXIT', 600, -200, 350) -- 5 -200
    makeLuaText('exit', 'EXIT GAME', -600, -265, 420) -- 5 -265
    setObjectCamera('pau', 'other')
    setObjectCamera('res', 'other')
    setObjectCamera('rest', 'other')
    setObjectCamera('exi', 'other')
    setObjectCamera('exit', 'other')
    setTextSize('pau', 60)
    setTextSize('res', all)
    setTextSize('rest', all)
    setTextSize('exi', all)
    setTextSize('exit', all)
    setTextAlignment('pau', 'other')
    setTextAlignment('res', 'other')
    setTextAlignment('rest', 'other')
    setTextAlignment('exi', 'other')
    setTextAlignment('exit', 'other')
    addLuaText('pau')
    addLuaText('res')
    addLuaText('rest')
    addLuaText('exi')
    addLuaText('exit')

    setProperty('Bg.visible', true)      
    setProperty('point.visible', true)
    setProperty('point.flipX', true)
    setProperty('pau.visible', true)
    setProperty('res.visible', true)
    setProperty('rest.visible', true)
    setProperty('exi.visible', true)
    setProperty('exit.visible', true)
end

function onUpdate()
	if paused == true then
        setProperty('Bg.visible', true)   
        setProperty('point.visible', true)   
        setProperty('pau.visible', true)
        setProperty('res.visible', true)
        setProperty('rest.visible', true)
        setProperty('exi.visible', true)
        setProperty('exit.visible', true)
        doTweenX('twe1', 'Bg', 0, time, 'elasticInOut')
        doTweenX('twe2', 'pau', 60, timet, 'elasticInOut')
        doTweenX('twe3', 'res', 5, timet, 'elasticInOut')
        doTweenX('twe4', 'rest', 5, timet, 'elasticInOut')
        doTweenX('twe5', 'exi', 5, timet, 'elasticInOut')
        doTweenX('twe6', 'exit', 5, timet, 'elasticInOut')
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition')-16) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
	else
        setProperty('Bg.visible', false)  
        setProperty('point.visible', false)    
        setProperty('pau.visible', false)
        setProperty('res.visible', false)
        setProperty('rest.visible', false)
        setProperty('exi.visible', false)
        setProperty('exit.visible', false)
        doTweenX('twe1', 'Bg', -430, time, 'elasticInOut')
        doTweenX('twe2', 'pau', -215, time, 'elasticInOut')
        doTweenX('twe3', 'res', -200, time, 'elasticInOut')
        doTweenX('twe4', 'rest', -210, time, 'elasticInOut')
        doTweenX('twe5', 'exi', -200, time, 'elasticInOut')
        doTweenX('twe6', 'exit', -265, time, 'elasticInOut')
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)		
	end
     -- res: 210, rest: x:200 y:280, exi: x:110, y:350, exit: x:260 y: 420
    if resume == true then
		setProperty('point.y', 210)
        setProperty('point.x', 190)
	elseif restart == true then
		setProperty('point.y', 280)
        setProperty('point.x', 210)
	elseif exi == true then
		setProperty('point.y', 350)
        setProperty('point.x', 110)
	elseif exit == true then
		setProperty('point.y', 420)
        setProperty('point.x', 260)
	end
	FUCKINGBUTTONS()
end

function FUCKINGBUTTONS()
	if keyJustPressed('accept') then
		if paused == false then
			paused = true
			resume = true
			restart = false
			exi = false
			exit = false
		elseif paused == true and resume == true then
			paused = false
			resume = false
			restart = false
			exi = false
			exit = false
		elseif paused == true and restart == true then
			restartSong(false);
		elseif paused == true and exi == true then
			exitSong(false);
		elseif paused == true and exit == true then
			os.exit();
		end
	end

    if keyJustPressed('up') and paused == true then
        playSound('scroll', 0.75)
		if resume == true then
			resume = false
			restart = false
			exi = false
			exit = true
		elseif exit == true then
			resume = false
			restart = false
			exi = true
			exit = false
		elseif exi == true then
			resume = false
			restart = true
			exi = false
			exit = false
		elseif restart == true then
			resume = true
			restart = false
			exi = false
			exit = false
		end
	end
	if keyJustPressed('down')  and paused == true then
        playSound('scroll', 0.75)
		if resume == true then
			resume = false
			restart = true
			exi = false
			exit = false
		elseif restart == true then
			resume = false
			restart = false
			exi = true
			exit = false
		elseif exi == true then
			resume = false
			restart = false
			exi = false
			exit = true
		elseif exit == true then
			resume = true
			restart = false
			exi = false
			exit = false
		end
	end
end -- script is done!