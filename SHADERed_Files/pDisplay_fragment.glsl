#version 300 es

#ifdef GL_ES
precision highp float;
#endif // GL_ES

layout (location = 0) out vec4 rtFragColor;

in vec2 vTexcoord;

uniform vec2 uResolution;
uniform sampler2D uTexScene; // represented by integer (0)
uniform sampler2D uTexBackground;

void main()
{
	// sampler, uv
	// 1) uv = screen location / screen resolution
	// 2) something to do with attributes: texture coordinates
	//vec2 uv = gl_FragCoord.xy / uResolution;
	vec2 uv = vTexcoord;
	vec4 scene = texture(uTexScene, uv);
	vec4 background = texture(uTexBackground, vec2(uv.x, uv.y + 0.7));

	// testing
	//rtFragColor = vec4(1.0, 0.5, 0.0, 1.0);
	//rtFragColor = vec4(uv, 0.0, 1.0);
	rtFragColor = mix(background, scene, scene.a);
}