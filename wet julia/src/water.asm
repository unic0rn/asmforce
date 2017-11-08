	parameter	"_OutCoord", float2, f0.rg, in

	texture		"wave1", t0

	texture		"source", t1

	parameter	"result", float4, f2, out

;----------------------------------------------------------

	mov		f1.rg, f0.rg
	set		f0.a, 0.5
	mul		f1.rg, f0.aa
	texb	f0.b, f1.rg, t0.r
	sub		f0.b, f0.a
	set		f0.a, 48
	mul		f0.a, f0.b
	add		f0.rg, f0.aa
	texb	f2, f0.rg, t1
	set		f0.a, 4
	mul		f0.b, f0.a
	add		f0.b, f2.a
	mul		f2.rgb, f0.bbb
