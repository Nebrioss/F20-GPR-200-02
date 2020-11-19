#version 300 es

#ifdef GL_ES
precision highp float;
#endif // GL_ES

layout (location = 0) out vec4 rtFragColor;

in vec4 vPos;
in vec4 vNormal;
in vec4 vTexcoord;

//uniform sampler2D uTex;

void main()
{
	
	//vec2 uv = vTexcoord.xy;
	//vec4 col = texture(uTex, 2.5 * uv);

	rtFragColor = vec4(0.75, 0.0, 0.0, 1.0);
}