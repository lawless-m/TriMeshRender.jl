module TriMeshRender

using TriMeshes
using Luxor

export isometric, render,  box!

quad! = TriMeshes.quad!

const r6 = sqrt(6)
const rr6 = 1/r6
const r2 = sqrt(2)
const r3 = sqrt(3)

const rM = [ [r3, 1, r2] [0,2,r2] [-r3,1,r2] ]
const Orth = [ [1,0,0] [0,1,0] [0,0,0] ]

function isometric(v::Vertex) 
	iv = Orth * rr6 * rM * v
	Point(iv[1], iv[2])
end

isometric(n::Net) = map(isometric, n.vertices)

function render(n::Net, w, h, fname)
	@png begin
	points = isometric(n)
	for f in n.faces
		line(points[f.AB.from], points[f.AB.to], :stroke)
		line(points[f.BC.from], points[f.BC.to], :stroke)
		line(points[f.CA.from], points[f.CA.to], :stroke)
	end
	end w h fname
end


###
end
