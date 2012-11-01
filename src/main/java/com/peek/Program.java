package com.peek;

public class Program
{

	public static void main(String[] args)
	{
		AgentManager am = new AgentManager();

		am.setupStorage();

		am.registerAgent("arthur@example.com", "Arthur", "/EclipseWS/Tennis/src/sample.png");
		am.registerAgent("maria@example.com", "Maria", "/EclipseWS/Tennis/src/sample.png");




	}
}