Shader "BendMesh"
{
	Properties
	{
		_Texture("Texture", 2D) = "white" {}
		_Color("Color", Color) = (0,0,0,0)
		_Amplitude("Amplitude", Float) = 0
		_Frequency("Frequency", Float) = 0
		_OffsetSin("OffsetSin", Float) = 0
		
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Texture;
		uniform float4 _Color;
		uniform float _OffsetSin;
		uniform float _Frequency;
		uniform float _Amplitude;
		uniform float4 _Texture_ST;
		
		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 vertexPos = v.vertex.xyz;
			float4 result = (float4(0.0 , ( sin( ( _OffsetSin + ( vertexPos.z * _Frequency ) ) ) * _Amplitude ) , 0.0 , 0.0));
			v.vertex.xyz += result.xyz;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Texture = i.uv_texcoord * _Texture_ST.xy + _Texture_ST.zw;
			o.Albedo = ( tex2D( _Texture, uv_Texture ) * _Color ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}