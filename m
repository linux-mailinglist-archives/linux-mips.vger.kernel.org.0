Return-Path: <linux-mips+bounces-15510-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zl10ME6LS2rbVAEAu9opvQ
	(envelope-from <linux-mips+bounces-15510-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 13:02:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48670F9AE
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 13:02:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=luQZ0p8N;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15510-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15510-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8333C3010F04
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95283BE633;
	Mon,  6 Jul 2026 10:39:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22623BBA09
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 10:39:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334379; cv=none; b=UQgKlMlmh6TgUW/NX51j0jZR9pvFy/WxGWAV5s0f4dmUAgo3Zqsu9FHzM3xdD/M7j0LeHUrK0670GHPDLSLDSk0Gaw0cDwXiLkG387HJJmywu8J+lbWueQ3FnEmbrzLat3AR9qzR29HgZQgMsS+jak4OHHmsJ2m86uEOyDEk+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334379; c=relaxed/simple;
	bh=3NqyvZK6r61fTF0y4rbK6dX7OLUGCMSqOwp3B7dW+hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvW24YVTO8pWfi0Vtemnb955e7y6mlWPLo71stQO/EQvnQ1IyU5+sjJ8JE5nZ6/5vEprEPNWdbf4Edga4fKjuRrTtif1X0LJUw1ldUg4Qr5DEqzfsmYnTlkjcaIwxMvMv3TGlEePTxOXtycg/13/EO3aeWRWLje/eOEGoDLzvzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=luQZ0p8N; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso749952f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783334376; x=1783939176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
        b=luQZ0p8NTauewf+aSngxbrXRtTh855g1JE3Q7xVyTLOGrKSoZi/OE8dgP6akPCrxcl
         w7LsaKo1FEbNORHcJQtdm+KyWqn44tbf831ewTvNOkykaWOxY6EvMb2PG0fJchLhEk+q
         KBP8Oj9Z0uDjAiBCBS4aqaDRNx8g3Z0GA+T8xwh/USsOaYWN8iqoyHIFXNcXLbmsaMaw
         ncU/PMt3zaQdM/aPf4AtDRJZIqb0FRgUxx0j5YebvVABAiyKO6Ce5AvVPfLJrbu8hafD
         9rQMLO8J/nuNt4qxd0D3m0mioezezAufGb5Fh3pSLxOrOy0rtHC4oyA9ihPX6+Z73+qz
         sk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334376; x=1783939176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Go7lNGQE+yUmjPgVI2sZRhO3/S4lEXiftKalvVFj+z0=;
        b=Icex2F+L/yCd5hX8/ZviAjYT6B858DyPnKcoRSBr454CHn44jMdaMpZwwj43aiLh+s
         t5x1Xv2SYeC+D0dsMJ8Bej3fkORggKnouwnVMQ9hRu5XqZxF8+D2rXt2mcCQnFUTkLWB
         zKCzAZLV5TLku8AHY52HluDXYnJWpooTwdyJkqdCi/kI1xNIZZb3JTuLaAmADsvoWnNc
         hbTUWOI5lWGzxj5IB9kuL9/wBd6iI5HSc+k+sSiOnexhooq5vd/ffA7CAKaSnWVrPpts
         QM0GJtCbaukRvFNh3zsEJW0VQSb75tee5/hanMLLzDXF9K3bfD7d9yt0oU3po6sWZxNC
         W1FQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3gekYycWqbt+rrqAUK0c7iakYtwUgTNaIT0XmO1vGT0pZGc6KyCcpfDG68NlvpsntfLneCTx41nFn@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqGwiUtJ57hWRZF24+fz4v7wwppcIAP/3h48MBqZoXn8jp99V
	VwD426Zd1E0mYrj/qPH5V8apgzUt7s9ZDrduUoKojbIYI2o+qEUU0PbmlRcvIQujzUI=
X-Gm-Gg: AfdE7ckT5W2vzHTlpTjXOavKmhmuD61b0IGulmx5bWTKM66Wtt7b0PuVK/rW9g5gA5W
	zPiMV+GnBEugLPPQb6FVpfetT3hk/o4XvQ5FOahNkU/9TUBzV+kPXcBAi0LGqYEHla+Z11XTE8N
	4KK9j3rJWMxt1FCy2v4O0CMUq70/lXt79us3YtY1mQ+1SzQt9o9zj5cpT8SxamXY8CV/uckqmFu
	VJwK34lNbFGYHcsuc0x32hz4RUUvGVp4Vg6ut19KluHd/S2AtdwDToCddfq8hWIx2ANyiHtghQJ
	UqohGx9Nqu8mtcjCWYGdceuP8lkuPSpmqkkeP2l5QLhpL6qFOreMRrVMLJFlOWZgFMsY+hKCBQg
	FmLCWiZwkKq9jEpAME58p/1BZkkEtU1zpEg5GEd7CaQk0Lkf4BSFMsY4tGdnH9uAD76oysj2Vuv
	tafNKhx/P1X1zjDcLndJWUdAfy31uDJosZM/ZZw8Y5Hh8JM6XHgkhZpjuCemuxKa7IrdRW7wDD5
	n47
X-Received: by 2002:a05:6000:4698:b0:475:36a:8c97 with SMTP id ffacd0b85a97d-47aab76f017mr8079359f8f.45.1783334376207;
        Mon, 06 Jul 2026 03:39:36 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8cdsm25702223f8f.1.2026.07.06.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:39:35 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:39:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Chen Wang <chen.wang@linux.dev>, linux-pwm@vger.kernel.org, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Michael Walle <mwalle@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Message-ID: <akuFirxGTqu_gt4O@monoceros>
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
 <aktWoIfY_DdO6gb4@monoceros>
 <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyrf5kfcddz5uoeo"
Content-Disposition: inline
In-Reply-To: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15510-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@oss.qualcomm.com,m:chen.wang@linux.dev,m:linux-pwm@vger.kernel.org,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:bleung@chromium.org,m:groeck@chromium.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:pjw@kernel.org,m:samuel.holland@sifive.com,m:mwalle@kernel.org,m:inochiama@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang
 @linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:hammerh0314@gmail.com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:alchark@gmail.com,m:sean.anderson@linux.dev,m:michal.simek@amd.com,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:chrome-platform@lists.linux.dev,m:imx@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:martinblumenstingl@gmail.com,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,kernel.org,jannau.net,gompa.dev,microchip.com,bootlin.com,tuxon.dev,broadcom.com,chromium.org,nxp.com,pengutronix.de,gmail.com,crapouillou.net,mleia.com,timesys.com,linaro.org,baylibre.com,googlemail.com,collabora.com,glider.be,sntech.de,samsung.com,sifive.com,linux.alibaba.com,foss.st.com,mail.toshiba,amd.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[67];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,wikipedia.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A48670F9AE


--vyrf5kfcddz5uoeo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 10:28:16AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Uwe,
>=20
> On 6/7/26 09:19, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > Hello Chen,
> >=20
> > On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
> > > On 7/5/2026 11:14 PM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > >    - Use a single space in a of_device_id array terminator; A singl=
e space
> > > >      after the opening { and before the closing } in non-empty
> > > >      initializers;
> > > >    - No comma after an array terminator;
> > > >    - Also no trailing comma after a named initializer iff the
> > > iff -> if
> >=20
> > This is actually intended. iff =3D "if and only if", see e.g.
> > https://en.wikipedia.org/wiki/If_and_only_if .
>=20
> I agree this scientific idiomatic expression is not well known
> by non-native English speakers, and using the expanded form is
> just simpler to review (thinking at non-native English speaker
> reading your commit in the future).

fine for me, I'll fixup to=20

 - Also no trailing comma after a named initializer if (and only if) the
   closing } is on the same line;

when applying.

Best regards
Uwe

--vyrf5kfcddz5uoeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLheQACgkQj4D7WH0S
/k6DEQf+JKDZ+NcR412RMDPBxcWuk831SswOfJipQJVDxTsFWtpZIrZIbOu0ZlBp
IEWpfB5nRfHwTSxF6Ceuf2jTc+wkwcRBKeH4MQsZFpGxBjGa4k7YEEfMSDU9S1vU
39G1FIVXnf0sDkUOUGf5zIomYewh4gdCoWRwDnCHsV4QnZKAaKCCEpX0U6QdW2OP
diy3iqasYf6KZyXnUyj0HBQRGjBYY4jBvVutXt4KtCqAKW+AcCANOtubadJgydWD
xXNkFLpscFQ9aVdyKZK19UP9yKdOwzkjR9pul+TqXDviO0c5UoAZEwMZYDbB1YPi
AJloqZ9/3vBcnEjZo3eWYk8zkrQifQ==
=vnC0
-----END PGP SIGNATURE-----

--vyrf5kfcddz5uoeo--

