This will track the development and creation of at least one keyboard
planned for personal use, but I want to share it with others.

# Gameboard

I've really enjoyed my Logitech G13, but it is now no longer in production and
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

![image](images/redox_01.jpg)

### Design 0.1

(This isn't really the very initial design, as I've been thinking about this
for over a year.)  Taking a few things from my experiments I created my own
layout using the awesome [Keyboard Layout
Editor](http://www.keyboard-layout-editor.com/).  I started with the Ergodox
layout and made some changes:

![switch_plate_0_1.svg](images/switch_plate_0_1.svg)

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

![image](images/keyboard_0_1.jpg)

#### Post-print thoughts

Merely extruding the shape from the keyboard layout editor resulted in the switches not snapping into place. The redox plate model has cutouts to allow the the clips on the switches to hold them in place. This will be included in the next design. I'm also going to move away from Tinkercad, so I won't attempt using modeling clay with this design. 

### Design 0.2

I switched from using Tinkercad to writing OpenSCAD script. I used it in previous projects and liked the control it gave me to accurately create shapes.

#### OpenSCAD

I started by creating a function to create the switch hole. Having the plate thickness as a variable allowed me to create the slot for the switch to properly snap into.

The next function takes a list of key positions and sizes (based on the coordinates of the keyboard layout editor).

Using the same coordinates for the switches I used two of my favorite commands in OpenSCAD: `hull` and `minkowski`. Each of these combine 3d solids to form new solids. This allowed me to create the plate that I then `difference` with the switch holes.

After I had my script working, OpenSCAD allows me change variables and see the changes to my model. Changing these variables let me create a pleasing plate to use for my next design. [Switch plate 0.2](stl/switch_plate_0_2.stl)

![plate_0_2](images/switch_plate_0_2.png)

When working on the base I had to update the version of OpenSCAD that I was using. I used the `rotate_extrude` command in OpenSCAD and versions prior to the 2016 versions do not include rotating a particular angle instead of the full 360 degres. I am currently using the March 2018 dev snapshot. [Base 0.2](stl/base_0_2.stl)

![base_0_2](images/base_0_2.png)

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

* Cherry-MX (or compatible keyswitches)
  * I purchased Gateron Reds for smooth gaming action.
* Cherry-MX keycaps
  * I bought an Ergodox-based set so that I had the right number and profile of keys
* Microcontroller
  * [Teensy 3.2](https://www.pjrc.com/store/teensy32.html)
  * [Teensy LC](https://www.pjrc.com/store/teensylc.html)
  * [Arduino Pro Micro](https://www.sparkfun.com/products/12640)
* Bunch of diodes
* 3D printer with TBDxTBDxTBD build volume
  * [Monoprice Maker Select](https://www.monoprice.com/product?p_id=13860)
* Lots of PLA for test prints
* [Thumb joystick](https://www.sparkfun.com/products/9032)
  * [Breakout board](https://www.sparkfun.com/products/9110)
  * Alternative [Slide joystick](https://www.sparkfun.com/products/9426)
    * I like the size and low profile, but fear I will have issues with it slipping.
* Thin wire (~24 gauge)


# [Ergodox](https://www.ergodox.io)

Depending on how the build process goes on my gameboard, I will have
spare parts to start work on an Ergodox. The alternative will be purchasing a Kinesis Advantage.
