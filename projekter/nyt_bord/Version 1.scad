pladetykkelse = 22;
pladelaengde = 2400;

pladsbrede = 700;

ende_brede  = (0 ? 700 : 900);
ende_dybde  = (0 ? 1200 : 800);
knaek_x     = (0 ? 670 : 200);
knaek_y     = (0 ? 200 : 0);

reglar_brede  = 47;
reglar_hoejde = 95;

module corner(r,x,y) {
    translate([x+(x==0?1:-1)*r,y+(y==0?1:-1)*r,0])
        intersection() {
            rotate([0,(x==0?1:-1)*90,0])
                cylinder(r=r,h=r*2,center=true);
            rotate([0,(x==0?1:-1)*90,90])
                cylinder(r=r,h=r*2,center=true);
        }
}

module bordplade() {
    hull()
        for (x = [0,pladelaengde]) for (r = [6,10]) {
            translate([0,0,(r==6?r:pladetykkelse-10)])
                corner(r,x,0);
            translate([x-(x== 0 ? -1 : 1)*r,800,r])
                rotate([90,0,0])
                    cylinder(r=r);
        }
}

module topplade() {
    hull() {
        cube([pladelaengde/6,400,0.1]);
        for (x = [0,pladelaengde/6]) for (y = [0,400])
            translate([0,0,pladetykkelse-10])
                corner(10,x,y);
    }
}

module riser() {
    translate([0,pladetykkelse,0])
        rotate([90,0,0])
            difference() {
                hull() {
                    for (x = [0,pladelaengde]) for (y = [0,200]) for (z = [6,pladetykkelse-6])
                        translate([0,0,z])
                            corner(6,x,y);
                }
                for (x1 = [200:400:2400]) for (x2 = [-25,25]){
                    translate([x1+x2,190,0])
                        cylinder(h=100,d=5,center=true);
                    translate([x1+x2,200,-10])
                        cube([5,20,100],center=true);
                }
            }
}

for (x = [0,pladelaengde]) {
    for (y = [0,2000]) {
        translate([x,y,0])
            mirror([0,(y==2000 ? 90 : 0 ),0])
                bordplade();
    }
    for (n = [0:5])
    translate([x+n*pladelaengde/6,800,200]) {
        topplade();
    }
    for (y = [800,2000-800-pladetykkelse])
        translate([x,y,0])
            riser();
}

module plads(x1,y1,x2,y2) {
    translate([(x1+x2)/2,(y1+y2)/2,-10]) {
        color("red") difference() {
                cylinder(d=pladsbrede+100,h=1);
                cylinder(d=pladsbrede+100-50,h=100,center=true);
        }
        color("green") difference() {
                cylinder(d=pladsbrede,h=1);
                cylinder(d=pladsbrede-50,h=100,center=true);
        }
    }
}

module ben() {
    mirror([0,0,1])
        translate([-reglar_brede/2,1000,0]) {
            color("blue")
                hull() {
                    translate([0,-800,0])
                        cube([reglar_brede,1600,1]);
                    translate([0,-600,reglar_hoejde-1])
                        cube([reglar_brede,1200,1]);
                }
            color("blue")
                hull() {
                    translate([0,-600,800])
                        cube([reglar_brede,1200,1]);
                    translate([0,-400,800-reglar_hoejde+1])
                        cube([reglar_brede,800,1]);
                }
            color("green")
                translate([reglar_brede/2+22,-300,0])
                    cube([22,600,800]);
            color("green")
                translate([-reglar_brede/2,-300,0])
                    cube([22,600,800]);
        }
}

for (x = [0,1200,2400,3600,2400*2-50])
    translate([x,0,0])
        ben();

translate([-reglar_brede/2-22,1000,0])
    mirror([1,0,0])
        mirror([0,0,1]) {
            color("blue")
                hull() {
                    cube([600,reglar_brede,1]);
                    translate([0,0,reglar_hoejde-1])
                        cube([400,reglar_brede,1]);
                }
            color("green")
                for (y = [reglar_brede,-reglar_brede+22])
                hull() {
                    translate([0,y,0])
                        cube([400,22,1]);
                    translate([0,y,800])
                        cube([100,22,1]);
                }
        }

mirror([1,0,0]) {
    hull()
    for (y=[0,1]) for (r = [6,10]) {
        translate([0,0,(r==6?6:pladetykkelse-10)])
            corner(r,0,2000*y);
        translate([800,1000-ende_brede/2,(r==6?6:pladetykkelse-10)])
            mirror([1,0,0])
                corner(r,0,ende_brede*y);
        translate([knaek_x,knaek_y,(r==6?6:pladetykkelse-10)])
            mirror([1,0,0])
                corner(r,0,(y==0?0:2000-knaek_y*2));
    }

    if (ende_dybde == 1200)
        plads(  0,0,
                knaek_x,knaek_y);
    plads(      knaek_x,knaek_y,
                ende_dybde,1000-ende_brede/2);
    plads(      ende_dybde,1000-ende_brede/2,
                ende_dybde,1000+ende_brede/2);
    plads(      ende_dybde,1000+ende_brede/2,
                knaek_x,2000-knaek_y);
    if (ende_dybde == 1200)
        plads(  knaek_x,2000-knaek_y,
                0,2000);
}

pladser = 6;

for (plads = [0:pladser-1]) for (side = [0,2000])
    plads(pladelaengde*2/pladser*plads,     side,
          pladelaengde*2/pladser*(plads+1), side);

