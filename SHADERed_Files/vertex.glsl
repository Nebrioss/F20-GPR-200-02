#version 300 es

layout (location = 0) in vec4 aPosition;

uniform mat4 uModelMat, uViewMat, uProjMat;

out vec4 vPosClip;

void main()
{
	//gl_Position = aPosition;
	// w = 1 because point
	
	//gl_Position = aPosition * vec4(0.5, 0.5, 0.5, 1);
	
	//gl_Position = uModelMat * aPosition;
	// w = 1 because point
	
	//gl_Position = uViewMat * uModelMat * aPosition;
	// w = 1 because point
	
	gl_Position = uProjMat * uViewMat * uModelMat * 
		(aPosition * vec4(0.5, 0.5, 0.5, 1.0));
						//multipying the vec to sace the image
						
	
	// w = 1 because point if orthographic
	// w = distance from viewer
	
	// NOT PART OF VS
	// NDC = CLIP / CLIP.W
	// w = 1
	// visible region is contained within [-1, 1]
	
	vPosClip = gl_Position;
	
	//gl_Position /= gl_Position.w;
	//failsafe prevents this from messing things
}