#version 300 es

// MAIN DUTY: PROCESS ATTRIBUTES
// e.g. 3D position in space
// e.g. normal
// e.g. 2D uv: texture coordinate
layout (location = 0) in vec4 aPosition;
layout (location = 1) in vec3 aNormal;
//in vec4 aPosition;

// e.g. 2D uv: texture coordinate
// TEXTURE SPACE
//layout (location = 2) in vec2 aTexcoord;
layout (location = 2) in vec4 aTexcoord;

// TRANSFORM UNIFORMS
uniform mat4 uModelMat;
uniform mat4 uViewMat;
uniform mat4 uProjMat;
uniform mat4 uViewProjMat;

// TEXTURE UNIFORM
uniform sampler2D uTexture;

// VARYING

// PER-VERTEX: send final color
//out vec4 vColor;

// PER-FRAGMENT: send stuff to the FS to calculate final
out vec4 vNormal;

//out vec2 vTexcoord;
out vec4 vTexcoord;

out vec4 vPosition;

// LIGHT INFORMATION
// sLight: struct to keep light elements together
//	  sCenter: center of light
//	  sColor: color of light
//	  sIntensity: intensity of light
struct sLight
{
    vec4 sCenter;
    vec3 sColor;
    float sIntensity;
};

// initLight: initializing light
//	  light: final light struct
//	  center: center of light
//	  color: color of light
//	  intensity: intensity of light
void initLight(out sLight light, in vec4 center, in vec3 color, in float intensity)
{
    light.sCenter = center;
    light.sColor = color;
    light.sIntensity = intensity;
}

vec3 lambertReflect(sLight light)
{
    vec3 lightVector = normalize(light.sCenter.xyz - vec3(aPosition));
    vec3 diffuseCoefficient = aNormal * lightVector;
    
    vec3 attenuation = 1.0 / (1.0 + ((light.sCenter.xyz - vec3(aPosition)) / light.sIntensity) + (((light.sCenter.xyz - vec3(aPosition)) * (light.sCenter.xyz - vec3(aPosition)) / (light.sIntensity * light.sIntensity))));
    
    vec3 diffuseIntensity = diffuseCoefficient * attenuation;

	return vec3(diffuseIntensity * light.sColor);
}


void main()
{
	// REQUIRED: set this value
	// problem: gl_Position is in "clip-space"
	// problem: aPosition is in "object-space"
	//gl_Position = aPosition;

	// position in world-space (wrong)
	//vec4 pos_world = uModelMat * aPosition;
	//gl_Location = pos_world;

	// position in camera-space (also wrong)
	//vec4 pos_camera = uViewMat * uModelMat * aPosition;
	//vec4 pos_camera = uViewMat * pos_world;
	//gl_Position = pos_camera;

	// position in clip-space (finally!)
	//vec4 pos_clip = uProjMat * uViewMat * uModelMat * aPosition;
	//vec4 pos_clip = uViewProjMat * pos_world;
	
	// POSITION PIPELINE
	mat4 modelViewMat = uViewMat * uModelMat;
	vec4 pos_camera = modelViewMat * aPosition;
	vec4 pos_clip = uProjMat * pos_camera;
	gl_Position = pos_clip;
	
	// NORMAL PIPELINE
	mat3 normalMat = transpose(inverse(mat3(modelViewMat)));
	vec3 norm_camera = normalMat * aNormal;
	//vec3 norm_camera = mat3(modelViewMat) * aNormal;
	
	// TEXCOORD PIPELINE
	mat4 atlasMat = mat4(0.5, 0.0, 0.0, 0.25,
						 0.0, 0.5, 0.0, 0.25,
						 0.0, 0.0, 1.0, 0.0,
						 0.0, 0.0, 0.0, 1.0);
	vec4 uv_atlas = atlasMat * aTexcoord;
	
	// OPTIONAL: set varyings
	//vColor = vec4(1.0, 0.5, 0.0, 1.0);
	
	// DEBUGGING: 
	
	// PER-VERTEX: calculate and output final color
	//vColor = vec4(0.5 * aNormal + 0.5, 1.0);
	
	// PER-FRAGMENT: pass things that FS needs to calculate final color
	//vNormal = vec4(aNormal, 0.0);
	vNormal = vec4(norm_camera, 0.0);
	
	//vTexcoord = aTexcoord;
	vTexcoord = uv_atlas;
	
	//gl_Position = uProjMat * modelViewMat * aTexcoord;
	
	// LIGHTS
	sLight lightOne;
    initLight(lightOne, vec4(1.0, 0.0, 1.0, 0.0), vec3(1.0, 0.75, 0.0), 100.0);
    
	sLight lightTwo;
    initLight(lightTwo, vec4(1.0, 0.0, 1.0, 0.0), vec3(1.0, 0.75, 0.0), 100.0);
    
	sLight lightThree;
    initLight(lightThree, vec4(1.0, 0.0, 1.0, 0.0), vec3(1.0, 0.75, 0.0), 100.0);
}