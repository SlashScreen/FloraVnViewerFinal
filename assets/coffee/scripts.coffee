cutscene.Script.build "prompt1-chefs", "preview.png", "Gourmet Gauntlet", (script) ->
    script.add_view 'opening1', 'backgrounds/bgopening1.png'
    script.add_view 'opening2', 'backgrounds/bgopening2.png'
    script.add_view 'opening3', 'backgrounds/bgopening3.png'
    script.add_view 'opening4', 'backgrounds/bgopening4.png'
    script.add_view 'opening4', 'backgrounds/bgopening4.png'
    script.add_view 'doors', 'backgrounds/hallway.png'
    script.add_view 'door-gnolls', 'backgrounds/door-gnolls.png'
    script.add_view 'room-gnolls', 'backgrounds/bggnolls.png'
    script.add_view 'menu-gnolls', 'backgrounds/bggnolllist.png'
    script.add_view 'door-armando', 'backgrounds/door-armando.png'
    script.add_view 'room-armando1', 'backgrounds/bgarmando1.png'
    script.add_view 'room-armando2', 'backgrounds/bgarmando2.png'
    script.add_view 'menu-armando', 'backgrounds/bgarmandolist.png'
    script.add_view 'door-sibyl', 'backgrounds/door-sibyl.png'
    script.add_view 'room-sibyl', 'backgrounds/bgsibyl.png'
    script.add_view 'menu-sibyl', 'backgrounds/bgsibyllist.png'
    script.add_view 'door-msrah', 'backgrounds/door-msrah.png'
    script.add_view 'room-msrah', 'backgrounds/bgmsrah.png'
    script.add_view 'menu-msrah', 'backgrounds/bgmsrahlist.png'
    script.add_view 'door-vera', 'backgrounds/door-vera.png'
    script.add_view 'room-vera', 'backgrounds/bgvera.png'
    script.add_view 'menu-vera', 'backgrounds/bgveralist.png'

    script.add_song 'intro', 'music/maitred.ogv'
    script.add_song 'room', 'music/songthing.ogv'
    script.add_song 'gnolls', 'music/gnolltwins.ogv'
    script.add_song 'armando', 'music/armando.ogv'
    script.add_song 'sibyl', 'music/sibyl.ogv'
    script.add_song 'msrah', 'music/msrah.ogv'
    script.add_song 'vera', 'music/vera.ogv'

    narrator = null
    gnoll_black = script.new_character
        name: 'Errgriz'
        position: 'right'
        color: '#273639'
        poses:
            annoyed: 'portraits/gnolls-annoyed black.png'
            confident: 'portraits/gnolls-confident black.png'
            excited: 'portraits/gnolls-excited black.png'
            excited2: 'portraits/gnolls-excited black(2).png'
            grump: 'portraits/gnolls-grump black.png'
            statement: 'portraits/gnolls-statement fact black.png'
    gnoll_white = script.new_character
        name: 'Ergrez'
        position: 'left'
        color: '#7fb784'
        poses:
            annoyed: 'portraits/gnolls-annoyed white.png'
            blank: 'portraits/gnolls-blank white.png'
            confident: 'portraits/gnolls-confident white.png'
            excited: 'portraits/gnolls-excited white.png'
            excited2: 'portraits/gnolls-excited white(2).png'
            grump: 'portraits/gnolls-grump white.png'
            statement: 'portraits/gnolls-statement fact white.png'

    armando = script.new_character
        name: 'Armando'
        position: 'middle'
        color: '#d28b3a'
        poses:
            blank: 'portraits/armando-staring blankly.png'
            confident: 'portraits/armando-confidence.png'
            excited: 'portraits/armando-excited grin.png'
            exclaiming: 'portraits/armando-exclaiming.png'
            leer: 'portraits/armando-Set1.png'
            intense: 'portraits/armando-intense eyes.png'
            ominous: 'portraits/armando-ominous.png'
            ominous2: 'portraits/armando-ominous 2.png'

    sibyl = script.new_character
        name: 'Sibyl'
        position: 'middle'
        color: '#8247b1'
        poses:
            annoyed: 'portraits/sibyl-annoyed.png'
            befuddled: 'portraits/sibyl-befuddled.png'
            exclaiming: 'portraits/sibyl-exclaiming.png'
            calm: 'portraits/sibyl-neutral happy.png'
            statement: 'portraits/sibyl-statement fact.png'
            surprised: 'portraits/sibyl-surprised.png'
            perturbed: 'portraits/sibyl-surprise slight annoy.png'
            thoughtful: 'portraits/sibyl-thoughtful.png'

    msrah = script.new_character
        name: 'Msrah'
        position: 'middle'
        color: '#46541d'
        poses:
            blank: 'portraits/msrah-blank serious.png'
            confident: 'portraits/msrah-cross arm confidence.png'
            grandiose: 'portraits/msrah-gesture grand.png'
            gesturing: 'portraits/msrah-gesture to viewer.png'
            list: 'portraits/msrah-list.png'
            excited: 'portraits/msrah-looks at viewer, slight excite.png'
            thoughtful: 'portraits/msrah-looks off thoughtfully.png'

    vera = script.new_character
        name: 'Vera'
        position: 'middle'
        color: '#9e0038'
        poses:
            annoyed: 'portraits/vera-annoyed.png'
            bored: 'portraits/vera-bored.png'
            exasperated: 'portraits/vera-exasperated annoyed.png'
            excited: 'portraits/vera-excited.png'
            grin: 'portraits/vera-grin.png'
            proud: 'portraits/vera-proud.png'
            statement: 'portraits/vera-statement fact excited.png'
            thoughtful: 'portraits/vera-thoughtful.png'

    # TODO it does seem a bit weird that everything is identified by string...  except for characters?

    # TODO eh this markup is not GREAT but it's least-bad i guess.  would only be better by combining the "for" instead of leaving it blank on subsequent rows
    script.add_credits '''
        <div class="cutscene--credits-row">
            <div class="-for">Art, Music</div>
            <div class="-who">PK</div>
            <div class="-deviantart"><a href="http://purplekecleon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://purplekecleon.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/papayakitty"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>
        <div class="cutscene--credits-row">
            <div class="-for">Art, Special thanks</div>
            <div class="-who">Exty</div>
            <div class="-deviantart"><a href="http://extyrannomon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://exty.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Script</div>
            <div class="-who">Marl</div>
            <div class="-deviantart"><a href="http://marlcabinet.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://avolontes.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Putting it together</div>
            <div class="-who">Eevee</div>
            <div class="-deviantart"><a href="http://lexyeevee.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://lexyeevee.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/eevee"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Special thanks</div>
            <div class="-who">Buyo</div>
            <div class="-deviantart"><a href="http://buyo-baka.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://buyobanana.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Special thanks</div>
            <div class="-who">Reimenta</div>
            <div class="-deviantart"><a href="http://reimenta.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Special thanks</div>
            <div class="-who">Seik</div>
            <div class="-deviantart"><a href="http://whmseik.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Special thanks</div>
            <div class="-who">Shikka</div>
            <div class="-deviantart"><a href="http://shikkatl.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://shikaro.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Special thanks</div>
            <div class="-who">Yugimew</div>
            <div class="-deviantart"><a href="http://yugimew.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"></div>
            <div class="-twitter"></div>
        </div>

        <p>
            <a href="http://floraverse.com/">Floraverse</a>
            ·
            <a href="http://floraverse.bandcamp.com/album/the-gourmet-gauntlet">Soundtrack on Bandcamp</a>
            ·
            <a href="http://floraverse.deviantart.com/journal/The-Gourmet-Gauntlet-458259365">Prompt on deviantArt</a>
        </p>

        <p>thanks for playing  :)</p>
    '''

    # -------------------------------------------------------------------------
    # Intro

    script.transition 'opening1'
    script.play 'intro'
    script.say narrator, '''“...Now go, and good luck. Don't mess it up.”'''
    script.say narrator, '''Now that the Maitre d’ has finished her speech, the assistants begin to head back to their rooms.'''
    script.say narrator, '''Not all of them look happy. Why would anyone sign up for this job if they didn't want it?'''
    script.say narrator, '''Oh well. You have no time to concern yourself with their affairs. You should probably begin your own preparations.'''
    script.say narrator, '''That is, if you decide to.'''

    script.mark 'look-around'
    script.transition 'opening2'
    script.menu
        'look-around:table-with-refreshments': "Look at table with refreshments"
        'look-around:maitre-d': "Look at Maitre d'"
        'look-around:back-to-room': "Head back to your room"

    script.mark 'look-around:table-with-refreshments'
    script.say narrator, '''With a name like Gourmet Gauntlet, you would have expected the refreshments to be a little bit better. These store-bought snacks and drinks don't appear to live up to the reputation the island carries for culinary excellence.'''
    script.say narrator, '''You decide to eat a cookie.'''
    script.say narrator, '''Bland. Maybe they're saving the good stuff for later.'''
    script.jump 'look-around'

    script.mark 'look-around:maitre-d'
    script.say narrator, '''You watch her talk to Mew York Harbormasters Raphael and Aquila. They were the ones in charge of getting you and the other assistants here safely.'''
    script.say narrator, '''You were more than capable of making the trip here yourself, but some of last year's Gourmet Run assistants were harassed by cities who sought to give their own Chefs an advantage.'''
    script.say narrator, '''You wonder how anyone could know which assistant had been selected by a specific Chef. Or, for that matter, how anyone could know who was an assistant at all. The Chef's selections are supposed to be kept secret until the Gauntlet Run begins.'''
    script.say narrator, '''At any rate, Citrico's escort plan worked. Raphael and Aquila were excellent coordinators, and you arrived on Citrico without any problems.'''
    script.jump 'look-around'

    script.mark 'look-around:back-to-room'
    script.say narrator, '''You decide to head back to your room. You have some packing to do, and not a lot of time to do it in.'''

    script.dim_out()
    script.nobackdrop()
    script.say narrator, '''After traversing through what felt like an eternity of stairs and a mile of hallway, you arrive at your room.'''

    script.transition 'opening3'
    script.play 'room'
    script.say narrator, '''You notice a letter on the table, addressed to you.'''
    #TODO menu here

    letter = null
    script.transition 'opening4'
    script.say letter, '''
        “Congratulations Assistant #492, for being selected by one of this year's Gourmet Run Chefs! This is a great honor, and your family and/or friends should be very proud!
        “Every year, dozens of thousands of individuals apply to be assistants, but only five hundred are selected! The Chefs carefully review each and every applicant, and make their selections only after great deliberation on their part.
        “Be aware that good sportsmanship and conduct are expected of you at all times, and bribes of any kind are not to be considered. If you suspect yourself the target of bribery/threats/coercion, please inform the Maitre'd or Harbormasters Raphael and Aquila immediately.
        “Please pack your things in the backpack provided to you and report to your Chef by midnight. They are sure to be expecting you!
        “Good luck!
        “ASSISTANT #492 TO REPORT TO CHEF 493#jjd$9 BY MIDNIGHT\nFAILURE TO DO SO WILL RESULT IN PERMIT BEING REVOKED AND DISQUALIFICATION”
    '''

    script.say narrator, '''Hmm. You can't make out which Chef you've been selected by. You'll just have to pack your things and head down to a Chef of your choosing. They probably won't notice if you're not supposed to be there, and hey, you have a 20% chance of picking the right Chef anyway! Those odds aren't too bad.'''

    script.say narrator, '''You place the few possessions you took with you into your backpack, and leave your room.'''

    script.dim_out()
    script.nobackdrop()
    script.say narrator, '''As you steel yourself for another eternity of ham-crushing stairs, you notice an elevator you missed before. Whoops.'''

    # -------------------------------------------------------------------------
    # Doors!

    script.transition 'doors'
    script.say narrator, '''You've made it to the orientation hallway. Behind each door is a Chef waiting to greet and supply their assistants with (hopefully) everything they'll need to get through the upcoming month.'''
    script.say narrator, '''Since your letter was damaged, you get to pick your own Chef. You should have probably spoken with the Maitre d’ about it, but it's too late for that now.'''
    script.say narrator, '''Making your own decision has always been far more appealing to you than being told what to do, anyway.'''

    script.mark 'doors'
    script.menu
        'doors:msrah': "Far left: Ornate door, covered in hieroglyphs"
        'doors:armando': "Middle left: Simple kitchen door"
        'doors:gnolls': "Middle: Bright forested passageway"
        'doors:sibyl': "Middle right: Simple wooden door"
        'doors:vera': "Far right: Odd door, covered in scribbles"
        'ending': cutscene.SpeechBubble.JUMP_WHEN_COMPLETE


    ## GNOLLS

    script.mark 'doors:gnolls'
    script.transition 'door-gnolls'
    script.nomusic()
    script.say narrator, '''You hear loud noises from behind this door, along with occasional growling, snarling, and barking.'''
    script.say narrator, '''Sounds like Gnolls. You've heard about them before, but have had the good fortune to have never run into one of them. From the sounds of it, there's two in this room.'''
    script.say narrator, '''You draw a breath, and the noises suddenly stop. Heavy footsteps head your way and stop just short of the door. Whatever is in there is waiting for you.'''
    script.say narrator, '''Are you brave enough to enter?'''
    script.dim_out()

    script.transition 'room-gnolls'
    script.play 'gnolls'
    script.say narrator, '''A Gnoll stands in front of you, and they’re just as large and vicious-looking as you were led to believe. They could probably twist your body into a pretzel without breaking a sweat, whether you liked it or not.'''
    script.say narrator, '''Luckily for you, they seem to have no interest in that.'''

    script.emote gnoll_black, 'excited', '''Oh. Ooh! Ooooh!'''
    script.emote gnoll_white, 'grump', '''What is it now!?'''
    script.say gnoll_black, '''Ooh! Look! Assistants have arrived!'''
    script.emote gnoll_white, 'excited', '''Ooh! Ooooh!'''
    script.emote gnoll_black, 'grump', '''Stop copying me!'''
    script.emote gnoll_white, 'grump', '''I am not copying. I am doing it better!'''
    script.emote gnoll_black, 'annoyed', '''Stop that! It is time for us to look at our assistant.'''
    script.emote gnoll_white, 'blank', '''Some do not look as strong, now that I see them closely.'''
    script.emote gnoll_black, 'confident', '''It should be good. We have picked them, so they will be strong enough.'''
    script.emote gnoll_white, 'confident', '''Yes, it is a great honor for us to choose them!'''
    script.say gnoll_black, '''The greatest!'''
    script.emote gnoll_white, 'blank', '''You do not need more instructions, no?'''
    script.say gnoll_black, '''It is very simple. Just grab things for us, and bring them back.'''
    script.emote gnoll_white, 'confident', '''Bring back everything we want, and we will win.'''
    script.emote gnoll_black, 'excited', '''And then we will be rewarded!'''
    script.emote gnoll_white, 'excited', '''All will know the might of the Gnoll cuisine!'''
    script.emote gnoll_black, 'confident', '''And you assistants will be rewarded too.'''
    script.emote gnoll_white, 'confident', '''But not as much as us. We want the most reward.'''
    script.emote gnoll_black, 'statement', '''We will need twice as much reward, since we are two, and not one.'''
    script.emote gnoll_white, 'excited2', '''Here’s my list.'''  # XXX list
    script.emote gnoll_black, 'excited2', '''Here’s my list, too.'''  # XXX list
    script.emote gnoll_white, 'blank', '''Look for things on my list first.'''
    script.emote gnoll_black, 'annoyed', '''No! Look for ones on mine first!'''
    script.emote gnoll_white, 'statement', '''We will leave it to assistants to decide.'''
    script.emote gnoll_black, 'statement', '''Yes. I agree. They will see which list is better.'''
    script.say gnoll_white, '''It will be my list that is better.'''
    script.emote gnoll_black, 'annoyed', '''You are not an assistant!'''
    script.say gnoll_white, '''I am too smart to be an assistant.'''
    script.emote gnoll_black, 'statement', '''Me too.'''

    script.say narrator, '''Chefs Ergrez and Errgriz have selected you to be one of their assistants! Did they do it because you looked strong? Probably. You better be, because their lists aren’t for the faint of heart! Don’t worry about having two lists of ingredients, by the way. Ergrez and Errgriz’s lists are identical.'''

    ###
    Ergrez’s & Errgriz’s list

    1. Strong things for strong food.
    At least ★★★★★★★★ (8) in Caution.

    2. Savory things are the best.
    At least  ★★★★ (4) in Savory.

    3. Spicy things are good too.
    At least ★★★★ (4) in Spicy.

    4. Sour thing wakes you up after meals.
    At least ★★★★★★★★ (8) in Sour.

    5. Sweet things are for kids. Don’t want too many sweet things.
    Try to have ★★★★★ (5) total or less in Sweet, please.
    ###

    script.transition 'menu-gnolls'
    script.exeunt gnoll_white, gnoll_black
    script.notext()
    script.pause()

    script.say narrator, '''Looks like these guys want some greenery, huh? I’m sure they’d make do with whatever you got them, though. Don’t sweat it too much if you can’t deliver perfectly in every category; it’s the job of a Chef to be able to work with what they have!'''

    script.dim_out()
    script.jump 'doors'

    ## ARMANDO

    script.mark 'doors:armando'
    script.transition 'door-armando'
    script.play 'armando'
    script.say narrator, '''The door opens as you approach it...'''
    script.transition 'room-armando1'
    script.say narrator, '''...and a large, sharply-dressed cat stands in the doorway, purposely blocking your way. She peers down at you, unimpressed. Behind her, you see a small black cat in traditional Mew York chef attire sitting down at a table, sharpening a cleaver.'''
    script.say narrator, '''The large cat coughs, commanding your attention. “You need something, or you gonna waste our time?”'''
    script.say narrator, '''Good question. Do you need something?'''

    script.transition 'room-armando2'
    script.emote armando, 'excited', '''Welcome to my kitchen, and my family!'''
    script.emote armando, 'blank', '''For the next month, at least.'''
    script.emote armando, 'excited', '''I consider all of my assistants just as important as my brothers and sisters.'''
    script.emote armando, 'intense', '''And by choosing you as my assistant, I’m placing a lot of trust in you. You need to do the same for me.'''
    script.emote armando, 'confident', '''I will win this for us, as long as you get me exactly what I need.'''
    script.emote armando, 'exclaiming', '''If you can’t do it, then by all means, tell me! There can be no secrets between family members.'''
    script.emote armando, 'excited', '''I’ll deem you unfit for assistant duty, of course!'''
    script.emote armando, 'ominous', '''But that will be a better outcome for you than if you were to return without my exact requirements.'''
    script.emote armando, 'ominous2', '''I would feel greatly deceived by you! I cannot tell you how upset I was the last time I was deceived!'''
    script.emote armando, 'excited', '''I would have to do my duty to all honest chefs everywhere and root out the source of the deception. It’d be better for you to not return at all, if that happened.'''
    script.emote armando, 'leer', '''I cannot tolerate dishonesty! You understand, right?'''
    script.emote armando, 'excited', '''Here’s the list. I’m sure you can do it. You look pretty smart. That’s why I chose you.'''

    script.say narrator, '''Armando has selected you to be one of his assistants! Did he really do it because you looked smart? How does someone even decide what ‘smart’ looks like? Oh well. You couldn’t help but feel a bit intimidated by him. Well, not by him, but by the massive bodyguards he had by his side, and by the ones you spotted lurking in the shadows. Is he a political figure? You have no idea. It’d probably be best not to make him upset, though.'''

    ###
    Armando’s list

    1. Fruit Salad
    At least ★★ (2) in both Sweet and Sour.

    2. Spiced Wine
    At least ★★★★ (4) in Sweet and ★★★ (3) in Spicy

    3. Roast
    At least ★★★★★★ (6) in Savory.

    4. Dessert
    At least ★★★ (3) in Sweet

    5. Special request
    I would simply love an ingredient with ★★★★★ (5) or more in Caution! Think of how stunning it would be for our diners!
    ###

    script.transition 'menu-armando'
    script.exeunt armando
    script.notext()
    script.pause()

    script.say narrator, '''Armando’s list shouldn’t be too hard... looks like he likes fruit. Still, if he’s as good as he says he is, he should be able to create an excellent meal with whatever you give him, even if it’s not exactly what he asked for. That last item can be a bit of trouble, but it does say it’s a special request. Does that mean he won’t be too upset if you don’t deliver on it? You hope not.'''

    script.dim_out()
    script.jump 'doors'

    ## SIBYL

    script.mark 'doors:sibyl'
    script.transition 'door-sibyl'
    script.nomusic()

    script.say narrator, '''A small sign is nailed underneath the nameplate reading “Sibyl”. It reads: “Abandon hope, all ye who enter here.” The door itself is covered in claw marks, and a dark red substance stains the wood in various places.'''

    script.say narrator, '''You suddenly realize that it's gone completely silent. All you can hear is your own breathing. The doorknob rattles and begins to turn. Something on the other side is about to greet you.'''

    script.say narrator, '''Do you stay and greet it?'''
    script.dim_out()

    script.transition 'room-sibyl'
    script.play 'sibyl'
    script.emote sibyl, 'perturbed', '''What’re you waiting here for? I’d already be off in the wilderness myself, if I had two good legs!'''
    script.emote sibyl, 'befuddled', '''Whaddya mean I’m not allowed? Who cares about that? Do something good enough, fella, and people don’t care about little things like rules.'''
    script.emote sibyl, 'surprised', '''The list? What list? Oh shoot, I forgot that was a thing. Doesn’t matter now.'''
    script.emote sibyl, 'calm', '''Just hurry up and pack your gear and head off to Stemm, the northernmost island.'''
    script.say sibyl, '''I’m gonna want you to zip through all five of the islands here.'''
    script.say sibyl, '''And I’m gonna want you to get me anything that looks mean.'''
    script.emote sibyl, 'annoyed', '''I mean it! Don’t bring me back some rabbit or field mouse.'''
    script.say sibyl, '''I’d be liable to toss you into the pot!'''
    script.emote sibyl, 'calm', '''Unless it was some kinda vicious, bloodthirsty rabbit or field mouse.'''
    script.say sibyl, '''If it were, I’d compliment you.'''
    script.emote sibyl, 'statement', '''Don’t bother killing them neither. I’m gonna need them fresh, so you’re gonna have to deliver them to me alive.'''
    script.emote sibyl, 'thoughtful', '''I guess you can get me some of the smaller things too, but only if they look mean.'''
    script.emote sibyl, 'exclaiming', '''Now get on out of here! You don’t need a list for that!'''
    script.emote sibyl, 'statement', '''And if you do, then I’m afraid you won’t last two days out there in the wilderness.'''

    script.say narrator, '''Sibyl has selected you to be one of her assistants! Was it because you looked brave? Maybe. Can you just pick up the easiest things on each island, claiming that each one looked particularly mean? Maybe not. She wants the meanest, most vicious things that the islands have to offer, and she wants them alive. She’ll understand if you have to kill them, though, or if you have to pick the second meanest, second most vicious things the islands have to offer.'''

    ###
    Sibyl’s “list”

    1. Stretches!
    Something ★★★ (3) or higher in Caution.

    2. Warmup!
    Something ★★★★ (4) or higher in Caution.

    3. Practice run!
    Something ★★★★★ (5) or higher in Caution.

    4. Showtime!
    Something ★★★★★★ (6) or higher in Caution.
    ###

    script.transition 'menu-sibyl'
    script.exeunt sibyl
    script.notext()
    script.pause()

    script.say narrator, '''It sure is easy to just ask for the most dangerous things on the islands, isn’t it? It’s not like she’s the one that has to go find and subdue all that stuff. She can probably put her enthusiasm to work on whatever you give her, no matter how bloodthirsty or wanting-to-kill-you it was.'''

    script.dim_out()
    script.jump 'doors'

    ## MSRAH

    script.mark 'doors:msrah'
    script.transition 'door-msrah'
    script.nomusic()

    script.say narrator, '''This door is decorated with Altharian hieroglyphs. You can't read them, but looking at them begins to fill you with a sense of cheer and dedication. Whatever Chef you were actually assigned to doesn't seem to matter much, now. You want to open this door.'''

    script.say narrator, '''As you touch the doorknob, you stop. Were you being controlled by those hieroglyphs just now? Were they put there by the Chef? That would be no good. You want to make your own decisions. You step back and take a deep breath.'''

    script.say narrator, '''Go inside?'''
    script.dim_out()

    script.transition 'room-msrah'
    script.play 'msrah'
    script.emote msrah, 'blank', '''The Maitre d’ kept you longer than I would have liked.'''
    script.emote msrah, 'thoughtful', '''That is of no great importance, however. There is no rush.'''
    script.emote msrah, 'excited', '''Tell me, is it your dream to be assistant to the top ranked Chef in the Gauntlet Run?'''
    script.emote msrah, 'confident', '''No need to be bashful, now. You’re standing in front of me because you want to be here.'''
    script.say msrah, '''There would be no other reason.'''
    script.emote msrah, 'excited', '''Yes, I chose you, of course I did. But you made the decision to be present.'''
    script.emote msrah, 'gesturing', '''I cannot choose that for you!'''
    script.emote msrah, 'confident', '''That is why I have selected you.'''
    script.emote msrah, 'blank', '''I am getting sidetracked. My apologies. If you’re here, it must mean it’s time for you to go.'''
    script.emote msrah, 'thoughtful', '''And we’ve only just started to get to know each other.'''
    script.emote msrah, 'blank', '''No matter.'''
    script.emote msrah, 'grandiose', '''Your performance in the coming month will tell me more about you than if we were to sit here conversing for hours.'''
    script.emote msrah, 'thoughtful', '''And my performance after yours will tell you everything you need to know about me.'''
    script.say msrah, '''It is how it should be. We shall speak with actions in the coming days.'''
    script.emote msrah, 'list', '''My list should not be too difficult. Take it, please.'''
    script.emote msrah, 'gesturing', '''I hope to meet with you again in a few weeks.'''

    script.say narrator, '''Msrah has selected you to be one of his assistants! It sounds like he picked you simply because you were there, which doesn’t sound very flattering. He didn’t sound very rude, though. Maybe he meant it in a good way. Still, though, with him having no expectations as to how well you’ll do, aren’t you a little bit nervous? Good thing nothing on his list seems to be too outlandish or dangerous. '''

    ###
    Msrah’s list

    1. Hello, assistant. For starters, I want you to travel to Polaris. Once there, I would like you to search for two ingredients. Any two will do, as long as they are both excellent examples of one of the five categories we have. Spicy, Sour, Sweet, Savory, or Bitter.
    Two ingredients ★-★★★★ (1 - 4) in any one category from Polaris.

    2. Once you have found two ingredients from Stemm, I would like you to travel north. Visit the other four islands for the same purpose.
    Two ingredients ★-★★★★ (1 - 4) in any one category from Citrico.
    Two ingredients ★-★★★★ (1 - 4) in any one category from Musapeel.
    Two ingredients ★-★★★★ (1 - 4) in any one category from Cherran.
    Two ingredients ★-★★★★ (1 - 4) in any one category from Stemm.

    3. I have no need for anything overpowering. Please limit your search to ingredients with ★★★★ (4) or less in Caution.
    ###

    script.transition 'menu-msrah'
    script.exeunt msrah
    script.notext()
    script.pause()

    script.say narrator, '''Sounds like you’ve got a bit of traveling to do! Looks like he wants a balanced menu. What he plans to make with that menu, you have no idea. Is it normal for a Chef to allow their assistants to decide on what ingredients are gathered? What if you screwed it up and got ten of the worst ingredients ever? Would that be your fault, or would it be the Chef’s fault? Best not to worry about that. He seemed confident you would make the right choices.'''

    script.dim_out()
    script.jump 'doors'

    ## VERA

    script.mark 'doors:vera'
    script.transition 'door-vera'
    script.nomusic()

    script.say narrator, '''This door is decorated with the same hieroglyphs as Msrah's door, but these are much more crude, and look to be drawn in crayon. A happy face in the middle stares at you. You stare back for a little bit.'''

    script.say narrator, '''After having your fill of staring at the door, you decide your time would be better spent deciding on whether or not you actually want to open it and enter.'''

    script.say narrator, '''Do you want to?'''
    script.dim_out()

    script.transition 'room-vera'
    script.play 'vera'
    script.emote vera, 'excited', '''Hey hey! You’re here! Just in time!'''
    script.say vera, '''We gotta swindle these suckers!'''
    script.emote vera, 'thoughtful', '''Or stalk? Was it stalk, or swindle? I can’t remember.'''
    script.emote vera, 'proud', '''I’m gonna just have you do both! Tell me which one works out the best!'''
    script.emote vera, 'bored', '''I live here, and let me tell you. It gets boring. Real boring. It’s the same old thing.'''
    script.emote vera, 'annoyed', '''Year in and year out.'''
    script.emote vera, 'bored', '''I’m tired of coming up with new things every year for this event.'''
    script.emote vera, 'exasperated', '''Boring!'''
    script.emote vera, 'grin', '''So let me tell you what I want you to do.'''
    script.emote vera, 'proud', '''It’s real easy.'''
    script.emote vera, 'statement', '''I want you to pick another Chef. I don’t care which one. Really! Don’t bother asking me!'''
    script.emote vera, 'grin', '''Pick one out, and stalk their assistants. See if you can get your hands on their lists.'''
    script.emote vera, 'thoughtful', '''Then either find your own ingredients from their lists and bring them to me at the end, or...'''
    script.emote vera, 'excited', '''Or steal their ingredients!'''
    script.emote vera, 'grin', '''That last option would be the funniest, I think.'''
    script.emote vera, 'proud', '''I’m gonna cook whatever the other Chefs think they’re gonna cook, and I’m gonna do it better.'''
    script.emote vera, 'grin', '''Cooking’s easy. Copying their stuff isn’t a problem if you’re as good as me.'''
    script.emote vera, 'statement', '''Now get! Go on, quick!'''

    script.say narrator, '''Why did the Imp select you to be her assistant? Do you look like you’d just rob someone, or lie to them and piggyback off of all of their hard work? She really thought you looked the type? Well, if you aren’t, you better at least act the type. She’s pretty serious about what she said earlier.'''

    ###
    Imp’s “list”

    1. Whatever someone else’s Chefs are gonna look for!
    2. But do it better than them! Do it better! Steal their ingredients if that’s what it comes down to.
    3. Even if it doesn’t come down to it, you should steal their ingredients anyway. I can always use more ingredients.
    4. You know what? Steal their ingredients. I don’t want anything that hasn’t been stolen from another Chef’s assistant.
    ###

    script.transition 'menu-vera'
    script.exeunt vera
    script.notext()
    script.pause()

    script.say narrator, '''Hoo boy. The other assistants don’t look like they’re gonna be pushovers. You’re glad she’s letting you pick who to stalk and rob, at least. Try not to let her down!'''

    script.dim_out()
    script.jump 'doors'


    script.mark 'ending'
    script.nobackdrop()
    script.nomusic()
    script.say narrator, '''After visiting all of the chefs, I've finally made my decision. I hope no one of them was counting on me, specifically...'''

    script.notext()
    script.roll_credits()


cutscene.Script.build "prompt2-itchyitchy-part1", "preview.png", "Itchy Itchy: Part 1", (script) ->
    script.add_view 'splash', 'itchyitchypart1.png'
    script.add_view 'trebol1a', 'trebolbgs1a.png'
    script.add_view 'trebol1b', 'trebolbgs1b.png'
    script.add_view 'trebol1c', 'trebolbgs1c.png'
    script.add_view 'trebol1d', 'trebolbgs1d.png'
    script.add_view 'trebol2a', 'trebolbgs2a.png'
    script.add_view 'trebol2b', 'trebolbgs2b.png'
    script.add_view 'trebol2c', 'trebolbgs2c.png'
    script.add_view 'trebol2d', 'trebolbgs2d.png'
    script.add_view 'trebol2e', 'trebolbgs2e.png'
    script.add_view 'trebol2f', 'trebolbgs2f.png'
    script.add_view 'trebol2g', 'trebolbgs2g.png'
    script.add_view 'trebol2h', 'trebolbgs2h.png'
    script.add_view 'trebol2i', 'trebolbgs2i.png'
    script.add_view 'trebol2j', 'trebolbgs2j.png'
    script.add_view 'trebol2k', 'trebolbgs2k.png'
    script.add_view 'trebol2l', 'trebolbgs2l.png'

    script.add_song 'undertaker', 'undertaker_2.ogg'
    script.add_song 'herbsnstuff', 'herbsnstuff.ogg'
    script.add_song 'wind', 'wind_2.ogg'
    script.add_song 'discodiscoreg', 'discodiscoreg.ogg'
    script.add_song 'musiccompetition', 'musiccompetition.ogg'
    script.add_song 'sleepy', 'sleepy.ogg'

    narrator = null

    frindle = script.new_character
        name: 'Frindle'
        position: 'left'
        color: '#776799'
        poses:
            neutral: 'frindle1.png'
            happy: 'frindle2.png'

    mibbi = script.new_character
        name: 'Mibbi'
        position: 'right'
        color: '#196099'
        poses:
            reading: 'mibbi1.png'
            talking: 'mibbi2.png'

    noma = script.new_character
        name: 'Noma'
        position: 'right'
        color: '#74265a'
        poses:
            annoyed: 'noma1.png'
            wideeyed: 'noma2.png'
            angry: 'noma3.png'

    pinpin = script.new_character
        name: 'Pinpin'
        position: 'left'
        color: '#b66985'
        poses:
            neutral: 'pinpin1.png'
            annoyed: 'pinpin2.png'

    turnip = script.new_character
        name: 'Turnip'
        position: 'left'
        color: '#61848a'
        poses:
            talking: 'turnip1.png'
            wincing: 'turnip2.png'
            neutral: 'turnip3.png'

    hazel = script.new_character
        name: 'Hazel'
        position: 'right'
        mutex: 'right'
        color: '#7a6b88'
        poses:
            neutral: 'hazel1.png'
            talking: 'hazel2.png'

    david = script.new_character
        name: 'David'
        position: 'right'
        mutex: 'right'
        color: '#5d9093'
        poses:
            neutral: 'david1.png'
            scheming: 'david2.png'

    clara = script.new_character
        name: 'Clara'
        position: 'left'
        color: '#dc439b'
        poses:
            neutral: 'clara1.png'
            happy: 'clara2.png'

    thremble = script.new_character
        name: 'Thremble'
        position: 'right'
        color: '#ea7772'
        poses:
            neutral: 'thremble1.png'
            liddown: 'thremble2.png'
            lidup: 'thremble3.png'

    clovin = script.new_character
        name: 'Clovin'
        position: 'left'
        color: '#5f809a'
        poses:
            neutral: 'clovin1.png'
            squinting: 'clovin2.png'

    chepe = script.new_character
        name: 'Chepe'
        position: 'left'
        color: '#6b30a5'
        poses:
            default: 'chepe1.png'
            talking: 'chepe2.png'
            eyesclosed: 'chepe3.png'

    stella = script.new_character
        name: 'Stella'
        position: 'left'
        color: '#6e2484'

    poster = script.new_character
        name: 'Poster'
        position: 'left'
        color: '#ab945e'
    sign = script.new_character
        name: 'Sign'
        position: 'left'
        color: '#ab945e'
    letter = script.new_character
        name: 'Letter'
        position: 'left'
        color: '#ab945e'

    # TODO ok this direly DIRELY needs to be standardized orrrr something.  it's mostly copy and paste
    script.add_credits '''
        <div class="cutscene--credits-row">
            <div class="-for">Art, Music</div>
            <div class="-who">PK</div>
            <div class="-deviantart"><a href="http://purplekecleon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://purplekecleon.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/papayakitty"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Script</div>
            <div class="-who">Marl</div>
            <div class="-deviantart"><a href="http://marlcabinet.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://avolontes.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Putting it together</div>
            <div class="-who"><a href="http://eev.ee/">Eevee</a></div>
            <div class="-deviantart"><a href="http://lexyeevee.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://lexyeevee.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/eevee"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <p>
            <a href="http://floraverse.com/">Floraverse</a>
            <!--
            ·
            <a href="http://floraverse.bandcamp.com/album/the-gourmet-gauntlet">Soundtrack on Bandcamp</a>
            ·
            <a href="http://floraverse.deviantart.com/journal/The-Gourmet-Gauntlet-458259365">Prompt on deviantArt</a>
            -->
        </p>

        <p>stay tuned for part 2</p>
    '''

    script.notext()
    script.transition 'splash'
    script.pause()

    script.transition 'trebol1a'
    script.play 'undertaker'
    script.say narrator, '''<i>???</i>'''
    script.say narrator, '''All is quiet within the clearing.\nNothing moves.'''

    script.transition 'trebol1b'
    script.say narrator, '''A gnarled, barren tree stands tall. It walks toward the forest.'''
    script.say narrator, '''It stops. The sound of crashing rocks and shifting earth fills the air.'''

    script.transition 'trebol1c'
    script.say narrator, '''Lava bursts from the ground, shooting high up into the sky. Cinders and flames reach out from the newly-formed chasm, toward the tree. The air is too hot to breathe.'''
    script.say narrator, '''A creature ten times the size of the tree rises out of the chasm, obscured by the shimmering heat.'''
    script.say narrator, '''The tree and the flame-creature stand still for a moment, and all is quiet save for the crackling of fire. Then, the tree's voice.'''

    script.transition 'trebol1d'
    script.say narrator, '''<i>“Ah!”</i>'''
    script.say narrator, '''<i>“To possess no fear of inevitability? How rare!”</i>'''
    script.say narrator, '''<i>“What great luck I possess, then, that I am witness to you!”</i>'''
    script.say narrator, '''<i>“Or would it do to attribute this to poor luck? Perhaps it does not matter.”</i>'''
    script.say narrator, '''<i>“Yes, it does not matter. It would be wrong to blame this on anything. There is no fault to be found here.”</i>'''
    script.say narrator, '''<i>“Well...”</i>'''
    script.say narrator, '''<i>“I am frightened by what awaits me, but I look forward to it still.”</i>'''
    script.say narrator, '''The flame-creature dives down, and the tree is no more.'''

    script.dim_out()  # TODO mel wants white here

    # -----

    script.transition 'trebol2a'
    script.play 'herbsnstuff'
    script.say narrator, '''<i>Bluegrass - Herbs & Stuff\nTrebol's #1 Spice & Tea company\nOxoth 12</i>'''

    script.emote frindle, 'neutral', '''How's the numbers? We're not in the weeds, are we?'''
    script.emote mibbi, 'reading', '''Numbers are good. No weeds here. We've actually already filled our quota.'''
    script.say frindle, '''What? Really?'''
    script.say mibbi, '''You betcha.'''
    script.say frindle, '''We still have half the month to go!'''
    script.emote mibbi, 'talking', '''Well, we've received very high yields from the last couple of harvests.'''
    script.say frindle, '''Yeah? What quality? Not just the low grade stuff, right?'''
    script.say mibbi, '''Well, yeah, we're getting the low grade stuff. But we're getting a lot of everything, even the top grade stuff.'''
    script.say frindle, '''What does our inventory look like right now?'''
    script.emote mibbi, 'reading', '''From our initial measurements, I'd say about twice as much as we usually have during this season.'''
    script.emote frindle, 'happy', '''Good news, good news. Looks like we'll be getting that bonus for this quarter!'''
    script.emote mibbi, 'talking', '''Looks like it, yep.'''
    script.say frindle, '''Well, I won't take up any more of your time. Keep up the good work!'''
    script.say mibbi, '''Always.'''
    script.exeunt frindle
    script.emote mibbi, 'reading', '''...'''
    script.say mibbi, '''Bonus, indeed. Hope it's enough to pay to eat out once or twice.'''
    script.dim_out()
    script.exeunt mibbi


    script.transition 'trebol2b'
    script.play 'wind'
    script.say narrator, '''<i>Bluegrass - Foxtrot\nTake a Hike Registration Building\nOxoth 20</i>'''

    script.pose pinpin, 'neutral'
    script.emote noma, 'annoyed', '''What?! What do you mean the safari is suspended?'''
    script.say pinpin, '''I mean exactly that, miss. The wildlife have been displaying unusual aggression as of late, and the rangers have decided that the safest course of action is to put all wilderness activities on hold.'''
    script.emote noma, 'wideeyed', '''For how long?'''
    script.say pinpin, '''I cannot say for sure, miss. I would assume until the wildlife is no longer hostile.'''
    script.emote noma, 'angry', '''What are we supposed to do, then? I've waited all year for this! I reserved this ticket over a month ago!'''
    script.emote pinpin, 'annoyed', '''I would not tell you what to do with your time, miss. As for your ticket, you're more than welcome to either apply for a refund or save it for a later date.'''
    script.emote noma, 'annoyed', '''Hmph.'''
    script.emote pinpin, 'neutral', '''Perhaps you would like to peruse our brochure table? Our island offers a number of other recreational activities.'''
    script.say noma, '''I would not like to peruse the brochure table. I did that a month ago before I decided on to get this ticket. Good day.'''
    script.emote pinpin, 'annoyed', '''Good day, miss.'''
    script.exeunt noma
    script.say pinpin, '''Hmm.'''
    script.say pinpin, '''I don't think anyone will mind if I close up an hour early. Yep, don't think they'll mind at all.'''
    script.exeunt pinpin
    script.dim_out()
    # TODO sigh this still cuts out the music
    script.play 'wind'


    script.transition 'trebol2c'
    script.say narrator, '''<i>Bluegrass - Foxtrot\nTake a Hike Hotel\nOxoth 21</i>'''

    script.pose turnip, 'neutral'
    script.emote noma, 'annoyed', '''I can't believe this! Those jackasses can't just close a whole forest!'''
    script.emote turnip, 'talking', '''Can't we just go anyway? They can't possibly have the entire border locked down. We paid to go camping, and I want to go camping.'''
    script.say noma, '''You and me both, buddy. Let's just hike around the forest for a while. When we see an area that doesn't look like it's being patrolled, we'll just sneak on in.'''
    script.say turnip, '''Sounds easy enough. What if we get lost or run into trouble, though?'''
    script.say noma, '''I have a map and a compass. And if we run into some hostile rabbits or whatever, I'm sure we'll survive.'''
    script.say turnip, ''''Kay. Let me fill out this comment card before we go. I'm giving this place a one star review.'''
    script.say noma, '''Out of five?'''
    script.say turnip, '''Out of ten. They'll never get over it.'''
    script.say noma, '''That's harsh.'''
    script.say turnip, '''Think we can get packed and out of here within an hour?'''
    script.say noma, '''Yeah, that should be fine.'''
    script.say turnip, ''''Kay, let's do it.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebol2f'
    script.play 'discodiscoreg'
    script.say narrator, '''<i>Disco-Disco - Galop\nDance Colosseum - Registration Office\nOxoth 26</i>'''

    script.transition 'trebol2d'
    script.say hazel, '''We're here, everyone! Does our skill dazzle you?!'''
    script.say narrator, '...'

    script.transition 'trebol2f'
    script.emote hazel, 'talking', '''Huh. Where is everyone? Did we show up too early or something, gang?'''
    script.emote david, 'neutral', '''Don't think so. Registration always opens up on the 26th.'''
    script.emote clara, 'neutral', '''Hey, look! There's a poster.'''

    script.say poster, '''ALL OFFICIAL VENUES ON HOLD UNTIL FURTHER NOTICE'''
    script.say poster, '''HELP WANTED - APPLY TODAY'''
    script.say poster, '''Looks like it's flu season, dancers! An unseasonably bad one, to say the least!'''
    script.say poster, '''Due to a large number of our workers falling ill, all public operations within Disco-Disco have been placed on hold until an adequate workforce has been re-established.'''
    script.say poster, '''And we need your help to do that!'''
    script.say poster, '''Disco-Disco is seeking talented and motivated workers to fill vacancies within its entertainment sectors!'''
    script.say poster, '''Almost every position is available! Start working today!'''

    script.pose clara, 'neutral'
    script.emote hazel, 'talking', '''Whoa. A flu? Is that why this place is like, a ghost town?'''
    script.emote david, 'scheming', '''That's kinda creepy. Should we volunteer to help?'''
    script.say clara, '''And get sick too? No way. Let's head back to the hotel and wait until registration opens up.'''
    script.emote david, 'neutral', '''When do you think that'll be?'''
    script.emote hazel, 'neutral', '''Probably a couple days at the most. I can't imagine why it would take longer.'''
    script.emote david, 'neutral', '''Hmm. Gives us more time to refine our dance moves, then.'''
    script.emote hazel, 'neutral', '''That's what I'm thinking.'''
    script.emote clara, 'neutral', '''Let's get on outta here.'''
    script.emote david, 'neutral', '''Whoa, whoa, whoa guys!'''
    script.emote hazel, 'neutral', '''What?'''
    script.emote david, 'neutral', '''We can't just walk out of here. Don't forget your ABCs.'''

    script.exeunt_all()
    script.transition 'trebol2e'
    script.say clara, '''Always'''
    script.say hazel, '''Be'''
    script.say david, '''Cloggin’'''

    script.transition 'trebol2f'
    script.emote hazel, 'talking', '''You know, why should we have to wear clogs? They kind of suck.'''
    script.emote clara, 'neutral', '''They are a bit bulky...'''
    script.emote david, 'neutral', '''Why not? Nobody else wears them, so we'd be unique. We'll be setting the bar for fashion.'''
    script.emote hazel, 'neutral', '''Well, I tossed mine out this morning.'''
    script.emote clara, 'happy', '''Me too. And you're not even wearing yours...'''
    script.exeunt hazel
    script.emote david, 'neutral', '''...'''
    script.emote david, 'scheming', '''Yeah. The ones I had actually broke.'''
    script.exeunt hazel, clara, david
    script.dim_out()


    script.mark 'xxx'
    script.transition 'trebol2g'
    script.play 'musiccompetition'
    script.say narrator, '''<i>Ballero - Sonata\nTournament of Music Registration Counter\nOxoth 26</i>'''

    script.emote thremble, 'neutral', '''Hello? Anyone here?'''
    script.emote clovin, 'neutral', '''Ring the bell!'''
    script.emote thremble, 'lidup', '''What bell?'''
    script.say clovin, '''Places like this have a bell you can ring. Makes it so the staff can't ignore you.'''
    script.emote thremble, 'neutral', '''What? How does that work?'''
    script.emote clovin, 'squinting', '''You just keep ringing it until the employees realize you're not gonna leave.'''
    script.say clovin, '''Look. That thing. That's the bell.'''
    script.say thremble, '''And I just ring it?'''
    script.say clovin, '''Yeah.'''
    script.say thremble, '''*ring*'''
    script.say thremble, '''...'''
    script.say clovin, '''Keep ringing it.'''
    script.say thremble, '''*ring*'''
    script.say thremble, '''*ring*'''
    script.say thremble, '''*ring*'''
    script.emote thremble, 'liddown', '''I don't think I can take any more of this bell. I hate it.'''
    script.emote chepe, 'talking', '''What are you two doing?'''
    script.emote clovin, 'neutral', '''Finally!'''
    script.say clovin, '''We'd like to register for the Tournament of Music.'''
    script.say chepe, '''Can't you read the sign?'''
    script.emote thremble, 'neutral', '''What sign?'''
    script.say chepe, '''The one you're standing under!'''
    script.emote clovin, 'squinting', '''I... oh.'''

    script.exeunt clovin, thremble, chepe
    script.transition 'trebol2h'
    script.say sign, '''SONATA MUSIC TOURNAMENT HALTED'''
    script.say sign, '''Due to a large number of coordinators, workers and bands falling ill, the Tournament of Music has been postponed.'''
    script.say sign, '''We understand that postponing such a large and beloved event can be frustrating, but the Sonata Music Commission feels it is in everyone's best interest to wait until all bands can perform without suffering from debilitating illnesses.'''
    script.say sign, '''Please monitor the daily news broadcasts for further updates.'''

    script.transition 'trebol2g'
    script.pose thremble, 'lidup'
    script.pose clovin, 'neutral'
    script.pose chepe, 'eyesclosed'
    script.say thremble, '''Aw, come on! Everyone's out sick?'''
    script.say clovin, '''That can't be the case.'''
    script.emote chepe, 'talking', '''Well, it can be and it is. Some kind of flu or something. You two should head home and listen to the news. Come back when registration's back open.'''
    script.say thremble, '''When's that gonna be?'''
    script.say chepe, '''How should I know? I'm not a doctor.'''
    script.say clovin, '''Yuck. Guess we can't do anything else right now.'''
    script.say chepe, '''And shut the door behind you! We're supposed to be closed.'''

    script.exeunt thremble, clovin, chepe
    script.dim_out()


    script.transition 'trebol2i'
    script.play 'sleepy'
    script.say narrator, '''<i>R-Bop - Fundango\nFundango Park Hotel\nOxoth 26</i>'''

    script.say narrator, '''*knock knock*'''
    script.say stella, '''Ugh... Maybe if I just ignore it...'''
    script.say narrator, '''*knock knock*'''

    script.transition 'trebol2j'
    script.say stella, '''...'''
    script.say narrator, '''*knock knock*'''
    script.say stella, '''Just a minute! I just woke up!'''

    script.transition 'trebol2k'
    script.say stella, '''What is it?'''
    script.say stella, '''...'''
    script.say stella, '''Hello?'''
    script.say stella, '''Hellooo?'''
    script.say stella, '''What a crock! I wanted to sleep in.'''
    script.say stella, '''What... a letter?'''

    script.say letter, '''FUNDANGO CLOSED'''
    script.say letter, '''As of Oxoth 26, all of Fundango Park's facilities will be closed until further notice.'''
    script.say letter, '''If you or anyone you know has visited Fundango Park in the past three weeks, please inform the nearest medical facility.'''
    script.say letter, '''If you are currently experiencing flu-like symptoms, make an effort to isolate yourself from others. Remain in your hotel room, and ask a friend or family member to inform the nearest medical facility of your condition.'''

    script.transition 'trebol2l'
    script.say stella, '''Uh. Is this a prank?'''
    script.say stella, '''Oh, jeez. Official letterhead and fancy paper. Guess it's legitimate.'''
    script.say stella, '''What do I do? How do I tell if I have flu-like symptoms? What?'''
    script.say stella, '''Oh, man...'''
    script.say stella, '''Well, it'd have to be pretty obvious, wouldn't it? And since it's not... I must be okay.'''
    script.say stella, '''Hmm. I'm hungry. I wonder if the restaurants are still open.'''
    script.say stella, '''Nothing ventured, nothing gained!'''

    script.dim_out()

    script.nobackdrop()
    script.say narrator, '''<i>Trebol\nOxoth 27</i>'''
    script.say narrator, '''The island is quiet.'''

    script.notext()
    script.roll_credits()
    # TODO a table of contents would be nice too
    # TODO be able to pause or mute?  need a little thing at the bottom maybe?  (catch pause key, teehee)
    # TODO should be able to click the left or right side of the whole thing to go forward/back, with some kinda light indicator


cutscene.Script.build "prompt2-itchyitchy-part2", "preview.png", "Itchy Itchy: Part 2", (script) ->
    script.add_view 'splash', 'itchyitchypart2.png'
    script.add_view 'trebolbgs3a', 'trebolbgs3a.png'
    script.add_view 'trebolbgs4a', 'trebolbgs4a.png'
    script.add_view 'trebolbgs4b', 'trebolbgs4b.png'
    script.add_view 'trebolbgs4c', 'trebolbgs4c.png'
    script.add_view 'trebolbgs4d', 'trebolbgs4d.png'
    script.add_view 'trebolbgs5a', 'trebolbgs5a.png'
    script.add_view 'trebolbgs5b', 'trebolbgs5b.png'
    script.add_view 'trebolbgs5c', 'trebolbgs5c.png'
    script.add_view 'trebolbgs5d', 'trebolbgs5d.png'
    script.add_view 'trebolbgs5e', 'trebolbgs5e.png'
    script.add_view 'trebolbgs5f', 'trebolbgs5f.png'
    script.add_view 'trebolbgs5g', 'trebolbgs5g.png'
    script.add_view 'trebolbgs5h', 'trebolbgs5h.png'
    script.add_view 'trebolbgs5i', 'trebolbgs5i.png'
    script.add_view 'trebolbgs5j', 'trebolbgs5j.png'
    script.add_view 'trebolbgs5k', 'trebolbgs5k.png'
    script.add_view 'trebolbgs5-2a', 'trebolbgs5-2a.png'
    script.add_view 'trebolbgs5-2b', 'trebolbgs5-2b.png'
    script.add_view 'trebolbgs5-2c', 'trebolbgs5-2c.png'
    script.add_view 'trebolbgs5-2d', 'trebolbgs5-2d.png'
    script.add_view 'trebolbgs5-2e', 'trebolbgs5-2e.png'
    script.add_view 'trebolbgs5-2f', 'trebolbgs5-2f.png'
    script.add_view 'trebolbgs5-2g', 'trebolbgs5-2g.png'
    script.add_view 'trebolbgs5-2h', 'trebolbgs5-2h.png'
    script.add_view 'trebolbgs5-2i', 'trebolbgs5-2i.png'

    script.add_song 'andrebeleth', 'andrebeleth.ogv'
    script.add_song 'andrecorrupt', 'andrecorrupt.ogv'
    script.add_song 'andrenormal', 'andrenormal_3.ogv'
    script.add_song 'andre', 'andre_4.ogv'
    script.add_song 'belethbored', 'belethbored1.ogv'
    script.add_song 'beleththing', 'beleththing.ogv'
    script.add_song 'beleth', 'beleth_3.ogv'
    script.add_song 'sleepy', 'sleepy_med.ogv'

    script.add_song 'andrevoice', 'andrevoice.ogv', loop_: false
    script.add_song 'belethvoice', 'belethvoice.ogv', loop_: false

    narrator = null

    # TODO: i really really want andre to have a custom frame
    andre = script.new_character
        name: 'Andre'
        position: 'back-andre-hack'
        color: '#952413'
        poses:
            andre1: 'andre1.png'
            andre2: 'andre2.png'
            andre3: 'andre3.png'
            andre4: 'andre4.png'
            andre5: 'andre5.png'
            andre6: 'andre6.png'
            andre7: 'andre7.png'
            andre8: 'andre8.png'
            andre9: 'andre9.png'
            andre10: 'andre10.png'
            andre11: 'andre11.png'
            andre12: 'andre12.png'
            andre13: 'andre13.png'
            andre14: 'andre14.png'
            andre15: 'andre15.png'
            andre16: 'andre16.png'
            andre17: 'andre17.png'
            andre18: 'andre18.png'
            andre19: 'andre19.png'
            andre20: 'andre20.png'
            exa1: 'exa1.png'
            exa2: 'exa2.png'
            exa3: 'exa3.png'
            exa4: 'exa4.png'
            exa5: 'exa5.png'

    beleth = script.new_character
        name: 'Beleth'
        position: 'right'
        color: '#d22e8c'
        poses:
            beleth1: 'beleth1.png'
            beleth1a: 'beleth1a.png'
            beleth1b: 'beleth1b.png'
            beleth1c: 'beleth1c.png'
            beleth1d: 'beleth1d.png'
            beleth1e: 'beleth1e.png'
            beleth2: 'beleth2.png'
            beleth2a: 'beleth2a.png'
            beleth2b: 'beleth2b.png'
            beleth3: 'beleth3.png'
            beleth3a: 'beleth3a.png'
            beleth3b: 'beleth3b.png'
            beleth3c: 'beleth3c.png'
            beleth3d: 'beleth3d.png'
            belethface: 'belethface.png'

    beleth_puppet = script.new_character
        name: "Beleth('s puppet)"
        position: 'right'
        color: '#b20a56'
        poses:
            default: 'belethpuppet.png'

    biff = script.new_character
        name: 'Biff'
        position: 'left'
        mutex: 'left'
        color: '#466e82'
        poses:
            biff1: 'biff1.png'
            biff1a: 'biff1a.png'
            biff1b: 'biff1b.png'
            biff1c: 'biff1c.png'
            biff1d: 'biff1d.png'
            biff2: 'biff2.png'
            biff2a: 'biff2a.png'
            biff2b: 'biff2b.png'
            biff2c: 'biff2c.png'

    biff_puppet = script.new_character
        name: "Biff('s puppet)"
        position: 'left'
        color: '#243842'
        poses:
            default: 'biffpuppet.png'

    buer = script.new_character
        name: 'Buer'
        position: 'left'
        mutex: 'left'
        color: '#7f9783'
        poses:
            buer1: 'buer1.png'
            buer2: 'buer2.png'
            buer3: 'buer3.png'
            buer4: 'buer4.png'
            buer5: 'buer5.png'

    median = script.new_character
        name: 'Median'
        position: 'left'
        mutex: 'left'
        color: '#84095d'
        poses:
            median1: 'median1.png'
            median1a: 'median1a.png'
            median2: 'median2.png'
            median3: 'median3.png'
            median4: 'median4.png'
            median5: 'median5.png'

    # TODO ok this direly DIRELY needs to be standardized orrrr something.  it's mostly copy and paste
    script.add_credits '''
        <div class="cutscene--credits-row">
            <div class="-for">Art, Music</div>
            <div class="-who">PK</div>
            <div class="-deviantart"><a href="http://purplekecleon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://purplekecleon.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/papayakitty"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Script</div>
            <div class="-who">Marl</div>
            <div class="-deviantart"><a href="http://marlcabinet.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://avolontes.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Spice</div>
            <div class="-who">Exty</div>
            <div class="-deviantart"><a href="http://extyrannomon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://exty.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Putting it together</div>
            <div class="-who"><a href="http://eev.ee/">Eevee</a></div>
            <div class="-deviantart"><a href="http://lexyeevee.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://lexyeevee.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/eevee"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <p><a href="http://floraverse.com/">Floraverse</a></p>
        <p><a href="https://floraverse.bandcamp.com/album/itchy-itchy"><img src="res/prompt2-itchyitchy-part2/album.png" alt="album cover depicting andre"><br>Soundtrack on Bandcamp</a></p>

        <p>to be continued...?</p>
    '''

    script.notext()
    script.transition 'splash'
    script.pause()

    script.transition 'trebolbgs3a'
    script.play 'andrenormal'
    script.pose andre, 'andre1'
    script.say narrator, '''<i>Turnstile - Vinyl\nGovernor's Tower - Andre's Chamber\nTigoth 1</i>'''
    script.emote andre, 'andre1', '''I'm afraid that's that. '''
    script.emote andre, 'andre6', '''Well, not really <i>afraid</i>, not exactly. I was just trying to sound concerned. Or polite. Did it work? Or did it just sound condescending?'''
    script.pose median, 'median1a', -120
    script.emote median, 'median1a', '''Sounded just a touch insensitive. '''
    script.pose median, 'median1'
    script.emote andre, 'andre3', '''Insensitive? That's not what I was hoping for at all! Rest assured I am <i>extremely</i> motivated to put this entire ordeal behind us! Trebol must get back on track, and soon.'''
    script.emote median, 'median1a', '''Maybe you shouldn't smile when you're announcing the deaths of countless citizens and the quarantine of an entire island? Just my two cents.'''
    script.pose median, 'median1'
    script.emote andre, 'andre6', '''Hmm. That sounds reasonable. I'll give it a try next time, then. Should I frown?'''
    script.emote median, 'median1a', '''<i>Can</i> you frown?'''
    script.pose median, 'median5'
    script.emote andre, 'andre11', '''I think so. Am I frowning?'''
    script.emote median, 'median1', '''...sure.'''
    script.pose median, 'median2'
    script.emote andre, 'andre2', '''I hope you realize I am putting a <i>lot</i> of faith in you to handle our situation. My credibility as a Governor is on the line here! Not everyone approves of me calling in someone like you to help Hellside.'''
    script.emote median, 'median1a', '''Your island is dying, and your citizens are worried that I'm a <i>Topsider</i>? What the hell is with you guys? Or your politics?'''
    script.pose median, 'median2'
    script.emote andre, 'andre1', '''Well, you see—'''
    script.say median, '''I don't want to be familiar with the politics down here, just in case you thought otherwise. I want to deal with your situation, get paid, and be on my way.'''
    script.pose median, 'median1'
    script.emote andre, 'andre6', '''I understand completely.'''
    script.emote median, 'median3', '''And maybe subject a couple of demons to my experiments.'''
    script.emote andre, 'andre1', '''Of course.'''
    script.emote median, 'median1', '''Is the military cordon I passed through on my way here just for show?'''
    script.pose median, 'median4'
    script.emote andre, 'andre3', '''Of course it is! But how intimidating is something, truly, if you know it isn't dangerous? Not intimidating at all! Not one bit!'''
    script.emote median, 'median1', '''I trust my assistants won't have a problem with your military? Will they be in any danger from it?'''
    script.emote andre, 'andre6', '''Gracious, no! A Governor allowing <i>Topsiders</i> to be harmed? I can't even imagine the uproar!'''
    script.pose median, 'median5'
    script.emote andre, 'andre2', '''Your assistants need only speak your name upon arrival in Hellside, and they will be taken care of.'''
    script.emote median, 'median1', '''What? That's it? You guys got some weird stuff going on down here if that's the case.'''
    script.emote andre, 'andre1', '''We pride ourselves on running an efficient ship here, Doctor. Your assistants are set to arrive in one week's time, and every night after that until there are no more assistants needing transportation!'''
    script.emote median, 'median1', '''All right, whatever.'''
    script.say median, '''I'm going to need a crew of personnel specializing in the removal of dead bodies from the cities, towns and forests. These bodies are most likely going to be highly contagious, and any mistakes made by the crew can cost them their lives. '''
    script.pose median, 'median1'
    script.emote andre, 'andre6', '''Ah, yes. You'll want to speak to Marquis Biff for that. '''
    script.say median, '''Okay, let me write that down. '''
    script.say median, '''Comic book special effect for body removal... got it.'''
    script.emote andre, 'andre1', '''He'll insist you call him Biff. He is an expert on handling the removal of dead bodies. Does it all the time! Quite the charmer, too! I'm sure you'll get along with him.'''
    script.say median, '''Next, I'll need a crew to handle transplanting the Barometz you have here to the contaminated areas of the forest.'''
    script.pose median, 'median2'
    script.emote andre, 'andre6', '''Hmm. We may have a problem there.'''
    script.say median, '''Don't tell me Hellsiders are afraid of Barometz.'''
    script.emote andre, 'andre1', '''Well, not the Barometz, but the food you requested for them.'''
    script.emote median, 'median5', '''Do you really explode around mandrakes? I thought that was an urban legend.'''
    script.emote andre, 'andre3', '''All good legends are based in reality! Your Topsiders will be required to do the handling of the Mandrakes. No sane demon will go near them.'''
    script.emote median, 'median1', '''What have you got in the way of support, then? I know you must have something.'''
    script.emote andre, 'andre6', '''Count Buer will be able to aid you. They are experts on the locating of and dealing with wildlife. They just won't be able to do the actual handling of the wildlife.'''
    script.say median, '''All right. Wait, experts? Is Buer just one demon?'''
    script.emote andre, 'andre1', '''Yes and no. Is there anything else you'll be needing?'''
    script.emote median, 'median1', '''My assistants are going to need some sort of backup when they're out and about Trebol. I understand they won't be in danger from the Hellside residents, but I don't think demons will be apt to follow their instructions.'''
    script.emote andre, 'andre3', '''You want some thugs, some brawn to accompany your assistants? That can be arranged! Vassal Beleth will be able to accommodate your needs. Their henchmen are as mindless and loyal as they come.'''
    script.emote median, 'median3', '''Excellent. Is the lab in Foxtrot ready?'''
    script.emote andre, 'andre1', '''Just waiting for you to make it your own.'''
    script.emote median, 'median1', '''I'd like to meet Biff, Beleth and Buer before I head off. Can you arrange that?'''
    script.emote andre, 'andre2', '''They'll be here shortly.'''
    script.dim_out()
    script.exeunt_all()


    script.play 'andrenormal'
    script.emote andre, 'andre1', '''Good evening! I am pleased to see that everyone was able to make it.'''
    script.say andre, '''Before we start this meeting, I wish to ask: is anyone here feeling under the weather?'''
    script.emote andre, 'andre3', '''Anyone at all? Speak up if you are! There's nothing to be afraid of.'''
    script.pose buer, 'buer4', -120
    script.emote buer, 'buer4', '''WE ARE TIRED. DOES THIS COUNT AS BEING "UNDER THE WEATHER"?'''
    script.exeunt buer
    script.emote andre, 'andre6', '''I don't know. Median?'''
    script.pose median, 'median1', -120
    script.emote median, 'median1', '''No. Does anyone have an unexplained rash? Itching areas or dry patches? Don't be embarrassed.'''
    script.pose median, 'median2'
    script.pose biff, 'biff1', -240
    script.emote biff, 'biff1', '''Well, I got plenty of those, but they're not unexplained. I know exactly why I got 'em all.'''
    script.exeunt biff
    script.emote median, 'median1', '''Huh. All right.'''
    script.exeunt median
    script.emote biff, 'biff1d', '''Hey Andre, what's the Topsider doing here, anyway? If word gets out that you're endangering them, it's gonna cause more problems than you already have.'''
    script.emote andre, 'andre1', '''That is one of the topics of tonight's meeting, so I am glad you asked! Median?'''
    script.pose andre, 'andre2'
    script.exeunt biff
    script.emote median, 'median1', '''I have been hired by Arch Magni Andre in order to take Trebol back from the epidemic currently underway. I gave Andre a list of required supplies and personnel, and he has chosen all of you to be the personnel.'''
    script.emote beleth, 'beleth1c', '''Just us three? How in the world do you think we're going to be enough?'''
    script.say median, '''You will be utilizing your powers to aid my assistants, who are expected to arrive within the week.'''
    script.exeunt median
    script.emote buer, 'buer1', '''HOW MANY ASSISTANTS SHOULD WE EXPECT?'''
    script.exeunt buer
    script.emote median, 'median1', '''Depends on how many feel like volunteering, but I wouldn't be surprised if it was several hundred.'''
    script.pose median, 'median2'
    script.emote beleth, 'beleth1d', '''What?! How can we be expected to assist that many? That's absurd!'''
    script.say median, '''You do not want to do it?'''
    script.emote beleth, 'beleth1', '''I just don't have nearly enough puppets to go around.'''
    script.emote median, 'median1', '''Everyone will be asked to do only what they can. No more.'''
    script.emote median, 'median4', '''As long as all of you do exactly as I say, this epidemic will be over within... I'd say within two or three months.'''
    script.emote beleth, 'beleth1a', '''Why so—'''
    script.pose beleth, 'beleth1'
    script.emote median, 'median1', '''Before you interrupt me, know that I intend to have the disease completely eradicated by then. Trebol will be recovering noticeably within a week of implementing my plan.'''
    script.say median, '''You will all be directing my assistants — Topsiders — from this building. You're all too valuable to get sick in the field and die.'''
    script.pose median, 'median4'
    script.emote biff, 'biff2a', '''And the Topsiders ain't? Sounds kind of cold.'''
    script.emote median, 'median1', '''Topsiders have nothing to worry about. They're immune to the disease.'''
    script.emote andre, 'andre3', '''Oh! How interesting!'''
    script.say median, '''Only Hellsiders, such as you four, are susceptible to the disease. Topsiders can't even spread it.'''
    script.emote biff, 'biff2', '''Why's that?'''
    script.emote median, 'median4', '''I have no idea. Hopefully I can discover why within the next few days.'''
    script.pose median, 'median1'
    script.emote buer, 'buer1', '''MAY WE ASK A QUESTION AFTER THIS ONE?'''
    script.emote median, 'median1', '''What is it?'''
    script.emote buer, 'buer1', '''WHAT DO YOU CURRENTLY KNOW ABOUT THE DISEASE? BELETH AND BIFF HAVE ONLY JUST ARRIVED, ANDRE NEVER LEAVES THIS ROOM—'''
    script.pose buer, 'buer2'
    script.emote andre, 'andre1', '''I could, if I wanted to.'''
    script.pose andre, 'andre2'
    script.emote buer, 'buer1', '''AND THE AREA WE GOVERN HAS NEARLY NO POPULATION. WOULD YOU ENLIGHTEN US?'''
    script.emote median, 'median1', '''What have you all heard about the disease?'''
    script.emote biff, 'biff1a', '''Some kinda horrible flu, comes with a rash. Doesn't go away.'''
    script.emote beleth, 'beleth1', '''That's about what I've heard.'''
    script.emote median, 'median1', '''It is not a flu. Andre, could you operate the projector?'''

    script.nomusic()
    script.emote andre, 'andre6', '''Certainly!'''

    script.exeunt biff, buer, beleth
    script.play 'sleepy'
    script.pose andre, 'exa1'
    script.say median, '''This is Patient A, a young Hellsider. They're displaying the initial symptoms of the disease: fever, fatigue; other than that they're completely healthy. Next slide.'''
    script.pose andre, 'exa2'
    script.say median, '''Patient A, one week after initial symptoms. Rashes have appeared, causing intense itching. Most patients, including Patient A, are unable to resist the urge to scratch these rashes, which leads to loss of fur.'''
    script.pose andre, 'exa3'
    script.say median, '''Patient A, two weeks after initial symptoms. More fur has fallen out, and the rashes are now inflamed and have begun to harden. Patient A is beginning to complain of joint stiffness and pain.'''
    script.emote beleth, 'beleth1b', '''This is kind of creepy. Are they still alive?'''
    script.emote median, 'median4', '''In a way. Next slide, please.'''
    script.pose andre, 'exa4'
    script.emote median, 'median1', '''Patient A, three weeks after initial symptoms. The patient has been given medicine to alleviate the itching, but fur continues to fall out. At this stage, it is a symptom of the disease itself, and not from scratching. The rashes are merging and beginning to spread over the entire body. Patient has developed a cough containing visible pollen-like debris. This debris is highly infectious. Next slide, please.'''
    script.pose andre, 'exa5'
    script.emote beleth, 'beleth1e', '''Holy...'''
    script.emote biff, 'biff2', '''Whoa!'''
    script.emote median, 'median4', '''Patient A, one month after initial symptoms. No fur remains. Cough is still present. Rash now covers the entire body, and is continuing to harden. Patient's mobility is almost entirely gone, and attempting to move the patient causes numerous cracks along their skin. Blood from these wounds is highly infectious.'''
    script.emote beleth, 'beleth1d', '''This is horrible! You just watched all that happen to them?!'''
    script.pose median, 'median4'
    script.say median, '''I attempted to treat them every step of the way. As you can see from the slides, I was not successful.'''
    script.pose andre, 'andre18'
    script.emote biff, 'biff2a', '''Does everyone end up like Patient A?'''
    script.emote median, 'median1', '''I believe so, yes. But it doesn't always progress to this point as quickly as in Patient A. My research indicates that some individuals have carried the disease for months before ending up like Patient A.'''
    script.emote buer, 'buer3', '''DOES THE IMMUNE SYSTEM REMOVE THE DISEASE ON ITS OWN?'''
    script.pose buer, 'buer5'
    script.emote median, 'median1', '''Not that I know of. The first reported cases were from Bluegrass, about four months ago. They're still sick, and are at the final stage of the disease.'''
    script.emote beleth, 'beleth3c', '''Are we all going to look just like Patient A?'''
    script.pose beleth, 'beleth3b'
    script.emote median, 'median4', '''If we can't eradicate this disease, yes.'''
    script.pose median, 'median1'
    script.emote andre, 'andre17', '''What about containment? What is the worst-case scenario?'''
    script.say median, '''I'll give you the best case scenario.'''
    script.say median, '''All of the Blackjack Isles becomes uninhabitable. I understand Pike has quarantined the island, but it's impossible for it to last forever. It only takes a single contagious patient to get through for everything to come crashing down.'''
    script.emote median, 'median4', '''Once it spreads to another island, quarantine will become exponentially more difficult, if not outright impossible.'''

    script.nomusic()
    script.emote median, 'median1', '''I have a theory that Heaven's Keys, or at least a part of it, underwent this same type of scenario in the past.'''

    script.play 'andrecorrupt'
    script.pose andre, 'andre5'
    script.say andre, '''...'''
    script.emote beleth, 'beleth3b', '''...'''
    script.emote biff, 'biff2b', '''...'''
    script.emote buer, 'buer5', '''...'''
    script.pose andre, 'andre4'
    script.emote median, 'median1', '''So, ready to help?'''
    script.emote buer, 'buer1', '''WHATEVER YOU NEED, MEDIAN. SPEAK YOUR ORDERS, AND WE SHALL OBEY. WE MUST NOT ALLOW THIS DISEASE TO CONQUER HELLSIDE.'''
    script.emote median, 'median1', '''While we wait for my assistants to arrive, I'm going to need you three to do some errands for me.'''
    script.say median, '''Buer, I'm told you have Barometz on this island, to the northwest.'''
    script.emote buer, 'buer1', '''YES. ON THE SCREAMING ISLAND.'''
    script.emote median, 'median1', '''We're going to need a lot of them. We're going to plant them in Bluegrass Forest.'''
    script.pose andre, 'andre18'
    script.emote buer, 'buer4', '''YOU SUSPECT THE DISEASE TO HAVE ORIGINATED FROM CONTAMINATED SOIL?'''
    script.emote median, 'median1', '''As I said, the first cases were from Bluegrass. A couple of employees working for a company named Herbs & Stuff.'''
    script.emote andre, 'andre9', '''Trebol's largest supplier of herbs, spices and teas! They send me a pamphlet every month.'''
    script.pose andre, 'andre18'
    script.say median, '''The employees were in charge of quality control, which meant they sampled everything that went through the building. These employees were the only ones that became ill.'''
    script.emote buer, 'buer1', '''THAT DOES SEEM TO SUGGEST A SOIL CONTAMINANT. WE BELIEVE YOU ARE RIGHT TO DESIRE BAROMETZ. SHALL WE BEGIN AT ONCE?'''
    script.emote median, 'median1', '''If you don't mind.'''
    script.emote buer, 'buer1', '''WE DO NOT MIND. WE SHALL TAKE OUR LEAVE NOW. WE WILL LOCATE AS MANY BAROMETZ AS POSSIBLE AND AWAIT THE ARRIVAL OF YOUR ASSISTANTS.'''

    script.nomusic()
    script.emote beleth, 'beleth1', '''What are both of you talking about?'''

    script.play 'andrenormal'
    script.exeunt buer
    script.emote andre, 'andre9', '''Have you not read the pamphlet detailing the natural wildlife on Screaming Island?'''
    script.emote beleth, 'beleth1b', '''...'''
    script.emote andre, 'andre10', '''You simply must! It is important to know all you can about our wonderful island!'''
    script.emote biff, 'biff2c', '''Can't you just tell us? I haven't read the pamphlet either.'''
    script.emote andre, 'andre3', '''Barometz are why Screaming Island is so vibrant and fertile! As Barometz grow, they leach all manner of toxins from their surroundings. Everything from decayed magic to inhospitable feelings! They're also emotionless killing machines, but that's par for the course for mother nature.'''
    script.emote biff, 'biff2a', '''And you want... Topsiders to go handle them.'''
    script.pose andre, 'andre18'
    script.emote median, 'median2', '''They'll be fine. Barometz fall asleep if they eat Mandrakes, and there are plenty of them on that island. It's why Barometz are there in the first place.'''
    script.emote beleth, 'beleth1c', '''Whoa! Is Buer going to be all right?'''
    script.emote andre, 'andre1', '''Of course! They're the best outdoorsy thing I know of.'''
    script.emote median, 'median1', '''Biff, Beleth?'''
    script.emote biff, 'biff1', '''Yes, sir!'''
    script.emote beleth, 'beleth1', '''Yes?'''
    script.pose andre, 'andre18'
    script.emote median, 'median1', '''I'm going to need you two to do a little searching through the Bluegrass Forest for me.'''

    script.nomusic()
    script.emote beleth, 'beleth2b', '''The forest, huh? For the source of the terrible, infectious, deadly disease?'''

    script.play 'andre'
    script.pose beleth, 'beleth1'
    script.say median, '''You're a mind reader.'''
    script.say median, '''Herbs & Stuff grows everything locally on the island, and both of you will have to search every location they get their inventory from.'''
    script.emote beleth, 'beleth1c', '''We're to check every single field and garden in Bluegrass?'''
    script.pose beleth, 'beleth1'
    script.say median, '''Yes.'''
    script.pose median, 'median2'
    script.emote biff, 'biff1a', '''For what? A mountain of corpses?'''
    script.emote median, 'median1', '''If you find one, that would be a pretty good sign, yes. Herbs & Stuff gave me a few of their maps, so it shouldn't be too hard for both of you to search everywhere.'''
    script.emote beleth, 'beleth2a', '''I don't know about Biff, but I'm not very comfortable waltzing into a nightmarish disease garden.'''
    script.pose beleth, 'beleth1b'
    script.say median, '''You won't have to. You two don't actually have to go anywhere to scout for me. Don't play dumb.'''
    script.emote beleth, 'beleth1d', '''How did you— that's secret!'''
    script.pose andre, 'andre2'
    script.emote beleth, 'beleth3a', '''Andre!'''
    script.pose beleth, 'beleth1b'
    script.emote biff, 'biff2a', '''Aw, man. You told her about our powers?'''
    script.emote andre, 'andre12', '''Who, me?'''
    script.emote beleth, 'beleth1c', '''...'''
    script.notext()
    script.pause()
    script.emote beleth, 'beleth1d', '''Is that me?! Why?!'''
    script.pose beleth, 'beleth1c'
    script.emote andre, 'andre13', '''Don't be ridiculous. This is merely a much cuter representation of you. You're nothing like this.'''
    script.emote beleth, 'beleth1a', '''You can't just go telling Topsiders that kind of information!'''
    script.emote andre, 'andre7', '''But I didn't, lad! Median simply explained what she needed, and I relayed that information to your commander. What was her name, again?'''
    script.emote andre, 'andre14', '''Oh, yes. Baphomet, I think! She saw fit to send both of you up here to help out. I'll call her up and explain how miffed you are at her decision.'''
    script.emote biff, 'biff2', '''Whoa, whoa, Andre! That's not necessary.'''
    script.emote andre, 'andre15', '''Are you certain? You and Beleth seemed awfully upset, just then. It'll only take a moment, I promise.'''
    script.emote beleth, 'beleth2a', '''...'''
    script.emote andre, 'andre16', '''What was that?'''
    script.emote beleth, 'beleth2b', '''It's fine. Sorry for assuming you told Median.'''
    script.emote andre, 'andre15', '''You're both forgiven. '''
    script.pose beleth, 'beleth1e'
    script.emote andre, 'andre19', '''That being said, I lied about all of it. I did tell Median, and then I got the OK from Baphomet to get both of you up here.'''
    script.emote beleth, 'beleth1d', '''Augh! Why?!'''
    script.pose beleth, 'beleth1b'
    script.emote andre, 'andre3', '''One should never assume anything! Even if you are correct. '''
    script.emote andre, 'andre1', '''What matters is that Median has been deemed trustworthy by your commander.'''
    script.pose andre, 'andre2'
    script.emote median, 'median1', '''Beleth, when one of your puppets finds the source of the contamination, have a few more puppets set up a perimeter and keep everyone and everything out.'''
    script.say median, '''Biff, if one of your... uh...'''
    script.pose median, 'median5'
    script.emote biff, 'biff1c', '''Puppets is fine.'''
    script.emote median, 'median1', '''Same thing goes for you. I want you and Beleth to work together on this. You'll both have a map, so work out the best route for each of you to take.'''
    script.emote beleth, 'beleth1', '''What are we looking for? What if we don't find a mountain of dead bodies?'''
    script.say median, '''You may just find a single dead body. That's all it takes to start an outbreak.'''
    script.emote beleth, 'beleth1c', '''Really?'''
    script.pose beleth, 'beleth1'
    script.emote median, 'median4', '''Yes. I've had many cases where an entire village's illness was caused by a single dead animal upstream of it. '''
    script.emote biff, 'biff2a', '''What kind of animal even has this kind of disease?'''
    script.say median, '''I have no idea. Nothing on Topside that I know of.'''
    script.say beleth, '''Anything else you need us to do?'''
    script.emote median, 'median1', '''That's it for now. I'm going to Bluegrass as well; a base has been constructed there and will serve as my headquarters. We can communicate back and forth with one of your puppets.'''
    script.say beleth, '''All right.'''
    script.emote median, 'median3', '''This is going to take a while, so don't lose your spirit. Bluegrass is a big place, so don't be surprised if it takes two or three weeks to search everything.'''
    script.say beleth, '''Are we going to get some kind of command center here to operate out of?'''
    script.emote andre, 'andre7', '''I have -just- the one for you!'''
    script.say beleth, '''Oh, awesome!'''
    script.emote biff, 'biff1a', '''What about me? I want a command center dealy, too.'''
    script.emote andre, 'andre8', '''Of course you do! And you'll get one. We wouldn't want to leave you out in the cold.'''
    script.emote median, 'median1', '''If anything comes up or if you need my help, contact me.'''
    script.exeunt median
    script.emote andre, 'andre2', '''...'''
    script.emote andre, 'andre1', '''She wasn't so bad, was she? Topsiders can be useful.'''
    script.emote beleth, 'beleth1c', '''Are you sure she'll be able to find a cure?'''
    script.pose beleth, 'beleth1'
    script.emote andre, 'andre6', '''Her resume is very impressive. She has handled dozens of similar cases, although they weren't quite on the scale of ours.'''
    script.say beleth, '''Okay, so let's say she finds a cure. How are we going to get it to everyone? Hellsiders aren't going to listen to her or her assistants, and all of our doctors are sick.'''
    script.emote andre, 'andre20', '''Administering the cure will be easy! As easy as firing high explosives into a city from a distance.'''
    script.emote beleth, 'beleth2b', '''Do we want to know?'''
    script.pose beleth, 'beleth1'
    script.emote andre, 'andre3', '''Yes, but I'll keep it a secret until it's relevant. She must find the cure, first!'''
    script.emote andre, 'andre8', '''Now, let's get you two to your command centers.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs4c'
    script.play 'beleththing'
    script.say narrator, '''2 weeks later\nAndre's Building - Cafeteria'''
    script.say beleth, '''I have 39 sections searched. No evidence to suspect contamination in any of them. How about you, Biff?'''
    script.say biff, '''27 searched, with nothing to show for it.'''
    script.say beleth, '''Bleh.'''
    script.say biff, '''The sections are pretty creepy, don't you think?'''
    script.say beleth, '''Why's that?'''
    script.say biff, '''They're all abandoned. Like everyone just stopped in the middle of what they were doing and hightailed it on out of them.'''
    script.say beleth, '''Well, they probably did do that.'''
    script.say biff, '''Yeah, but still. No sign of life anywhere, and that creeps me out.'''
    script.say beleth, '''How is that different from what you're normally used to?'''
    script.say biff, '''It just is.'''
    script.say biff, '''Well, that's enough lunch for me. Back to the ol' grind.'''
    script.dim_out(true)
    script.exeunt_all()


    script.transition 'trebolbgs4a'
    script.say narrator, '''1 hour later\nBeleth's broom closet'''
    script.say narrator, '''*knock knock*'''
    script.pose biff, 'biff1', 0
    script.emote biff, 'biff1', '''Hey! Beleth! I think I found something!'''
    script.emote beleth, 'beleth1', '''What is it?'''
    script.emote biff, 'biff1a', '''I dunno. Bring your puppet over to section 28.'''
    script.emote beleth, 'beleth1c', '''What? Why?'''
    script.emote biff, 'biff1', '''Just do it! I can't explain it.'''
    script.emote beleth, 'beleth1b', '''Ugh. Fine.'''
    script.say beleth, '''I'll have a puppet over there in an hour.'''
    script.dim_out(true)
    script.exeunt_all()


    script.transition 'trebolbgs4d'
    script.say narrator, '''1 hour later\nSection 28'''
    script.pose beleth_puppet, 'default'
    script.say beleth_puppet, '''Well? What is it?'''
    script.pose biff_puppet, 'default'
    script.say biff_puppet, '''Look around.'''
    script.say beleth_puppet, '''Flowers and stuff. What about it?'''
    script.say biff_puppet, '''A lot of flowers and stuff. All the other fields were kinda sickly on account of not being taken care of.'''
    script.say beleth_puppet, '''You think we should give it an in-depth search?'''
    script.say biff_puppet, '''Yeah. There's no wildlife around, either. It's really quiet.'''
    script.say beleth_puppet, '''Weird. Okay, let's do it.'''
    script.dim_out(true)

    script.say narrator, '''Hours later\nSection 28'''
    script.say beleth_puppet, '''This section took forever!'''
    script.say biff_puppet, '''Yeah, it's huge. That's why I asked you to come on over and help.'''
    script.say beleth_puppet, '''Did you find anything?'''
    script.say biff_puppet, '''A whole lot of flowers and trees, but not much else. No dead animals or monsters.'''
    script.say beleth_puppet, '''That's too bad.'''
    script.say beleth_puppet, '''Aw, man, it's gonna take hours to get to my next section.'''
    script.say beleth_puppet, '''Eh, I'll do it tomorrow. I need to let my puppets recharge, and I need to get some rest.'''
    script.say biff_puppet, '''A rest does sound nice.'''
    script.say beleth_puppet, '''Do you even need one?'''
    script.say biff_puppet, '''They keep the mind fresh, lad! I'm gonna set Hammy down here for the night. I think he liked flowers when he was alive.'''
    script.say beleth_puppet, '''You're not worried about something finding, uh, "Hammy"?'''
    script.say biff_puppet, '''Nah. No wildlife in this section, remember? Plus, Hammy's not that interesting on his own. I'd be more worried about something messing with your puppets.'''
    script.say beleth_puppet, '''It'll be fine. It'll attack any wildlife that goes near it.'''
    script.say biff_puppet, '''Dropping Hammy... now! I'll catch you at the cafeteria.'''
    script.say beleth_puppet, '''Sure.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs5a'
    script.play 'belethbored'
    script.say narrator, '''Minutes later\nBeleth's broom closet'''
    script.say beleth, '''Ugh. Another day gone, another day wasted.'''
    script.transition 'trebolbgs5b'
    script.say beleth, '''I don't know how much longer I can do this without something exciting happening. Who knew being a commander would be this boring? '''
    script.transition 'trebolbgs5c'
    script.say beleth, '''There haven't even been any cool magical transformations! '''
    script.transition 'trebolbgs5f'
    script.say beleth, '''Ah man...'''
    script.transition 'trebolbgs5j'
    script.say beleth, '''I can't believe it's been so long since I last had time to read this. I'm probably behind, what, twelve issues or so?'''
    script.notext()
    script.pause()

    script.transition 'trebolbgs5f'
    script.nomusic()
    script.say beleth, '''...'''
    script.say beleth, '''....'''
    script.say beleth, '''.....'''
    script.transition 'trebolbgs5g'
    script.say beleth, '''This is cool...'''
    script.transition 'trebolbgs5h'
    script.say beleth, '''This is so cool...'''
    script.transition 'trebolbgs5j'
    script.say beleth, '''It's like my powers are being wasted on busywork. This is ridiculous. Ugh.'''
    script.transition 'trebolbgs5d'
    script.say beleth, '''I want to go out and do stuff. Why can't it be like... like this?'''

    script.transition 'trebolbgs5e'
    script.play 'andrevoice'
    script.say andre, '''Wasted, huh?'''

    script.transition 'trebolbgs5k'
    script.play 'belethvoice'
    script.say beleth, '''AUUUGH!'''

    script.transition 'trebolbgs5-2a'
    script.play 'andrebeleth'
    script.say andre, '''Oh— no, this is serious. I've got the paper and pen right here. We can work together on a report of my gross misuse of your powers.'''
    script.transition 'trebolbgs5-2c'
    script.say beleth, '''H-how... How long have you been there?!'''
    script.transition 'trebolbgs5-2d'
    script.say andre, '''Hmm. Since issue 7, page 12. Panel...3? Yes.'''
    script.transition 'trebolbgs5-2e'
    script.say andre, '''If memory serves me right, you got cheese dust on the page.'''
    script.say beleth, '''... ... ...'''
    script.transition 'trebolbgs5-2a'
    script.say andre, '''I'd also be interested in understanding how reading this comic is a better use of your time than keeping the rest of Hellside from this plague, if you'd share. You don't have to, but I think it'd be good for the report.'''
    script.say beleth, '''...'''
    script.transition 'trebolbgs5-2b'
    script.say andre, '''Do go on! I need more than "...".'''
    script.transition 'trebolbgs5-2f'
    script.say beleth, '''Um. Look, I kind of thought I was talking to myself and I was taking a break and—'''
    script.say beleth, '''Ugh. Sorry. It's just a little boring. It hasn't been very exciting since I became a vassal.'''
    script.say beleth, '''I haven't even gotten to use Doctor Nurse or Cat n Fox yet!'''
    script.transition 'trebolbgs5-2g'
    script.say andre, '''That's a good thing.'''
    script.say beleth, '''Yeah... I guess.'''
    script.transition 'trebolbgs5-2h'
    script.say andre, '''I'm sure things will become exciting for you soon. Within a couple of months, probably. Three, tops.'''
    script.say beleth, '''Huh? What makes you say that?'''
    script.transition 'trebolbgs5-2i'
    script.say andre, '''Would you look at the time! I've gotta go not be in a comic book. See you around.'''
    script.say beleth, '''...'''
    script.dim_out()


    script.transition 'trebolbgs4b'
    script.nomusic()
    script.say narrator, '''The next day\nBiff's command center'''
    script.emote biff, 'biff1', '''Another day in paradise. Wake up, Hammy! Time for another day of fruitless searching!'''
    script.emote biff, 'biff1c', '''Eh? Hammy? You there? You didn't get eaten by a HIPPO or anything, yeah?'''
    script.emote biff, 'biff1d', '''Hmm. Maybe I just wore you out. Thought you had another month left in you, but I guess not.'''
    script.emote biff, 'biff2a', '''Man, this sucks. Can't just leave you there, and Beleth will complain if I ask them to carry you.'''
    script.emote biff, 'biff1a', '''Hey, Toothy! Wake up! Go get your brother!'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs4a'
    script.play 'beleththing'
    script.say narrator, '''Beleth's broom closet'''
    script.say narrator, '''*knock knock*'''
    script.emote biff, 'biff1', '''Hey! Beleth!'''
    script.emote beleth, 'beleth1', '''What is it this time?'''
    script.emote biff, 'biff1a', '''I need you to have your puppet guard Hammy, until his replacement arrives.'''
    script.emote beleth, 'beleth1b', '''What?'''
    script.emote biff, 'biff1c', '''Hammy's not responding to me. I think he's dead.'''
    script.emote beleth, 'beleth1c', '''Why do I have to guard him?'''
    script.emote biff, 'biff2', '''It's either that or we have a buncha zombie wildlife on our hands.'''
    script.emote beleth, 'beleth1d', '''That can happen?!'''
    script.pose beleth, 'beleth1'
    script.emote biff, 'biff1c', '''Not that I know of, but it can't hurt to take precautions. I don't want anyone to get their mitts on my magic.'''
    script.emote beleth, 'beleth1b', '''Man, fine.'''
    script.emote beleth, 'beleth1', '''...'''
    script.emote beleth, 'beleth1b', '''How did Hammy, uh, die, I guess?'''
    script.emote biff, 'biff1', '''Dunno. Does it look like anything ate him?'''
    script.say beleth, '''Er, I can't tell. He never looked good in the first place.'''
    script.say biff, '''Still got both his legs?'''
    script.say beleth, '''I count two relatively intact legs. They're kinda moldy, though.'''
    script.emote biff, 'biff2c', '''Mold's inevitable. Haven't figured out how to keep it off.'''
    script.say beleth, '''Well, aside from that, he looks like he did yesterday.'''
    script.emote biff, 'biff1', ''''Kay. Actually, you know what? You could just build a fire and throw Hammy in it, if you don't want to wait for Toothy.'''
    script.emote beleth, 'beleth1c', '''Uh, no. A fire, in the woods, built by a wooden puppet?'''
    script.pose beleth, 'beleth1'
    script.say biff, '''Rats. Well, Toothy should arrive by tonight.'''
    script.say beleth, '''Huh? Tonight? Why so fast?'''
    script.emote biff, 'biff1c', '''Toothy's a genuine SAND HIPPO, buddy. He's big enough to carry Hammy while combing the sections for clues.'''
    script.emote beleth, 'beleth1a', '''Whoa, I've never seen one of those. Okay, I'll have my puppet wait here. This is gonna be awesome.'''
    script.dim_out(true)
    script.exeunt_all()


    script.transition 'trebolbgs4b'
    script.say narrator, '''Hours later\nBiff's command center'''
    script.say narrator, '''*knock knock*'''
    script.emote beleth, 'beleth1', '''Hey, Biff! Open up!'''
    script.emote biff, 'biff1', '''What's up?'''
    script.emote beleth, 'beleth1b', '''Are flowers supposed to be growing from Hammy?'''
    script.emote biff, 'biff2a', '''There shouldn't be anything doing that, aside from the mold. Well, and some mushrooms. But that's it.'''
    script.say beleth, '''No mushrooms on Hammy, just flowers.'''
    script.emote biff, 'biff1', '''Weird. Can you pick one?'''
    script.emote beleth, 'beleth1', '''Sure.'''

    script.nomusic()
    script.emote beleth, 'beleth1b', '''...'''

    script.play 'sleepy'
    script.emote beleth, 'beleth1', '''Something's wrong. My puppet isn't responding like it should.'''
    script.say beleth, '''Feels like my connection is being lost. Weird.'''
    script.say beleth, '''Is Toothy big enough to carry two bodies?'''
    script.emote biff, 'biff1c', '''Yeah. He's almost there, too.'''
    script.dim_out(true)
    script.exeunt_all()


    script.transition 'trebolbgs4a'
    script.say narrator, '''A bit later\nBeleth's command center'''
    script.say narrator, '''*knock knock*'''
    script.emote biff, 'biff1', '''Yo. Something's up with your puppet in section 28.'''
    script.emote beleth, 'beleth1', '''What is it?'''
    script.say biff, '''It's growing flowers, just like Hammy is.'''
    script.emote beleth, 'beleth1b', '''...'''
    script.emote biff, 'biff1c', '''There's more, too. Hammy's got a rash, and I have no idea why. He's dead.'''
    script.emote beleth, 'beleth1', '''I think we found the field.'''
    script.emote biff, 'biff2a', '''I'm thinking so, too.'''
    script.emote beleth, 'beleth1e', '''Wait, wait. Back up a second. My puppet is growing flowers? For real?'''
    script.emote biff, 'biff1c', '''Yep.'''
    script.emote beleth, 'beleth3', '''That doesn't make sense! My puppet was never alive!'''
    script.pose beleth, 'beleth1'
    script.say biff, '''I don't know what to tell you, buddy. Your puppet's as flowery as it can get, right now.'''
    script.emote beleth, 'beleth1b', '''All right. There's something in Section 28, and it's gotta be what we're looking for.'''
    script.dim_out()

    script.exeunt_all()
    script.notext()
    script.nomusic()
    script.nobackdrop()
    script.roll_credits()


cutscene.Script.build "prompt2-itchyitchy-part3", "preview.png", "Itchy Itchy: Part 3", (script) ->
    script.add_view 'splash', 'itchyitchypart3.png'
    script.add_view 'trebolbgs4d', 'reused-from-part2/trebolbgs4d.png'
    script.add_view 'trebolbgs6-2a', 'trebolbgs6-2a.png'
    script.add_view 'trebolbgs6-2b', 'trebolbgs6-2b.png'
    script.add_view 'trebolbgs6-2c', 'trebolbgs6-2c.png'
    script.add_view 'trebolbgs6-2d', 'trebolbgs6-2d.png'
    script.add_view 'trebolbgs6-2e', 'trebolbgs6-2e.png'
    script.add_view 'trebolbgs6-2f', 'trebolbgs6-2f.png'
    script.add_view 'trebolbgs6-2g', 'trebolbgs6-2g.png'
    script.add_view 'trebolbgs6-2h', 'trebolbgs6-2h.png'
    script.add_view 'trebolbgs6-3', 'trebolbgs6-3.png'
    script.add_view 'trebolbgs6-3a', 'trebolbgs6-3a.png'
    script.add_view 'trebolbgs6a', 'trebolbgs6a.png'
    script.add_view 'trebolbgs6b', 'trebolbgs6b.png'
    script.add_view 'trebolbgs6c', 'trebolbgs6c.png'
    script.add_view 'trebolbgs6d', 'trebolbgs6d.png'
    script.add_view 'trebolbgs6e', 'trebolbgs6e.png'
    script.add_view 'trebolbgs6f', 'trebolbgs6f.png'
    script.add_view 'trebolbgs6f2', 'trebolbgs6f2.png'
    script.add_view 'trebolbgs6g', 'trebolbgs6g.png'

    script.add_song 'conductor', 'conductor_4.oga'
    script.add_song 'dire', 'dire_2.oga'
    script.add_song 'sleepy', 'sleepy_4.oga'
    script.add_song 'undertaker', 'undertaker_3.oga'
    script.add_song 'undertakerfailed', 'undertakerfailed.oga'

    narrator = null

    beleth_puppet = script.new_character
        name: "Beleth('s puppet)"
        position: 'right'
        color: '#b20a56'
        poses:
            default: 'belethpuppet2.png'

    biff_puppet = script.new_character
        name: "Biff('s puppet)"
        position: 'left'
        mutex: 'left'
        color: '#243842'
        poses:
            default: 'biffsandhippo.png'

    conductor = script.new_character
        name: "Conductor"
        position: 'right'
        color: '#352d54'
        poses:
            default: 'conductor.png'

    median = script.new_character
        name: "Median"
        position: 'left'
        mutex: 'left'
        color: '#84095d'
        poses:
            median1: 'reused-from-part2/median1.png'
            median1a: 'reused-from-part2/median1a.png'
            median1bark: 'median1bark.png'
            median2: 'reused-from-part2/median2.png'
            median3: 'reused-from-part2/median3.png'
            median4: 'reused-from-part2/median4.png'
            median5: 'reused-from-part2/median5.png'

    undertaker1 = script.new_character
        name: "?"
        position: 'left'
        color: '#6b6872'
        poses:
            default: 'undertakersingle.png'

    undertaker2 = script.new_character
        name: "??"
        position: 'right'
        color: '#6b6e58'
        poses:
            default: 'undertakerdouble.png'
    #
    # TODO ok this direly DIRELY needs to be standardized orrrr something.  it's mostly copy and paste
    script.add_credits '''
        <div class="cutscene--credits-row">
            <div class="-for">Art, Music</div>
            <div class="-who">PK</div>
            <div class="-deviantart"><a href="http://purplekecleon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://purplekecleon.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/papayakitty"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Script</div>
            <div class="-who">Marl</div>
            <div class="-deviantart"><a href="http://marlcabinet.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://avolontes.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Putting it together</div>
            <div class="-who"><a href="http://eev.ee/">Eevee</a></div>
            <div class="-deviantart"><a href="http://lexyeevee.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://lexyeevee.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/eevee"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <p><a href="http://floraverse.com/">Floraverse</a></p>
        <p><a href="https://floraverse.bandcamp.com/album/itchy-itchy"><img src="res/prompt2-itchyitchy-part2/album.png" alt="album cover depicting andre"><br>Soundtrack on Bandcamp</a></p>

        <p>to be continued...?</p>
    '''

    script.notext()
    script.transition 'splash'
    script.pause()

    script.transition 'trebolbgs4d'
    script.play 'dire'
    script.say narrator, '''Later that week\nSection 28'''
    script.emote median, 'median3', '''This is unusual! You were right to send for me.'''
    script.emote beleth_puppet, 'default', '''You really think the source is somewhere in this section?'''
    script.emote median, 'median1', '''I am sure of it. It's just a matter of finding it, now.'''
    script.emote biff_puppet, 'default', '''Well, Hammy combed through the area pretty good before he up and died, and didn't find anything, so I dunno.'''
    script.say beleth_puppet, '''My puppet wasn't able to find anything before dying, either.'''
    script.emote median, 'median1', '''Your puppet is made of wood, yes?'''
    script.say beleth_puppet, '''Yeah. It was never alive to begin with, so I have no idea why the disease was able to do anything to it.'''
    script.say beleth_puppet, '''Furthermore, I don't know why my puppet doesn't respond. I should be able to do something with it, even if it is covered in flowers.'''
    script.emote median, 'median2', '''Your puppet was alive at one point, I guarantee.'''
    script.say beleth_puppet, '''What do you mean?'''
    script.emote median, 'median1', '''The wood you used. It came from a tree, yes? A tree that was once alive.'''
    script.say median, '''And Biff, your Hammy, he was once alive?'''
    script.emote biff_puppet, 'default', '''Yeah, but not anymore.'''
    script.emote median, 'median1', '''Is it improbable that a bacteria or virus would be able to replicate itself within Hammy?'''
    script.emote biff_puppet, 'default', '''It's never happened before. Aside from mold and mushrooms, that is. But the mushrooms are on purpose. Mold's just weird; it grows on the magic I use to keep my puppets laundry-fresh.'''
    script.emote median, 'median4', '''Hmm.'''
    script.emote median, 'median1', '''Ah.'''
    script.emote median, 'median5', '''Ah!'''
    script.say beleth_puppet, '''What is it?!'''
    script.say median, '''An undertaker.'''
    script.emote biff_puppet, 'default', '''That sounds intimidating. You should get out of there, I guess.'''
    script.emote median, 'median1', '''There's no need. It's dead.'''
    script.say beleth_puppet, '''Huh? Oh.'''
    script.exeunt_all()
    script.transition 'trebolbgs6b'
    script.say beleth_puppet, '''Oh! That thing!'''
    script.say biff_puppet, '''What thing? The tree?'''
    script.say biff_puppet, '''...'''
    script.say biff_puppet, '''That's not a tree, huh?'''
    script.say median, '''We have found it. We've found it!'''
    script.transition 'trebolbgs6c'
    script.say median, '''I must get a sample! Biff, Beleth!'''
    script.say biff_puppet, '''Yes sir!'''
    script.say beleth_puppet, '''Yeah?'''
    script.say median, '''I want each of you to send up a dozen puppets to set up a perimeter, say, two hundred feet in diameter from this spot.'''
    script.say median, '''Leave Toothy here, Biff. Right next to the tree.'''
    script.say median, '''Beleth, leave your puppet there as well. Neither of you are to move them.'''
    script.say median, '''It is important that when your puppets get here, they do not approach this area. I can guarantee that Toothy and Beleth's puppet are already infected.'''
    script.say biff_puppet, '''Oh, jeez.'''
    script.say beleth_puppet, '''Again?!'''
    script.say median, '''Yes. So unless you want to lose more puppets, keep them away from this area. Understood?'''
    script.say biff_puppet, '''Yeah.'''
    script.say beleth_puppet, '''Got it.'''
    script.transition 'trebolbgs6d'
    script.say median, '''I'll be taking some bark back to Foxtrot with me.'''
    script.say median, '''...'''
    script.say median, '''It's burnt?'''
    script.say median, '''Strange.'''
    script.say median, '''Well, I'm off. It's only a matter of time, now.'''
    script.dim_out(true)


    script.transition 'trebolbgs6e'
    script.say narrator, '''One week later\nFoxtrot - Median's lab'''
    script.say median, '''Why does nothing work?'''
    script.say median, '''Never before has a cure eluded me for so long! How aggravating!'''
    script.say median, '''Aaaaugh!'''
    script.transition 'trebolbgs6f'
    script.say median, '''Calm down, Median.'''
    script.say median, '''Heart rate is above normal.'''
    script.say median, '''Blood pressure is above normal. Relax.'''
    script.say median, '''Relax.'''
    script.say median, '''Deep breaths.'''
    script.say median, '''...'''
    script.say median, '''Okay. Okay. I must be missing something. Think.'''
    script.say median, '''This is the source of the disease. All my tests have confirmed this.'''
    script.say median, '''Save for affecting wooden dolls, it acts in every way like a normal disease.'''
    script.say median, '''Biff's corpse puppets, as well. Hmm.'''
    script.transition 'trebolbgs6f2'
    script.say median, '''Ah. Ah!'''
    script.say median, '''It’s not Biff’s corpses.'''
    script.say median, '''It’s not Beleth’s puppets!'''
    script.say median, '''It makes sense. It's the only thing that makes sense.'''
    script.transition 'trebolbgs6g'
    script.emote median, 'median1', '''Conductor! Are you here?'''
    script.emote conductor, 'default', '''Waitin' on you, miss. Train's ready to go. Void Forest, yep?'''
    script.emote median, 'median3', '''You must be a mind reader. How long?'''
    script.say conductor, '''Can't say right now. Depends on the traffic, ya know? Could be two days, could be three.'''
    script.emote median, 'median1', '''We must leave at once!'''
    script.say conductor, '''Can do.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs6-2a'
    script.play 'conductor'
    script.say narrator, '''Two days later\nHellside Void – Conductor's train'''
    script.say median, '''What do you know of Undertakers?'''
    script.say conductor, '''I know they're some of the finest individuals I ever met. Do a world of good for everyone.'''
    script.say median, '''Not many would share your opinion. But I agree.'''
    script.say conductor, '''Nothing wrong with offerin' to make a fella's final days good ones. Can't think of any reason why I wouldn't take 'em up on their offer, if it ever came up for me.'''
    script.say median, '''Some are afraid that to accept their offer would be to admit inevitability, and to cast all hope aside.'''
    script.say conductor, '''Nothin' in this world's worth being afraid of.'''
    script.say median, '''Do you know how their offer works?'''
    script.transition 'trebolbgs6-2b'
    script.say conductor, '''They got a spell called Izagesia.'''
    script.say median, '''That's right. Are you familiar with how it works?'''
    script.say conductor, '''If I were to guess, I'd say it was a magical contract of some sort.'''
    script.say median, '''That's too good for a guess.'''
    script.say conductor, '''I like to read.'''
    script.say median, '''It's one of the only known articles of magic that Kadath and all its professors haven't been able to dispel. They classify it as a disease, or malady, which is why I know about it.'''
    script.say median, '''It's strong magic, and some of the strongest types of magic involve agreements between two or more parties.'''
    script.say median, '''Do you know what happens after Izagesia kills its target?'''
    script.say conductor, '''Feel free to refresh my memory, if you don't mind.'''
    script.transition 'trebolbgs6-2c'
    script.say median, '''In exchange for a month of peaceful days, the terminally ill individual decomposes and is used as fertilizer for the Undertakers.'''
    script.say median, '''It's theorized that this process also has something to do with producing new, additional Undertakers.'''
    script.say median, '''My question is: what would happen if an Undertaker was used as fertilizer?'''
    script.say conductor, '''I think you already know, miss.'''
    script.say median, '''Yes, I think I do.'''
    script.dim_out()


    script.transition 'trebolbgs6-2d'
    script.nomusic()
    script.say narrator, '''The next day\nVoid Forest'''
    script.emote median, 'median1', '''This is Void Forest?'''
    script.emote conductor, 'default', '''Nah. For that, you’ll want to head down this path a couple miles. That’ll get ya there.'''
    script.emote median, 'median2', '''Couple miles, huh? I thought your train could go anywhere.'''
    script.say conductor, '''Wouldn’t want to disturb the peace of the place. No sir. Couple miles away is as close as I’ll go.'''
    script.emote median, 'median1', '''All right, then.'''
    script.say conductor, '''I’ll be right here. Stay on the path ‘n you’ll be fine. Not much wanders through these parts, and what does stays away from the path.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs6a'
    script.play 'undertaker'
    script.say narrator, '''Void Forest\nExactly 2 Miles Later'''
    script.emote undertaker1, 'default', '''Halt! What business brings you to this place?'''
    script.emote undertaker2, 'default', '''Be you a friend of one of our guests? A relative of one of our guests?'''
    script.pose median, 'median1', -120
    script.emote median, 'median1', '''No. To both of those. I’m here because—'''
    script.say undertaker1, '''Then off with you! Our guests must not be disturbed.'''
    script.emote median, 'median1bark', '''It’s important. Look.'''
    script.say undertaker2, '''...!'''
    script.say undertaker1, '''You bring us terrible news, stranger. Why do you possess evidence of our kindred’s demise?'''
    script.say undertaker2, '''Are you the one responsible for it? Speak true, or you will not leave this place.'''
    script.emote median, 'median1', '''I am not the one who killed them. I only found their body in Hellside.'''
    script.say undertaker1, '''We are to believe that?'''
    script.say undertaker2, '''We do not venture into Hellside.'''
    script.emote median, 'median2', '''I didn’t come out all this way just to lie to you.'''
    script.say undertaker1, '''Where in Hellside do you claim to have found our kin?'''
    script.emote median, 'median1', '''Bluegrass region of Trebol.'''
    script.say undertaker2, '''I see.'''
    script.say median, '''The Blackjack Isles.'''
    script.pose median, 'median2'
    script.say undertaker1, '''We know of Trebol, and of Bluegrass.'''
    script.say undertaker1, '''Remain here, stranger.'''
    script.say median, '''It’s Median.'''
    script.pose median, 'median1'
    script.say undertaker1, '''We go to discuss your story with our kin.'''
    script.dim_out(true)
    script.exeunt undertaker1, undertaker2


    script.say narrator, '''Later\nVoid Forest'''
    script.pose undertaker1, 'default'
    script.pose undertaker2, 'default'
    script.say undertaker2, '''We have returned, stranger.'''
    script.emote median, 'median4', '''And?'''
    script.pose median, 'median1'
    script.say undertaker1, '''Your story is possible. Our kind went in search of a Topsider in Hellside some months ago and never returned.'''
    script.say undertaker2, '''We now have closure. Thank you.'''
    script.say undertaker1, '''But you did not travel to our forest simply for us. Speak your business.'''
    script.emote median, 'median4', '''I need your help ending something your kindred started. A disease.'''
    script.say undertaker2, '''A disease? Started by our kin? Nonsense.'''
    script.say median, '''<i>I told them about Trebol and the plague. I told them about the frustrating nature of the disease, and how I had made no progress in finding a cure for it. I told them about how their kin — an Undertaker — was contaminating the ground, becoming the source of the disease.</i>'''
    script.pose median, 'median2'
    script.say undertaker2, '''Your story, although unfortunate, is still nonsense.'''
    script.pose median, 'median1'
    script.say undertaker1, '''It is not our nature to carry or spread disease.'''
    script.say undertaker2, '''Were it otherwise, all of Owel would be ill.'''
    script.say median, '''Hellside’s a strange place.'''
    script.say undertaker1, '''It is.'''
    script.emote median, 'median4', '''Even if your kin isn’t the source of the disease, they still have something to do with it. I’m certain of that.'''
    script.pose median, 'median1'
    script.say undertaker2, '''Hmm...'''
    script.say undertaker1, '''I suppose one of us could accompany you back to our kin, as payment for granting us closure.'''
    script.say undertaker2, '''Very well. I shall inform the others.'''
    script.say undertaker1, '''I will accompany you to Hellside, stranger. Lead the way.'''
    script.dim_out()
    script.exeunt undertaker2


    script.transition 'trebolbgs6-2d'
    script.say narrator, '''Two miles in the opposite direction of the first two miles\nVoid Forest'''
    script.emote conductor, 'default', '''I see ya brought some company! We’re all ready to head on back.'''
    script.say conductor, '''Have a hard time?'''
    script.emote median, 'median3', '''No, actually. It went much smoother than I was expecting.'''
    script.pose median, 'median1'
    script.say undertaker1, '''We fulfill our responsibility without complaint.'''
    script.say conductor, '''Well, there’s no rule written anywhere that says things gotta be difficult. At least, no rule that I’ve ever seen.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs6-2e'
    script.play 'conductor'
    script.say narrator, '''The Void - Hellside'''
    script.emote undertaker1, 'default', '''...'''
    script.say undertaker1, '''Stranger.'''
    script.emote median, 'median1', '''Yes?'''
    script.say undertaker1, '''May I see the remnants of my kin?'''
    script.say median, '''As long as you don’t take it out of the bag.'''
    script.emote conductor, 'default', '''Ah, don’t worry about me. I’ll be fine.'''
    script.exeunt conductor
    script.emote median, 'median1bark', '''There you go, then.'''
    script.say undertaker1, '''How did our kin perish? Do you know?'''
    script.emote median, 'median4', '''I don’t. Most of their body was charred, though. That piece was one of the only unburnt sections I could find.'''
    script.say undertaker1, '''Ah.'''
    script.emote median, 'median1', '''Can fire kill an Undertaker?'''
    script.say undertaker1, '''With ease. We are wood. Other things as well, but mostly wood.'''
    script.say undertaker1, '''However...'''
    script.say median, '''Yes?'''
    script.say undertaker1, '''Does fire not eradicate sickness?'''
    script.say median, '''As far as I know, yes, it does. Every time.'''
    script.say undertaker1, '''I still do not believe our kin is the cause of your disease, but if they are, and if it is possible to help, I will.'''
    script.say median, '''That’s all I’m asking for.'''
    script.dim_out()
    script.exeunt_all()


    script.transition 'trebolbgs6b'
    script.play 'undertakerfailed'
    script.say narrator, '''Later\nSection 28'''
    script.emote median, 'median1', '''We’re here. Save for the bark I took, their body hasn’t been touched. The perimeter guards saw to that.'''
    script.emote undertaker1, 'default', '''There are two bodies here, stranger. Not one.'''
    script.emote median, 'median5', '''What?!'''
    script.say undertaker1, '''Our kin met their end while carrying the guest they sought.'''
    script.say undertaker1, '''Words alone cannot adequately express our sorrow, guest. We have failed you.'''
    script.say undertaker1, '''Forgive us.'''
    script.say undertaker1, '''Please do not think this is commonplace for us, stranger. An event such as this is nearly unheard of.'''
    script.emote median, 'median4', '''I won’t.'''
    script.emote median, 'median1', '''Can you remove the, uh, guest from your kin? I need to see them.'''
    script.say undertaker1, '''There is no time to mourn?'''
    script.say median, '''Not right now. Later.'''
    script.exeunt_all()
    script.transition 'trebolbgs6-2f'
    script.say undertaker1, '''No rest, even in death. Bear with it, guest.'''
    script.transition 'trebolbgs6-2g'
    script.say undertaker1, '''Where shall I place them?'''
    script.say median, '''Stop!'''
    script.say undertaker1, '''Is this not what you want?'''
    script.transition 'trebolbgs6-2h'
    script.say median, '''Drop it.'''
    script.say undertaker1, '''Surely you jest? We cannot treat guests—'''
    script.say median, '''Drop it now!'''
    script.transition 'trebolbgs6-3'
    script.say narrator, '''<i>thud</i>'''
    script.transition 'trebolbgs6-3a'
    script.say undertaker1, '''...!'''
    script.say undertaker1, '''They are... they are still alive?'''
    script.dim_out()
    script.exeunt_all()
    script.notext()
    script.nomusic()
    script.nobackdrop()

    script.roll_credits()


cutscene.Script.build "prompt2-itchyitchy-part4", "preview.png", "Itchy Itchy: Part 4", (script) ->
    script.add_view 'splash', 'itchyitchypart4.png'
    script.add_view 'trebolbgs7-2a', 'trebolbgs7-2a.png'
    script.add_view 'trebolbgs7-2b', 'trebolbgs7-2b.png'
    script.add_view 'trebolbgs7-2c', 'trebolbgs7-2c.png'
    script.add_view 'trebolbgs7-2d', 'trebolbgs7-2d.png'
    script.add_view 'trebolbgs7-2e', 'trebolbgs7-2e.png'
    script.add_view 'trebolbgs7-2f', 'trebolbgs7-2f.png'
    script.add_view 'trebolbgs7-2g', 'trebolbgs7-2g.png'
    script.add_view 'trebolbgs7-2h', 'trebolbgs7-2h.png'
    script.add_view 'trebolbgs7-2i', 'trebolbgs7-2i.png'
    script.add_view 'trebolbgs7a-10', 'trebolbgs7a-10.png'
    script.add_view 'trebolbgs7a-1', 'trebolbgs7a-1.png'
    script.add_view 'trebolbgs7a-2', 'trebolbgs7a-2.png'
    script.add_view 'trebolbgs7a-3', 'trebolbgs7a-3.png'
    script.add_view 'trebolbgs7a-4', 'trebolbgs7a-4.png'
    script.add_view 'trebolbgs7a-5', 'trebolbgs7a-5.png'
    script.add_view 'trebolbgs7a-6', 'trebolbgs7a-6.png'
    script.add_view 'trebolbgs7a-7', 'trebolbgs7a-7.png'
    script.add_view 'trebolbgs7a-8', 'trebolbgs7a-8.png'
    script.add_view 'trebolbgs7a-9', 'trebolbgs7a-9.png'
    script.add_view 'trebolbgs7a', 'trebolbgs7a.png'
    script.add_view 'trebolbgs7b', 'trebolbgs7b.png'
    script.add_view 'trebolbgs7c', 'trebolbgs7c.png'
    script.add_view 'trebolbgs7d', 'trebolbgs7d.png'
    script.add_view 'trebolbgs7e', 'trebolbgs7e.png'
    script.add_view 'trebolbgs7f', 'trebolbgs7f.png'
    script.add_view 'trebolbgs7g', 'trebolbgs7g.png'
    script.add_view 'trebolbgs7h', 'trebolbgs7h.png'
    script.add_view 'trebolbgs7i', 'trebolbgs7i.png'
    script.add_view 'trebolbgs7j', 'trebolbgs7j.png'
    script.add_view 'trebolbgs7k', 'trebolbgs7k.png'
    script.add_view 'trebolbgs8a-2', 'trebolbgs8a-2.png'
    script.add_view 'trebolbgs8a', 'trebolbgs8a.png'
    script.add_view 'trebolbgs8b', 'trebolbgs8b.png'
    script.add_view 'trebolbgs8c', 'trebolbgs8c.png'
    script.add_view 'trebolbgs8d', 'trebolbgs8d.png'
    script.add_view 'trebolbgs8e', 'trebolbgs8e.png'
    script.add_view 'trebolbgs8f', 'trebolbgs8f.png'
    script.add_view 'trebolbgs8g', 'trebolbgs8g.png'
    script.add_view 'trebolbgs8h', 'trebolbgs8h.png'
    script.add_view 'trebolbgs8i', 'trebolbgs8i.png'

    script.add_song 'staticinfection', 'staticinfectionsong_2a.oga'

    angelgrowth = script.add_component new cutscene.ImageSpot 'cutscene--animation'
    angelgrowth.add_animation 'default', [
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-1.png', delay: 350 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-2.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-3.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-4.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-5.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-6.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-7.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-8.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-9.png', delay: 100 },
        { url: 'res/prompt2-itchyitchy-part4/trebolbgs7a-10.png', delay: 0 },
    ]

    static12 = script.add_component new cutscene.ImageSpot 'cutscene--animation'
    static12.add_animation 'default', [
        { url: 'res/prompt2-itchyitchy-part4/static.png', delay: 200 },
        { url: 'res/prompt2-itchyitchy-part4/static2.png', delay: 200 },
    ]

    static34 = script.add_component new cutscene.ImageSpot 'cutscene--animation'
    static34.add_animation 'default', [
        { url: 'res/prompt2-itchyitchy-part4/static3.png', delay: 200 },
        { url: 'res/prompt2-itchyitchy-part4/static4.png', delay: 200 },
    ]

    angel = script.new_character
        name: 'angel'
        position: 'angel'
        color: 'white'

    beleth = script.new_character
        name: 'Beleth'
        position: 'right'
        color: '#d22e8c'

    beleth_puppet = script.new_character
        name: "Beleth('s puppet)"
        position: 'right'
        color: '#b20a56'

    biff = script.new_character
        name: 'Biff'
        position: 'left'
        mutex: 'left'
        color: '#466e82'

    biff_puppet = script.new_character
        name: "Biff('s puppet)"
        position: 'left'
        color: '#243842'

    loppy = script.new_character
        name: 'Loppy'
        position: 'left'
        color: '#020133'

    median = script.new_character
        name: 'Median'
        position: 'left'
        mutex: 'left'
        color: '#84095d'

    undertaker1 = script.new_character
        name: "?"
        position: 'left'
        color: '#6b6872'

    narrator = null

    # TODO ok this direly DIRELY needs to be standardized orrrr something.  it's mostly copy and paste
    script.add_credits '''
        <div class="cutscene--credits-row">
            <div class="-for">Art, Music</div>
            <div class="-who">PK</div>
            <div class="-deviantart"><a href="http://purplekecleon.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://purplekecleon.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/papayakitty"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Script</div>
            <div class="-who">Marl</div>
            <div class="-deviantart"><a href="http://marlcabinet.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://avolontes.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"></div>
        </div>

        <div class="cutscene--credits-row">
            <div class="-for">Putting it together</div>
            <div class="-who"><a href="http://eev.ee/">Eevee</a></div>
            <div class="-deviantart"><a href="http://lexyeevee.deviantart.com/"><img src="img/deviantart.png" alt="deviantArt"></a></div>
            <div class="-tumblr"><a href="http://lexyeevee.tumblr.com/"><img src="img/tumblr.png" alt="Tumblr"></a></div>
            <div class="-twitter"><a href="https://twitter.com/eevee"><img src="img/twitter.png" alt="Twitter"></a></div>
        </div>

        <p><a href="http://floraverse.com/">Floraverse</a></p>
        <p><a href="https://floraverse.bandcamp.com/album/itchy-itchy"><img src="res/prompt2-itchyitchy-part2/album.png" alt="album cover depicting andre"><br>Soundtrack on Bandcamp</a></p>

        <p>to be continued...?</p>
    '''


    script.notext()
    script.transition 'splash'
    script.pause()

    script.play 'staticinfection'
    script.transition 'trebolbgs7a'

    script.partial_steps.push component: angelgrowth, event: 'cutscene:change', xxx_event_args: -> ['default']
    script.pause()
    script.partial_steps.push component: angelgrowth, event: 'cutscene:disable', xxx_event_args: -> []

    script.transition 'trebolbgs7b'
    script.say median, '''What...'''
    script.transition 'trebolbgs7c'
    script.say undertaker1, '''I don’t...'''
    script.transition 'trebolbgs7d'
    script.say median, '''There’s nothing we can do.'''
    script.transition 'trebolbgs7e'
    script.say undertaker1, '''Was there ever anything?'''
    script.transition 'trebolbgs7f'
    script.say median, '''...'''
    script.say median, '''No.'''

    script.partial_steps.push component: static12, event: 'cutscene:change', xxx_event_args: -> ['default']

    script.transition 'trebolbgs7g'
    script.say undertaker1, '''There’s nothing left to do, then.'''
    script.transition 'trebolbgs7h'
    script.say median, '''That’s what I thought.'''
    script.transition 'trebolbgs7i'
    script.say undertaker1, '''...'''
    script.say median, '''...'''

    script.partial_steps.push component: static12, event: 'cutscene:disable', xxx_event_args: -> []

    script.transition 'trebolbgs7j'
    script.say beleth_puppet, '''Oh, shit!'''
    script.say beleth_puppet, '''Biff!'''
    script.say biff_puppet, '''Huh?'''
    script.transition 'trebolbgs7k'
    script.say biff_puppet, '''Oh, what? Here!?'''
    script.say beleth_puppet, '''Get Median and the Undertaker! Now!'''
    script.say biff_puppet, '''Shit. Shit!'''
    script.transition 'trebolbgs7-2a'
    script.say biff_puppet, '''I can’t!'''
    script.say beleth_puppet, '''What!?'''
    script.say biff_puppet, '''I can’t get close enough!'''
    script.say beleth_puppet, '''What—'''
    script.transition 'trebolbgs7-2b'
    script.say beleth_puppet, '''...'''
    script.say beleth_puppet, '''I can’t use Dr. Nurse or Cat n Fox.'''
    script.transition 'trebolbgs7-2c'
    script.say biff_puppet, '''The hell you can’t! Do it now!'''
    script.say biff_puppet, '''I can’t get near it!'''

    script.partial_steps.push component: static12, event: 'cutscene:change', xxx_event_args: -> ['default']

    script.transition 'trebolbgs7-2d'
    script.say beleth_puppet, '''They won’t be able to do anything.'''
    script.say beleth_puppet, '''Wrong type.'''
    script.say beleth_puppet, '''Haha.'''
    script.say beleth_puppet, '''My puppets are useless.'''
    script.say beleth_puppet, '''It was kinda stupid, wasn't it?'''
    script.say beleth_puppet, '''Thinking I'd be able to help.'''
    script.say beleth_puppet, '''Haha.'''

    script.partial_steps.push component: static12, event: 'cutscene:disable', xxx_event_args: -> []

    script.transition 'trebolbgs7-2e'
    script.say biff_puppet, '''What the hell are you talking about!?'''
    script.say biff_puppet, '''Get in there! NOW!'''

    script.partial_steps.push component: static12, event: 'cutscene:change', xxx_event_args: -> ['default']

    script.transition 'trebolbgs7-2f'
    script.say beleth_puppet, '''...'''
    script.say beleth_puppet, '''No.'''
    script.say beleth_puppet, '''I don’t think I will.'''
    script.say beleth_puppet, '''It wouldn’t do anything, you know?'''
    script.say beleth_puppet, '''...'''
    script.say beleth_puppet, '''It hurts.'''
    script.say biff_puppet, '''Beleth?'''
    script.say biff_puppet, '''BELETH!?'''
    script.say biff_puppet, '''Shit!'''
    script.transition 'trebolbgs7-2h'
    script.say narrator, '''...'''
    script.dim_out(true)
    script.partial_steps.push component: static12, event: 'cutscene:disable', xxx_event_args: -> []


    script.transition 'trebolbgs7-2i'
    script.say narrator, '''Biff’s command center'''
    script.say biff, '''Oh, no.'''
    script.say biff, '''No, no! No!'''
    script.say biff, '''Loppy! Loppy! Get over here!'''
    script.say biff, '''NOW!'''
    script.transition 'trebolbgs8a'
    script.say biff, '''Holy shit, holy shit.'''
    script.say biff, '''Where is it!?'''
    script.transition 'trebolbgs8a-2'
    script.say biff, '''No! No no no!'''
    script.say biff, '''The book! Where is it!?'''
    script.transition 'trebolbgs8b'
    script.say biff, '''WHERE IS IT!?'''

    script.partial_steps.push component: static12, event: 'cutscene:change', xxx_event_args: -> ['default']

    script.transition 'trebolbgs8c'
    script.say loppy, '''Here and ready, master.'''
    script.say biff, '''God damnit.'''
    script.say biff, '''God damnit!'''
    script.say biff, '''I didn’t bring it.'''
    script.say biff, '''I didn’t bring it!'''
    script.dim_out(true)


    script.transition 'trebolbgs8d'
    script.say narrator, '''Section 28 - Median'''
    script.say median, '''There really was nothing, was there?'''
    script.say median, '''Guess not.'''
    script.say median, '''I see that, now. '''
    script.say median, '''Nothing awaits.'''
    script.say median, '''Haha.'''
    script.say median, '''...'''
    script.say median, '''It hurts.'''
    script.say median, '''It...'''
    script.say median, '''it hurts...'''
    script.say median, '''...'''
    script.say median, '''....'''
    script.say median, '''.....'''
    script.dim_out(true)


    script.transition 'trebolbgs8e'
    script.say narrator, '''Section 28 - Undertaker'''
    script.say undertaker1, '''I came from nothing, and I return to nothing.'''
    script.say undertaker1, '''...'''
    script.say undertaker1, '''No.'''
    script.say undertaker1, '''I will not return.'''
    script.say undertaker1, '''I will become nothing.'''
    script.say undertaker1, '''...'''
    script.say undertaker1, '''I cease.'''
    script.say undertaker1, '''...'''
    script.say undertaker1, '''....'''
    script.say undertaker1, '''.....'''
    script.dim_out(true)


    script.partial_steps.push component: static12, event: 'cutscene:disable', xxx_event_args: -> []
    script.partial_steps.push component: static34, event: 'cutscene:change', xxx_event_args: -> ['default']
    script.transition 'trebolbgs8f'
    script.say narrator, '''Section 28 - Angel'''
    script.say angel, """.\f\f.\f\f."""
    script.dim_out(true)


    script.partial_steps.push component: static34, event: 'cutscene:disable', xxx_event_args: -> []
    script.partial_steps.push component: static12, event: 'cutscene:change', xxx_event_args: -> ['default']
    script.transition 'trebolbgs8g'
    script.say narrator, '''Biff’s command center'''
    script.say biff, '''NO!'''
    script.say biff, '''Median!'''
    script.say biff, '''No!'''
    script.say biff, '''No...'''
    script.dim_out(true)


    script.partial_steps.push component: static12, event: 'cutscene:disable', xxx_event_args: -> []
    script.partial_steps.push component: static34, event: 'cutscene:change', xxx_event_args: -> ['default']
    script.transition 'trebolbgs8h'
    script.say narrator, '''Beleth’s broom closet'''
    script.say beleth, '''...'''
    script.say beleth, '''I...'''
    script.say beleth, '''...'''
    script.say beleth, '''I...'''
    script.say beleth, '''...'''

    script.transition 'trebolbgs8i'  # XXX + static 3 and 4 looping]
    script.say narrator, '''<i>thump</i>'''

    script.nobackdrop()
    script.nomusic()
    script.notext()
    script.pause()

    script.partial_steps.push component: static34, event: 'cutscene:disable', xxx_event_args: -> []
    script.roll_credits()
