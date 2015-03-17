-- conf.lua
-- use this in place of your games normal conf.lua to see how it deals
-- with some common, or likely, limitations of uLove-targeted platforms.
--
-- Bare in mind, this is by no means a complete test, but its a minimal
-- benchmark; if it can't run under this, then you are definitely going to
-- have problems.
function love.conf(t)
    t.title             = "Metro runner"
    t.author            = "vstebunov"
    t.version           = 60
    t.console           = false


    t.screen.width      = 800 
    t.screen.height     = 600
    t.screen.fullscreen = false                     -- this is likely to be true
                                                    -- on an uLove target, but few modern systems
                                                    -- actually support this res ...so, yeah.

    t.screen.vsync      = true                      -- actually could go either way on a uLove
                                                    -- platform, but anything to bring your
                                                    -- FPS down, lest you forget that most
                                                    -- uLove targets are likely to be sub-500MHz
    t.modules.joystick  = true
    t.modules.audio     = true
    t.modules.keyboard  = true                      --  if you actually have a game pad, you
                                                    -- should make sure your game can be played
                                                    -- *entirely* using that that. and no cheating with
                                                    -- "pro" gamepads; we're talking one D-pad, A, B,
                                                    -- R, L, Start, and Select. and that's generous.
    t.modules.event     = true
    t.modules.image     = true
    t.modules.graphics  = true
    t.modules.timer     = true
    t.modules.mouse     = false                     -- there are far more portables without
                                                    -- mouse-like input, than those with.
    t.modules.sound     = true
    t.modules.physics   = false                     -- aw, you thought uLove platforms were powerful
                                                    -- enough to run physics, that's cute ^_^
    Animations_legacy_support = true 
end

