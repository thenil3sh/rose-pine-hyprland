#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 FragColor;

const float strength = 0.6;

void main() {
    vec4 color = texture(tex, v_texcoord);
    
    vec3 warm = vec3(
        1.0 + 0.15 * strength,  
        1.0 + 0.05 * strength,   
        1.0 - 0.45 * strength    
    );

    vec3 result = color.rgb * warm;

    FragColor = vec4(clamp(result, 0.0, 1.0), color.a);
}

