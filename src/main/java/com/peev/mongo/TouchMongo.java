package com.peev.mongo;


import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Collection;
import java.util.Iterator;

public class TouchMongo
{
	public static void main(String[] args)
	{
		ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		DocumentHierarchyService service = context.getBean(DocumentHierarchyService.class);
		//service.hitMongo();

		service.dropCollection(Folder.class);

		service.loadSampleData();
		Folder sd = service.find("root");


		  print(sd);


	}

	private static void print(Folder sd)
	{
		System.out.println(sd);
		Collection<Folder> col = sd.getDocuments();
		for (Iterator<Folder> iterator = col.iterator(); iterator.hasNext(); )
		{
			Folder next = iterator.next();
			print(next);
		}
	}
}
