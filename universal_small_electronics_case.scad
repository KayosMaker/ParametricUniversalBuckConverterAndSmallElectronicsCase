/*
* Universal Small Electronics Mounting Case
* ======================================================================================================
* remixed from the following file on thingiverse, by gtcdma : https://www.thingiverse.com/thing:1625233
* remix by Kayos Maker
* ======================================================================================================
*
*       Features
* - compatible with 2 and 4 hole PCBs
* - mount PCB on plastic posts or with screws
* - configurable optional cooling slots
* - internal zip tie points for strain relief which print on almost any printer with no support(bridging enabled in slicer)
* - configurable single or dual mounting tabs
* - optional 2 or 4 hole screw closure(set up for m3 screws but can be altered with care)
*
*   
*       USAGE NOTES
*   Generally speaking, read all the comments.  Each variable is commented in order to clarify it's purpose in the overall design.  Variables are grouped into sections according to relevance.   
*
* ======================================================================================================
*
*       Current Version v2.12   5/29/2021
*
*       Changelog
* v2.12 - add feature wishlist to keep myself motivated, and remind myself what to work on after a long absence (5-29-2021)
* v2.11 - remove trimpot hole(pita to measure accurately - remove the lid for adjustments)
*       - reformat variables section for customizer (its harder for me to read but it should be easier for non-openscadders to use now)
* v2.10 - add optional cooling slots to lid  (4-16-2021)
*       - add optional screwholes to mounting options
*       - add options for 4 hole pcbs
*       - add optional 2 or 4 hole case closure, in addition to original friction fit
*       - add mounting ear/s option
* v2.00 - reformat for my editting preferences, will fix later for customizer
* v2    - establish new version for my changes 
* v1    - no version info from orig file or contact info for author.  we'll call it 1.0
*
*        Feature Wishlist / To-Do list
* - asymmetrical pcb options
* - chamfer/radius option
* - rework language in comments to more clearly describe how features work
* - add sensible limits and easy to undersand options for customizer based use of the file
* - add option to render only one or both components, for ease of creating separate stl's
*/
// ======================================================================================================
//   USER DEFINABLE VARIABLES   

/*[PRIMARY PCB DIMENSIONS (in mm)]*/

//PCB Length - wireholes align with this axis, so if you want the holes on the long sides of your enclosure, swap your x and y values for everything
pcb_x = 54;

//PCB Width - add some padding if you dont wish it to be a snug fit side to side
pcb_y = 24.5; 

//PCB Height - measure from the pcb underside to the top of the highest component
pcb_ht = 17; 

//Mounting Holes X - distance between mounting hole centers, on X axis
holes_x = 35;   

//Mounting Holes Y - same as above on Y axis - in both cases measure as if there were 4 holes(even if it's a 2 hole device), not on the diagonal
holes_y = 18.5;   




/*[PCB MOUNTING OPTIONS]*/

//Each pair of mounting locations can only use posts or holes, not both.  If you use all 4 mounting points you can use posts at one pair of locations, and screwholes at the other pair.


//                post/hole      A       B
//                positions          
//                               C       D
//



/*[PCB STANDOFFS]*/

//Standoff Height - create clearance for PCB bottom, and/or depth for screwholes - this is the pad the PCB will sit on, and will host either a mounting post, mounting hole, or neither(flat), based on your selections
standoff_ht = 4;

//Standoff Diameter - this forms the pad/ledge against which the pcb is secured, it should be larger than the mounting hole/post dia.  this also determines how much meat there will be surrounding screwholes, if selected as a mounting option.  
standoff_dia = 5;



/*[PCB MOUNTING POSTS]*/

//Posts at positions A and D - this is the standard setup for most PCBs with two diagonally oriented mounting holes - 0:false, 1:true
post_ad = 1;//[0,1]

//Posts at positions B and C - primarily to be used with 4 hole PCBs - you may use two posts and two screw holes in order to save two screws, but still have a very solid mount - 0:false, 1:true
post_bc = 0;//[0,1]

//Post Diameter - dont make these too snug a fit, as they can tend to snap off if they are too tight.  
post_dia = 2.7;

//Mounting Post Height - This doesn't need to be much more than a nub if it's to be part of a 4 hole mounting setup.  They can be made taller and have a dab of silicone applied atop them to act as a fastener free securing method. 
post_ht = 4;

           

/*[PCB MOUNTING HOLES]*/  

//set "0" for no holes at A/D positions, "1" for holes
hole_ad = 0;

//set "0" for no holes at B/C positions, "1" for holes
hole_bc = 1;

//screwhole diameter - hole depth is equal to standoff height - plan screw length there 
hole_dia = 2.9;


                            
/*[BODY SHELL and RADIUS]*/

//body shell thickness - multiple of nozzle width recommended
thickness = 1.6;            

//body fillet radius - numbers below 2 will cause issues - the model is built on the rfillet
rfillet = 3;                


                            
/*[WIRE ENTRY HOLES DIAMETER]*/             

//wire entrance/exit hole dia
dwires = 4.5;               



/*[LID COOLING SLOTS]*/

//# cooling slots on lid - use "0" for no slots
slots = 9;                  

//individual slot width as percentage  0.5 is 50/50 balanced open/closed - increase to widen slots, decrease to narrow slots - values between 0.1-0.9 recommended
slot_width = 0.7;           



/*[CASE MOUNTING EARS]*/

//mounting ear width - use 0 here to have no ears
ear_width = 10;             

//mounting ear length - should be longer than rfillet
ear_length = 15;          

//ear screwhole diameter
ear_hole = 4;   

//use "0" to have only one mounting ear.  use "ear_width" for pair of matched ears
ear2_width = ear_width;     


/*[CASE CLOSURE SCREWS]*/

//enables or disables screw closure - "1" for screwholes,  "0" for friction fit 
closure_screws = 1;         
                            //
//enables or disables streamlining the enclosure screwholes as they appear on the outside.  printing will be easier with this disabled - "0" for a fully streamlined exterior, "1" for a countersink opening that is flat(will protrude from large radiused enclosure corners)                             
screwhole_shave = 1;        

//set "0" for no closure holes at A/D positions, "1" for holes
closure_ad = 0;             

//set "0" for no closure holes at B/C positions, "1" for holes
closure_bc = 1;             



/*[CLOSURE SCREW PARAMETERS]*/
//closure screw parameters.  change at your own risk.  

//holes threads should pass through freely
top_id = 3.6;  

//countersink diameter for screwhead
top_cs_dia = 6.1;   

//countersink depth
top_cs_depth = 3.3;    

//screwhole the screw grabs into - better tight than loose
bottom_id = 2.9;                        
                         


//nothing below needs to be changed to use the file as is
//if you make new features(or fix my mess in ways) that are useful, share the new file
/* [Hidden] */
//------------------------------------------------------------------------------------------------------------   

shaft_od = top_cs_dia+thickness*2;      //determines the meat for the countersink, and helps
                                        //adjusts the overall length of the enclosure to accomodate it if necessary 


pcb_z = pcb_ht+standoff_ht;

slot_spread = (pcb_y-(rfillet+1))/((slots*2)+1);

int_x = pcb_x + 10+((shaft_od*2-10)*closure_screws);   

$fn=64;

//---------------------


bottom();
translate([0, pcb_y + 10, 0]) top();      


//---------------------


module bottom() 
{
    difference() {  
        union() {
            base();  
            
            //ziptie mounts
            difference() {
                union() {
                    translate([-int_x/2, -(dwires+1)/2, -pcb_z/2]) cube([4.5, dwires+1, pcb_z/2-dwires/2.5]);
                    translate([int_x/2-4.5, -(dwires+1)/2, -pcb_z/2]) cube([4.5, dwires+1, pcb_z/2-dwires/2.5]);
                }
                translate([-int_x/2, -(dwires+1)/2-.1, -pcb_z/2+1]) cube([3.2, dwires+1+.2, pcb_z/2-dwires/2-3]);
                translate([int_x/2-3.2, -(dwires+1)/2-.1, -pcb_z/2+1]) cube([3.2, dwires+1+.2, pcb_z/2-dwires/2-3]);
            }
        }
        
        base_shaver_b();

        
        wireholes();
        translate([0,0,pcb_z+2])cube([pcb_x*2, pcb_y*2, pcb_z*2], center = true);       

        //clamshell connection
        difference() {
                translate([0,0,2])cube([pcb_x*2, pcb_y*2, 4], center = true);
                rcube([int_x + thickness, pcb_y + thickness, pcb_z + thickness], rfillet - thickness/2, center = true);  
        }          
            
    }
    
    //pcb mounting posts/screwholes
    difference() {
        union(){
            translate([-holes_x/2, holes_y/2, -pcb_z/2]) cylinder(d = standoff_dia, h = standoff_ht);   //A
            translate([holes_x/2, holes_y/2, -pcb_z/2]) cylinder(d = standoff_dia, h = standoff_ht);    //B
            translate([-holes_x/2, -holes_y/2, -pcb_z/2]) cylinder(d = standoff_dia, h = standoff_ht);  //C    
            translate([holes_x/2, -holes_y/2, -pcb_z/2]) cylinder(d = standoff_dia, h = standoff_ht);   //D
            translate([-holes_x/2, holes_y/2, -pcb_z/2+standoff_ht]) cylinder(d = post_dia*post_ad, h = post_ht);      //A
            translate([holes_x/2, holes_y/2, -pcb_z/2+standoff_ht]) cylinder(d = post_dia*post_bc, h = post_ht);       //B
            translate([-holes_x/2, -holes_y/2, -pcb_z/2+standoff_ht]) cylinder(d = post_dia*post_bc, h = post_ht);     //C
            translate([holes_x/2, -holes_y/2, -pcb_z/2+standoff_ht]) cylinder(d = post_dia*post_ad, h = post_ht);      //D
        }
        translate([-holes_x/2, holes_y/2, -pcb_z/2]) cylinder(d = hole_dia*hole_ad, h = standoff_ht+1);      //A
        translate([holes_x/2, holes_y/2, -pcb_z/2]) cylinder(d = hole_dia*hole_bc, h = standoff_ht+1);       //B
        translate([-holes_x/2, -holes_y/2, -pcb_z/2]) cylinder(d = hole_dia*hole_bc, h = standoff_ht+1);     //C
        translate([holes_x/2, -holes_y/2, -pcb_z/2]) cylinder(d = hole_dia*hole_ad, h = standoff_ht+1);      //D
        
        translate([-holes_x/2, holes_y/2, -pcb_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_ad, d1 = hole_dia*hole_ad, h = (standoff_dia - hole_dia)/2);      //
        translate([holes_x/2, holes_y/2, -pcb_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_bc, d1 = hole_dia*hole_bc, h = (standoff_dia - hole_dia)/2);       //
        translate([-holes_x/2, -holes_y/2, -pcb_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_bc, d1 = hole_dia*hole_bc, h = (standoff_dia - hole_dia)/2);     //
        translate([holes_x/2, -holes_y/2, -pcb_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_ad, d1 = hole_dia*hole_ad, h = (standoff_dia - hole_dia)/2);      //
    }
    
    
    //closure screwholes 
    difference() {
        union() {
            translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_ad*closure_screws, h = pcb_z/2+1);        //A
            translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_bc*closure_screws, h = pcb_z/2+1);         //B
            translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_bc*closure_screws, h = pcb_z/2+1);       //C
            translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_ad*closure_screws, h = pcb_z/2+1);        //D
        }
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2]) cylinder (d = bottom_id, h = pcb_z/2+2);
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2]) cylinder (d = bottom_id, h = pcb_z/2+2);
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2]) cylinder (d = bottom_id, h = pcb_z/2+2);
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2]) cylinder (d = bottom_id, h = pcb_z/2+2);
        
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-(.5*thickness)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2);  
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-(.5*thickness)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2); 
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-(thickness*.5)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2);  
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-(thickness*.5)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2); 
    }
    
    
    //mounting ears
    difference() {
        union() {
            translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)/2-rfillet, 0, -pcb_z/2-thickness/2]) cube([ear_length+rfillet-ear_width/2,ear_width,thickness],center = true);
            translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet, 0, -pcb_z/2-thickness])  cylinder(d=ear_width, h=thickness);
            translate([int_x/2+(thickness+rfillet)/2,0,-pcb_z/2-thickness+(rfillet*1.5)/2])  cube([thickness+rfillet,ear_width,rfillet*1.5], center = true);
    
            translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)/2-rfillet), 0, -pcb_z/2-thickness/2]) cube([ear_length+rfillet-ear2_width/2,ear2_width,thickness],center = true);
            translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet), 0, -pcb_z/2-thickness])  cylinder(d=ear2_width, h=thickness);                  
            translate([-(int_x/2+(thickness+rfillet)/2),0,-pcb_z/2-thickness+(rfillet*1.5)/2])  cube([thickness+rfillet,ear2_width,rfillet*1.5], center = true);        
        }
    
        translate ([int_x/2+thickness+(ear_length+rfillet)/2,0,-pcb_z/2+rfillet]) rcube([ear_length+rfillet,ear_width+rfillet*2,rfillet*2],rfillet,center=true);        
        translate ([-(int_x/2+thickness+(ear_length+rfillet)/2),0,-pcb_z/2+rfillet]) rcube([ear_length+rfillet,ear2_width+rfillet*2,rfillet*2],rfillet,center=true);   
        
        translate ([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet,0,-pcb_z/2-thickness]) cylinder(d = ear_hole, h=thickness*4, center=true);        
        translate ([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet),0,-pcb_z/2-thickness]) cylinder(d = ear_hole, h=thickness*4, center=true); 
        
        
        translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet,0,-pcb_z/2-thickness/6]) cylinder(d2 = ear_hole+thickness*4, d1 = ear_hole, h = thickness*2);  
        translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet),0,-pcb_z/2-thickness/6]) cylinder(d2 = ear_hole+thickness*4, d1 = ear_hole, h = thickness*2);
       
       wireholes(); 
        
    }
       

    
}




module top() 
{
    
    
    difference() {    
        base();
        wireholes();
        translate([0,0,pcb_z])cube([pcb_x*2, pcb_y*2, pcb_z*2], center = true);    
        
        //clamshell connection
        intersection() {                                                                            
            rcube([int_x + thickness, pcb_y + thickness, pcb_z + thickness], rfillet - thickness/2, center = true);
            translate([0,0,0])cube([pcb_x*2, pcb_y*2, 4], center = true);
        }
        
        
        //cooling slots
        translate ([0,-((slots-1)*slot_spread),0])
        cooling_slots( slots, slot_spread*2) rcube([int_x-rfillet*2 , slot_width*(2*slot_spread) ,thickness+3],rfillet=(slot_width*(2*slot_spread))/2,center=true);
        
        
        //closure screwhole voids for some reason need to be here too in order to work properly cause im a noob and dont know the right way to do things
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_bc*closure_screws, h = pcb_z/2);             //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_ad*closure_screws, h = pcb_z/2);              //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_ad*closure_screws, h = pcb_z/2);            //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_bc*closure_screws, h = pcb_z/2);             //B
        
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_cs_dia*closure_bc*closure_screws, h = top_cs_depth);      //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_cs_dia*closure_ad*closure_screws, h = top_cs_depth);       //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_cs_dia*closure_ad*closure_screws, h = top_cs_depth);     //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_cs_dia*closure_bc*closure_screws, h = top_cs_depth);      //B
        
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);       //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);     //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //B
    }
    //closure screwholes 
    difference() {
        union() {
            translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = (shaft_od)*closure_bc*closure_screws, h = pcb_z/2-2+thickness-.5);             //C
            translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = (shaft_od)*closure_ad*closure_screws, h = pcb_z/2-2+thickness-.5);              //D
            translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = (shaft_od)*closure_ad*closure_screws, h = pcb_z/2-2+thickness-.5);            //A
            translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = (shaft_od)*closure_bc*closure_screws, h = pcb_z/2-2+thickness-.5);             //B
        }
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_bc, h = pcb_z/2+thickness);             //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_ad, h = pcb_z/2+thickness);              //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_ad, h = pcb_z/2+thickness);            //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness]) cylinder (d = top_id*closure_bc, h = pcb_z/2+thickness);             //B
        
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_bc, h = top_cs_depth+.5);      //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_ad, h = top_cs_depth+.5);       //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_ad, h = top_cs_depth+.5);     //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_bc, h = top_cs_depth+.5);      //B
        
        translate([-int_x/2+shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //C
        translate([int_x/2-shaft_od/2,pcb_y/2-shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);       //D
        translate([-int_x/2+shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);     //A
        translate([int_x/2-shaft_od/2,-pcb_y/2+shaft_od/2,-pcb_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //B
        
        base_shaver();
    }     

    
}
    
    
    




module base () 
{
    difference() {
        rcube([int_x + thickness*2, pcb_y + thickness*2, pcb_z + thickness*2], rfillet, center = true);
        rcube([int_x, pcb_y, pcb_z], rfillet-thickness, center = true);

    }
}


module base_shaver ()   //used to remove protruding geometry after screwholes are added to the top half
{
    difference() {
        cube([int_x+10*screwhole_shave, pcb_y+10*screwhole_shave, pcb_z*2*screwhole_shave], center = true);
        rcube([int_x + thickness*2, pcb_y + thickness*2, pcb_z + thickness*2], rfillet, center = true);
    }
}

module base_shaver_b ()   //used to remove protruding geometry after screwholes are added to the top half
{
    difference() {
        cube([int_x+10, pcb_y+10, pcb_z*2], center = true);
        rcube([int_x + thickness*2, pcb_y + thickness*2, pcb_z + thickness*2], rfillet, center = true);
    }
}
        
        
module wireholes() 
{
    hull() {
        rotate([0, 90, 0]) cylinder(d = dwires, h = int_x+thickness*2, center = true);  
        translate([0,0,4]) rotate([0, 90, 0]) cylinder(d = dwires, h = pcb_x+rfillet*2+thickness*2, center= true); 
    }
    
    hull() {
        translate([int_x/2+thickness,0,0]) rotate([0, 90, 0]) cylinder(d1 = dwires, d2 = dwires+2, h = thickness*0.5, center = true);  
        translate([int_x/2+thickness,0,4]) rotate([0, 90, 0]) cylinder(d1 = dwires, d2 = dwires+2, h = thickness*0.5, center= true); 
    }
    hull() {
        translate([-int_x/2-thickness,0,0]) rotate([0, 90, 0]) cylinder(d2 = dwires, d1 = dwires+2, h = thickness*0.5, center = true);  
        translate([-int_x/2-thickness,0,4]) rotate([0, 90, 0]) cylinder(d2 = dwires, d1 = dwires+2, h = thickness*0.5, center= true); 
    }
}




module rcube (size, rfillet=1, center=false) 
{ 
    sx = size[0] - rfillet*2;
    sy = size[1] - rfillet*2;
    sz = size[2] - rfillet*2;
    
    tx = center ? -size[0]/2 + rfillet : rfillet;
    ty = center ? -size[1]/2 + rfillet : rfillet;
    tz = center ? -size[2]/2 + rfillet : rfillet;

    translate([tx, ty, tz]) hull() {        
        translate([ 0, 0, 0 ]) sphere (r = rfillet);
        translate([sx, 0, 0 ]) sphere (r = rfillet);
        translate([ 0,sy, 0 ]) sphere (r = rfillet);
        translate([sx,sy, 0 ]) sphere (r = rfillet);
        translate([ 0, 0,sz ]) sphere (r = rfillet);
        translate([sx, 0,sz ]) sphere (r = rfillet);   
        translate([ 0,sy,sz ]) sphere (r = rfillet);
        translate([sx,sy,sz ]) sphere (r = rfillet);                
    }
}
module cooling_slots(count,spread){
    
        for ( i = [0:1:count-1] ) {
            translate([0,spread*i,-pcb_z/2-thickness])
            children();
        }
    }