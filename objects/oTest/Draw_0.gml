var _colour = make_colour_hsv(195, 120, 160);
var _alpha = 1.0;

shader_set(shdMiasma);

texture_set_stage(shader_get_sampler_index(shdMiasma, "u_sSmoke0"), sprite_get_texture(sSmoke0, 0));
texture_set_stage(shader_get_sampler_index(shdMiasma, "u_sSmoke1"), sprite_get_texture(sSmoke1, 0));
texture_set_stage(shader_get_sampler_index(shdMiasma, "u_sSmoke2"), sprite_get_texture(sSmoke2, 0));
texture_set_stage(shader_get_sampler_index(shdMiasma, "u_sSmoke3"), sprite_get_texture(sSmoke3, 0));

gpu_set_tex_repeat_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke0"), true);
gpu_set_tex_repeat_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke1"), true);
gpu_set_tex_repeat_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke2"), true);
gpu_set_tex_repeat_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke3"), true);

gpu_set_tex_filter_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke0"), true);
gpu_set_tex_filter_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke1"), true);
gpu_set_tex_filter_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke2"), true);
gpu_set_tex_filter_ext(shader_get_sampler_index(shdMiasma, "u_sSmoke3"), true);

shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAlpha0"), _alpha*alpha0);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAlpha1"), _alpha*alpha1);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAlpha2"), _alpha*alpha2);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAlpha3"), _alpha*alpha3);

shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vScale0"), 1024, 1024);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vScale1"),  512, 1024);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vScale2"), 1024,  512);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vScale3"),  512,  512);

shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAngle0"), textureAngle0);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAngle1"), textureAngle1);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAngle2"), textureAngle2);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAngle3"), textureAngle3);

shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vOffset0"), x0, y0);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vOffset1"), x1, y1);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vOffset2"), x2, y2);
shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_vOffset3"), x3, y3);

shader_set_uniform_f(shader_get_uniform(shdMiasma, "u_fAlphaFalloff"), 1/1.4);

draw_circle_color(1000, 650, 200, _colour, _colour, false);

draw_primitive_begin(pr_trianglelist);

draw_vertex_color(   0,   0, _colour, 1.0);
draw_vertex_color( 200,   0, _colour, 1.0);
draw_vertex_color( 200, 900, _colour, 1.0);

draw_vertex_color(   0,   0, _colour, 1.0);
draw_vertex_color( 200, 900, _colour, 1.0);
draw_vertex_color(   0, 900, _colour, 1.0);

draw_vertex_color(200, 200, _colour, 1.0);
draw_vertex_color(400, 400, _colour, 0.0);
draw_vertex_color(400, 900, _colour, 0.0);

draw_vertex_color(200, 200, _colour, 1.0);
draw_vertex_color(400, 900, _colour, 0.0);
draw_vertex_color(200, 900, _colour, 1.0);

draw_vertex_color( 200,   0, _colour, 1.0);
draw_vertex_color(1600,   0, _colour, 1.0);
draw_vertex_color(1600, 200, _colour, 1.0);

draw_vertex_color( 200,   0, _colour, 1.0);
draw_vertex_color(1600, 200, _colour, 1.0);
draw_vertex_color( 200, 200, _colour, 1.0);

draw_vertex_color( 200, 200, _colour, 1.0);
draw_vertex_color(1600, 200, _colour, 1.0);
draw_vertex_color(1600, 400, _colour, 0.0);

draw_vertex_color( 200, 200, _colour, 1.0);
draw_vertex_color(1600, 400, _colour, 0.0);
draw_vertex_color( 400, 400, _colour, 0.0);

draw_primitive_end();

shader_reset();