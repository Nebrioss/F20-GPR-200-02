#version 300 es

#ifdef GL_ES
precision highp float;
#endif // GL_ES

in vec4 vNormal;

layout (location = 0) out vec4 rtFragColor;

void main()
{
	rtFragColor = vNormal;
}