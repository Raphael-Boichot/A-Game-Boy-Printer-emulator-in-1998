            Gameboy Printer Emulator

                Version 2.0 

           Release date: 21-Dec-98

            Copyright M. Eyre 1998
  
DESCRIPTION:
------------
You can use the Gameboy Printer Emulator to download photos from the Gameboy 
Camera into a PC via the parallel port.

DISCLAIMER:
-----------
The Gameboy Printer Emulator is Freeware; you are allowed to use it in any way 
you want, without paying me anything. The only thing I want in return are 
bug-reports and enhancement-requests, which can be mailed to 
Martin.Eyre@crispgroup.co.uk

You are also allowed (and encouraged) to distribute this software, as long
as you don't receive any payment for it. 

Keep in mind that you use this software at your own risk; any damage which 
might occur, in whatever form, is your own responsibility.

FILE LIST:
----------

GBCAM2.EXE	- The GB Printer emulator EXE 
GBPIC999.DAT	- Default photo
GBPIC???.SMP	- Stamp files
GBPIC???.FRA	- Frame Files
PAL.DAT		- Default palette
SETUP.DAT	- Current Setup options

USEAGE:
-------

The software is used to download photos from the gameboy.  It emulates the gameboy
printer.  Photos that are downloaded can be saved to disk and are stored in individual 
data files (GBPIC???.DAT).  Upto 40 photos can be stored in an album. 

Editing Photos

Basic drawing tools are provided to draw lines and boxes.
Stamps can be but onto the photo as well as modifying the frame.

The current photo can be exported to a number of different formats :-

Bmp       - Windows Bitmap (.bmp)
Pcx       - ZSoft PCX Format (.pcx)
Tile(TE)  - Tile Editor format (.gbr)
Tile(GB)  - GB Tile File (.gbt)
Tile C    - C Code (.c) !!! Not fully working		
Text      - Text File (.txt)

An area can be selected for exporting :-

All       - all data exported
Photo     - photo data only
Frame     - Frame and photo data

PRINT
-----

To enable to print the following cable is required :-

GB               PC
--               --
Pin   DATA IN    Pin 1   (Not used for printing)
Pin   DATA OUT   Pin 4
Pin   CLK        Pin 5
Pin   GND        Pin 18

The Print button will send the current picture to the Gameboy printer.
Use the options to set Photo or Frame (All may not work with large photos).
Slider bars allow the following options to be changed :-

S - Data send delay rate - (This is trial and error I found 30 was ok) 
    Set the rate to the top to start with
B - Number of line feeds before printing
A - Number of line feeds after printing 
E - Exposure, make print darker or lighter


CONTACT INFO:
-------------
I can be contacted though E-Mail at: Martin.Eyre@crispgroup.co.uk

KNOWN PROBLEMS
--------------

a. Printing only works with small sized photos.
b. Speed delay rate - soon to be changed to timer interupt
c. Export to C file not working correctly.
d. Max size of photo is around 60k.

HISTORY:
--------
  Version   Date:        Description:

  2.0      21 Dec 1998   New User Interface

  1.3       7 Sep 1998   Added Print button and print options.

  1.2       1 Sep 1998   Added Export to BMP file.
                         Added Export to PCX file.
                         Added Export to GBR file.
                         Added Export to C file.
                         Added Export to tile file.
                         Added Export to Text file 
                         (Only works straight after download)	

  1.1      25 Aug 1998   Fixed bug where only one line is read in.
                         Allowed upto 40 photo in album.
                         Blanked picture if not in album.

  1.0(Beta)20 Aug 1998   Initial release