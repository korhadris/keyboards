BThis will track the development and creation of at least one keyboard
planned for personal use, but I want to share it with others.

# Gameboard

I've really enjoyed my G13, but it is now no longer in production and
replacements are expensive. I've long thought about making my own
mechanical gameboard as an upgrade. My starting point is a left-half
[Ergodox](https://www.ergodox.io). I will be removing the thumb
cluster and replacing it with a small gamepad joystick.

## Features

Here are a few of my wanted features:

* More buttons than the G13
* Better joystick
* Mechanical keys
* Customizable key bindings (firmware updates OK for this)
* Mode switching
* Red Cherry-compatible switches
* Column stagger or ortholinear layout
* NKRO support
* Maybe support for a foot pedal

## Changes from Ergodox

* Removed thumb cluster
* Changed the inside column to be 1.5u, 1u, 1u keys instead of 1u, 1.5u, 1.5u
  * I feel this provides a more natural reach for the keys

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
