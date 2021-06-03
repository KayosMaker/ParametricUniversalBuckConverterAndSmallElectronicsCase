# Parametric Universal Buck Converter and Small Electronics Case
 
This OpenSCAD script will generate a 3d printable enclosure for small electronics such as buck converters, relay boards, and more.  Nearly all aspects of the design are parametric in nature, allowing a great deal of flexibility and control over the output.  Optional features include:

* compatible with 2 and 4 hole PCBs
* pcb mounting options include screwholes, printed posts, or even a combination of both(only possible for 4 hole pcb's)
* optional cooling slots
* internal zip tie points for strain relief which print on almost any printer with no support(bridging enabled in slicer)
* single or dual mounting ears(or neither)
* case can be configured for snap fit, 2-hole, or 4-hole closure


## Getting Started

To use this file you'll need OpenSCAD: https://www.openscad.org


## Notes for Usage

There are a lot of options in this file, particularly when it comes to mounting and closure.  Start by getting the basic measurements of your board into the file, and doing a basic preview to get something close to right on screen, to help you visualize what options you want to use or skip.  The options are well commented, though all the comments won't show in the customizer.  Read the comments well to understand what each feature does and how to implement it.  I tried to be thorough in my comments, and I'll expand on anything I find lacking now that it's here on github.  Use a small radius to get the most printable files.  large radii look great but create what is essentially an unprintable overhang at the bed.  I plan on creating a branch to make an attempt at a chamfered body instead of the radiused one, using all the same features I've implemented into this one.

This file is how I started to learn openscad, and is very much a work in progress full of screwups and solutions that take the long way around a problem.  For now it works and is easy to fit to any little board.  I will continue to work on it and iron out redundancies over time.


## Built With

[OpenSCAD](https://www.openscad.org/)


### Credit
Thanks to gtcdma, the original author of the basic enclosure, available at: https://www.thingiverse.com/thing:1625233

All modifications from the original were done by me, Kayos Maker.
