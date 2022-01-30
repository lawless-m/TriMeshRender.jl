using TriMeshRender
using Test

Vertex = TriMeshRender.Vertex

@testset "TriMeshRender.jl" begin
	@test isometric(Vertex(0,0,0)) == Vertex(0,0,0)
	@test isometric(Vertex(0,1,0)) == Vertex(0,1,0)
	@test isometric(Vertex(1,0,0)) ≈ Vertex(cos(deg2rad(30)), sin(deg2rad(30)), 0)
	@test isometric(Vertex(2,0,0)) ≈ Vertex(2cos(deg2rad(30)), sin(2deg2rad(30)), 0)
	@test isometric(Vertex(1,1,0)) ≈ Vertex(cos(deg2rad(30)), 1+sin(deg2rad(30)), 0)
	@test isometric(Vertex(0,0,1)) ≈ Vertex(-cos(deg2rad(30)), sin(2eg2rad(30)), 0)
	@test isometric(Vertex(0,0,2)) ≈ Vertex(-2cos(deg2rad(30)), sin(2deg2rad(30)), 0)
end



