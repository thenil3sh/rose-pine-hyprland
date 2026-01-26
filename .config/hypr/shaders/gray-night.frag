#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 FragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // Standard luminance grayscale
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    vec3 gray_rgb = vec3(gray);

    // Night light adjustment (warm tint)
    // Kill blue, slightly boost red, keep green reasonable
    vec3 night = vec3(
        gray_rgb.r * 1.08,  // red boost
        gray_rgb.g * 1.00,  // neutral green
        gray_rgb.b * 0.70   // blue suppression
    );

    FragColor = vec4(night, color.a);
}

