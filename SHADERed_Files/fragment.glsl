#version 300 es

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;
//out vec4 rtFragColor;

uniform sampler2D uTexture;

// VARYING

// PER-VERTEX: receive the final color
//in vec4 vColor;

// PER-FRAGMENT: receive stuff used for final color
in vec4 vNormal;

//in vec2 vTexcoord;
in vec4 vTexcoord;

void main()
{
	//rtFragColor = vec4(0.5, 0.0, 0.25, 1.0);
	
	// PER-VERTEX: input is just final color
	//rtFragColor = vColor;
	
	// PER-FRAGMENT: calculate final color here using inputs
	vec4 N = normalize(vNormal);
	rtFragColor = vec4(0.5 * N.xyz + 0.5, 1.0);
	
	//rtFragColor = vec4(vTexcoord, 0.0, 1.0);
	rtFragColor = vTexcoord;
	
	// USING TEXTURE (hopefully)
	rtFragColor = texture(uTexture, 2.0 * vTexcoord.xy);
}