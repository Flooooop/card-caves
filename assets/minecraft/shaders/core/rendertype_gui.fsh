#version 150

in vec4 vertexColor;
in float isTooltip;
in vec3 Corner1;
in vec3 Corner2;
in vec3 Corner3;
in vec3 Corner4;
in vec3 position;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {


    if (isTooltip == 1.) {
        vec3 c1 = vec3(Corner1.xy / Corner1.z, Corner1.z);
        vec3 c2 = vec3(Corner2.xy / Corner2.z, Corner2.z);
        vec3 c3 = vec3(Corner3.xy / Corner3.z, Corner3.z);
        vec3 c4 = vec3(Corner4.xy / Corner4.z, Corner4.z);
        vec3 Cmin = min(c1,min(c3,c4));
        vec3 Cmax = max(c1,max(c3,c4));

        if (all(greaterThan(vec2(15.), Cmax.xy - Cmin.xy))) {discard; return;}

        if (position.x < Cmax.x-0.5 && position.x > Cmin.x+0.5) {
            if (Cmax.x - Cmin.x < 7.) {discard; return;}
        }
    }

    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
    fragColor = color * ColorModulator;
}