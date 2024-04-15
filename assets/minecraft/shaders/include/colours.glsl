#define NO_SHADOW vec3(76., 64., 22.) // #4C4016
#define SELECTED_CARD vec3(138., 121., 63.) // #8A793F

bool isColor(vec4 originColor, vec3 color) {
    return (originColor*255.).xyz == color;
}

vec4 getShadow(vec3 color) {
    return vec4(floor(color / 4.) / 255., 1);
}

vec4 getShadowAlt(vec3 color) {
    return vec4(ceil(color / 4.) / 255., 1);
}

bool isShadow(vec4 originColor, vec3 color) {
    return round(originColor.xyz*255.) == round(getShadow(color).xyz*255.) || round(originColor.xyz*255.) == round(getShadowAlt(color).xyz*255.);
}

bool isEither(vec4 originColor, vec3 color) {
    return isShadow(originColor, color) || isColor(originColor, color);
}

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}