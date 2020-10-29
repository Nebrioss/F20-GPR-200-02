#version 300 es

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;
//out vec4 rtFragColor;

// VARYING
in vec4 vColor;

void main()
{
	//rtFragColor = vec4(0.5, 0.0, 0.25, 1.0);
	rtFragColor = vColor;
}