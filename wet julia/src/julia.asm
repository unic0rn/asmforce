	parameter	"_OutCoord", float2, f0.rg, in

	texture		"wave0", t0

	parameter	"result", float4, f1, out

	parameter	"scale", float2, f0.ba, in

	parameter	"c", float2, f2.rg, in

;----------------------------------------------------------

	texn	f1, f0.rg, t0
	mul		f0.rg, f0.ba
	set		f3.r, 2
	sub		f0.rg, f3.rr
	
	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	set		f4.r, 32
	ltn		f3.r, f4.r
	if		i0.r

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r
	set		f1.rgb, 0.2

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r
	set		f1.rgb, 0.4

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r
	set		f1.rgb, 0.8

	mov		f3.rg, f0.rg
	mul		f0.rg, f0.rg
	sub		f0.r, f0.g
	add		f0.r, f2.r
	mul		f3.r, f3.g
	add		f3.r, f3.r
	add		f3.r, f2.g
	mov		f0.g, f3.r
	
	mov		f3.rg, f0.rg
	mul		f3.rg, f3.rg
	add		f3.r, f3.g
	ltn		f3.r, f4.r
	if		i0.r
	set		f1.rgb, 1

	end
	end
	end
	end
	end
	end
	end
	end
