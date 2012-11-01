package com.peev.mongo;

import com.mongodb.Mongo;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.core.mapping.MongoMappingContext;

@Configuration
public class AppConfig
{
	@Bean
	public MongoFactoryBean mongo()
	{
		MongoFactoryBean factory = new MongoFactoryBean();
		factory.setHost("ec2-107-21-219-245.compute-1.amazonaws.com");
		factory.setPort(1080);
		System.out.println("Setting up mongo:" + factory);

		return factory;
	}

	@Bean
	public SimpleMongoDbFactory mongoDbFactory() throws Exception
	{
		Mongo mongo = mongo().getObject();
		System.out.println("setting up mongoDbFactory("+mongo+")");
		return new SimpleMongoDbFactory(mongo, "hierarchical");
	}

	@Bean
	public MongoTemplate mongoTemplate() throws Exception
	{
		return new MongoTemplate(mongoDbFactory());
	}

	@Bean
	public DocumentHierarchyService documentHierarchyService() throws Exception {
		return new DocumentHierarchyService( mongoTemplate() );
	}

	@Bean
	public MappingMongoConverter converter()
	{
		try
		{
			return new MappingMongoConverter(mongoDbFactory(),mappingContext());
		}
		catch (Exception e)
		{
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}
		return null;
	}


	@Bean
	public MongoMappingContext mappingContext(){
		return new MongoMappingContext();
	}

}