#version 300 es

#ifdef GL_ES
precision highp float;
#endif	// GL_ES

layout (location = 0) out vec4 rtFragColor;

in vec4 vPosClip;

void main()
{
	//rtFragColor = vec4(1.0);
	//rtFragColor = vPosClip;
	
	//MANUAL PERSPECTIVE DIVIDE
	vec4 posNDC = vPosClip / vPosClip.z;
	//rtFragColor = posNDC;
	// [-1, +1] contains all visible space]
	
	//SCREEN-SPACE
	vec4 posScreen = posNDC * 0.5 + 0.5;
	rtFragColor = posScreen;
	// [-1,+1] -> [0,1]
	
	rtFragColor.b = 0.0;
	
}