This will track the development and creation of at least one keyboard
planned for personal use, but I want to share it with others.

# Gameboard

I've really enjoyed my G13, but it is now no longer in production and
replacements are expensive. I've long thought about making my own
mechanical gameboard as an upgrade. My starting point is a left-half
[Ergodox](https://www.ergodox.io). I will be removing the thumb
cluster and replacing it with a small gamepad joystick.

## Features

Here are a few of my desired features:

* More buttons than the G13
* Better joystick
* Mechanical keys
* Customizable key bindings (firmware updates OK for this)
* Mode switching (layers, profiles for different game types)
* Red Cherry-compatible switches
* Column stagger or ortholinear layout
* NKRO support
* Maybe support for a foot pedal
* Fit on a 180x180 3D printer build plate

## Layout

I liked the base layout of the Ergodox, but I wanted to both make some
modifications to it as well as look at what others have done.

### Redox

I liked the look of the
[Redox](https://www.thingiverse.com/thing:2704567) that I found on
Thingiverse. I also used the [tilted
Redox](https://www.thingiverse.com/thing:2767216) that I found there
as well. I knew these weren't the final layout, but I wanted to do
some test prints as well as look at ideas from others. 

#### What I learned from printing the Redox (tilted)

I liked many of the changes from the original Ergodox, but I ran into
one huge issue: keycaps. This layout uses a bunch of 1.25u keys (which
I wish Ergodox had used as well), but I couldn't find a decent keycap
set that would work with this layout. I think if you were building a
Redox, you'd have to use a DSA profile set of keycaps from a standard
keyboard. This probably isn't a big deal, but I really wanted
something with different profiles by rows.

I also felt that the tilt was too much for a gaming half-keyboard. In
playing with my own layout later, I settled on a 7 degree tilt instead
of the 15 degree from the Thingiverse model.

I really liked the mounting screw design and filleted edge to the top
of the model. I hope to reproduce this in my own work.

### Design 0.1

(This isn't really the very initial design, as I've been thinking about this
for over a year.)  Taking a few things from my experiments I created my own
layout using the awesome [Keyboard Layout
Editor](http://www.keyboard-layout-editor.com/).  I started with the Ergodox
layout and made some changes:
[switch_plate_0_1.svg](images/switch_plate_0_1.svg)

#### Changes from Ergodox

* Removed right hand
* Removed thumb cluster
* Changed the inside column to be 1.5u, 1u, 1u keys instead of 1u, 1.5u, 1.5u
  * I feel this provides a more natural reach for the keys

#### Creating the model

I used Tinkercad to extrude the .png and then spent a lot of time manipulating
it to have some rounded corners and a tilted base. The models that I ended up
with are [switch_plate_0_1.stl](stl/switch_plate_0_1.stl) and
[base_0_1.stl](stl/base_0_1.stl). I left out the joystick portion as I was
having enough difficulty with Tinkercad that I knew it would just be painful to
keep iterating to get the joystick in the right place. The 1.0 plan was to be
printed, and then use modeling clay to figure out where to place the SparkFun
joystick breakout board to get the joystick in a comfortable postion and
include that in the next version.

## Microcontroller

* I want a microcontroller that can be a keyboard and joystick, simultaneously
* Started with a Teensy 3.2
  * Certainly most of the keyboard work for TMK and QMK use ATMEL mcus vs. ARM-based ones
  * Overkill for what I'm doing
  * Will likely reuse the Teensy 3.2 for a different project
* Have ordered a Teensy LC and Arduino Pro Micro
  * LC has the keyboard / joystick features I'm looking for
  * Arduino Pro Micro may be a better first start

## Parts list

* Red Cherry-MX (or compatible keyswitches)
  * I purchased Gateron Reds
* Cherry-MX keycaps
  * I bought an Ergodox-based set so that I had the right number and profile of keys
* Teensy LC microcontroller
* Bunch of diodes
* 3D printer with TBDxTBDxTBD build volume
* Lots of PLA for test prints
* Thin wire (~24 gauge)


# [Ergodox](https://www.ergodox.io)

Depending on how the build process goes on my gameboard, I will have
spare parts to start work on an Ergodox.
