#version 300 es

#ifdef GL_ES
precision highp float;
#endif

layout (location = 0) out vec4 rtFragColor;
//out vec4 rtFragColor;

// TEXTURE UNIFORM
uniform sampler2D uTexture;

// VARYING

// PER-VERTEX: receive the final color
in vec4 vColor;

// PER-FRAGMENT: receive stuff used for final color
in vec4 vNormal;

//in vec2 vTexcoord;
in vec4 vTexcoord;

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
    vec3 lightVector = normalize(light.sCenter.xyz - normalize(vNormal.xyz));
    vec3 diffuseCoefficient = vNormal.xyz * lightVector;
    
    vec3 attenuation = 1.0 / (1.0 + ((light.sCenter.xyz - vec3(vNormal.xyz)) / light.sIntensity) + (((light.sCenter.xyz - vec3(vNormal.xyz)) * (light.sCenter.xyz - vec3(vNormal.xyz)) / (light.sIntensity * light.sIntensity))));
    
    vec3 diffuseIntensity = diffuseCoefficient * attenuation;

	return vec3(diffuseIntensity * light.sColor);
}


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
	
	// used for testing light
	rtFragColor = vec4(1.0, 1.0, 1.0, 1.0);
	
	// USING LIGHTS
	rtFragColor = vColor;
	
	// USING TEXTURE
	//rtFragColor = texture(uTexture, 2.0 * vTexcoord.xy);
}