#version 300 es

// MAIN DUTY: PROCESS ATTRIBUTES
// e.g. 3D position in space
// e.g. normal
// e.g. 2D uv: texture coordinate
layout (location = 0) in vec4 aPosition;
//in vec4 aPosition;

// VARYING
out vec4 vColor;

void main()
{
	// REQUIRED: set this value
	gl_Position = aPosition;
	
	//vColor = vec4(1.0, 0.5, 0.0, 1.0);
	vColor = aPosition;
}