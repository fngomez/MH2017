package com.meta.heuristicas;

import java.util.List;
import java.util.LinkedList;
import java.util.TreeSet;

public class Grafo {
	
	private Vertice[] vertices;
	private Vertice raiz;
	private int capacidadMaxima;
	
	// Los vertices deben estar numerados desde cero y de forma continua
	// Las aristas no son dirigidas
	public Grafo(int raiz, int cantidadVertices, List<Arista> aristas, int capacidadMaxima) {
		
		this.capacidadMaxima = capacidadMaxima;
		
		this.vertices = new Vertice[cantidadVertices];
		
		for (int i = 0; i < cantidadVertices; i++) {
			
			Vertice nuevoVertice = new Vertice();
			nuevoVertice.Numero = i;
			
			for (Arista arista : aristas) {
				if (arista.Vertice1 == i || arista.Vertice2 == i) {
					nuevoVertice.Aristas.add(arista);
				}
			}
			
			this.vertices[i] = nuevoVertice;
			
			if (nuevoVertice.Numero == raiz) {
				this.raiz = nuevoVertice;
			}
		}
		
	}
	
	public List<Vertice> GenerarAGM() {
		LinkedList<Vertice> AGM = new LinkedList<Vertice>();
		boolean[] verticesAGM = new boolean[this.vertices.length];
		TreeSet<Arista> aristasElegibles = new TreeSet<Arista>();
		
		for (int i = 0; i < this.vertices.length; i++) {
			verticesAGM[i] = false;
		}
		
		AGM.add(this.raiz);
		verticesAGM[this.raiz.Numero] = true;
		aristasElegibles.addAll(this.raiz.Aristas);
		
		while (AGM.size() < this.vertices.length) {
			Arista proximaArista = aristasElegibles.first();
			
			if ((verticesAGM[proximaArista.Vertice1] && verticesAGM[proximaArista.Vertice2])) {
				continue;
			}
			
			Vertice nuevoVerticeAGM;
			
			if (!verticesAGM[proximaArista.Vertice1]) {
				nuevoVerticeAGM = this.vertices[proximaArista.Vertice1];
			} else {
				nuevoVerticeAGM = this.vertices[proximaArista.Vertice2];
			}
			
			AGM.add(nuevoVerticeAGM);
			aristasElegibles.addAll(nuevoVerticeAGM.Aristas);
			verticesAGM[nuevoVerticeAGM.Numero] = true;
		}

		return AGM;
	}
}
