/*Small Electronics Mounting Case
*------------------------------------
*remixed from the following file on thingiverse, by gtcdma : https://www.thingiverse.com/thing:1625233
*remix by Kayos Maker
*
*
*
*
*  -compatible with 2 and 4 hole devices
*  -mount board on plastic posts or with screws(or both for 4 hole devices, saving 2 screws)
*  -configurable optional cooling slots
*  -configurable optional pot adjustment hole
*  -internal zip tie points for strain relief
*  -configurable single or dual mounting tabs
*  -optional 2 or 4 hole screw closure(set up for m3 screws but can be altered with care)

*  Changelog

    -v2.10  -add optional cooling slots to lid  (4-16-2021)
            -add optional screwholes to mounting options
            -add options for 4 hole boards
            -add optional 2 or 4 hole case closure, in addition to original friction fit
            -add mounting ear/s option
    -v2.00  -reformat for my editting preferences, will fix later for customizer
*   -v2     -establish new version for my changes 
*   -v1.0   -no version info from orig file or contact info for author.  we'll call it 1.0
*/
//-----------------------------------------------------------------------------------------------------------
//   USER VARIABLES         //usage notes
                            //
board_x = 54;               //add extra space to x/y to have more room around pcb
board_y = 24.5;               //
board_ht = 17;              //measure from the board underside to highest component - use standoff_ht to compensate for solder and throughhole tails

holes_x = 35;               //distance between mounting holes on board
holes_y = 18.5;            //measure as if there were 4 holes, not on the diagonal


                            //BOARD MOUNTING OPTIONS - each pair of mounting locations can only use posts or holes, not both.  if you use all 4
                            //mounting points you can use posts at one pair of locations, and screwholes at the other pair
                            //

                            //
                            //
                            //                post/hole      A       B
                            //                positions          
                            //                               C       D
                                                     
post_ad = 1;                //set "0" for no posts at A/D positions, "1" for posts
post_bc = 0;                //set "0" for no posts at B/C positions, "1" for posts
                            //
post_dia = 2.7;             //diameter of board mounting posts - use 0 for no posts anywhere
post_ht = 4;                //height of mounting posts
                            
                            
standoff_ht = 4;            //create clearance for board bottom, and/or depth for screwholes
standoff_dia = 5;           //diameter of standoff 

                            
hole_dia = 2.9;               //screwhole diameter - hole depth is equal to standoff height - plan screw length there 
                            //
hole_ad = 0;                //set "0" for no holes at A/D positions, "1" for holes
hole_bc = 1;                //set "0" for no holes at B/C positions, "1" for holes
                            
                            
trimpot_x = -7.5;           //trimpot location       
trimpot_y = 10;             //from center
                            //
trimpot_hole = 3;           //hole diameter - use "0" for no hole
                            
                            
thickness = 1.6;            //body shell thickness - multiple of nozzle width recommended
rfillet = 3;                //body fillet radius - numbers below 2 will cause issues - the model is built on the rfillet
                            
                            
dwires = 4.5;               //wire entrance/exit hole dia


slots = 9;                  //# cooling slots on lid - use "0" for no slots
slot_width = 0.7;           //individual slot width as percentage  0.5 is 50/50 balanced open/closed
                            //increase to widen slots, decrease to narrow slots - values between 0.1-0.9 recommended


ear_width = 10;             //mounting ear width - use 0 here to have no ears
ear_length = 15;            //mounting ear length - should be longer than rfillet
ear_hole = 4;               //ear screwhole diameter
                            //
ear2_width = ear_width;     //use "0" to have only one mounting ear.  use "ear_width" for pair of matched ears


closure_screws = 1;         //enables or disables screw closure - "1" for screwholes,  "0" for friction fit 
                            //
                            //enables or disables streamlining the enclosure screwholes as they appear on the outside.  printing will be easier with this disabled
screwhole_shave = 1;        //"0" for a fully streamlined exterior, "1" for a countersink opening that is flat(will protrude from large radiused enclosure corners)
                            //
                            //select closure screws locations 
closure_ad = 0;             //set "0" for no closure holes at A/D positions, "1" for holes
closure_bc = 1;             //set "0" for no closure holes at B/C positions, "1" for holes

//closure screw parameters.  change at your own risk.  
top_id = 3.6;                           //holes threads should pass through freely
top_cs_dia = 6.1;                       //countersink diameter for screwhead
top_cs_depth = 3.3;                       //countersink depth
                                        //
bottom_id = 2.9;                        //screwhole the screw grabs into - better tight than loose
                                        //
shaft_od = top_cs_dia+thickness*2;      //don't change this one, it determines the meat for the countersink, and helps
                                        //adjusts the overall length of the enclosure to accomodate it if necessary                            





//nothing below needs to be changed to use the file as is
//if you make new features(or fix my mess in ways) that are useful, share the new file

//------------------------------------------------------------------------------------------------------------   





//

board_z = board_ht+standoff_ht;

slot_spread = (board_y-(rfillet+1))/((slots*2)+1);

int_x = board_x + 10+((shaft_od*2-10)*closure_screws);       
$fn=64;

//---------------------


bottom();
translate([0, board_y + 10, 0]) top();      


//---------------------


module bottom() 
{
    difference() {  
        union() {
            base();  
            
            //ziptie mounts
            difference() {
                union() {
                    translate([-int_x/2, -(dwires+1)/2, -board_z/2]) cube([4.5, dwires+1, board_z/2-dwires/2.5]);
                    translate([int_x/2-4.5, -(dwires+1)/2, -board_z/2]) cube([4.5, dwires+1, board_z/2-dwires/2.5]);
                }
                translate([-int_x/2, -(dwires+1)/2-.1, -board_z/2+1]) cube([3.2, dwires+1+.2, board_z/2-dwires/2-3]);
                translate([int_x/2-3.2, -(dwires+1)/2-.1, -board_z/2+1]) cube([3.2, dwires+1+.2, board_z/2-dwires/2-3]);
            }
        }
        
        base_shaver_b();

        
        wireholes();
        translate([0,0,board_z+2])cube([board_x*2, board_y*2, board_z*2], center = true);       

        //clamshell connection
        difference() {
                translate([0,0,2])cube([board_x*2, board_y*2, 4], center = true);
                rcube([int_x + thickness, board_y + thickness, board_z + thickness], rfillet - thickness/2, center = true);  
        }          
            
    }
    
    //board mounting posts/screwholes
    difference() {
        union(){
            translate([-holes_x/2, holes_y/2, -board_z/2]) cylinder(d = standoff_dia, h = standoff_ht);   //A
            translate([holes_x/2, holes_y/2, -board_z/2]) cylinder(d = standoff_dia, h = standoff_ht);    //B
            translate([-holes_x/2, -holes_y/2, -board_z/2]) cylinder(d = standoff_dia, h = standoff_ht);  //C    
            translate([holes_x/2, -holes_y/2, -board_z/2]) cylinder(d = standoff_dia, h = standoff_ht);   //D
            translate([-holes_x/2, holes_y/2, -board_z/2+standoff_ht]) cylinder(d = post_dia*post_ad, h = post_ht);      //A
            translate([holes_x/2, holes_y/2, -board_z/2+standoff_ht]) cylinder(d = post_dia*post_bc, h = post_ht);       //B
            translate([-holes_x/2, -holes_y/2, -board_z/2+standoff_ht]) cylinder(d = post_dia*post_bc, h = post_ht);     //C
            translate([holes_x/2, -holes_y/2, -board_z/2+standoff_ht]) cylinder(d = post_dia*post_ad, h = post_ht);      //D
        }
        translate([-holes_x/2, holes_y/2, -board_z/2]) cylinder(d = hole_dia*hole_ad, h = standoff_ht+1);      //A
        translate([holes_x/2, holes_y/2, -board_z/2]) cylinder(d = hole_dia*hole_bc, h = standoff_ht+1);       //B
        translate([-holes_x/2, -holes_y/2, -board_z/2]) cylinder(d = hole_dia*hole_bc, h = standoff_ht+1);     //C
        translate([holes_x/2, -holes_y/2, -board_z/2]) cylinder(d = hole_dia*hole_ad, h = standoff_ht+1);      //D
        
        translate([-holes_x/2, holes_y/2, -board_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_ad, d1 = hole_dia*hole_ad, h = (standoff_dia - hole_dia)/2);      //
        translate([holes_x/2, holes_y/2, -board_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_bc, d1 = hole_dia*hole_bc, h = (standoff_dia - hole_dia)/2);       //
        translate([-holes_x/2, -holes_y/2, -board_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_bc, d1 = hole_dia*hole_bc, h = (standoff_dia - hole_dia)/2);     //
        translate([holes_x/2, -holes_y/2, -board_z/2+standoff_ht-((standoff_dia-hole_dia)/6)]) cylinder(d2 = standoff_dia*hole_ad, d1 = hole_dia*hole_ad, h = (standoff_dia - hole_dia)/2);      //
    }
    
    
    //closure screwholes 
    difference() {
        union() {
            translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_ad*closure_screws, h = board_z/2+1);        //A
            translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_bc*closure_screws, h = board_z/2+1);         //B
            translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_bc*closure_screws, h = board_z/2+1);       //C
            translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2]) cylinder (d = (bottom_id+thickness*2)*closure_ad*closure_screws, h = board_z/2+1);        //D
        }
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2]) cylinder (d = bottom_id, h = board_z/2+2);
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2]) cylinder (d = bottom_id, h = board_z/2+2);
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2]) cylinder (d = bottom_id, h = board_z/2+2);
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2]) cylinder (d = bottom_id, h = board_z/2+2);
        
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-(.5*thickness)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2);  
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-(.5*thickness)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2); 
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-(thickness*.5)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2);  
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-(thickness*.5)+1.5]) cylinder(d2 = bottom_id+thickness*4, d1 = bottom_id, h = thickness*2); 
    }
    
    
    //mounting ears
    difference() {
        union() {
            translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)/2-rfillet, 0, -board_z/2-thickness/2]) cube([ear_length+rfillet-ear_width/2,ear_width,thickness],center = true);
            translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet, 0, -board_z/2-thickness])  cylinder(d=ear_width, h=thickness);
            translate([int_x/2+(thickness+rfillet)/2,0,-board_z/2-thickness+(rfillet*1.5)/2])  cube([thickness+rfillet,ear_width,rfillet*1.5], center = true);
    
            translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)/2-rfillet), 0, -board_z/2-thickness/2]) cube([ear_length+rfillet-ear2_width/2,ear2_width,thickness],center = true);
            translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet), 0, -board_z/2-thickness])  cylinder(d=ear2_width, h=thickness);                  
            translate([-(int_x/2+(thickness+rfillet)/2),0,-board_z/2-thickness+(rfillet*1.5)/2])  cube([thickness+rfillet,ear2_width,rfillet*1.5], center = true);        
        }
    
        translate ([int_x/2+thickness+(ear_length+rfillet)/2,0,-board_z/2+rfillet]) rcube([ear_length+rfillet,ear_width+rfillet*2,rfillet*2],rfillet,center=true);        
        translate ([-(int_x/2+thickness+(ear_length+rfillet)/2),0,-board_z/2+rfillet]) rcube([ear_length+rfillet,ear2_width+rfillet*2,rfillet*2],rfillet,center=true);   
        
        translate ([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet,0,-board_z/2-thickness]) cylinder(d = ear_hole, h=thickness*4, center=true);        
        translate ([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet),0,-board_z/2-thickness]) cylinder(d = ear_hole, h=thickness*4, center=true); 
        
        
        translate([(int_x/2+thickness)+(ear_length+rfillet-ear_width/2)-rfillet,0,-board_z/2-thickness/6]) cylinder(d2 = ear_hole+thickness*4, d1 = ear_hole, h = thickness*2);  
        translate([-((int_x/2+thickness)+(ear_length+rfillet-ear2_width/2)-rfillet),0,-board_z/2-thickness/6]) cylinder(d2 = ear_hole+thickness*4, d1 = ear_hole, h = thickness*2);
       
       wireholes(); 
        
    }
       

    
}




module top() 
{
    
    
    difference() {    
        base();
        wireholes();
        translate([0,0,board_z])cube([board_x*2, board_y*2, board_z*2], center = true);    
        
        //clamshell connection
        intersection() {                                                                            
            rcube([int_x + thickness, board_y + thickness, board_z + thickness], rfillet - thickness/2, center = true);
            translate([0,0,0])cube([board_x*2, board_y*2, 4], center = true);
        }
        
        //trimpot hole
        translate([trimpot_x, -trimpot_y, -board_z/2-thickness]) cylinder(d = trimpot_hole , h = thickness+6);
        
        //cooling slots
        translate ([0,-((slots-1)*slot_spread),0])
        cooling_slots( slots, slot_spread*2) rcube([int_x-rfillet*2 , slot_width*(2*slot_spread) ,thickness+3],rfillet=(slot_width*(2*slot_spread))/2,center=true);
        
        
        //closure screwhole voids for some reason need to be here too in order to work properly cause im a noob and dont know the right way to do things
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_bc*closure_screws, h = board_z/2);             //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_ad*closure_screws, h = board_z/2);              //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_ad*closure_screws, h = board_z/2);            //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_bc*closure_screws, h = board_z/2);             //B
        
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_cs_dia*closure_bc*closure_screws, h = top_cs_depth);      //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_cs_dia*closure_ad*closure_screws, h = top_cs_depth);       //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_cs_dia*closure_ad*closure_screws, h = top_cs_depth);     //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_cs_dia*closure_bc*closure_screws, h = top_cs_depth);      //B
        
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);       //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);     //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //B
    }
    //closure screwholes 
    difference() {
        union() {
            translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = (shaft_od)*closure_bc*closure_screws, h = board_z/2-2+thickness-.5);             //C
            translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = (shaft_od)*closure_ad*closure_screws, h = board_z/2-2+thickness-.5);              //D
            translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = (shaft_od)*closure_ad*closure_screws, h = board_z/2-2+thickness-.5);            //A
            translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = (shaft_od)*closure_bc*closure_screws, h = board_z/2-2+thickness-.5);             //B
        }
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_bc, h = board_z/2+thickness);             //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_ad, h = board_z/2+thickness);              //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_ad, h = board_z/2+thickness);            //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness]) cylinder (d = top_id*closure_bc, h = board_z/2+thickness);             //B
        
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_bc, h = top_cs_depth+.5);      //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_ad, h = top_cs_depth+.5);       //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_ad, h = top_cs_depth+.5);     //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness-.5]) cylinder (d = top_cs_dia*closure_bc, h = top_cs_depth+.5);      //B
        
        translate([-int_x/2+shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //C
        translate([int_x/2-shaft_od/2,board_y/2-shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);       //D
        translate([-int_x/2+shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_ad,d1 = top_cs_dia*closure_ad, h = (top_cs_dia-top_id)/2);     //A
        translate([int_x/2-shaft_od/2,-board_y/2+shaft_od/2,-board_z/2-thickness+top_cs_depth]) cylinder (d2 = top_id*closure_bc,d1 = top_cs_dia*closure_bc, h = (top_cs_dia-top_id)/2);      //B
        
        base_shaver();
    }     

    
}
    
    
    




module base () 
{
    difference() {
        rcube([int_x + thickness*2, board_y + thickness*2, board_z + thickness*2], rfillet, center = true);
        rcube([int_x, board_y, board_z], rfillet-thickness, center = true);

    }
}


module base_shaver ()   //used to remove protruding geometry after screwholes are added to the top half
{
    difference() {
        cube([int_x+10*screwhole_shave, board_y+10*screwhole_shave, board_z*2*screwhole_shave], center = true);
        rcube([int_x + thickness*2, board_y + thickness*2, board_z + thickness*2], rfillet, center = true);
    }
}

module base_shaver_b ()   //used to remove protruding geometry after screwholes are added to the top half
{
    difference() {
        cube([int_x+10, board_y+10, board_z*2], center = true);
        rcube([int_x + thickness*2, board_y + thickness*2, board_z + thickness*2], rfillet, center = true);
    }
}
        
        
module wireholes() 
{
    hull() {
        rotate([0, 90, 0]) cylinder(d = dwires, h = int_x+thickness*2, center = true);  
        translate([0,0,4]) rotate([0, 90, 0]) cylinder(d = dwires, h = board_x+rfillet*2+thickness*2, center= true); 
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
            translate([0,spread*i,-board_z/2-thickness])
            children();
        }
    }