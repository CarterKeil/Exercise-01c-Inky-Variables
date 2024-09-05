/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR Health = 10

VAR Cealth = 5

VAR Pet_name = ""

VAR Torches = 0

-> Memory

==Memory==
Before you is the Mouth of the Carvern
If you wish you may summon a creature to accompany you throughout your journey.

+ [Imp]
    ~ Pet_name = "Imp"
    -> Imp
    
+ [Puedodragon]
    ~ Pet_name = "Peudodragon"
    -> Puedodragon

+ [Quasit]
    ~ Pet_name = "Quasit"
    -> Quasit

==Imp==
Are you sure you want this creature?
+[Yes] -> cave_mouth
+[No] -> Memory

==Puedodragon==
Are you sure you want this creature?
 +[Yes] -> cave_mouth
+[No] -> Memory

==Quasit==
Are you sure you want this creature?
+[Yes] -> cave_mouth
+[No] -> Memory

== cave_mouth ==
You enter the a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

{Pet_name} Is sitting on your shouder and starring into deeper into the cave

You have {Torches} Torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {Torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. It is very dark, you can't see anything.
* {Torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
You pick up the torch, your {Pet_name} stares into the fire with its big eyes.
 ~ Torches = Torches +1
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
 ~ Torches = Torches -1
-> END

== west_tunnel_lit ==
The room has a locked chest
~ Torches = Torches -1
* [Attempt to open the chest] ->Chest
* [Go Back] -> cave_mouth

==Chest==
The Chest jumpes out at you

{Pet_name == "Imp": {Pet_name} Throws fire at the Chest Mimc} -> Chest_Damage

{Pet_name == "Puedodragon": {Pet_name}Spits fire at the Chest Mimic} -> Chest_Damage

{Pet_name == "Quasit": {Pet_name} Slashes at the Chest Mimc} -> Chest_Damage

==Chest_Damage==

Mimc tooks 1 Damage it is now at

 ~ Cealth = Cealth -1
{Cealth} 

The Mimc bites towards you, you take 1.5 Damage

 ~ Health = Health -1.5

{Health}

+ {Cealth != 0}[Attack] -> Chest_Damage
* {Cealth == 0} [You Win!!!] -> WIN

==WIN==
The Mimic starts spewing Gold from its body
-> END