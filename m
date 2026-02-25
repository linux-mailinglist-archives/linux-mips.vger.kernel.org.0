Return-Path: <linux-mips+bounces-13232-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBoVHDJpn2lRagQAu9opvQ
	(envelope-from <linux-mips+bounces-13232-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 22:27:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB319DD26
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 22:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35055302F422
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 21:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3249F313285;
	Wed, 25 Feb 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PzBp7ysd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D3306B21
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 21:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054828; cv=none; b=M0BzsDtuGr1zRI9xmW4bHZ5Hb7Slo1R7odXJ8hwuT1DH+wbRBBp67AVAESG0rYol1mjnktkeAGvEOcPoyGJy6BvddXNtz8SIqEt+1+/BX98UYodUSxppnBpiaDF/eVduWjGLvQShwnZ/Lrj+uD7fKmu/DZoiW7RkuVb7c1e6C6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054828; c=relaxed/simple;
	bh=yGGMDF5JAAyQ7t/X+LED3I2wNOi+oFXMl1uT9N+vUHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UGXhb2TLJSVdwfOKoTKngcDyjApB+2S24UesQYy36GcoUaP7jP1CdUNshn9JydxLgTytaJyFFMQZ9il0Ey4csk7f5zpKaGP0vbk0qLhXI+5hSuP2UX1JC37HHUbiVBxZXh3mzPezBfI3WvRz6Jh7BuYITFdeUhhqd/a0MJYP03k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PzBp7ysd; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45f09874c4cso106665b6e.3
        for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 13:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772054825; x=1772659625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=PzBp7ysdmb3gfHHG4xNmOTe9VXSE5URpzf8AeQjKsPRKZtNZ180XrZmWGei4QIEMag
         YEV87ONmpK5yI2NAdKi5qvT4gcCMlDdlLTWud/y4qZlDiOB4gKDUpX6Mfc5OIZQhms5q
         0tcNhY3n116NvydPlxv9UhK2UNl3PXy1VSTxNkDcU+6FFSFzrBtDTS7ULHTuQLXxIkjV
         yEpsZk/JYKG3mv/LrR2mo2t+gkExij091/8H+me92LRPCUtNu1GXFjX33CjuOVbVpDhp
         lgqGflnVKqHz5fz1weHNbX8iog6LwPYBlbBKG5gc6bt4Tvih/IzuWWTAsU19BXdrAkSd
         9E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054825; x=1772659625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qd3od5gT9Y56WsM6DlqnASWYdZTTGBmXPSgA7J3iS4=;
        b=VPz6b/ISXtubu9ipDR7BTxPAL9YanEz7ENESAQHqX5Rc8YU1wmGP3cn7LrCtRonhet
         AW3jFy32dxdy9DsVZMkNRGHfEh3gp8QKQGxljzr/fDPgavzy68B1S/6RTYOtbP20jqVO
         MQZ5zoNvxT4xARm76w3lgCcNi4rrRwXtx3C9ccVlnjx+ShfE4VSnT14SSC5rY1bMUcaV
         HP2EekOo1aF8AEia3eOVUcpmoWwPq4hHg23qZjvcjdW3cliH2AnbVnqmxSJ16+b7WX2F
         vZhnquyPS9PtaXlxDgRvXV10F+ryDdW0613WBzD0uuxATceO+DhkfwHHL7wULwEAFnIX
         /poQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkSToebVAbcx5OriW/Nm4X7MEmQ0SLgO5vTfQgLoGmGZZ/4ToZUGZTbDLDYxZsNWrRaw6arAi4BMA6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfaj7ju3krZi6cKmN4HNMOspt/IzEgJbd04++Cq/TSCHbXZHrx
	2jtLFIYLukZAKQAD9KcOrj37ild84jUb/7yK71z47bYUL9+saJRLuYAledRZSPCo+tA=
X-Gm-Gg: ATEYQzyplaM7/lSAWZJBpOH7O4nwX3Gn07z8S+Tsn8BcgIEW5ECqY1//KvPJHHy8Zxh
	+Kip4GOBZ7RQ6Kanzk08nS6CnrFUSJP9Z651E7Sj3OHUY1JjsraC8D5tdsRicf6FUVnehWyieDt
	Iz55QXBX81k3H9Z6uNX3VI0Y3CPiLwqeMoOXUjtFMqRdUx1c9JxQcLp+7rXIf+Wfwo20P2d6g+9
	m9gZ+5pA+yQyisZjM8ce6zM1rsTV/AlddjBB85vTFQBrfMH2L2mfot9YW9gSxy+dUIKhDXy1YDB
	72ZoVvXYrMsyGObcgeSAlH5lt1gjlu/6gl1EUHTOha7CoC2hl6qpWkbob5EWXcXqB06TW3sqqyV
	bMbWrqYYbv1lJrbicsr+TGraSh6eA0yG1f2JszmtS5k0yZ5KInOajgMT4ieWR3GgW55fEGxMQKf
	b7BUxTltavBg5DYUWNgYQTMt8cyLmzRaAa38yUGbwuCi99VHn+Rhf95icH6G6sEvNF4NSuNPg=
X-Received: by 2002:a05:6870:2188:b0:3e8:8e56:671a with SMTP id 586e51a60fabf-4157b210230mr8655778fac.54.1772054824819;
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:146:def2:caeb:cb1f? ([2600:8803:e7e4:500:146:def2:caeb:cb1f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf2572bsm64198fac.2.2026.02.25.13.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 13:27:04 -0800 (PST)
Message-ID: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
Date: Wed, 25 Feb 2026 15:27:01 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] iio: Rename 'sign' field to `format` in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Dan Robertson <dan@dlrobertson.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Esteban Blanc <eblanc@baylibre.com>, Jorge Marques
 <jorge.marques@analog.com>, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Alisa-Dariana Roman <alisa.roman@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Renato Lui Geh
 <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Paul Cercueil <paul@crapouillou.net>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kurt Borja <kuurtb@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Haibo Chen <haibo.chen@nxp.com>, Salih Erim <salih.erim@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Michal Simek
 <michal.simek@amd.com>, Gustavo Silva <gustavograzs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Roan van Dijk <roan@protonic.nl>,
 Jyoti Bhayana <jbhayana@google.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Remi Buisson <remi.buisson@tdk.com>, Christian Eggers <ceggers@arri.de>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jir?=
 =?UTF-8?Q?man?= <megi@xff.cz>, Song Qiang <songqiang1304521@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260225100421.2366864-1-flavra@baylibre.com>
 <20260225101735.2368252-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260225101735.2368252-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-13232-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,lwn.net,linuxfoundation.org,metafoo.de,analog.com,gmail.com,kernel.org,subdimension.ro,dlrobertson.com,chromium.org,linux.intel.com,linaro.org,microchip.com,bootlin.com,tuxon.dev,it-klinger.de,crapouillou.net,minoris.se,collabora.com,nxp.com,pengutronix.de,sntech.de,foss.st.com,dolcini.it,amd.com,protonic.nl,google.com,tdk.com,arri.de,xff.cz,wolfvision.net,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[88];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E3DB319DD26
X-Rspamd-Action: no action

On 2/25/26 4:17 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use to in order to add support for non-
> integer scan elements; therefore, change its name from 'sign' to a more
> generic 'format'.
> 

Maybe Jonathan is OK with doing this all at once, but another alternative
could be to introduce a union to allow both names at the same time, then
we could make the change more gradually.

