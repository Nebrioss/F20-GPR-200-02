#version 300 es

// MAIN DUTY: PROCESS ATTRIBUTES
// e.g. 3D position in space
// e.g. normal
// e.g. 2D uv: texture coordinate
layout (location = 0) in vec4 aPosition;
//in vec4 aPosition;

// TRANSFORM UNIFORMS
uniform mat4 uModelMat;
uniform mat4 uViewMat;
uniform mat4 uProjMat;
uniform mat4 uViewProjMat;

// VARYING
out vec4 vColor;

void main()
{
	// REQUIRED: set this value
	// problem: gl_Position is in "clip-space"
	// problem: aPosition is in "object-space"
	//gl_Position = aPosition;

	// position in world-space (wrong)
	vec4 pos_world = uModelMat * aPosition;
	//gl_Location = pos_world;

	// position in camera-space (also wrong)
	//vec4 pos_camera = uViewMat * uModelMat * aPosition;
	vec4 pos_camera = uViewMat * pos_world;
	//gl_Position = pos_camera;

	// position in clip-space (finally!)
	//vec4 pos_clip = uProjMat * uViewMat * uModelMat * aPosition;
	//vec4 pos_clip = uProjMat * pos_camera;
	vec4 pos_clip = uViewProjMat * pos_world;
	gl_Location = pos_clip;
	
	//vColor = vec4(1.0, 0.5, 0.0, 1.0);
	vColor = aPosition;
	//vColor = pos_camera;
}