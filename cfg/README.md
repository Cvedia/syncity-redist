## Config templates

This is a repository for `scripts` that contain special configurables.

A configurable is nothing but a JSON file with parameters for a `script`, this allows for a way
to configure scripts without really changing the python logic beneath, although has a drawback of
a more rigid and complex logic into the python script itself.

The idea of configurables is to provide yet another way to interact with the simulator, as
after you created a scene you could programtically configure arbitrary parameters on the scene
to add more entropy without manually fiddling with logic.