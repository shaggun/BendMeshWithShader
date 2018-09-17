Bending a mesh with a shader using a sine function in Unity
=====================================
![gif](https://i.imgur.com/ndl30QA.gif)

This is a simple shader for Unity to bend a mesh with a sine function.
Useful when you want to simulate the bending caused due to a force being applied to an object.
The sine function is being plotted along the Z axis, if you want to bend along the X axis edit line 33 like this:

```sh
float4 appendResult = (float4(vertex3Pos.z , ( sin( ( _OffsetSin + ( vertex3Pos.x * _Frequency ) ) ) * _Amplitude ) , vertex3Pos.x , 0.0));
```

The more vertices your mesh has along the axis you want to bend the smoother it will look.

If you don't want to download or clone the whole project [here's only the shader](https://gist.github.com/shaggun/50a9d39187f5516a870aba03528368ee).

**Tested with Unity 2018.2**
