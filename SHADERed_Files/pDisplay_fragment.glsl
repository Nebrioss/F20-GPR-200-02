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
	vec4 col = texture(uTex, uv);

	// testing
	//rtFragColor = vec4(1.0, 0.5, 0.0, 1.0);
	//rtFragColor = vec4(uv, 0.0, 1.0);
	rtFragColor = col;
}