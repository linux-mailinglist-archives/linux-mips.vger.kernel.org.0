Return-Path: <linux-mips+bounces-13292-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEjKGO9do2myBQUAu9opvQ
	(envelope-from <linux-mips+bounces-13292-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Feb 2026 22:28:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B566A1C9188
	for <lists+linux-mips@lfdr.de>; Sat, 28 Feb 2026 22:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE28375DE60
	for <lists+linux-mips@lfdr.de>; Sat, 28 Feb 2026 19:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0D1377014;
	Sat, 28 Feb 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5Ww6oOt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE41375AC1;
	Sat, 28 Feb 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772301630; cv=none; b=rFTlUPOFZTmzY/wAFlCykNOe8FDBZBPC6rFo0BidI5M0Gba6gmvINod3X3BjEAm2I+OtBIe3o6lKES9IXetb2/KFQHz/J/98MAtHRbuMHaVXZN3hqtIV28zfxrU4pCWgQIgTB3MXh1R/Vo9j/dpFZkrmRRA4fk7LHvIVCSbCX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772301630; c=relaxed/simple;
	bh=kHCRe4FxCpKOmGTFDbEGFmwKc5c1cbzYW9mRrhA/2zM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEYsZCofNJjF/T3285U3LlOis4c1wDyVX/PkfMVlaCbthc76U3iB3CXMhDGqCj3Xe9+EZ4q61wPbsUYsU17H9RzmC5UkfL5Ve4gdw94DrnOx+jVH0mEq316O1qD7A9UDeDJf4YuDMBqRARkApBnVGfbean2Pu+i3fFir8NizyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5Ww6oOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED299C19423;
	Sat, 28 Feb 2026 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772301629;
	bh=kHCRe4FxCpKOmGTFDbEGFmwKc5c1cbzYW9mRrhA/2zM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y5Ww6oOt+Lwkhhw6KzkZzqCLx2GB5Y6V/naeD+g/YVnGDnFJykP4eczgV77pSo6aG
	 MwceHNzWz3tTt2nQUPDrqo4OH/XpY1QPEj4j2coQSntozKAfKLK4GkW1a2dH8TyfFX
	 5fZRLH0VdmJrHIj0bW/2HmeVqQPjJBYdjnqVErnT7/OV5v8nL9A1bM8hWX1+RqOS8L
	 j+1xUXhbGCwz3WIiQx9BfetTOcQFR4X46hu07hQziT4+MpACIMVHSm6kKP/vnmJT2+
	 XJSlGPNpWjGSFDy3clti8s912U34ZnWDCJSJbRQ//cNsZce6q9IlsPUYRVrZhQYnRM
	 3szaWx8Sycbcw==
Date: Sat, 28 Feb 2026 17:59:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Lucas
 Stankus <lucas.p.stankus@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, Ramona
 Gradinariu <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Petre Rodan <petre.rodan@subdimension.ro>,
 Dan Robertson <dan@dlrobertson.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Esteban Blanc <eblanc@baylibre.com>, Jorge Marques
 <jorge.marques@analog.com>, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>, Alisa-Dariana Roman
 <alisa.roman@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>, Renato
 Lui Geh <renatogeh@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andreas Klinger <ak@it-klinger.de>, Paul Cercueil <paul@crapouillou.net>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Matteo
 Martelli <matteomartelli3@gmail.com>, Marius Cristea
 <marius.cristea@microchip.com>, Heiko Stuebner <heiko@sntech.de>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Kurt Borja <kuurtb@gmail.com>, Francesco
 Dolcini <francesco@dolcini.it>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29u?=
 =?UTF-8?B?w6dhbHZlcw==?= <jpaulo.silvagoncalves@gmail.com>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Haibo Chen <haibo.chen@nxp.com>, Salih Erim
 <salih.erim@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>, Michal
 Simek <michal.simek@amd.com>, Gustavo Silva <gustavograzs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Roan van Dijk <roan@protonic.nl>,
 Jyoti Bhayana <jbhayana@google.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Nishant Malpani <nish.malpani25@gmail.com>, Rui
 Miguel Silva <rmfrfs@gmail.com>, Linus Walleij <linusw@kernel.org>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>,
 Jagath Jog J <jagathjog1996@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Remi Buisson <remi.buisson@tdk.com>,
 Christian Eggers <ceggers@arri.de>, Mudit Sharma
 <muditsharma.info@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, =?UTF-8?B?T25kxZllag==?= Jirman
 <megi@xff.cz>, Song Qiang <songqiang1304521@gmail.com>, Dixit Parmar
 <dixitparmar19@gmail.com>, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v6 4/7] iio: Rename 'sign' field to `format` in struct
 iio_scan_type
Message-ID: <20260228175954.1f0950a1@jic23-huawei>
In-Reply-To: <120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
References: <20260225100421.2366864-1-flavra@baylibre.com>
	<20260225101735.2368252-1-flavra@baylibre.com>
	<120c7f33-4ca1-4d35-ac1b-b65362f1adfc@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13292-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,lwn.net,linuxfoundation.org,metafoo.de,analog.com,gmail.com,kernel.org,subdimension.ro,dlrobertson.com,chromium.org,linux.intel.com,linaro.org,microchip.com,bootlin.com,tuxon.dev,it-klinger.de,crapouillou.net,minoris.se,collabora.com,nxp.com,pengutronix.de,sntech.de,foss.st.com,dolcini.it,amd.com,protonic.nl,google.com,tdk.com,arri.de,xff.cz,wolfvision.net,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[88];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: B566A1C9188
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 15:27:01 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 2/25/26 4:17 AM, Francesco Lavra wrote:
> > This field is used to differentiate between signed and unsigned integers.
> > A following commit will extend its use to in order to add support for non-
> > integer scan elements; therefore, change its name from 'sign' to a more
> > generic 'format'.
> >   
> 
> Maybe Jonathan is OK with doing this all at once, but another alternative
> could be to introduce a union to allow both names at the same time, then
> we could make the change more gradually.

Please do the union for v7.  Not so much because I mind a global change, but
more because the chances of merge conflicts are too high.

Perhaps for this series just introduce the union and use it in the driver
here. We can then chase it through the rest of the tree as a separate step.

Alternatively leave it with a misleading name for now (so allow 'f' to be a
magic sign value) and we can do the rename as a follow up.

Jonathan



