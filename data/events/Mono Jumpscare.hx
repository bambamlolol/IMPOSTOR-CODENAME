function create(){
    jumpscare = new FlxSprite(0, 60).loadGraphic(Paths.image('deadpostor'));
    jumpscare.screenCenter();
    jumpscare.x -= 455;
    jumpscare.y -= 85;
    jumpscare.scale.x = jumpscare.scale.y = 1.125;
    jumpscare.alpha = 0;
    add(jumpscare);
}

function onEvent(e:EventGameEvent){
    if (FlxG.save.data.jumpscares){
        if (e.event.name == "Mono Jumpscare"){
            if (e.event.params[0] == true){
                jumpscare.alpha = 1;
            }
            if (e.event.params[0] == false){
                FlxTween.tween(jumpscare, {alpha: 0}, e.event.params[1]);
            }
        }
    }
}