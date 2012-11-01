package com.peev.mongo;
import java.util.Collection;
import java.util.HashSet;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document( collection = "documents" )
public class Folder
{
	public static final String PATH_SEPARATOR = "/";

	@Id private String id;
	@Field private String name;
	@Field private String path;

	// We won't store this collection as part of document but will build it on demand
	@Transient private Collection<Folder> documents = new HashSet<Folder>();

	public Folder() {
	}

	public Folder(final String id, final String name) {
		this.id = id;
		this.name = name;
		this.path = id;
	}

	public Folder(final String id, final String name, final Folder parent) {
		this( id, name );
		this.path = parent.getPath() + PATH_SEPARATOR + id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Collection<Folder> getDocuments() {
		return documents;
	}

	@Override
	public String toString()
	{
		return "Folder{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", path='" + path + '\'' +
				", docSize=" + documents.size() +
				'}';
	}
}