Return-Path: <linux-mips+bounces-14871-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g0CWBhxkIGot2gAAu9opvQ
	(envelope-from <linux-mips+bounces-14871-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 19:27:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539763A26D
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 19:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c18sJ7aS;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14871-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14871-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE5F93019FD1
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 17:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C41B44E03B;
	Wed,  3 Jun 2026 17:21:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D423E2756;
	Wed,  3 Jun 2026 17:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507280; cv=none; b=g7pWtHhMf0O0iGNdd36VMpvNXdYZD2TBObJu+1s1FhyR7RR0FDqupRKr3xtIquVu0ZrsfUQt9a1IdEJznGmnHbQosoUZQEjZxxU9N8mLC2H2OZdZg7jgjzvT9To7Zc2hZOm4wlnOQYWnRoczOCzflaos4j5VaBXrToTHB8PlmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507280; c=relaxed/simple;
	bh=Gxx19LdDTz6T+j/ZXP+pzENHKb9KQ9gFUO3WnCcEAmg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feSZkWqT/TmUJbsOkZnDmJS1HsxQliCkldQqTYA/bcSk3sW0dn7jh+75XI4tjfKLqJvwgAiSzTX85m4XrQnqWyN+kxq8m6wCcXZSc0e8z8IoueqqNx+EDTpbhpu7pYV8VMdbdRuE89d5WGODkM3E4EvAHUBHRREJIVt1Zekpdzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c18sJ7aS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9B71F00893;
	Wed,  3 Jun 2026 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780507278;
	bh=Ig4zCGf7+4ptZbdZZMypwYARwR0YB1sgjeMspwVj9PE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c18sJ7aSoq9r+i0IlOMIyM+kePG9Og4QNfkKdmvW9i9gHt/nkcyz7wt3X6sQ55+PN
	 9FCuhhMNrZDZj6AiihMI5VZ5eSGx75aw2BHqp+z8eJPDKPiawLxyWYNdzegnzvTLP4
	 SUK0v0AV8YpRWsaQN9Z7bVQvVxyvbFJIooaNjoNYh0o8y8mjZWNbqaH/2nGiGRSSjv
	 yhGhdlantZDthW2N7NtTDXBDCNyfOloZ32O+IlYOTFWGg3Gt/jq7bLRmckBoFSWC6R
	 Go6HqJDXVno0Uqebslcwu+6uFCc6/BDhadZDjKwxPxloA2uOX2Cy1qIxjyq10GIpqT
	 8FjWPlNqvKQSg==
Date: Wed, 3 Jun 2026 18:20:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter
 Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Kevin Tsai <ktsai@capellamicro.com>, Linus
 Walleij <linus.walleij@linaro.org>, Eugen Hristev
 <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Hans de Goede <hansg@kernel.org>, Support Opensource
 <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>,
 Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello
 <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Casey Connolly
 <casey.connolly@linaro.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Amit
 Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <20260603182052.7d23c067@jic23-huawei>
In-Reply-To: <acBr-W2ILu9tnMyd@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
	<20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
	<acBr-W2ILu9tnMyd@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14871-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:romain.gantois@bootlin.com,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@roeck-us.net,m:peda@axentia.se,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:Mariel.Tinaco@analog.com,m:ktsai@capellamicro.com,m:linus.walleij@linaro.org,m:eugen.hristev@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:sre@kernel.org,m:wens@csie.org,m:hansg@kernel.org,m:support.opensource@diasemi.com,m:paul@crapouillou.net,m:me@iskren.info,m:krzk@kernel.org,m:m.szyprowski@samsung.com,m:matheus@castello.eng.br,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:casey.connolly@linaro.org,m:pali@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@linaro.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:claudiu.beznea.uj@bp
 .renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:s.nawrocki@samsung.com,m:olivier.moysan@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:sebastian.reichel@collabora.com,m:andriy.shevchenko@intel.com,m:dmitrytorokhov@gmail.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,samsung.com,roeck-us.net,axentia.se,baylibre.com,analog.com,kernel.org,metafoo.de,capellamicro.com,linaro.org,csie.org,diasemi.com,crapouillou.net,iskren.info,castello.eng.br,gmail.com,collabora.com,linux.alibaba.com,intel.com,arm.com,bp.renesas.com,perex.cz,suse.com,foss.st.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:email,bootlin.com:email,collabora.com:email,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8539763A26D

On Sun, 22 Mar 2026 15:24:21 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:
> > Use namespaced exports for IIO consumer API functions.
> > 
> > This will make it easier to manage the IIO export surface. Consumer drivers
> > will only be provided access to a specific set of functions, thereby
> > restricting usage of internal IIO functions by other parts of the kernel.
> > 
> > This change cannot be split into several parts without breaking
> > bisectability, thus all of the affected drivers are modified at once.
> > 
> > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>  
> 
> For input:
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thanks.
> 

For anyone wondering what happened to this... I forgot to apply this at the
beginning of the cycle and by the time I remembered we had too much queued up
so it would have been messy to do an immutable branch.   Anyhow, I plan to
sort this at start of next cycle.

Jonathan

