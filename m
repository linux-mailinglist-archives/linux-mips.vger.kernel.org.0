Return-Path: <linux-mips+bounces-13866-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PW2B4ZswGmmHgQAu9opvQ
	(envelope-from <linux-mips+bounces-13866-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2026 23:26:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B581B2EB01D
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2026 23:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28815300336A
	for <lists+linux-mips@lfdr.de>; Sun, 22 Mar 2026 22:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E49F376BE5;
	Sun, 22 Mar 2026 22:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6+E9+uL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007401E9B3A
	for <linux-mips@vger.kernel.org>; Sun, 22 Mar 2026 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218369; cv=none; b=INJXPJaysXMc9lb6XvGINKs39TyRVkUWRGO+IGjn5X9uaKkfMPyzXZAPMvzwVfnjJ8r7+JeIXxPBkHHkMR8SP2m4o8YhGa3a0I1NCNnjVNTxxu0IuOYEw5AQETFx7EgWrKO9kjKrTJLVo8iKe1AqaLQifidBwtOQn/2Pj4svHF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218369; c=relaxed/simple;
	bh=ELcx204Cby/dJnsY8H4NrZVX+UUsPAla3X1U1xwxuPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7K6Fgw9INwCyY7oQPQ7cl8oEPZ7riZ4OSDKHqhaDZ2PnxfQ2PeDhlRGcGtudO7NvpUbXmTTsF61u/aH9+NdQXngo147CRpWwtPqbOOE8l4r2ebDZcaVz54RV6AjlnGFPAE8SZwDNUgrC8D/6BBBaPdDHQ5eMMikm/D6uPmvRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6+E9+uL; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0f754e756so3426038eec.1
        for <linux-mips@vger.kernel.org>; Sun, 22 Mar 2026 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774218367; x=1774823167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
        b=h6+E9+uLA8xRXNgJferHczQafyyNfWNDUBvAT4x0tADovM1UnNssK7ZVWrjyvYG82n
         Am2bw6wx3hSf2XkDhk8z93gIdfdRT5bMOzuapMmK2n3Xp+aSv8B3jQf5lliuOAeM6BaO
         YaUtkUyAay0I8wYaSqZPGvsoQ7M5JmNqQkcfNrIwVbwfIzAGeW3o8GGYwyvDCr+RK3TW
         wus0I234JZvMLDHBR7LSi/4r//62KExFUSPOXXndjXv3DfrX04UBwt4PAs+sMNQ0yJ3c
         +5uTEUOkVhomhMkKraS7iP5Iz84IhS0t6NqKzSJBOs16ht0izRnh8okWM4aR/76An0ch
         Hvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774218367; x=1774823167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
        b=Te/0jLjsIL1cWs2p4O8GOON8MVQygVreAXZFMB/16K9tLeAqBRG48y73q9kPVznV8A
         DW+b2KcDw7Dz9VOB3d7r9Z7Qac49F1k7BQlwSWyHTF6m+rJ8W+GAHSQ1u7TozABHdUcJ
         HBGYlV9pEHkp736QpqAmDp8wIWgxRhIhXLmT0W8JX1oIIkdQXEZB2uC0g459SemByr8e
         t7wWz5u6RUmX9bhuZuOTppQWor8LHSar2FwrVO+Pbd8RE4dv8+qaXOW3pEjZy51LMVSB
         yPnpZVcB8MaosQE7LnapoLPiaveqY3/C4ffLvvAD+KhOFgyAz0MkBC8QAMybfiIGUAK2
         Yn9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyg5XpOV587gJ7ONLUgSlOX4YhdFNM0r+3/WH0+QGP7eFLLmOz4zNiDKO3KEUKEOCz4+cvQlsfjIRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzuROTGeYzHfY+mfsFNjesydtsFNcMV2/cSIbnaP/WHJ1dqQQQw
	Ysv7MApTrkbyWFBWGmaCi0lLuUNpajveRaLlvb3F6lqeUUG1FtX++Gt2
X-Gm-Gg: ATEYQzzMYKWCmhlnKoGCWcGWwttTfdP0ZwHEzcWZGQlK15kr83C2W98I/KAnZf55smx
	qaOini6Y3h3JVZbjjM21PyQv0MSVz8OEFa9I7YjYcy+n+R+ejyF97Tft0tahL/H/FngkQDZDmOQ
	3xaL/MgzIttdr/lpl11d3X1TkVfLug+TMFdX8GFR7M/fTXoRxgixzwIT9ltM3T9cyay1s4uiaL+
	smpuOk5f9p06WXkJ23kwBgaXzOeo0xLN67Sh3HPhE6qsBjN65JkObzIwJ3uY6kVlYvSMBl3zjBj
	K1BvLsqi3mdjJGsOZQQnyfP8QRjYUln7ndBZyIwmnP9ECUkK+hYOkpyIxn320A8Eorh6Azj7Xa9
	R16bvl5b0aJEx8E3GFTN2aB2GAInrSro3qFnXSLaCpuKI2pM8YzklmvwUAIiMs2SnGkZb+8uPhC
	m/H2+bwGoLaM2kq6vsxDZG29pYvajq9h/KcezFS93YsjWRtJhWzXC/IXjVgZSzYoeA
X-Received: by 2002:a05:7300:aca2:b0:2c0:be45:6815 with SMTP id 5a478bee46e88-2c10981e483mr3694786eec.32.1774218367042;
        Sun, 22 Mar 2026 15:26:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm13678234eec.26.2026.03.22.15.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:26:06 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:26:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hansg@kernel.org>, Support Opensource <support.opensource@diasemi.com>, 
	Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matheus Castello <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <acBsI0PxvxDGymCa@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
 <20260111170222.43aee69a@jic23-huawei>
 <20260322122529.62093f12@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322122529.62093f12@jic23-huawei>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bootlin.com,samsung.com,roeck-us.net,axentia.se,baylibre.com,analog.com,kernel.org,metafoo.de,capellamicro.com,linaro.org,csie.org,diasemi.com,crapouillou.net,iskren.info,castello.eng.br,gmail.com,collabora.com,linux.alibaba.com,intel.com,arm.com,bp.renesas.com,perex.cz,suse.com,foss.st.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13866-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: B581B2EB01D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 12:25:29PM +0000, Jonathan Cameron wrote:
> On Sun, 11 Jan 2026 17:02:22 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 09 Dec 2025 09:25:56 +0100
> > Romain Gantois <romain.gantois@bootlin.com> wrote:
> > 
> > > Use namespaced exports for IIO consumer API functions.
> > > 
> > > This will make it easier to manage the IIO export surface. Consumer drivers
> > > will only be provided access to a specific set of functions, thereby
> > > restricting usage of internal IIO functions by other parts of the kernel.
> > > 
> > > This change cannot be split into several parts without breaking
> > > bisectability, thus all of the affected drivers are modified at once.
> > > 
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>  
> > Ideally looking for a couple more Acks.
> > 
> > If any of the maintainers of other trees who haven't already replied
> > have time for a quick glance that would be great.  I'll spin an
> > immutable branch but I'm not really expecting any non trivial
> > conflicts unless there is a new user in flight that I've forgotten
> > about.
> 
> At this stage, given I'm still waiting on replies from a couple of
> subsystem maintainers, I'm thinking we'll do this next cycle and I'll
> provide an immutable branch based on rc1 for anyone to grab if they
> run into merge conflicts in linux-next.

Sorry, I just acked the input bits in the patch, but in general I feel
these kind of mechanical changes in consumers do not require an ack and
you can just go an apply such changes.

Thanks.

-- 
Dmitry

