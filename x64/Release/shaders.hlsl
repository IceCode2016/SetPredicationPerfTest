//*********************************************************
//
// Copyright (c) Microsoft. All rights reserved.
// This code is licensed under the MIT License (MIT).
// THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY
// IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR
// PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.
//
//*********************************************************

struct PSInput
{
    float4 position : SV_POSITION;
    float4 color : COLOR;
    float2 wpos : TEXCOORD0;
};

PSInput VSMain(float4 position : POSITION, float4 color : COLOR)
{
    PSInput result;

    result.position = position;
    result.color = color;
    result.wpos = position.xy;

    return result;
}

float4 PSMain(PSInput input) : SV_TARGET
{
    float2 color_scale = exp(asin(input.wpos));
    //for (int i = 0; i < 100; ++i)
    //{
    //    color_scale = exp(color_scale);
    //}
    color_scale = (sin(color_scale) * 0.5f + 0.5f);
    float4 color = float4(color_scale * input.color.xy, input.color.z, input.color.w);
    return color;
}
