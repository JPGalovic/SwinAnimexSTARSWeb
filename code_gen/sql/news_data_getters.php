<?php
	// SQL getters for News & Newsletter Data, Version 1.0.0, FEB18, JPGalovic

	// Gets all details for all articles in a newsletter from a given date
	function get_newsletter_articles($newsletter_date)
	{
		$query = 'SELECT NEWS_ARTICLE.ARTICLE_HEADLINE, NEWS_ARTICLE.ARTICLE_IMAGE_URL, NEWS_ARTICLE.ARTICLE_TEXT, NEWS_ARTICLE.ARTICLE_AUTHOR FROM NEWS_ARTICLE LEFT JOIN ARTICLE_LINKER ON (NEWS_ARTICLE.ARTICLE_DATE, NEWS_ARTICLE.ARTICLE_HEADLINE) = (ARTICLE_LINKER.ARTICLE_DATE, ARTICLE_LINKER.ARTICLE_HEADLINE) WHERE PUBLICATION_DATE = "'.$newsletter_date.'"';
		
		return run_query($query);
	}
?>