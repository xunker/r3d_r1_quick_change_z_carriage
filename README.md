Quick-change Z-Carriage for Robo 3D R1
======================================

This is a replacement Z-Carriage (for Robo 3D R1) that allows for quick removal
of X-carriage and X-rods without disassembling the printer.

__This is still a work in progress and is not ready to be used.__

This is based on parts of
[Complete RoBo3D Printer](https://www.thingiverse.com/thing:729956)
by [Mike Kelly](https://www.thingiverse.com/mkelly).

### TODO
* Add changelog
* Redo clamp design
  * Releasable without removing belt, motor, or idler pulley
    * Maybe not important, since you need need to release the belt to remove the X-carriage anyway
  * Releasable without removing X-endstop
    * Make X-endstop be built in to clamp?
  * Template-ized so it's the same for all four corners, only requiring `mirror()`.
* Build Left (idler) side
* Clean up code for Right (motor) side
* Sizing / Fitting / Calibration test piece generation
* Move original source STLs to subdirectory to avoid confusion
* Photos
* Video
* Add to:
  * Thingiverse
  * MyMiniFactory
  * YouMagine
