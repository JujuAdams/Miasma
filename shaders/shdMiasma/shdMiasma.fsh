varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_sSmoke0;
uniform sampler2D u_sSmoke1;
uniform sampler2D u_sSmoke2;
uniform sampler2D u_sSmoke3;

uniform float u_fAlphaFalloff;

uniform float u_fAlpha0;
uniform float u_fAlpha1;
uniform float u_fAlpha2;
uniform float u_fAlpha3;

uniform vec2 u_vOffset0;
uniform vec2 u_vOffset1;
uniform vec2 u_vOffset2;
uniform vec2 u_vOffset3;

uniform vec2 u_vScale0;
uniform vec2 u_vScale1;
uniform vec2 u_vScale2;
uniform vec2 u_vScale3;

uniform float u_fAngle0;
uniform float u_fAngle1;
uniform float u_fAngle2;
uniform float u_fAngle3;

vec2 rotateByVector(vec2 position, vec2 centre, vec2 vector)
{
    return centre + (position - centre)*mat2(vector, -vector.y, vector.x);
}

vec2 rotate(vec2 position, vec2 centre, float angle)
{
    return rotateByVector(position, centre, vec2(cos(0.00872664625*angle), -sin(0.00872664625*angle)));
}

void main()
{
    vec2 coord0 = (rotate(v_vTexcoord - u_vOffset0, vec2(0.5), u_fAngle0))/u_vScale0;
    vec2 coord1 = (rotate(v_vTexcoord - u_vOffset1, vec2(0.5), u_fAngle1))/u_vScale1;
    vec2 coord2 = (rotate(v_vTexcoord - u_vOffset2, vec2(0.5), u_fAngle2))/u_vScale2;
    vec2 coord3 = (rotate(v_vTexcoord - u_vOffset3, vec2(0.5), u_fAngle3))/u_vScale3;
    
    vec4 sample0 = texture2D(u_sSmoke0, coord0);
    vec4 sample1 = texture2D(u_sSmoke1, coord1);
    vec4 sample2 = texture2D(u_sSmoke2, coord2);
    vec4 sample3 = texture2D(u_sSmoke3, coord3);
    
    gl_FragColor = vec4(0.0);
    gl_FragColor += u_fAlpha0*sample0;
    gl_FragColor += u_fAlpha1*sample1;
    gl_FragColor += u_fAlpha2*sample2;
    gl_FragColor += u_fAlpha3*sample3;
    
    gl_FragColor = vec4(v_vColour.rgb, pow(v_vColour.a, u_fAlphaFalloff)) * gl_FragColor;
}
