# TODO porting old ones forward also STUFF I BROKE
# - up/down to move selection in menus doesn't work
# - right arrow works on a menu (broke "next: null"?)
# - jukebox errors are quietly discarded (and don't change the splash text), not even logged to console (try a bogus track name)
# - pausing while looking at a partly-scrolled speech does not end well
# - holding down right arrow sometimes attributes lines to the wrong speaker
# - holding down right arrow can make text overflow the box
# - holding down right arrow is still slow while the speaker tag changes
#   (curiously, it's much faster when between TAL panels)
# - basically fast scrolling is a huge pain
# - can't skip through "delay" for some reason
#
# - people are seeing black background flicker near the end of TTA2; possibly browser evicting too many images?  can we wait on transitionend and only hide the old image afterwards?  hard to test!

# - some of the revealeon stuff is a fucking disaster
# - not really happy with the way the textbox transitions back and forth in species-bugs
# - component ids are terrible and don't tell me what kind of thing an imagespot is or even which cutscene a thing came from
# - species-bugs would be a lot better if i could wait on an animation.  actually that goes for the one at the beginning of itchy itchy part 4, too.
# - i changed the htmlblock z-index and have no fucking idea if that will break anything really
# - i would actually want to use flexbox to position the text + images but the only option is absolute everything; no real layers
# - problems in loading sometimes don't actually show 'kaboom'?
# - tablet doesn't disappear at the end of revealeons

# TODO some thoughts on the problems with this json script format
# - really tedious to edit by hand, and really repetitive
# - hard to read as a result, too
# - lot of copy-pasting of metadata: credits are mostly the same every time, character colors and font effects ought to be shared css or something

# TODO easy, important, later
# - need a fix for the chrome mobile audio loading thing
# - direly need a table of contents
#   - PROBLEM: going "backwards" works by remembering how you got there...  how does that work if you jump arbitrarily??
# - mute, too (possibly solved by pause)
# - can't jump back to the scene list if that's where you landed
# - need to port all the old cutscenes to the new format
# - stage:next and stage:prev work through the pause screen, ooops
#
# - hashchange event
# - show a better loading screen that includes the title of the thing being loaded  8D
# - loading screen feels like it should be different depending on whether you are loading the main menu or a particular script
# - if it fails to load, try to load again but cachebusted (including css, js...  hmm that sounds tricky)

# - it might be much more convenient to have an Actor class that combines both a component and its current live element; would give somewhere to put state instead of in jquery data!

# TODO embedding
# - how much html do i expect people to copy/paste?  should be //minimal//
# - how do they specify which scripts to load?  i feel it should be something declarative

# TODO alright so the rules for the introductory splash screen are as follows
# - it should be embedded in the html so you get it even if you don't have js support
# - it should have a few sections toggleable via css ("requires javascript", "warning: sound")
# - when/where it appears should vary:
#   - if you land DIRECTLY ON A SCENE then it should show with a play button before the thing starts and the music plays (i don't think this should count as a step though?)
#   - if you land on the main page itself then it should show before the index?


# TODO in rough order
# - if you hold down ->, you fuck up the text before the credits: somehow the disable transitions overlap and the stage thinks it's busy forever.  not sure how to fix since this is a sort of general transition problem  :|
# - mute button
# - carat for scrolling text
# - can't advance with click if there's no speech box lol
# - hmmm JUMP_WHEN_COMPLETE doesn't let you go backwards.  maybe it should only fire once?  or reset after it fires once?  or appear as a regular item after it fires once?
# - hosting this on...  somewhere?  probably separate from floraverse for now with a placeholder  :/
# - haha this error screen sucks
# - fast-forward key (or detect holding down ->) that automatically skips through partial-advancement like filling the speechbox?
# - make the scroll smarter: account for lag, be slightly faster than one char per frame
# - speaker fonts?
# - TINY glitch: backdrop seems to fade back in if you try to skip the dim_out before a nothing
# - XXX ABSOLUTELY NEED: FALLBACK FOR UNSUPPORTED BROWSERS WITH JUST THE MENUS AND/OR SCRIPT.
#      - omg is it possible to describe the script entirely in html  o_o  it's declarative, right...?
# - i ran into a weird case where firefox loaded part of an image and sent a Range request for the rest, got back a 206, and...  did nothing with it.  considered it a failure, even.

# TODO future niceties
# - fragment to jump around
# - jumplist of places you've been before (persistent)
# - volume control (persistent)
# - replace all the js with declarative html that looks ok displayed?  is this feasible even
# - convenience merge "pose" with "say"?
# - minify this and the js while you're at it?
# - ...ditch jquery?
# - would be pretty slick if you could say characters A and B can never appear on-screen at the same time, and the exeunting would be handled automatically
# - automatically pause the music if the window loses focus, or the tab loses focus, using visibility api?  unless you're using the jukebox.  also, have a jukebox
#     - could put a little play icon in the title too, though that doesn't work for iframes.  also the title should probably include the title of the current thing being played

# TODO tech stuff
# - need error checking for menu labels!
# - more error checking of arguments
# - break this into :filez:
# - 'offset' is a hack, not relative to the position at all
# - 'back' is also a hack, maybe z-index should be a real thing here, idk
# - backdrop should stop being a special case
#   - the returned components should be little builder wrappers that have their own methods, instead of using script.everything
# - i think narrator should be a real thing honestly
#   - also maybe there should be real css rules for characters
# - switching between left/right for the labels is a little flickery

# ==============================================================================
# LIBRARY STUFF

# ------------------------------------------------------------------------------
# Cross-browser amenities

requestAnimationFrame =
    window.requestAnimationFrame || window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame || window.msRequestAnimationFrame
cancelAnimationFrame = window.cancelAnimationFrame || window.mozCancelAnimationFrame || window.webkitCancelAnimationFrame


window.console ?= {}
window.console.log ?= ->
window.console.error ?= ->

# ------------------------------------------------------------------------------
# Tiny DOM helpers

create_element = (tag, attrs={}) ->
    el = document.createElement tag
    for key, value of attrs
        el.setAttribute key, value
    return el


# ------------------------------------------------------------------------------
# Promise/event helpers

promise_always = ->
    ###
    Return a Deferred that's already been resolved.  Mainly useful for cases
    where you want to defer an action until after a first step has been
    completed, but the first step is optional.

    The Deferred's value will be null.
    ###
    return $.when null


promise_event = ($element, event, failure_event=null) ->
    ###
    Return a Deferred that will resolve when the named event (or
    space-separated list of event names) fires.

    Optionally, the Deferred will be rejected when the named failure event
    fires.

    Either way, the Deferred's value will be the fired event.
    ###
    namespace = ".cutscene-promise-event-#{Math.random()}"
    _namespace_event = (name) ->
        return [part + namespace for part in name.split ' '].join ' '

    event = _namespace_event event
    promise = $.Deferred()
    $element.one event, (ev) ->
        promise.resolve ev

    # Same thing for the failure event
    if failure_event?
        failure_event = _namespace_event failure_event
        $element.one failure_event, (ev) ->
            promise.reject ev

    # Make sure to always unbind as soon as /either event/ fires
    promise.always ->
        $element.off namespace

    return promise


promise_transition = ($el) ->
    $el = $ $el

    props = window.getComputedStyle($el[0])
    # TODO this is nice, but also doesn't check that anything is actually
    # transitioning at the moment
    if props.transitionProperty != 'none' and props.transitionDuration != '0s'
        return promise_event $el, 'transitionend'
    else
        return promise_always()


promise_wait = (time) ->
    ###
    Return a Deferred that will resolve after the specified amount of time has
    passed (in SECONDS, like Python, what do you think this is).
    ###
    promise = $.Deferred()
    window.setTimeout (-> promise.resolve null), time * 1000
    return promise


refire = ($target, source, event_types...) ->
    for event_type in event_types
        source.on event_type, (event, args...) ->
            $target.triggerHandler event.type, args...


normalize_color = (color) ->
    # Stupid hack to add the alpha to the background color, regardless
    # of how the color is formatted
    d = document.createElement 'div'
    document.body.appendChild d
    d.style.backgroundColor = color
    rgb_color = window.getComputedStyle(d).backgroundColor
    document.body.removeChild d
    return rgb_color


# ==============================================================================
# CUTSCENE IMPLEMENTATION

NS = '.cutscene'

CAN_PLAY_AUDIO = do ->
    dummy_audio = document.createElement 'audio'
    return dummy_audio.canPlayType and dummy_audio.canPlayType 'audio/ogg; codecs="vorbis"'


class Widget
    constructor: (@$parent, @$container) ->
        if @$parent instanceof Widget
            @$parent = @$parent.$container
        if not @$container?
            @$container = @_create_container()
            @$parent.append @$container

    _create_container: ->
        throw new Error "No container passed to #{@.name} and don't know how to make one"

    on: (args...) ->
        return @$container.on args...

    triggerHandler: (args...) ->
        return @$container.triggerHandler args...


class SplashScreen extends Widget
    constructor: ($parent, $container) ->
        super $parent, $container

        @set_ready()

        if CAN_PLAY_AUDIO
            @$container.addClass '-state-audio-on'
        else
            @$container.addClass '-state-audio-off'

        @$parent.on 'stage:next', (event) =>
            # When we're passed a "next frame" event, it really means dismiss
            # us, if we're dismissable
            if not @$container.hasClass '-state-ready'
                return
            if not @$container.hasClass '-active'
                return

            @$container.removeClass '-active'

    set_loading: ->
        @$container.removeClass '-state-ready'
        @$container.removeClass '-state-failed'
        @$container.addClass '-state-loading'
        @$container.addClass '-active'

    set_failed: ->
        # TODO pretty sure we can do better than this, at least say it was a loading error
        # TODO and allow trying again or going back or something
        @$container.removeClass '-state-loading'
        @$container.removeClass '-state-ready'
        @$container.addClass '-state-failed'
        @$container.addClass '-active'

    set_ready: ->
        @$container.removeClass '-state-loading'
        @$container.removeClass '-state-failed'
        @$container.addClass '-state-ready'
        @$container.addClass '-active'


class ScriptMenu extends Widget
    constructor: ($parent, $container) ->
        super $parent, $container
        @items = []

    _create_container: ->
        return $ '<ol>', class: 'cutscene-list'

    # TODO i feel increasingly strongly that these should go in /reverse/
    # order, so most recent is at the top.  but that raises the question: is
    # ordering really a property of the order these things happen to be
    # defined?  or is it based on e.g. the publication date metadata that
    # doesn't exist yet oops?
    add_item: (item) ->
        @items.push item
        @$container.append item.$container


class ScriptMenuItem extends Widget
    constructor: ($parent, $container) ->
        super $parent, $container

    _create_container: ->
        return $ '<li>', text: '...loading...'

    bind_script: (script) ->
        @$container.text ''
        @$container.append $ '<img>', src: "res/#{script.name}/#{script.preview_img}"
        if script.date
            @$container.append $ '<time>', datetime: script.date.toISOString(), text: script.date.toDateString()
        @$container.append $('<h2>').text script.title or script.name
        if script.subtitle
            @$container.append $('<h3>').text script.subtitle
        @$container.data 'script-name', script.name

    # TODO once again we have three states...
    set_failed: ->
        @$container.text 'failed!'


class ScriptPause extends Widget
    constructor: ($parent, $container) ->
        super $parent, $container

    _create_container: ->
        el = document.createElement 'div'
        el.classList.add 'cutscene--pause'
        return $ el


class ScriptPauseMenu extends Widget
    constructor: ($parent, $container) ->
        super $parent, $container

        # Need this to bubble, so it fires before the event on the main
        # container
        # TODO actually i'm not sure that's true, this is the target so should
        # receive it first?
        @$container[0].addEventListener 'click', (event) =>
            event.stopImmediatePropagation()
            event.preventDefault()
            @$container.triggerHandler @pause_event()
        , true

        @$parent.on 'action:pause', =>
            @$container.find('.cutscene--pause-menu').addClass '-active'

        @$parent.on 'action:unpause', =>
            @$container.find('.cutscene--pause-menu').removeClass '-active'

    _create_container: ->
        el = document.createElement 'div'
        el.classList.add 'cutscene--pause'

        button = document.createElement 'div'
        button.classList.add 'cutscene--pause-button'
        button.textContent = '⚙'
        el.appendChild button

        menu = document.createElement 'div'
        menu.classList.add 'cutscene--pause-menu'
        menu.textContent = 'P A U S E'
        el.appendChild menu

        return $ el

    is_paused: ->
        return @$container.find('.cutscene--pause-menu').hasClass '-active'

    pause_event: ->
        if @is_paused()
            return 'action:unpause'
        else
            return 'action:pause'


class Brain
    constructor: (@$container) ->
        @current_stage = null
        # TODO this seems pretty weird to put here, when loaded scripts live on
        # Script
        @loading_scripts = {}

    init: ->
        # First things first, look for the scripts we're supposed to be
        # loading, so we can get an early start on that
        # TODO would be peachy keen if this could modify the items in-place
        # rather than nuking and starting over
        $xxx_menu = @$container.find '.cutscene-list'
        if $xxx_menu.length
            $links = $xxx_menu.find 'li a'
            # TODO yeah this bit, don't do this
            $xxx_menu.html ''
            @script_menu = @_build_menu $xxx_menu
            for link in $links
                @register_json link.getAttribute 'href'
        else
            @script_menu = @_build_menu()
        @$container.append @script_menu.$container

        @splash = new SplashScreen @$container, @$container.find '.cutscene-splash'

        @pause = new ScriptPauseMenu @$container
        # TODO this is kinda fugly
        @pause.$container.hide()

        refire @$container, @pause, 'action:pause', 'action:unpause'

        # Bind event handlers
        @$container.on 'click' + NS, (event) =>
            # Don't do anything if a modifier key is held down, so people can
            # select text if they wish
            if event.ctrlKey or event.shiftKey or event.altKey or event.metaKey
                return
            # Don't fuck up clicks on links dang
            if event.target.tagName == 'A'
                # Also allow regular link clicks to break out of the iframe
                event.target.setAttribute('target', '_top')
                return
            event.preventDefault()
            @$container.triggerHandler 'stage:next'

        # This is incredibly stupid, but: Chrome selects a whole lot of the
        # stage on double-click, but the event that actually does it is the
        # second mousedown.  We don't want to eliminate ALL mousedown, though,
        # because that's what gives focus to our iframe!  So we want to ignore
        # any mousedown that happens within an arbitrary short timespan after
        # the previous mousedown.  JAVASCRIPT
        last_mousedown = 0
        @$container.on 'mousedown' + NS, (event) ->
            now = Date.now()
            # When I say arbitrary, I mean arbitrary -- double-click time is
            # entirely customizable and depends on the OS
            if now - last_mousedown < 500
                event.preventDefault()
            last_mousedown = now

        # These ones, alas, have to be global
        $(document.body).on 'keydown', @_on_keydown
        window.addEventListener "hashchange", (ev) -> console.log ev.oldURL, ev.newURL

    start: ->
        if location.hash != ""
            @run location.hash.substring(1)
        else
            @show_menu()

    register_json: (url) ->
        if url of @loading_scripts
            return
        menu_item = new ScriptMenuItem @script_menu
        @script_menu.add_item menu_item

        @loading_scripts[url] = $.get url
        .then (data) =>
            # TODO this kludge is required for jquery's promises only
            try
                delete @loading_scripts[url]
                script = script_from_json url, data
                menu_item.bind_script script
            catch e
                deferred = $.Deferred()
                deferred.reject(null, null, e)
                return deferred
        .fail (xhr, reason_text, reason) ->
            console.error "Failed to load #{url}:", reason
            menu_item.set_failed()

    _on_keydown: (event) =>
        if event.altKey or event.ctrlKey or event.metaKey or event.shiftKey
            return

        key = event.keyCode or event.charCode

        fire = null

        if key == 13  # enter
            fire = 'menu:accept'

        else if key == 19 or key == 80  # pause; p
            fire = @pause.pause_event()

        else if key == 32  # space
            fire = 'stage:next'

        else if key == 38  # up
            fire = 'menu:prev'

        else if key == 40  # down
            fire = 'menu:next'

        else if key == 39  # right
            fire = 'stage:next'

        else if key == 37  # left
            fire = 'stage:prev'

        if not fire?
            return

        @$container.triggerHandler fire

        # TODO this means up/down arrow will never work naturally, even without
        # a menu around...
        event.preventDefault()

    _build_menu: ->
        # TODO genericize the 'menu' stuff to work for arbitrary menus of
        # links, i.e., here as well
        script_menu = new ScriptMenu @$container
        # TODO this seems maybe invasive, but clearly we have to get from the
        # <li> to the brain /somehow/ -- have kind of a general problem here of
        # who is responsible for passing events from child to parent?
        script_menu.on 'click', 'li', (event) =>
            script_name = $(event.currentTarget).data 'script-name'
            if not script_name
                return
            @run script_name

            @script_menu.$container.css 'display', 'none'

        for name, script of Script.by_name
            item = new ScriptMenuItem script_menu
            item.bind_script script
            script_menu.add_item item
        return script_menu

    show_menu: ->
        # TODO this should probably use state css classes
        @script_menu.$container.css 'display', ''

    run: (script_name) ->
        promises = []
        if @current_stage?
            promises.push @current_stage.stop()

        # TODO when i switch to standard promises, this fork behavior is gonna
        # change, i think?
        script_promise = $.Deferred()
        script_promise.done (script) ->
            # TODO this hardcodes the original title, but, :effort:
            document.title = "#{script.title} - Floraverse cutscenes"
        promises.push script_promise
        # TODO lmao this is the worst but i can't think of how to improve it
        handler = =>
            if script_name of Script.by_name
                script_promise.resolve Script.by_name[script_name]
            else if not Object.keys(@loading_scripts).length
                script_promise.reject(new Error "no such script #{script_name}")
        for url, load_promise of @loading_scripts
            load_promise.always handler
        handler()

        @splash.set_loading()
        # TODO this is kinda fugly
        # TODO pause should only show after loading is dismissed imo...
        @pause.$container.show()

        # TODO not thrilled about this, maybe the states should go on the
        # entire container
        @script_menu.$container.css 'display', 'none'

        $.when(promises...).then (script) =>
            # TODO it would be nice to skip the transition here if we're
            # landing on a fragment (i.e., skipping the menu) but how do we
            # detect that?
            @$container.css width: script.size[0], height: script.size[1]
            @current_stage = new Stage @$container, null, script
            return @current_stage.load()
        .fail =>
            console.log arguments
            @splash.set_failed()
            return
        .then =>
            @splash.set_ready()
            return
        # TODO handle failures and progress and whatnot


class Script
    @by_name: {}

    constructor: (@name, @preview_img, @title, @components, @partial_steps, @initial_step, @steps, @label_indices, @subtitle, @date, @size=[800, 600]) ->
        # TODO complain if name is duplicated
        @current_step = null

        Script.by_name[@name] = this

    @build: (name, preview_img, title, cb) ->
        builder = new ScriptBuilder name, preview_img, title

        cb builder

        return builder.finalize()

    @expand_partial_steps: (partial_steps, components) ->
        # TODO i think i want to get rid of this entirely and just do it in
        # realtime; i don't see any reason not to

        all_keys = Object.keys components
        all_keys.push 'pause'

        step = {}
        for key in all_keys
            step[key] = null

        final_steps = [step]
        last_step_is_bogus = true
        for partial_step in partial_steps
            # XXX ok this logic is fucked; what i want to do is fill the next
            # step with the partial one, THEN fill in any defaults left over.
            # right?  get rid of the fuckin magical special cases
            if partial_step.component?
                key = partial_step.component.id
                # TODO this is stupid.  how can i make it less stupid.
                # TODO also, this erroneously fires on exeunt_all, which
                # does cutscene:disable, which can freely be discarded
                dummy_event = [partial_step.event, partial_step.xxx_event_args()...]
                if step[key]? and JSON.stringify(step[key]) != JSON.stringify(dummy_event) and final_steps.length > 1 and JSON.stringify(step[key]) != JSON.stringify(final_steps[final_steps.length - 2][key])
                    console.error "WARNING: #{key} is set to #{step[key]} and then #{dummy_event} with no pause in between; the first state will never appear!"
                step[key] = dummy_event
                last_step_is_bogus = false

            if partial_step.next?
                step.next = partial_step.next
            if partial_step.mark?
                step.mark = partial_step.mark

            if partial_step.pause
                step.pause = partial_step.pause
                new_step = {}
                for key, val of step
                    if components[key]? and components[key].propagate
                        new_step[key] = val
                final_steps.push new_step
                last_step_is_bogus = true
                step = new_step

        if last_step_is_bogus
            # If the last partial_step has a pause, we'll end up creating a new
            # step without actually putting any events in it, in which case we
            # should scrap it
            final_steps.pop()

        # TODO might need to nuke any last stubby step that doesn't actually do
        # anything, which would happen if the last step ends with a pause

        # Two more quick passes to find all the labels and rewrite all the
        # jumps to be step indices
        label_indices = {}
        step_count = final_steps.length
        for step, i in final_steps
            if 'mark' of step
                if step.mark of label_indices
                    throw new Error "Can't use the same mark twice: #{step.mark}"
                label_indices[step.mark] = i
        for step, i in final_steps
            if 'next' of step
                if step.next == null
                    continue
                if not step.next of label_indices
                    throw new Error "Can't jump to bogus mark: #{step.next}"
                step.next = label_indices[step.next]
            else if i < step_count - 1
                step.next = i + 1

        return [final_steps, label_indices]


class Stage extends Widget
    ###
    The thing you play out a Script on.

    A Script contains a listing of abstract steps, but a Stage puts them into
    reality.  All the actual DOM puppeteering happens here.
    ###
    constructor: ($parent, $container, @script) ->
        super $parent, $container

        # TODO hmmm this sure is a lot of independent state variables
        @loaded = false
        @_busy = false
        @_paused = false

        @current_step = null
        @$component_elements = {}  # map of component ids to their $elements
        @step_path = []

    _create_container: ->
        return $ '<div>', class: 'cutscene--theater'

    load: ->
        ###
        Set up the DOM and download resources.

        Returns a Deferred, which will also generate progress notifications.
        ###
        promises = []
        _unfinished = {}
        for id, component of @script.components
            [element, promise] = component.reify @$container
            @$component_elements[id] = element
            promises.push promise

        # Bind a bunch of event handlers woo
        @$parent.on "stage:next#{NS} stage:prev#{NS} stage:jump#{NS} action:pause#{NS} action:unpause#{NS}", (event, args...) =>
            if not @loaded
                return
            # Re-fire on ourselves, so all our children can respond
            @$container.triggerHandler event.type, args...

        @$container.on 'stage:next' + NS, (event) =>
            if not @_busy and not event.isDefaultPrevented()
                @advance()
        @$container.on 'stage:prev' + NS, (event) =>
            if not @_busy and not event.isDefaultPrevented()
                @backtrack()
        @$container.on 'stage:jump' + NS, (event, label) =>
            @step_path.push @current_step
            @current_step = @script.label_indices[label]
            @_update()
        # TODO need to nuke all NS events on destruction
        # TODO would kinda like a more robust way to enforce the +NS too

        return $.when(promises...).then =>
            @loaded = true
            return @_update_to @script.initial_step

    advance: ->
        # Special case for the very first step, which has no "current" step to
        # step forward from
        if not @current_step?
            @current_step = 0
            next_step = @script.steps[@current_step]
            @_update()
            return true

        next_step = @script.steps[@current_step].next
        if next_step and 0 <= next_step < @script.steps.length
            @step_path.push @current_step
            @current_step = next_step
            @_update()
            return true
        else
            return false

    backtrack: ->
        while @step_path.length
            @current_step = @step_path.pop()
            if @script.steps[@current_step].pause != 'wait'
                @_update()
                return true

        return false


    _update: ->
        @_update_to @script.steps[@current_step]

    _update_to: (step) ->
        # TODO should this only fire events when the new state is different
        # from the old state, or should that be up to the components??
        promises = []
        for id, $element of @$component_elements
            component_state = step[id]
            if component_state?
                [event, args...] = component_state
            else
                event = 'cutscene:disable'
                args = []
            promise = $element.triggerHandler event, args
            if promise?
                promises.push promise

        if promises.length
            @_busy = true
            promise = $.when promises...
            promise.done => @_busy = false
            # XXX fix this, ideally  :/
            # Emergency fallback: if we're not done after 3s, assume a promise
            # dropped on the floor.
            promise_wait(3).then =>
                if promise.state() == "pending"
                    @_busy = false
        else
            promise = promise_always()

        if step.pause == 'wait'
            # "wait" is special: it means when this step is complete,
            # automatically advance to the next one.  Used for dim_out, where
            # the dimming is one step, but we don't want the player to have to
            # push a button for the next step.
            promise.done => @advance()

        return promise

    stop: ->
        # TODO what does this do if it's in the middle of starting?  is it
        # possible to just cancel everything that's going on?  Deferreds don't
        # exactly have a cancel.  i guess not a huge problem though
        # TODO ALSO i need to reset the size of the container


# ------------------------------------------------------------------------------
# Components

# TODO currently we have:
# - components are the configuration, and they jam all the changes into
# callbacks and stateless methods, with all the state on the element
# - "steps" are really just event names and arguments
# TODO the game plan is:
# - ActorTemplate: holds the script's configuration
# - Actor: the actual thing on the stage, with the element as a property
# - Step: has an 'evaluate' method or something that just calls methods on the
# actor
# TODO so this leaves a few questions
# * how do we rewind?  each step should really be applied /on top of/ the
# previous one (for this actor) to create a "state", and that's what gets
# applied each time

class Component
    propagate: true

    @_sequence: 0
    _id_suffix: ->
        return 'component'

    constructor: ->
        Component._sequence++
        @id = "#{Component._sequence}-#{@_id_suffix()}"

    toString: ->
        return "<#{@constructor.name}: #{@id}>"

    list_components: () ->
        return [@]


class Step
    event: null
    pause: false
    next: undefined

    constructor: (@component) ->

    xxx_event_args: ->
        return []


class MarkStep extends Step
    component: null

    constructor: (@mark) ->


class LowerCurtainStep extends Step
    pause: 'wait'
    event: 'cutscene:lower'


class FlashCurtainStep extends Step
    pause: 'wait'
    event: 'cutscene:flash'



class Actor
    interrupt_next: ->
        return false

class ActorTemplate


class NewCurtain extends Actor
    constructor: ($parent) ->
        @element = create_element 'div', class: 'cutscene--curtain'
        $parent.append @element

        @pending = false

    do_lower: ->
        if @element.classList.contains '-lowered'
            return

        @element.classList.remove '-flash'
        @element.classList.add '-lowered'
        promise = promise_transition @element
        @pending = promise
        return promise.then => @pending = false

    # TODO this is quite a hack, sigh
    do_flash: ->
        if @element.classList.contains '-lowered'
            return

        @element.classList.add '-flash', '-lowered'
        promise = promise_transition @element
        @pending = promise
        return promise.then =>
            @pending = null
            @element.classList.remove '-lowered'
            promise_transition(@element).then =>
                @element.classList.remove '-flash'

    do_disable: ->
        if not @element.classList.contains '-lowered'
            return

        @element.classList.remove '-lowered'
        @pending = null
        return
        return promise_event @element, 'transitionend'

    interrupt_next: ->
        if not @pending or not @element.classList.contains '-lowered'
            return

        # This is really stupid, but if you hold the right arrow key, the
        # curtain lowers and immediately raises, and it never actually
        # transitions, so the promise never resolves.  Do it manually.
        # TODO i would fucking love to avoid this idiot problem entirely
        old_promise = @pending
        old_promise.resolve null
        @pending = null

        @element.classList.remove '-lowered'
        return true


class Curtain extends Component
    propagate: false

    _id_suffix: ->
        return 'curtain'

    json_lower: ->
        return new LowerCurtainStep @

    json_flash: ->
        return new FlashCurtainStep @

    reify: ($parent) ->
        actor = new NewCurtain $parent

        $(actor.element).on 'cutscene:lower', ->
            return actor.do_lower()

        $(actor.element).on 'cutscene:flash', ->
            return actor.do_flash()

        $(actor.element).on 'cutscene:disable', ->
            return actor.do_disable()

        $parent.on 'stage:next' + NS, (event) =>
            if actor.interrupt_next()
                event.preventDefault()

        # TODO how does the actor return a loading promise as well?
        return [$(actor.element), promise_always()]


class SayLineStep extends Step
    event: 'cutscene:change'
    pause: true
    constructor: (component, @xxx_fake_speaker, @text) ->
        super component

    xxx_event_args: ->
        return [@xxx_fake_speaker, @text]


class HideTextboxStep extends Step
    event: 'cutscene:hide'


class ShowMenuStep extends Step
    event: 'cutscene:menu'
    # TODO not sure where should be looking at this
    next: null
    pause: true
    constructor: (component, @labels_to_captions) ->
        super component

    xxx_event_args: ->
        return [@labels_to_captions]


class SpeechBubble extends Component
    @JUMP_WHEN_COMPLETE: {sentinel: true}

    propagate: false

    _id_suffix: ->
        return 'speech'

    reify: ($parent) ->
        $element = $ '<div>', class: 'cutscene--speech-bubble'
        $parent.append $element

        $element.data 'visited-labels': {}

        $element.on 'cutscene:change', @_change.bind this
        $element.on 'cutscene:menu', @_menu.bind this
        $element.on 'cutscene:hide', @_hide.bind this
        $element.on 'cutscene:disable', @_disable.bind this

        $element.on 'mouseenter', 'li', @_menu_hover.bind this
        $element.on 'click', 'li', (event) ->
            $selected = $(this)
            label = $selected.data('label')
            if label?
                event.stopImmediatePropagation()
                $element.data('visited-labels')[label] = true
                $parent.triggerHandler 'stage:jump', [label]

        $parent.on 'stage:next' + NS, (event) => @_possibly_fill event, $element
        $parent.on 'action:pause' + NS, (event) => @_pause event, $element
        $parent.on 'action:unpause' + NS, (event) => @_unpause event, $element

        $parent.on 'menu:next' + NS, (event) => @_menu_move event, 1
        $parent.on 'menu:prev' + NS, (event) => @_menu_move event, -1
        $parent.on 'menu:accept' + NS, (event) =>
            $selected = $element.find('li.-selected')
            label = $selected.data('label')
            if label?
                $element.data('visited-labels')[label] = true
                $parent.triggerHandler 'stage:jump', [label]

        return [$element, promise_always()]

    _change: (event, speaker, text) ->
        $el = $ event.currentTarget
        if text == ""
            # TODO all the speaker handling is hacky ugh.  this is just to
            # allow setting the class before actually showing any text, to fix
            # the transition on the terminal in scrapgoats
            if speaker and speaker.position
                $el.attr 'data-position', speaker.position
            @_hide event
            return
        $el.removeClass '-hidden'

        $el.attr 'data-state', ''
        $dialogue = @_build_dialogue text
        # Remove everything...  but not the speaker tag, because we want to
        # fade that out smoothly.
        $el.children().not('.cutscene--speaker').remove()
        $el.append $dialogue

        # Purge old speaker tags
        # TODO man this code all sucks; stick in separate method plz
        $old_speakers = $el.find('.cutscene--speaker')
        if speaker == $old_speakers.data 'speaker'
            leave_speaker = true
        else
            leave_speaker = false

        if not leave_speaker
            $old_speakers.removeClass '-active'
            promise_event $old_speakers, 'transitionend'
                .done -> $old_speakers.remove()

        # TODO super weird bug: set the transition time to something huge like
        # 10s and mash arrow keys mid-transition and sometimes you end up with
        # dialogue attributed to the wrong speaker!
        if leave_speaker
            # do nothing
        else if speaker and speaker.name?
            rgb_color = normalize_color speaker.color
            background_color = rgb_color.replace /^rgb([(].+)[)]$/, "rgba$1, 0.8)"

            # TODO need to reset this when anything else happens ugh
            $el.css
                backgroundColor: background_color
                color: speaker.color

            $speaker = $('<div>',
                class: 'cutscene--speaker'
                text: speaker.name
                css: backgroundColor: speaker.color
                data: speaker: speaker
            )
            $speaker.attr 'data-position', speaker.position
            $el.append $speaker
            # Force recompute or this won't actually transition anything
            $speaker[0].offsetTop
            $speaker.addClass '-active'
        else
            $el.css
                backgroundColor: ''
                color: ''
            $el.removeAttr 'data-position'
        if speaker and speaker.position
            $el.attr 'data-position', speaker.position

        @_start_scrolling $dialogue

        return

    _build_dialogue: (text) ->
        source = document.createElement 'div'
        source.innerHTML = text
        target = document.createDocumentFragment()

        current_node = source.firstChild
        current_target = target
        all_letters = []
        all_word_endings = []
        while current_node
            if current_node.nodeType == Node.TEXT_NODE
                text_chunk = current_node.nodeValue
                i = 0
                while true
                    # TODO astral plane  :/
                    ch = text_chunk.charAt i
                    if ch
                        i++
                    else
                        break

                    # Stick spaces onto the end of the previous span; reduces
                    # the DOM size by a decent chunk which makes life faster
                    # all around.  And it doesn't matter if the space is on the
                    # boundary of an inline element, either!
                    if all_letters.length and ch == " "
                        [..., letter] = all_letters
                        letter.textContent += ch
                        all_word_endings.push letter
                    else
                        letter = document.createElement 'span'
                        letter.textContent = ch
                        all_letters.push letter
                        current_target.appendChild letter

            else if current_node.nodeType == Node.ELEMENT_NODE
                new_parent = current_node.cloneNode false
                current_target.appendChild new_parent
                current_target = new_parent

            # Pick the next node
            if current_node.hasChildNodes()
                current_node = current_node.firstChild
            else
                while current_node and not current_node.nextSibling
                    current_node = current_node.parentNode
                    current_target = current_target.parentNode

                    if current_node == source
                        current_node = null
                        break

                if current_node
                    current_node = current_node.nextSibling

        $(all_letters).addClass '-hidden'

        return $ '<div>', class: 'cutscene--dialogue'
            .append target
            .data all_letters: all_letters

    _next_letter: ($dialogue) ->
        all_letters = $dialogue.data 'all_letters'
        $all_letters = $(all_letters)

        # Next letter to show is the one after the currently-visible letter
        $visible_letters = $all_letters.not('.-hidden')
        if $visible_letters.length
            return $all_letters.index($visible_letters.last()) + 1
        else
            return 0

    _start_scrolling: ($dialogue) ->
        ###
        Start scrolling the current text into view, if applicable.

        Returns true iff there was any text to display.
        ###
        if $dialogue.data 'timeout'
            # Already running!
            return true
        if 'done' == $dialogue.parent().attr 'data-state'
            # Nothing left to do!
            return false

        all_letters = $dialogue.data 'all_letters'
        $all_letters = $(all_letters)

        letter_index = @_next_letter $dialogue
        if letter_index >= all_letters.length
            # The end of the text is visible, so, nothing to do here
            $dialogue.parent().attr 'data-state', 'done'
            return false

        # Hide all the letters so we start from scratch
        $all_letters.addClass '-hidden'

        @_scroll $dialogue, all_letters, letter_index
        return true

    _scroll: ($dialogue, all_letters, letter_index) ->
        # Do some math: figure out where the bottom of the available space is
        # now, and in the case of text that doesn't fit in the box all at once,
        # "slide" all the previously-shown text out of the way.
        next_letter_top = all_letters[letter_index].offsetTop
        container_bottom = $dialogue.offsetParent().height() + next_letter_top
        $dialogue.css 'margin-top', all_letters[0].offsetTop - next_letter_top

        $dialogue.parent().attr 'data-state', 'scrolling'

        cb = =>
            $dialogue.data timeout: null
            state = $dialogue.parent().attr 'data-state'

            while true
                el = all_letters[letter_index]
                if not el
                    $dialogue.parent().attr 'data-state', 'done'
                    return

                # TODO this doesn't work if we're still in the middle of loading oops
                # TODO i don't remember what the above comment was referring to
                # If we ran out of room, stop here and wait for a "next" event
                if el.offsetTop + el.offsetHeight >= container_bottom
                    $dialogue.parent().attr 'data-state', 'waiting'
                    return

                letter_index++
                $(el).removeClass '-hidden'

                if state != 'fill'
                    break

            if el and el.textContent == "\f"
                # TODO this will break the pause button during this delay
                # TODO also i don't think we'll catch stage:next correctly?
                $dialogue.data timeout: setTimeout cb, 500
            else
                $dialogue.data timeout: requestAnimationFrame cb

        cb()

    _possibly_fill: (event, $el) ->
        ###
        Called when the stage receives a "next" event.  Possibly interrupts it.

        1. If the text is still scrolling, fill the textbox instead of
        advancing to the next step.
        2. If the textbox is full but there's still more text to show, scroll
        down and keep going instead of advancing to the next step.
        ###
        $dialogue = $el.children '.cutscene--dialogue'
        if not $dialogue.length
            return

        # TODO if there's only one character left, maybe don't count this as a fill?
        # TODO i don't remember what that meant either  :(

        if $dialogue.data 'timeout'
            # Case 1: Still running -- update state so the next update knows to fill
            $dialogue.data paused: false
            $dialogue.parent().attr 'data-state', 'fill'
            event.preventDefault()
        else if @_start_scrolling $dialogue
            # Case 2: more text to show
            event.preventDefault()

    _menu: (event, labels_to_captions) ->
        $el = $ event.currentTarget

        # Check for a special JUMP_WHEN_COMPLETE caption -- if this exists, and
        # the player has visited all the other labels, we'll automatically jump
        # straight to that label
        visited_labels = $el.data 'visited-labels'
        all_visited = true
        when_complete_label = null
        for label, caption of labels_to_captions
            if caption == SpeechBubble.JUMP_WHEN_COMPLETE
                when_complete_label = label
            else if not visited_labels[label]
                all_visited = false
                break
        if all_visited and when_complete_label?
            $el.parent().triggerHandler 'stage:jump', [when_complete_label]
            return

        $el.removeClass '-hidden'
        $el.empty()
        # TODO dry; XXX remove speaker!!!
        $el.css
            backgroundColor: ''
            borderColor: ''

        $menu = $ '<ol>', class: 'cutscene--menu'
        for label, caption of labels_to_captions
            if caption == SpeechBubble.JUMP_WHEN_COMPLETE
                continue
            $menu.append $ '<li>', text: caption, data: label: label

        $menu.children().first().addClass '-selected'

        $el.append $menu

        # Even though this is a brand new element, browser history may keep it
        # scrolled
        $menu[0].scrollTop = 0

        return

    _menu_hover: (event) ->
        $el = $ event.delegateTarget
        $hovered = $ event.currentTarget

        $el.find('li').removeClass '-selected'
        $hovered.addClass '-selected'

    _menu_move: (event, direction) ->
        $el = $ event.currentTarget
        $menu = $el.find '.cutscene--menu'
        if not $menu.length
            return

        $target = $menu.children 'li.-selected'
        $target.removeClass '-selected'

        orig_direction = direction

        while direction > 0
            direction--
            $target = $target.next 'li'
            if not $target.length
                $target = $menu.children('li').first()

        while direction < 0
            direction++
            $target = $target.prev 'li'
            if not $target.length
                $target = $menu.children('li').last()

        $target.addClass '-selected'

        # Is the newly-selected item completely contained within its parent?
        ###
        menu_top = $menu[0].scrollTop
        item_top = $target[0].offsetTop
        menu_bottom = menu_top + $menu[0].offsetHeight
        item_bottom = item_top + $target[0].offsetHeight
        if item_bottom > menu_bottom
            $menu[0].scrollTop = item_bottom - $menu[0].offsetHeight
        if item_top < menu_top
            $menu[0].scrollTop = item_top


            ###
        if not ($menu[0].scrollTop <= $target[0].offsetTop <= $menu[0].scrollTop + $menu[0].offsetHeight - $target[0].offsetHeight)
            # Argument is whether to align with top, which we want to do iff we
            # scrolled upwards.  This also works if we wrapped around:
            # scrolling the topmost item into view "aligned with the bottom"
            # pushes it to the very top.
            $target[0].scrollIntoView orig_direction < 0

    _hide: (event) ->
        $el = $ event.currentTarget
        $el.addClass '-hidden'
        $el.text ''

    _disable: (event) ->
        $el = $ event.currentTarget
        $el.text ''

    _pause: (event, $el) =>
        $dialogue = $el.children '.cutscene--dialogue'
        if not $dialogue.length
            return

        timeout = $dialogue.data 'timeout'
        if timeout?
            cancelAnimationFrame(timeout)

    _unpause: (event, $el) =>
        $dialogue = $el.children '.cutscene--dialogue'
        if not $dialogue.length
            return

        all_letters = $dialogue.data('all_letters')
        letter_index = @_next_letter $dialogue
        if letter_index >= all_letters.length
            return
        @_scroll $dialogue, all_letters, letter_index
        


class ChangeImageStep extends Step
    event: 'cutscene:change'
    constructor: (component, @view, @offset=0) ->
        super component

    xxx_event_args: ->
        return [@view, @offset]


class HideImageStep extends Step
    event: 'cutscene:disable'


# TODO support animations, like pmde did
class ImageSpot extends Component
    constructor: (@class, opts) ->
        @views = {}

        if opts?
            # TODO probably, more stuff here
            { @name, @color, @position, @mutex } = opts

        super

    _id_suffix: ->
        return @name

    add_view: (name, tmp_image_url) ->
        @views[name] = [ url: tmp_image_url ]

    add_animation: (name, frames) ->
        @views[name] = frames

    json_show: ({view}) ->
        if view not of @views
            throw new Error "No such view #{view} for image spot #{@}"
        return new ChangeImageStep @, view

    json_hide: ->
        return new HideImageStep @

    reify: ($parent) ->
        $element = $ '<div>', class: "cutscene--image-spot #{@class}"
        $parent.append $element

        view_elements = {}
        img_promises = []
        for view_name, frames of @views
            view_elements[view_name] = frame_elements = []
            for frame in frames
                $img = $ '<img>'
                # Bind the event handler FIRST -- if the image is cached it might
                # load instantly!
                img_promises.push promise_event $img, 'load', 'error'
                $img.attr src: frame.url
                $img.data 'view-name', view_name
                $img.data 'delay', frame.delay or 0
                $element.append $img
                frame_elements.push $img

        $element.data 'view-elements', view_elements

        $element.on 'cutscene:change' + NS, @_change
        $element.on 'cutscene:disable' + NS, @_disable

        # TODO i can't figure out how to make this work but i really want to be
        # able to "skip" a transition while holding down right arrow  >:(
        ###
        $parent.on 'stage:next' + NS, (event) =>
            $x = $element.find('.-visible')
            #$x.css 'transition-property', 'none'
            $x.css 'transition-duration', '0s'
            $x.css 'opacity', '1.0'
            if $x[0]?
                $x[0].offsetHeight
            $x.css 'opacity', ''
            $x.css 'transition-duration', ''
            #$x.css 'transition-duration', '0s'
            #$element[0].style.transitionDuration = undefined
        ###

        # TODO uhh how does progress work with image tags?  how does it work at
        # all?  i think i'd have to use ajax here and rely on the cache or
        # whatever ungh
        return [$element, $.when img_promises...]

    # TODO this should interrupt a 'next' event, either advancing the animation
    # or forcing you to watch it once or something

    _change: (event, view_name, offset) =>
        $el = $ event.currentTarget
        $el.removeClass '-immediate'
        $el.css marginLeft: "#{offset or 0}px"

        active_view_name = $el.data 'active-view-name'
        if active_view_name == view_name
            return
        $el.data 'active-view-name', view_name

        $view_elements = $el.data 'view-elements'

        $target_child = $view_elements[view_name][0]
        if $target_child.hasClass '-visible'
            return

        $el.children().removeClass '-visible'

        $target_child.addClass '-visible'
        promise = promise_transition $target_child

        delay = $target_child.data 'delay'
        if delay
            setTimeout (=> @_advance $el, view_name, 0), delay

        return promise

    _advance: ($el, view_name, current_index) =>
        $view_elements = $el.data 'view-elements'
        $current = $view_elements[view_name][current_index]
        next_index = (current_index + 1) % $view_elements[view_name].length
        $next = $view_elements[view_name][next_index]

        if not $current.hasClass '-visible'
            return

        $current.removeClass '-visible'
        $next.addClass '-visible'

        delay = $next.data 'delay'
        if delay
            setTimeout (=> @_advance $el, view_name, next_index), delay

    _disable: (event) ->
        $el = $ event.currentTarget

        # The backdrop has a transition delay so there's no black flicker
        # during a transition (when both images are 50% opaque), but when we're
        # hiding the entire backdrop, we don't want that.  This class disables
        # it.
        $el.addClass '-immediate'

        $visibles = $el.children '.-visible'
        if $visibles.length
            promises = $visibles.map (ix, child) -> promise_transition $(child)
            promise = $.when promises...
            $visibles.removeClass '-visible'
            $el.data 'active-view-name', null
        else
            promise = promise_always()

        return promise


class PlayTrackStep extends Step
    event: 'cutscene:change'
    constructor: (component, @track) ->
        super component

    xxx_event_args: ->
        return [@track]


class StopTrackStep extends Step
    event: 'cutscene:disable'


# TODO support multiple tracks with overdub, like pmde did
# TODO i feel like these should be "tracks" instead of "songs"
class Boombox extends Component
    constructor: ->
        @songs = {}
        super

    _id_suffix: ->
        return 'boombox'

    add_song: (name, {url, loop_}) ->
        loop_ ?= true
        @songs[name] = url: url, loop_: loop_

    json_play: ({track}) ->
        if not track of @songs
            throw new Error "No such track #{track} for jukebox #{@}"
        return new PlayTrackStep @, track

    json_stop: ->
        return new StopTrackStep @

    reify: ($parent) ->
        $element = $ '<div>', class: "cutscene--boombox"
        $parent.append $element

        # If we can't play music at ALL, don't even try to load anything
        if not CAN_PLAY_AUDIO
            return [$element]

        promises = []
        song_elements = {}
        for song_name, {url, loop_} of @songs
            $player = $ '<audio>'
            # Note: 'canplaythrough' fires when the entire sound can be played
            # without buffering.  But Chrome doesn't like downloading the
            # entire file, and the spec never guarantees this is possible
            # anyway, so go with 'canplay' and hope for the best.
            promise = promise_event $player, 'canplay', 'error'
            # Add a failure handler that just disables the element entirely;
            # missing music (or codec support) shouldn't break the entire scene
            promise = promise.then null, do (song_name) -> ->
                console.error 'failed to load audio:', arguments...
                delete song_elements[song_name]
                return promise_always()
            promises.push promise

            $player.attr
                src: url
                preload: 'auto'  # ask the browser to download
                autobuffer: true  # older way to do the same thing
                loop: loop_
            $player.data 'song-name', song_name

            # Unlike images, the downloading doesn't start without this
            $player[0].load()

            $element.append $player
            song_elements[song_name] = $player

        $parent.on 'action:pause', (event) => @_pause event, $element
        $parent.on 'action:unpause', (event) => @_unpause event, $element

        $element.data 'song-elements', song_elements

        $element.on 'cutscene:change', @_change
        $element.on 'cutscene:disable', @_disable

        # TODO uhh how does progress work with audio tags?  how does it work at
        # all?  i think i'd have to use ajax here and rely on the cache or
        # whatever ungh
        return [$element, $.when promises...]

    _change: (event, song_name) =>
        $el = $ event.currentTarget
        old_song_name = $el.data 'active-song-name'
        if old_song_name == song_name
            return
        $el.data 'active-song-name', song_name

        $song_elements = $el.data 'song-elements'

        $old_song = $song_elements[old_song_name]
        $new_song = $song_elements[song_name]

        # TODO maybe this should just be .find('.-visible')
        if $old_song?
            old_promise = @_stop_track $old_song[0]
        else
            old_promise = promise_always()

        # Kill the animation queue, in case the new song is in the process of
        # stopping.  The `true`s clear the queue and jump to the end of the
        # animation.
        if $new_song?
            $new_song.stop true, true
            $new_song[0].volume = 1.0  # XXX default volume?
            $new_song[0].play()

        return old_promise

    _stop_track: (media) ->
        ###
        Stop a track with a fadeout.

        Returns a promise that will complete when the fadeout is finished.
        ###
        if media.paused
            return promise_always()

        original_volume = media.volume
        return $(media).animate(volume: 0, 'slow').promise().then ->
            media.pause()
            media.currentTime = 0.0
            media.volume = original_volume

    _disable: (event) =>
        $el = $ event.currentTarget
        old_song_name = $el.data 'active-song-name'
        $song_elements = $el.data 'song-elements'
        $old_song = $song_elements[old_song_name]

        $el.data 'active-song-name', null

        if $old_song?
            return @_stop_track $old_song[0]
        else
            return promise_always()

    _pause: (event, $el) =>
        current_song_name = $el.data 'active-song-name'
        $song_elements = $el.data 'song-elements'
        $current_song = $song_elements[current_song_name]

        if $current_song?
            $current_song[0].pause()

    _unpause: (event, $el) =>
        current_song_name = $el.data 'active-song-name'
        $song_elements = $el.data 'song-elements'
        $current_song = $song_elements[current_song_name]

        if $current_song?
            $current_song[0].play()


class ShowBlockStep extends Step
    event: 'cutscene:enable'
    pause: true


class HTMLBlock extends Component
    propagate: false

    _id_suffix: ->
        return 'html'

    constructor: (@markup) ->
        super

    json_show: ->
        return new ShowBlockStep @

    reify: ($parent) ->
        $element = $ '<div>', class: 'cutscene--html'

        # for vertical align via flexbox
        $wrapper = $ '<div>', class: 'cutscene--html-wrapper'
        $wrapper.html @markup
        $element.append $wrapper

        $parent.append $element

        $element.on 'cutscene:enable', =>
            $element.addClass '-active'
            return

        $element.on 'cutscene:disable', =>
            $element.removeClass '-active'
            return

        return [$element, promise_always()]


class DelayStep extends Step
    event: 'cutscene:pause'
    pause: 'wait'
    constructor: (component, @delay) ->
        super component

    xxx_event_args: ->
        return [@delay]


class Singleton extends Component
    # Hacky one-off that does some global actions
    propagate: false

    reify: ($parent) ->
        # TODO here's a good reason to get rid of elements as event targets
        $element = $ '<div>', class: "cutscene--singleton"
        $parent.append $element

        $element.on 'cutscene:pause', (event, delay) ->
            return promise_wait delay

        return [$element, promise_always()]


class ScriptBuilder
    constructor: (@name, @preview_img, @title) ->
        # raw step objects, just a map of component to arguments
        @partial_steps = []

        # map of id to component
        @components = {}

        # "mutually exclusive" groups of image spots -- only one such spot can
        # be active during any given step.  maps mutex name to list of spots
        # TODO problem with mutexes: they might make a 'say' go completely
        # haywire.  maybe 'say' should also inherit the image spot's last pose?
        @mutexes = {}

        # current offset for each image spot
        # TODO this is pretty hacky.  really it's about the arrangement of the
        # other characters -- we only want to squish everyone aside when x
        # other person is visible
        @offsets = {}

        # special components that only need to exist once -- always created and
        # have their own dedicated step methods
        @curtain = @add_component(new Curtain)
        @backdrop = @add_component(new ImageSpot 'cutscene--backdrop')
        @boombox = @add_component(new Boombox)
        @speech = @add_component(new SpeechBubble)

        # TODO need a better way to tack this onto all urls
        @root_url = "res/#{@name}/"

    add_component: (component) ->
        @offsets[component.id] = 0
        @components[component.id] = component

    add_view: (name, tmp_image_url) ->
        @backdrop.add_view name, @root_url + tmp_image_url

    add_song: (name, tmp_audio_url, params={}) ->
        params.url = @root_url + tmp_audio_url
        @boombox.add_song name, params

    # TODO inconsistent naming here
    new_character: (opts) ->
        { position, poses, mutex } = opts
        spot = new ImageSpot "cutscene--imagespot-#{position}", opts
        for view_name, view_opts of poses
            tmp_image_url = view_opts
            spot.add_view view_name, @root_url + tmp_image_url
        component = @add_component(spot)

        if mutex?
            (@mutexes[mutex] ?= []).push(component)

        return component

    # -------------------------------------------------------------------------
    # Commands that add steps

    pause: ->
        @partial_steps.push new SayLineStep @speech, {}, ""
        #@partial_steps.push pause: true

    # TODO i think dim_out needs to have a distinct long pause sometimes, right?  like major_transition did before
    # TODO lol this doesn't actually fade
    # TODO should this imply exeunt_all?
    # TODO ugh this is so hacky
    dim_out: (keep_music=false) ->
        step = pause: 'wait'
        #for id, component of @components
        #    step[id] = ['cutscene:disable']
        if not keep_music
            #step[@boombox.id] = ['cutscene:disable']
            @partial_steps.push new StopTrackStep @boombox

        #step[@curtain.id] = ['cutscene:lower']
        #@partial_steps.push step
        @partial_steps.push new LowerCurtainStep @curtain

    ## BACKDROP

    # TODO most of these should validate that the named thing exists
    transition: (view_name) ->
        if view_name not of @backdrop.views
            throw "No such backdrop #{view_name}"

        @partial_steps.push new ChangeImageStep @backdrop, view_name

        #step = {}
        #step[@backdrop.id] = ['cutscene:change', view_name]
        #@partial_steps.push step

    nobackdrop: ->
        @partial_steps.push new HideImageStep @backdrop

        #step = {}
        #step[@backdrop.id] = ['cutscene:disable']
        #@partial_steps.push step

    ## CHARACTERS

    pose: (image_spot, view_name, offset=null) ->
        if view_name not of image_spot.views
            throw "Character #{image_spot.id} has no pose named #{view_name}"

        if offset?
            @offsets[image_spot.id] = offset

        #step = {}
        #step[image_spot.id] = ['cutscene:change', view_name, @offsets[image_spot.id]]
        @partial_steps.push new ChangeImageStep image_spot, view_name, @offsets[image_spot.id]

        if image_spot.mutex
            for other_spot in @mutexes[image_spot.mutex]
                if other_spot isnt image_spot
                    #step[other_spot.id] = ['cutscene:disable']
                    @partial_steps.push new HideImageStep other_spot

        #@partial_steps.push step

    exeunt: (image_spots...) ->
        #step = {}
        for image_spot in image_spots
            #step[image_spot.id] = ['cutscene:disable']
            @partial_steps.push new HideImageStep image_spot
        #@partial_steps.push step

    exeunt_all: ->
        #step = {}
        for id, component of @components
            if component instanceof ImageSpot and component isnt @backdrop
                #step[component.id] = ['cutscene:disable']
                @partial_steps.push new HideImageStep component
        #@partial_steps.push step

    ## AUDIO

    # TODO uhh this is kind of a vague name i guess
    play: (song_name) ->
        if song_name not of @boombox.songs
            throw "No song named #{song_name}"

        @partial_steps.push new PlayTrackStep @boombox, song_name
        #step = {}
        #step[@boombox.id] = ['cutscene:change', song_name]
        #@partial_steps.push step

    nomusic: ->
        @partial_steps.push new StopTrackStep
        #step = {}
        #step[@boombox.id] = ['cutscene:disable']
        #@partial_steps.push step

    ## TEXT BOX

    say: (character, text) ->
        if not text?
            throw new Error "Psst.  Line?"
        @partial_steps.push new SayLineStep @speech, character, text
        #step = pause: true
        #step[@speech.id] = ['cutscene:change', character, text]
        #@partial_steps.push step

    notext: ->
        @partial_steps.push new HideTextboxStep @speech
        #step = {}
        #step[@speech.id] = ['cutscene:hide']
        #@partial_steps.push step

    menu: (labels_to_captions) ->
        @partial_steps.push new ShowMenuStep @speech, labels_to_captions
        #step = pause: true, next: null
        #step[@speech.id] = ['cutscene:menu', labels_to_captions]
        #@partial_steps.push step

    ## CONVENIENCE

    # Combines 'pose' with 'say'.
    emote: (character, view_name, text) ->
        @pose character, view_name
        @say character, text

    ## HTML

    add_credits: (html) ->
        if @credits?
            throw new Error "Can't have two credits blocks!"
        @credits = new HTMLBlock html
        @add_component @credits

    # TODO should imply nobackdrop, notext, nomusic, etc?
    roll_credits: ->
        if not @credits?
            throw new Error "No credits defined; call add_credits first!"
        @partial_steps.push new ShowBlockStep @credits
        #step = pause: true
        #step[@credits.id] = ['cutscene:enable']
        #@partial_steps.push step

    ## FLOW CONTROL

    mark: (label) ->
        @partial_steps.push new MarkStep label
        #@partial_steps.push mark: label

    jump: (label) ->
        l = @partial_steps.length
        if not l
            throw new Error "Can't jump as the first step!"
        last_step = @partial_steps[l - 1]
        if not last_step.pause
            throw new Error "Can only jump after a pause"
        if last_step.next?
            throw new Error "Can't jump after a step that already has a 'next'"
        last_step.next = label

    finalize: ->
        # TODO a case this doesn't handle: backing up beyond the first time an
        # event was sent to a component.  components need to expose their
        # default state events i think?  or have a special cutscene:default?
        # or just use disable since dim_out does that already?
        # TODO should this just be inlined into the functions above?  would
        # that be simpler?  it's what the old code did.  this way makes the
        # order of component vs step definition arbitrary though...
        [final_steps, label_indices] = Script.expand_partial_steps(
            @partial_steps, @components)

        # Build a special separate step to indicate what the stage should look
        # like /before/ the first step -- i.e. underneath the loading screen,
        # before the player has agreed to start.  This really just means
        # showing the first backdrop.
        # TODO there's still a brief delay while the textbox hides here, eugh
        initial_step = {}
        initial_step[@speech.id] = ['cutscene:hide']
        initial_step[@backdrop.id] = final_steps[0][@backdrop.id]

        return new Script @name, @preview_img, @title, @components, @partial_steps, initial_step, final_steps, label_indices


# Not a real component!  Delegates to other components.
class Character
    constructor: (@speech, relative_to, name, color, position, poses) ->
        # TODO this is a super hack, but SpeechBubble assumes you pass it an
        # ImageSpot, because I am an idiot.  fix this please
        @fake_speaker = name: name, position: position, color: color ? 'black'

        # TODO don't like this hardcoding a whole lot
        # TODO seems like this duplicates some of the stuff below
        # TODO not every character has an image spot -- e.g. narrator
        # TODO seriously need to split apart speakers and image spots; really
        # don't want the same "position" here
        cls = "cutscene--imagespot-#{position}"
        @image_spot = new ImageSpot cls
        for name, args of poses ? []
            @image_spot.add_view name, relative_to + args

    @from_json: (speech, relative_to, {name, color, position, poses}) ->
        # TODO lmao this is stupid.
        return new Character speech, relative_to, name, color, position, poses

    list_components: () ->
        return [@image_spot]

    json_say: ({text}) ->
        # TODO wonder if one level up i can rethrow this more specifically
        if not text?
            throw "Need some text!"

        return new SayLineStep @speech, @fake_speaker, text

    json_pose: (args) ->
        return @image_spot.json_show args

    json_leave: ->
        return new HideImageStep @image_spot

        


# TODO FEATURES THIS WANTS
# - "include" mechanism for borrowing actors from other sources
script_from_json = (url, data) ->
    # TODO this will just hang forever if the json is bogus or the request
    # otherwise fails
    components = {}
    actors = {}

    # TODO lmao fix this garbage
    if -1 != data.asset_root.search /^(?:[/]|\w+:[/][/])/
        # given root is absolute
        relative_to = data.asset_root
    else
        # given root is relative to the url of the json file
        last_slash = url.lastIndexOf '/'
        if last_slash == -1
            parent = './'
        else
            parent = url.substring(0, last_slash + 1)
        relative_to = parent + data.asset_root
    if relative_to.substring(-2) == "/."
        relative_to = relative_to.substring 0, relative_to.length - 1
    else if relative_to.substring(-1) != "/"
        relative_to += "/"

    speech = new SpeechBubble
    components[speech.id] = speech
    singleton = new Singleton
    components[singleton.id] = singleton

    if data.credits?
        # TODO this is pretty hardcodey but, you know, fuck it.  could be a
        # templated thing later, idk
        credits_html = $ '<div>'
        for contributor in data.credits.people ? []
            row = $ '<div>', class: 'cutscene--credits-row'
            credits_html.append row

            row.append $ '<div>', class: '-for', text: contributor.for

            who = $('<div>', class: '-who').appendTo row
            if contributor.website
                who.append $ '<a>', href: contributor.website, text: contributor.who
            else
                who.text contributor.who

            devart = $('<div>', class: '-deviantart').appendTo row
            if contributor.deviantart
                link = $ '<a>', href: "http://#{contributor.deviantart}.deviantart.com/"
                link.append $ '<img>', src: "img/deviantart.png", alt: "deviantArt"
                devart.append link

            tumblr = $('<div>', class: '-tumblr').appendTo row
            if contributor.tumblr
                link = $ '<a>', href: "http://#{contributor.tumblr}.tumblr.com/"
                link.append $ '<img>', src: "img/tumblr.png", alt: "Tumblr"
                tumblr.append link

            twitter = $('<div>', class: '-twitter').appendTo row
            if contributor.twitter
                link = $ '<a>', href: "https://twitter.com/#{contributor.twitter}"
                link.append $ '<img>', src: "img/twitter.png", alt: "Twitter"
                twitter.append link

        for line in data.credits.footer_html ? []
            credits_html.append $ '<p>', html: line

        credits = new HTMLBlock credits_html.html()
        components[credits.id] = credits
    else
        credits = null

    # TODO i think i might want to change this to a list, since actor order can
    # be important -- corresponds directly to layering order.  i think.  or
    # maybe /that/ should be explicit.
    for handle, actordef of data.actors
        if actordef.type == "character"
            actor = Character.from_json speech, relative_to, actordef
        else if actordef.type == "spot"
            # TODO i don't really like this way of specifying the class.
            # probably because, um, why do char classes have "imagespot" in the
            # class and this doesn't
            # TODO i even hacked around this for the frame in the prompt augh
            actor = new ImageSpot "cutscene--#{actordef.position}"
            for name, args of actordef.views
                # TODO this sucks.
                if typeof args == "object" and Object.getPrototypeOf(args) == Array.prototype
                    actor.add_animation name, ( url: relative_to + arg.url, delay: arg.delay for arg in args )
                else
                    actor.add_view name, relative_to + args
        else if actordef.type == "jukebox"
            actor = new Boombox
            for name, args of actordef.tracks
                actor.add_song name, url: relative_to + args
        else if actordef.type == "curtain"
            actor = new Curtain

        actors[handle] = actor

        for component in actor.list_components()
            components[component.id] = component

    partial_steps = []
    # TODO and maybe these could just be lists too honestly?
    for instruction in data.script
        # TODO i could get rid of this special case if instead i let the
        # textbox handle it -- treat empty text as "hide textbox and pause".
        # there's never any reason to pause while text is showing anyway, and
        # that's generally hecka confusing
        if instruction.action == 'pause'
            partial_steps.push new SayLineStep speech, {}, ""
            continue
        else if instruction.action == 'roll_credits'
            # TODO there's no reason the credits couldn't be explicitly created
            # by the script too
            if not credits?
                throw "Can't roll credits; you never defined any!"
            partial_steps.push new ShowBlockStep credits
            continue
        else if instruction.action == 'notext'
            # TODO this feels like a slight hack, but the textbox isn't
            # actually created by the script.  maybe it should be...?  i mean,
            # the narrator is now, as well as the jukebox.
            partial_steps.push new HideTextboxStep speech
            continue
        else if instruction.action == 'delay'
            partial_steps.push new DelayStep singleton, instruction.delay
            continue

        actor = actors[instruction.actor]
        if not actor?
            # TODO maybe include the whole instruction
            throw "No such actor #{instruction.actor}"

        action = actor['json_' + instruction.action]
        if not action?
            throw "No such action #{instruction.action} for actor #{instruction.actor} (#{actor})"

        try
            step_obj = action.call(actor, instruction)
        catch e
            console.error e, "instruction was:", instruction
            throw e
        partial_steps.push step_obj
        #partial_step = {}
        #partial_step[step_obj.component.id] = [step_obj.event, step_obj.xxx_event_args()...]
        #partial_step.pause = step_obj.pause
        #partial_steps.push(partial_step)


    [final_steps, label_indices] = Script.expand_partial_steps(
        partial_steps, components)

    # Create an initial step
    # TODO this is duplicated from StageBuilder -- maybe the speech box should
    # just /start out hidden by default/ like EVERYTHING ELSE does?
    # TODO but then that doesn't help with the backdrop, which currently
    # doesn't show here at all, hnngh, i wish this would just do the first step
    # but only if it doesn't have text...  wait, maybe i can just do that
    initial_step =
        "#{speech.id}": ['cutscene:hide']
    if final_steps[0]?
        for component_id, event of final_steps[0]
            component = components[component_id]
            # TODO LOL THIS WON'T FLY.  MAYBE ASK THE DAMN COMPONENT WHAT ITS
            # INITIAL STATE SHOULD BE??
            if component instanceof ImageSpot and component.class? and component.class.match /backdrop/
                initial_step[component_id] = event

    # TODO this is getting really stupid.  needs both kwargs and possibly a
    # distinct 'metdata' block
    return new Script data.name, data.preview, data.title, components, partial_steps, initial_step, final_steps, label_indices, data.subtitle, (if data.date? then new Date(data.date) else null), data.size ? null


class Neurosurgeon
    constructor: () ->

    init: () ->


# TODO i'm increasingly unsure whether this should even be here, or should be a
# oneliner initialization thing in the html
$ ->
    # TODO ok time to write a baby editor, and the baby version of an
    # editor is a viewer.
    # TODO 0: convert old cutscenes into jsons
    # TODO 1: turn "partial steps" into real things (objects!) and let
    # Script resolve them into canonical steps
    # TODO 2: also make "initial step" the problem of the individual
    # components
    # TODO 3: need to make the Brain capable of loading scripts without needing
    # to also populate a dom, OOPS
    # TODO incidentally, can i stop fucking around with component ids and
    # use the Map class or whatever?  does that exist anywhere yet?
    #new Neurosurgeon(document.getElementById 'cutscene-container').init()
    #return

    # TODO it would be nice if the menu just updated automatically when a
    # new thing is loaded, or something?  or maybe the menu mode should
    # just use a separate list
    brain = new Brain($ '#cutscene-container')
    brain.init()
    brain.start()


@start_editor = (sel) ->
    $editor = $ sel
    list = $ '<ol>', class: 'cutscene-editor--script'

    # TODO i have no idea how specifying urls here ought to work
    script = Script.by_name['prompt1-chefs']
    for step in script.partial_steps
        li = $ '<li>'
        list.append li
        proto = Object.getPrototypeOf step
        if proto.constructor is SayLineStep
            if step.xxx_fake_speaker?
                li[0].style.borderColor = step.xxx_fake_speaker.color
                rgb_color = normalize_color step.xxx_fake_speaker.color
                li[0].style.backgroundColor = rgb_color#.replace /^rgb([(].+)[)]$/, "rgba$1, 0.8)"
                li.append $ '<div>', text: step.xxx_fake_speaker.name, class: '-speaker'
            li.append $ '<div>', text: step.text, class: '-line'
        else
            li.text "#{proto.constructor.name} :: #{step.xxx_event_args().join ' / '}"

    $editor.append list



# Exports
@cutscene = { Script, SpeechBubble, ImageSpot }
