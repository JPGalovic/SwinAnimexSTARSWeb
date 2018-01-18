<?php
	// Error Reporting, Version 1.1, JAN18, JPGalovic
	// Code requires variables to be set
	if(isset($error_no))
	{
		if(isset($error_text))
		{
			$error_time = date('Y-m-d H:i:s', time());
			mail('web_error@swinanime.net',
					  'Website Error - '.$error_time.' - '.$error_no,
					  'An error has occured on the swinanime website at '.$error_time.'. Error: '.$error_no.', '.$error_text,
					  'From: webmaster@swinanime.net'.'\r\n'.'Reply-To: webmaster@swinanime.net'.'\r\n'.'X-Mailer: PHP/'.phpversion()
					 );
			die('<p>SwinAnime apologies, an error has occured and will hopefully be fixed soon. In the meantime please visit our <a href="https://www.facebook.com/swinanime/">facebook page</a></p><p>Website Error - '.$error_time.' - '.$error_no.'</p>');
		}
	}
?>