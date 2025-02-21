var flashMeasure:Bool = false;
var flashMeasure2:Bool = false;
var flashMeasure4:Bool = false;
var flashBeat2:Bool = false;

function create(){
    deadGfspeaker = new FlxSprite(300, 195);
    deadGfspeaker.frames = Paths.getSparrowAtlas('stages/polus/speakerlonely');
    deadGfspeaker.animation.addByPrefix('bop', 'speakers lonely', 24, false);
    deadGfspeaker.antialiasing = true;
    insert(members.indexOf(gf), deadGfspeaker);

    crowd = new FlxSprite(-900, 200);
    crowd.frames = Paths.getSparrowAtlas('stages/polus/boppers_meltdown');
    crowd.animation.addByPrefix('bop', 'BoppersMeltdown', 24, false);
    crowd.animation.play('bop');
    crowd.scrollFactor.set(1.5, 1.5);
    crowd.antialiasing = true;
    crowd.updateHitbox();
    
    bfdead.alpha = 0;
}

function update(){
    if (curSong == "sussus moogus"){
        remove(deadGfspeaker);
    }

    if (curSong == "meltdown"){
        bfdead.alpha = 1;
        if (!Options.lowMemoryMode){
            add(crowd);
        }
    }

    if (PlayState.opponentMode){
        comboGroup.x = 400;
    }
    
    if (PlayState.coopMode){
        comboGroup.x = 550;
    }
}

function measureHit(){
    if (flashMeasure == true){
        camGame.zoom += 0.015;
        camHUD.zoom += 0.03;
        if (FlxG.save.data.flashingLights){
            camGame.flash(0x7EFF0000, .35);
        }
    }

    if (flashMeasure2 == true){
        if (curMeasure % 2 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (FlxG.save.data.flashingLights){
                camGame.flash(0x7EFF0000, .35);
            }
        }
    }

    if (flashMeasure4 == true){
        if (curMeasure % 4 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (FlxG.save.data.flashingLights){
                camGame.flash(0x7EFF0000, .35);
            }
        }
    }
}

function stepHit(){
    if (curSong == "sabotage"){
        switch(curStep){
            case 816:
                gf.alpha = 1;
                gf.playAnim("fadein", true);
            case 820:
                dad.playAnim("look", true);
        }
    }
    else if (curSong == "meltdown"){
        switch (curStep){
            case 1152:
                playVid("end");
                camGame.alpha = 0;
                camHUD.alpha = 0;
        }
    }
}

function beatHit(){
    deadGfspeaker.animation.play('bop');
    crowd.animation.play('bop');

    if (flashBeat2 == true){
        if (curBeat % 2 == 0){
            camGame.zoom += 0.015;
            camHUD.zoom += 0.03;
            if (FlxG.save.data.flashingLights){
                camGame.flash(0x7EFF0000, .35);
            }
        }
    }
}

// hscript call stuff

function flashBeat2(){
    flashBeat2 = true;
}

function flashBeat2Alt(){
    flashBeat2 = true;
}

function flashMeasure(){
    flashMeasure = true;
}

function flashMeasureAlt(){
    flashMeasure = true;
}

function flashMeasure2(){
    flashMeasure2 = true;
}

function flashMeasure2Alt(){
    flashMeasure2 = true;
}

function flashMeasure2Alt2(){
    flashMeasure2 = true;
}

function flashMeasure4(){
    flashMeasure4 = true;
}

function flashMeasure4Alt(){
    flashMeasure4 = true;
}

function stopFlashing(){
    flashBeat2 = false;
    flashMeasure = false;
    flashMeasure2 = false;
    flashMeasure4 = false;
}

function cancelFlashMeasure2(){ // specifically for meltdown
    flashMeasure2 = false;
}