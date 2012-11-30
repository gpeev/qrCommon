package com.g;

import com.djstat.model.FaceBookData;
//import org.springframework.social.facebook.api.Facebook;
//import org.springframework.social.facebook.api.ImageType;
//import org.springframework.social.facebook.api.Page;
//import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.io.IOException;


public class SocialTest
{

	public static void main(String[] args) throws IOException
	{
		File f = new File("");
		String path = f.getCanonicalPath();
		System.out.println( "path:"+path);

//		ApplicationContext ctx = new ClassPathXmlApplicationContext("file:/Volumes/Big Brain-2/vmwareBkup/djStat.com/src/main/webapp/WEB-INF/applicationContext.xml");
//		MailService mail = ctx.getBean("mailService",MailService.class);

//		String from = mail.getFromAddress();

//		System.out.println("From:"+from);



		//Facebook fb = new FacebookTemplate();
		//Page p = fb.fetchObject("DavidGuetta",Page.class);
		//String s = fb.fetchObject("DavidGuetta",String.class);
//		RestTemplate rt = fb.fetchObject("DavidGuetta",RestTemplate.class);
		RestTemplate rt = new RestTemplate();

		FaceBookData fbo = rt.getForObject("https://graph.facebook.com/DavidGuetta", FaceBookData.class);
		System.out.println("Name = "+ fbo.getName());
		System.out.println("Likes = "+ fbo.getLikes());
		System.out.println("TA = "+ fbo.getTalking_about_count());
		System.out.println("websites = "+ fbo.getWebsite());


	//	System.out.println("s = " + s);



	//	System.out.println("Likes = " + p.getLikes());
	//	System.out.println("Checkins = " + p.getCheckins());
	//	System.out.println("FanCnt = " + p.getFanCount());

	}

	/**
	 * s = {
	 * 	"name":"David Guetta",
	 * 	"is_published":true,
	 * 	"website":"http:\/\/www.davidguetta.com http:\/\/www.youtube.com\/davidguetta http:\/\/twitter.com\/davidguetta ",
	 * 	"username":"DavidGuetta",
	 * 	"about":"FOLLOW ME ON TWITTER : http:\/\/twitter.com\/davidguetta",
	 * 	"genre":"Electro \/ House",
	 * 	"band_members":"David Guetta",
	 * 	"current_location":"Paris, FR",
	 * 	"record_label":"GUM PROD \/ EMI",
	 * 	"bio":"With 2009\u2019s multi-platinum One Love, two-time-Grammy-winning artist\/producer\/DJ David Guetta cemented his status as a genre-busting hitmaker whose in-your-face fusion of electro and hip-hop beautifully warps the pop landscape. Now, with his fifth studio album Nothing But The Beat, Guetta builds on that breakthrough momentum and takes his decades-spanning career to a frenetic new level marked by bigger hooks and more brain-bending beats. A star- packed powerhouse showcasing today\u2019s hottest hip-hop and R&B artists, Nothing But The Beat backs up its high-gloss pop with ingenious electronic stylings that deftly flaunt Guetta\u2019s DJ pedigree. In a nod to the driving force behind Guetta\u2019s crossover success, the double album (due out August 29) also offers an all-instrumental disc designed to turn new listeners on to the hypnotic sound of house music.\n\nOne of the most wildly anticipated albums of the year, Nothing But The Beat comes hot on the heels of the rush release of its first smash single, \u201cWhere Them Girls At\u201d (featuring Flo Rida & Nicki Minaj). Already his fasting selling single to reach gold status in the USA, the dizzying and deadly catchy \u201cWhere Them Girls At\u201d marks a one-time return to the straight-up club-anthem sensibility of Guetta\u2019s \u201cSexy Bitch\u201d (the 2009 monster hit that moved 5 million units worldwide). \u201cWhen I listen to the radio in the U.S., every song sounds like \u2018Sexy Bitch,\u2019\u201d says Guetta. \u201cThe urban dance thing has become huge. Now I have to push it because my sound has become so popular. It\u2019s a challenge, but I like that.\u201d\n\nFor help in blowing up those musical boundaries, Guetta assembled an A-team of collaborators sure to thrill enthusiasts from all ends of the pop spectrum. Nothing But The Beat features no fewer than 17 guest artists, from hip-hop royalty (Snoop Dogg, Ludacris, Timbaland) and game-changing rappers (Minaj, Lil Wayne) to R&B superstars (Usher, Chris Brown, Akon) and breakout pop acts (Dev, Jessie J). Rounded out by Jennifer Hudson, Flo Rida, Taio Cruz, Sia, and Guetta\u2019s \u201cfellow mad scientist\u201d Will.I.Am., that roster was carefully culled to guarantee a filler-free album destined to deliver hit after hit. \u201cI produced about 40 songs to get these 13 records together,\u201d Guetta explains. \u201cI wanted every song to be huge, phenomenal.\u201d\n\nNot only boasting massive pop appeal, Nothing But The Beat bears a broad, adventurous scope of sound that reaffirms Guetta\u2019s role as a pioneer of the electronica\/urban music hybrid. To start, the album blasts off with the dancefloor- ruling trinity of \u201cWhere Them Girls At,\u201d \u201cLittle Bad Girl,\u201d and \u201cTurn Me On,\u201d a triple threat that quickly proves Nothing But The Beat to be a high-energy hit machine. Riding off the feel-good frenzy of \u201cWhere Them Girls At,\u201d \u201cLittle Bad Girl\u201d pairs\n\nLudacris\u2019s masterfully bombastic flow with the smooth, sexed-up vocals of singer\/rapper Taio Cruz\u2014all while repurposing classic house-music elements (lush synth loops, crisp beats) into a radio-ready knockout. On the glorious and gut-punching \u201cTurn Me On,\u201d meanwhile, Guetta grants Nicki Minaj her stunning debut as a full-fledged songbird. \u201cEveryone knows she\u2019s the best female rapper right now,\u201d says Guetta. \u201cI wanted to take her somewhere she\u2019s never been.\u201d The track brilliantly contrasts Minaj\u2019s trademark madcap rapping with disarmingly tender vocal work, complementing her persona-switching performance with a slick barrage of erratic beats and spaced-out effects.\n\nEver experimental, Guetta transports his collaborators to previously unexplored sonic spaces all throughout Nothing But The Beat. On \u201cSweat,\u201d for instance, Guetta remixes one of his most prized DJ records as a stark, synth-heavy electro-hop track that spotlights Snoop Dogg\u2019s strikingly sleek vocals. Elsewhere on the album, guest artists match Guetta\u2019s ingenuity with their own brand of beamed-in-from-another-dimension whimsy and weirdness. Just as \u201cI Can Only Imagine\u201d alternates shimmering, buoyant beats with wildly skidding synth, the track continually trades off Chris Brown\u2019s warm melodies with the lyrical mischief- making of Lil Wayne (whom Guetta dubs \u201ca big genius\u201d). And on \u201cI Just Wanna F,\u201d Timbaland and Dev play a deliciously dirty version of the alphabet game while Guetta lays down a densely textured groove that makes this futuristic fever dream one of the album\u2019s most irresistible moments.\n\nAt the heart of Nothing But The Beat is a selection of soul-stirring songs that reveal the spirit behind Guetta\u2019s gorgeously crafted beats. With all the passion and power of an old-school dance anthem, \u201cNight Of Your Life\u201d shows off Jennifer Hudson\u2019s heavenly voice and remarkable range. On the slow-building \u201cWithout You,\u201d Usher opens with achingly vulnerable vocals that soon swell into a soaring, sweeping performance ultimately backed by delicate piano work. \u201cIt\u2019s possibly the biggest track on the album,\u201d says Guetta of \u201cWithout You.\u201d \u201cIt\u2019s a monster\u2014so big, so emotional.\u201d In a one-two punch, Guetta follows \u201cWithout You\u201d with the equally wistful opening moments of \u201cNothing Really Matters\u201d\u2014then turns it all around and elevates the Will.I.Am-led track into an escapist party jam. \u201cI love playing with both worlds,\u201d says Guetta, noting the bold disparity between the \u201ccrazy electro-beat and the super-sophisticated string arrangement\u201d on \u201cNothing Really Matters.\u201d To close out Nothing But The Beat, Guetta taps into the otherworldly vocal prowess of Australian indie-pop star Sia. Ethereal yet anthemic, \u201cTitanium\u201d enchants the listener with trance-inducing beats and a lyrical intensity unrivaled on the pop scene today.\n\nSwitching gears for the 10-track accompanying disc, Guetta reconnects with his electro roots and primary fan base. \u201cI didn\u2019t want people who\u2019ve been following me for years to feel left out,\u201d says Guetta. \u201cI feel like if I lose my original fans, it\u2019s over. Without those people that inspire me, I\u2019m just another pop producer.\u201d From tripped-out techno to drum-driven dubstep experiments to raw and riotous dirty house, the instrumental element of Nothing But The Beat illuminates Guetta\u2019s\nvirtuosity as a DJ\u2014an art he continues to hone and expand even as he racks up chart-topping records. That evidence of Guetta\u2019s remaining firmly rooted in club culture will no doubt satisfy longtime electronica devotees, while at the same time ushering a whole new audience into the dance-music underground. \u201cBecause I\u2019m a DJ first, I wanted to use my success to introduce newer fans to what my culture is about and where my inspiration comes from,\u201d Guetta notes.\n\nThat sizable success isn\u2019t nearly limited to Guetta\u2019s work as a recording artist and DJ. In addition to selling more than 5 million albums worldwide since his 2001 debut, Guetta acted as producer on the Black Eyed Peas\u2019 \u201cI Gotta Feeling\u201d (the highest-selling digital release in music history). Along with his two Grammys (one for his remix of Madonna\u2019s \u201cRevolver\u201d in 2011, the other for his remix of One Love\u2019s \u201cWhen Love Takes Over), Guetta took home the Best DJ, Best Producer, and Best-Selling French Artist prizes at the 2010 World Music Awards. And having kicked off his DJ career as a teenager in his native France, Guetta also partners with his wife Cathy on promoting duties for the legendary F*** Me I\u2019m Famous dance parties (held in locations like Ibiza, Miami, New York, and Las Vegas since 1995). \u201cIt doesn\u2019t matter if I make a beat that\u2019s going to be a song on the radio, or if I make a record that\u2019s meant to please DJs,\u201d Guetta says of continuing to bridge the gap between electronic and pop on Nothing But The Beat. \u201cI always just think of making people dance\u2014that\u2019s my first priority.\u201d",
	 * 	"talking_about_count":274294,
	 * 	"category":"Musician\/band",
	 * 	"id":"7619396355",
	 * 	"link":"http:\/\/www.facebook.com\/DavidGuetta",
	 * 	"likes":34666104,
	 * 	"cover":{
	 * 		"cover_id":"10150982186771356",
	 * 		"source":"http:\/\/sphotos-b.xx.fbcdn.net\/hphotos-ash3\/s720x720\/551224_10150982186771356_36287974_n.jpg",
	 * 		"offset_y":0
	 * 		}
	 * }

	 */




}
