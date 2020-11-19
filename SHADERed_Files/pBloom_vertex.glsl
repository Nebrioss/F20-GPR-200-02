#version 300 es

layout (location = 0) in vec4 aPosition;
//layout (location = 2) in vec2 aTexcoord;

out vec2 vTexcoord;

void main()
{
	gl_Position = aPosition; // * vec4(0.5, 0.5, 0.5, 1.0);
	
	//vTexcoord = aTexcoord; // = 
	vTexcoord = aPosition.xy * 0.5 + 0.5;// NDC -> screen: [-1, 1] -> [0, 1]
}