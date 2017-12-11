package com.meta.heuristicas;

public class Arista implements Comparable<Arista> {
	public int Vertice1;
	public int Vertice2;
	public int Costo;
	public int Flujo;

	@Override
	public int compareTo(Arista other) {
		if (this.Costo < other.Costo) {
			return -1;
		}
		
		if (this.Costo > other.Costo) {
			return 1;
		}
		
		return 0;
	}
}
