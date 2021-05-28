# Parametric Universal Buck Converter and Small Electronics Case
 
This OpenSCAD script will generate a 3d printable enclosure for small electronics such as buck converters, relay boards, and more.  Nearly all aspects of the design are parametric in nature, allowing a great deal of flexibility and control over the output.  Optional features include:

-fully parametric basic dimensions that will self-adjust to the dimensions of your board, and its screw hole locations(as measured by you)

-mounting for 2 and 4 hole boards

-choice of plastic mounting posts, screw holes, or neither(flat pad).  this allows you to choose the best method of mounting for your application

-4 hole devices can mix and match, using plastic posts at two corners, and screw holes at the other two.  or screw holes and flat pads

-optional cooling slots in the lid

-optional mounting ears with user controlled dimensions.  choice between one mounting ear, or two

-optional screw closure for the two halves.  the snap fit works well but some applications require a more secure hold.  you can choose between 2 hole closure, 4 hole closure, or friction fit only.


## Getting Started

To use this file you'll need OpenSCAD: https://www.openscad.org


## Notes for Usage

There are a lot of options in this file, particularly when it comes to mounting and closure.  Start by getting the basic measurements of your board into the file, and doing a basic preview to get something close to right on screen, to help you visualize what options you want to use or skip.  The options are well commented, though all the comments won't show in the customizer.  Read the comments well to understand what each feature does and how to implement it.  I tried to be thorough in my comments, and I'll expand on anything I find lacking now that it's here on github.  Use a small radius to get the most printable files.  large radii look great but create what is essentially an unprintable overhang at the bed.  I plan on creating a branch to make an attempt at a chamfered body instead of the radiused one, using all the same features I've implemented into this one.

This file has a lot of work to go to be where I want it.  For now it works and is easy to fit to any little board.  

### Credit
Thanks to gtcdma, the original author of the basic enclosure, available at: https://www.thingiverse.com/thing:1625233

All modifications from the original were done by me, Kayos Maker.
