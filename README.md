# Nirimation
A host for Niri Animations configurations to be shared using custom shaders built in with GLSL

# Showcase
## This was brought by Posty! Config written by XansiVA

https://github.com/user-attachments/assets/ab2b63ec-8040-456a-aa48-38993233b255

<details>
<summary>Other Videos of Configurations</summary>

https://github.com/user-attachments/assets/db6a82f1-80d8-4be0-8f09-70b281217c69

https://github.com/user-attachments/assets/8f082806-9294-41f9-af31-aeacfb225309

https://github.com/user-attachments/assets/a6490c92-9e5f-4641-8585-da515c9d213e

https://github.com/user-attachments/assets/bdac322f-a53c-4e02-9107-a76124b935f5

https://github.com/user-attachments/assets/4ad228f2-ed69-40dc-8ab3-287480fa4427

https://github.com/user-attachments/assets/a62bb9d3-9fe3-4a35-9c87-d9af3f45c999

https://github.com/user-attachments/assets/0e3e31c5-d14d-463c-a0a5-f1595a83658f

https://github.com/user-attachments/assets/2fa9dd95-5988-48a3-8ec7-a72e72b74be5

https://github.com/user-attachments/assets/0f4a8d7b-211a-4711-b184-8faadb9d32ff

https://github.com/user-attachments/assets/7fac12ba-47f9-4aab-8827-c81bac32e7fc

https://github.com/user-attachments/assets/501297a7-085a-4dcc-bf53-11acb6edee43

https://github.com/user-attachments/assets/fe469e11-6df0-4437-9597-28c9a7e1b2d7

https://github.com/user-attachments/assets/73ab4218-a1dd-434a-ae57-3ca8d237664e

</details>


> **Notice**
> We don't take animation configs that are not **Custom Shaders!**
This means that they must be written in GLSL or any other graphics programming.

# How to use these.
You need a basic knowledge of how config files work.
Usually your niri config should be in `~/.config/niri/config.kdl`.
Open it and scroll down until you see an `animations` line inside of it, you can copy and paste different configs into it.
We only add FULL animation blocks so delete your current animation block in the niri config and replace it with the block you copied.

You are allowed to ask for an animation, contribute, and copy any of them all you like.
Enjoy them!


# Current Issues;
Unravel seems to have a error or non alignment where it does not draw the line based on how long the window is infact it just draws it to the screen width.
Here are the some videos for reference.

# Nix / Home Manager
Add the flake to your inputs and enable the module:
```nix
# flake.nix
inputs.nirimation.url = "github:XansiVA/nirimation";

# home.nix
imports = [ inputs.nirimation.homeManagerModules.default ];

programs.nirimation = {
  enable = true;
  animation = "glitch-cyberpunk";                    # optional
  settings.glitch-cyberpunk.open_duration_ms = 500;  # optional, keys from animations/config.toml
};
```
Then add `include "nirimation.kdl"` to your niri `config.kdl`.

Leave out `animation` and `settings` if you'd rather switch animations with `nirimation apply <name>`. Home Manager makes the files it manages read-only, so `nirimation apply` can't change them.
