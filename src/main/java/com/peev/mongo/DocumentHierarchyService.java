package com.peev.mongo;

import com.mongodb.ServerAddress;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import java.util.*;


public class DocumentHierarchyService
{
	MongoTemplate mongoTemplate;

	public DocumentHierarchyService(MongoTemplate mTemplate)
	{
		this.mongoTemplate = mTemplate;
	}

	public Folder find(final String id)
	{
		final Folder document = mongoTemplate.findOne(
				Query.query(new Criteria("id").is(id)),
				Folder.class
		);

		if (document == null)
		{
			return document;
		}

		return build(
				document,
				mongoTemplate.find(
						Query.query(new Criteria("path").regex("^" + id + "["+Folder.PATH_SEPARATOR+"]")),
						Folder.class
				)
		);
	}

	private Folder build(final Folder root, final Collection<Folder> documents)
	{
		final Map<String, Folder> map = new HashMap<String, Folder>();

		for (final Folder document : documents)
		{
			map.put(document.getPath(), document);
		}

		for (final Folder document : documents)
		{
			map.put(document.getPath(), document);

			final String path = document
					.getPath()
					.substring(0, document.getPath().lastIndexOf(Folder.PATH_SEPARATOR));

			if (path.equals(root.getPath()))
			{
				root.getDocuments().add(document);
			}
			else
			{
				final Folder parent = map.get(path);
				if (parent != null)
				{
					parent.getDocuments().add(document);
				}
			}
		}

		return root;
	}

	public long countDocuments(final String collection, final Query query)
	{
		return mongoTemplate.executeCommand(
				"{ " +
						"\"count\" : \"" + collection + "\"," +
						"\"query\" : " + query.getQueryObject().toString() +
						" }").getLong("n");
	}


/*	public void insertOrUpdate(final Folder document)
	{
		final BasicDBObject dbDoc = new BasicDBObject();
		converter.write(document, dbDoc);

		mongoTemplate.execute(Folder.class,
				new CollectionCallback<Object>()
				{
					public Object doInCollection(DBCollection collection)
							throws MongoException, DataAccessException
					{
						collection.update(
								new Query()
										.addCriteria(new Criteria("name").is(document.getName()))
										.getQueryObject(),
								dbDoc,
								true,
								false
						);

						return null;
					}
				}
		);
	}
  */

	public void createCollection(final String name)
	{
		mongoTemplate.createCollection(name);
	}

	public void dropCollection(java.lang.Class tClass)
	{
		mongoTemplate.dropCollection(tClass);
	}

	public void insert(final Object object, final String collection)
	{
		mongoTemplate.insert(object, collection);
	}

	/*
	public void createIndex(final String name, final String collection)
	{
		template.ensureIndex(
				new Index()
						.on(name, Order.DESCENDING)
						.unique(Index.Duplicates.DROP),
				collection
		);
	}
      */


	public void hitMongo()
	{
		System.out.println("mongoTemplate is: " + mongoTemplate);

		List<ServerAddress> serverAddressList = mongoTemplate.getDb().getMongo().getConnector().getServerAddressList();
		for (int i = 0; i < serverAddressList.size(); i++)
		{
			ServerAddress address = serverAddressList.get(i);
			System.out.println(i + ") address = " + address);
		}

		int si = serverAddressList.size();
		System.out.println("SIZE:" + si);
		MongoOperations mongoOperations = mongoTemplate;

		if (mongoOperations.collectionExists(Folder.class))
		{
			mongoOperations.dropCollection(Folder.class);
		}

		mongoOperations.createCollection(Folder.class);

		Folder p = new Folder("John", "39");
		Folder p2 = new Folder("John", "39", p);

		mongoOperations.insert(p);

		List<Folder> results = mongoOperations.findAll(Folder.class);
		System.out.println("Results: " + results);
	}


	public void loadSampleData()
	{
		//template.dropCollection( Folder.class );

		final Folder parent = new Folder("root", "root");
		final Folder child1 = new Folder("readingList", "readingList", parent);
		final Folder child11 = new Folder("cancer", "cancer", child1);
		final Folder child12 = new Folder("sickness", "sickness", child1);
		final Folder child121 = new Folder("diet", "diet", child12);
		final Folder child13 = new Folder("lungs", "lungs", child1);
		final Folder child2 = new Folder("savedSearches", "savedSearches", parent);

		mongoTemplate.insertAll(Arrays.asList(parent, child1, child11, child12, child121, child13, child2));


	}
}
