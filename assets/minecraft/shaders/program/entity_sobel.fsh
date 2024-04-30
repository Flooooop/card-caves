#version 150

uniform sampler2D DiffuseSampler;
uniform float Time;

in vec2 texCoord;
in vec2 oneTexel;

out vec4 fragColor;

void main(){
    fragColor = texture(DiffuseSampler, texCoord);
    fragColor.a *= 0.5;

    if (fragColor.rgb == vec3(1.0,1.0,1.0)) {fragColor.rgb *= sin(Time*6.28318530718)/4. + 0.875;}
}