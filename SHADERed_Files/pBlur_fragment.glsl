#version 300 es

#ifdef GL_ES
precision highp float;
#endif // GL_ES

layout (location = 0) out vec4 rtFragColor;

in vec2 vTexcoord;

uniform vec2 uResolution;
uniform sampler2D uTex; // represented by integer (0)

void main()
{
	// sampler, uv
	// 1) uv = screen location / screen resolution
	// 2) something to do with attributes: texture coordinates
	//vec2 uv = gl_FragCoord.xy / uResolution;
	vec2 uv = vTexcoord;

	float shift = 1.0 / uResolution.y;
	
	rtFragColor = (1.0 * texture(uTex, vec2(uv.x + 2.0 * shift, uv.y + 2.0 * shift)) +
        4.0 * texture(uTex, vec2(uv.x + shift, uv.y + 2.0 * shift)) +
        6.0 * texture(uTex, vec2(uv.x, uv.y + 2.0 * shift)) +
        4.0 * texture(uTex, vec2(uv.x - shift, uv.y + 2.0 * shift)) +
        1.0 * texture(uTex, vec2(uv.x - 2.0 * shift, uv.y + 2.0 * shift)) +
                 
        4.0 * texture(uTex, vec2(uv.x + 2.0 * shift, uv.y + shift)) +
        16.0 * texture(uTex, vec2(uv.x + shift, uv.y + shift)) +
        24.0 * texture(uTex, vec2(uv.x, uv.y + shift)) +
        16.0 * texture(uTex, vec2(uv.x - shift, uv.y + shift)) +
        4.0 * texture(uTex, vec2(uv.x - 2.0 * shift, uv.y + shift)) +
                 
        6.0 * texture(uTex, vec2(uv.x + 2.0 * shift, uv.y)) +
        24.0 * texture(uTex, vec2(uv.x + shift, uv.y)) +
        32.0 * texture(uTex, vec2(uv.x, uv.y)) +
        24.0 * texture(uTex, vec2(uv.x - shift, uv.y)) +
        6.0 * texture(uTex, vec2(uv.x - 2.0 * shift, uv.y)) +
                 
        4.0 * texture(uTex, vec2(uv.x + 2.0 * shift, uv.y - shift)) +
        16.0 * texture(uTex, vec2(uv.x + shift, uv.y - shift)) +
        24.0 * texture(uTex, vec2(uv.x, uv.y - shift)) +
        16.0 * texture(uTex, vec2(uv.x - shift, uv.y - shift)) +
        4.0 * texture(uTex, vec2(uv.x - 2.0 * shift, uv.y - shift)) +
                 
        1.0 * texture(uTex, vec2(uv.x + 2.0 * shift, uv.y - 2.0 * shift)) +
        4.0 * texture(uTex, vec2(uv.x + shift, uv.y - 2.0 * shift)) +
        6.0 * texture(uTex, vec2(uv.x, uv.y - 2.0 * shift)) +
        4.0 * texture(uTex, vec2(uv.x - shift, uv.y - 2.0 * shift)) +
        1.0 * texture(uTex, vec2(uv.x - 2.0 * shift, uv.y - 2.0 * shift))) / 256.0;
}