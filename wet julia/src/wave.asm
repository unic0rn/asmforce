	parameter	"_OutCoord", float2, f0.rg, in
	
	texture		"wave0", t0

	texture		"wave1", t1

	parameter	"result", float4, f2, out

;----------------------------------------------------------

	mov		f1.rg, f0.rg
	set		f3.r, 0
	set		f3.g, -1
	set		f3.b, 2
	add		f1.rg, f3.gr
	texn	f2, f1.rg, t0
	add		f1.rg, f3.br
	texn	f4, f1.rg, t0
	add		f2.r, f4.r
	add		f1.rg, f3.gg
	texn	f4, f1.rg, t0
	add		f2.r, f4.r
	add		f1.rg, f3.rb
	texn	f4, f1.rg, t0
	add		f2.r, f4.r
	set		f1.r, 0.5
	set		f1.a, 0.0078125
	mul		f2.r, f1.r
	texn	f4, f0.rg, t1
	sub		f2.r, f4.r
	sub		f1.r, f2.r
	mul		f1.r, f1.a
	add		f2.r, f1.r
	ltn		f2.r, f3.r
	if		i0.r
	mov		f2.r, f3.r
	end
	mov		f2.gb, f2.rr
