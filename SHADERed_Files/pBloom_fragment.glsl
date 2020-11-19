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
	
	rtFragColor = texture(uTex, uv);
	
	float luminance = 0.2126 * rtFragColor.x + 0.7152 * rtFragColor.y + 0.0722 * rtFragColor.z;

	rtFragColor.xyz = rtFragColor.xyz * luminance;
}