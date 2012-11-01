package com.djstat.service;

import com.djstat.exception.DuplicateException;
import com.djstat.form.vCard;
import com.djstat.model.QrArtifact;
import com.djstat.model.vCardEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

@Service
public class QRCodeServices
{

	private static final Logger LOG = LoggerFactory.getLogger(QRCodeServices.class);


	@PersistenceContext
	private transient EntityManager entityManager;


	public String addQrContent(String qrText)
	{
		String qText = cleanQrText(qrText);

		//todo : clean text
		QrArtifact data = new QrArtifact();
		data.setQrText(qText);
		//data.setCreateDateTime(new Date().getTime());


		final Query query = entityManager.createQuery("SELECT u FROM com.djstat.model.QrArtifact u WHERE qrText = :qrText");
		query.setParameter("qrText", qText);

		@SuppressWarnings("unchecked")
		final List results = query.getResultList();
		if(results != null && !results.isEmpty())
		{
			throw new DuplicateException("A duplicate QR Code has been found.");
		}

		entityManager.persist(data);

		System.out.println("The object ID=" + data.getId());


		return data.getId();
	}


	private String cleanQrText(String qrt)
	{
		return qrt;
	}

	public QrArtifact getQrArtifiact(String id)
	{
		final Query query = entityManager.createQuery("SELECT u FROM com.djstat.model.QrArtifact u WHERE id = :id");
		query.setParameter("id", id);

		@SuppressWarnings("unchecked")
		final List results = query.getResultList();
		if(results != null && results.size() > 0)
		{
			return (QrArtifact) results.get(0);
		}
		else
		{
			return null;
		}
	}

	public List<QrArtifact> getQrCodeList()
	{
		final Query query = entityManager.createQuery("SELECT u FROM com.djstat.model.QrArtifact");
		return query.getResultList();
	}

	public String createUid(String username, String type)
	{
		QrArtifact qr = new QrArtifact();
		qr.setUsername(username);
		qr.setType(type);
		//qr.setCreateDateTime(new Date().getTime());
		entityManager.persist(qr);
		System.out.println("The qrArtifact ID=" + qr.getId());
		return qr.getId();
	}

	public String addVCard(String username, vCard vcard)
	{

		vCardEntity ent = new vCardEntity(username, vcard);
		ent.setCreateDateTime(new Date().getTime());
		entityManager.persist(ent);
		System.out.println("creating vCard w ID=" + ent.getId());
		return ent.getId();
	}

	public vCardEntity getVCard(String key)
	{
		final Query query = entityManager.createQuery("SELECT u FROM com.djstat.model.vCardEntity u WHERE id = :key");
		query.setParameter("key", key);

		@SuppressWarnings("unchecked")
		final List results = query.getResultList();
		if(results != null && results.size() > 0)
		{
			return (vCardEntity) results.get(0);
		}
		else
		{
			return null;
		}
	}

	public List<vCardEntity> getVCards(String username)
	{
		final Query query = entityManager.createQuery("SELECT u FROM com.djstat.model.vCardEntity u WHERE username = :key");
		query.setParameter("key", username);

		return query.getResultList();
	}
}