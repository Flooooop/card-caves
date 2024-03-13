#version 150

#define TOOLTIP_Z -0.04000008

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;
out float isTooltip;
out vec3 position;
out vec3 Corner1;
out vec3 Corner2;
out vec3 Corner3;
out vec3 Corner4;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexColor = Color;

    position = vec3(Position.xy, 1);
    Corner1 = Corner2 = Corner3 = Corner4 = vec3(0);
    int id = gl_VertexID%4;

    if (gl_Position.z == TOOLTIP_Z) {
        isTooltip = 1;
        switch(id){
        case 0:
            Corner1 = vec3(Position.xy, 1);
            break;
        case 1:
            Corner2 = vec3(Position.xy, 1);
            break;
        case 2:
            Corner3 = vec3(Position.xy, 1);
            break;
        case 3:
            Corner4 = vec3(Position.xy, 1);
            break;
    }
    } else {
        isTooltip = 0;
    }
}