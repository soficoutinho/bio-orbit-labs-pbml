// Bio-Orbit Labs - Microgravity Sample Retrieval Clamp
// Garra robótica paramétrica para coleta de amostras em bioreator orbital

// VARIÁVEIS PARAMÉTRICAS

base_x = 90;
base_y = 55;
base_z = 8;

servo_x = 24;
servo_y = 13;
servo_z = 13;

arm_length = 58;
arm_width = 10;
arm_height = 8;
arm_gap = 26;

jaw_radius_outer = 18;
jaw_radius_inner = 11;
jaw_height = 8;

support_width = 34;
support_length = 12;
support_height = 8;

hole_radius = 2.2;

// BASE ARREDONDADA

module rounded_base() {

    difference() {

        hull() {

            translate([-base_x/2 + 8, -base_y/2 + 8, 0])
                cylinder(h=base_z, r=8, $fn=40);

            translate([base_x/2 - 8, -base_y/2 + 8, 0])
                cylinder(h=base_z, r=8, $fn=40);

            translate([-base_x/2 + 8, base_y/2 - 8, 0])
                cylinder(h=base_z, r=8, $fn=40);

            translate([base_x/2 - 8, base_y/2 - 8, 0])
                cylinder(h=base_z, r=8, $fn=40);
        }

        // encaixe para microservo 9g
        translate([0, -12, base_z - 3])
            cube([servo_x, servo_y, servo_z], center=true);

        // furos de fixação
        translate([-32, -18, -1])
            cylinder(h=base_z+2, r=hole_radius, $fn=30);

        translate([32, -18, -1])
            cylinder(h=base_z+2, r=hole_radius, $fn=30);

        translate([-32, 18, -1])
            cylinder(h=base_z+2, r=hole_radius, $fn=30);

        translate([32, 18, -1])
            cylinder(h=base_z+2, r=hole_radius, $fn=30);
    }
}

// SUPORTE DO SERVO

module servo_mount_walls() {

    // parede esquerda
    translate([-17, -12, base_z])
        cube([4, 22, 14], center=false);

    // parede direita
    translate([13, -12, base_z])
        cube([4, 22, 14], center=false);

    // parede traseira
    translate([-17, -12, base_z])
        cube([34, 4, 14], center=false);
}

// PESCOÇO CENTRAL

module central_neck() {

    translate([-support_width/2, 10, base_z])
        cube([support_width, support_length, support_height], center=false);
}

// BRAÇO ESQUERDO

module left_arm() {

    translate([-arm_gap/2 - arm_width/2, 20, base_z + 2])
        cube([arm_width, arm_length, arm_height], center=false);
}

// BRAÇO DIREITO

module right_arm() {

    translate([arm_gap/2 - arm_width/2, 20, base_z + 2])
        cube([arm_width, arm_length, arm_height], center=false);
}

// GARRA FRONTAL

module front_ring() {

    translate([0, 20 + arm_length, base_z + 2])

        difference() {

            cylinder(h=jaw_height, r=jaw_radius_outer, $fn=70);

            translate([0, 0, -1])
                cylinder(h=jaw_height + 2, r=jaw_radius_inner, $fn=70);

            // abertura frontal
            translate([-7, -jaw_radius_outer - 2, -1])
                cube([14, 16, jaw_height + 2], center=false);
        }
}

// REFORÇOS ESTRUTURAIS

module reinforced_joints() {

    // reforço esquerdo
    translate([-25, 19, base_z])

        linear_extrude(height=8)

            polygon(points=[[0,0],[12,0],[12,18]]);

    // reforço direito
    translate([25, 19, base_z])

        mirror([1,0,0])

            linear_extrude(height=8)

                polygon(points=[[0,0],[12,0],[12,18]]);

    // ponte traseira
    translate([-arm_gap/2 - arm_width/2, 20, base_z + 2])

        cube([arm_gap + arm_width, 10, arm_height], center=false);
}

// TUBO BIOLÓGICO ORBITAL

module sample_tube_visual() {

    // tubo orbital azul

    color([0.2, 0.8, 1.0])

    translate([0, 20 + arm_length, base_z + 18])

        cylinder(h=40, r=8, center=true, $fn=60);
}

// MODELO PRINCIPAL

module bio_orbit_clamp() {

    union() {

        rounded_base();

        servo_mount_walls();

        central_neck();

        reinforced_joints();

        left_arm();

        right_arm();

        front_ring();

        // detalhe superior orbital
        translate([-18, 28, base_z + 10])

            cube([36, 4, 3], center=false);
    }
}

// RENDER FINAL

bio_orbit_clamp();

sample_tube_visual();
