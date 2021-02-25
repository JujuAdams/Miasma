attribute vec3 in_Position;
attribute vec4 in_Colour;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 worldPos = gm_Matrices[MATRIX_WORLD] * vec4(in_Position.xyz, 1.0);
    gl_Position = gm_Matrices[MATRIX_PROJECTION]*gm_Matrices[MATRIX_VIEW]*worldPos;
    
    v_vColour = in_Colour;
    v_vTexcoord = worldPos.xy;
}
