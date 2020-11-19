#version 300 es

layout (location = 0) in vec4 aPosition;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec4 aTexcoord;

out vec4 vPos;
out vec4 vNormal;
out vec4 vTexcoord;

uniform mat4 uModelMat, uViewMat, uProjMat;

void main()
{
	vPos = aPosition;

	gl_Position = uModelMat * aPosition;
	
	mat4 atlasMat = mat4(0.5, 0.0, 0.0, 0.0,
						 0.0, 0.5, 0.0, 0.0,
						 0.0, 0.0, 1.0, 0.0,
						 0.25, 0.25, 0.0, 1.0);
	vec4 uv_atlas = atlasMat * aTexcoord;
	
	vNormal = vec4(aNormal, 0.0);
	
	vTexcoord = uv_atlas;
}