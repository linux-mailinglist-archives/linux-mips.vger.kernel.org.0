Return-Path: <linux-mips+bounces-3836-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B926912328
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 13:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5082E284E4D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 11:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191BA172BA7;
	Fri, 21 Jun 2024 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="nAtmHxbl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dBxu0SwG"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90E3A1CD;
	Fri, 21 Jun 2024 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968711; cv=none; b=Br5gMZuY3LwR6/sgzrLyuPKr6Wnaqh7K0LW2KbJ1kFxbiGUaAImHrJ6nKMgyS0fMhLuacpx9oJKGcRnP6OOtxKXGwrwRRg4VornJpXg+laD0DCfj956urSnIWQ3PCENvvH2ldtepxVcezY/fSshHLJNplhMbYjOrgLWzEdLXqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968711; c=relaxed/simple;
	bh=+fY7tkigpTQXc5Fku/J8C2gMCAOJnpPj6kuyBUVHayg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=fMTwUMN4Xt1a3HHvhaylJAjrjqGtGoZRHXEfHfZ6mJ+zgNwWjicsspyTyZgExXREoTxEk7jFfjIhNWGqLkWf8/6CfSdR/NhWHZNiHZPsXGEN3hxOmBQL4iRbeosH0/0H9s+Q7iQK9O+5gfqLCHPKJGiqg+ab6Bg1Fdz/cmK9Ww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=nAtmHxbl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dBxu0SwG; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2F4CD18000BB;
	Fri, 21 Jun 2024 07:18:28 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 21 Jun 2024 07:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718968707;
	 x=1719055107; bh=G0G1El3uK8k2KjVN3fQ6GgP+FCi/pQffGpLCPF/vvhA=; b=
	nAtmHxblkVwYf1+7Jq2u6m1VmZGiN9TSZLEJFshiPsDMlAegGOiNHf+UE+4216dT
	htbiTLMSoaFX92ECFSGXq3F+QpleL98i78t8z+rdIcbyYTpavyMV6JSXHaSxk6PL
	JOkiuNZ6qSyqyyByhm9AzSIqmcopudyqmKoZtTLxsJJTsBjHqvlNzSwAmuJICJPC
	xAkI+sCOWXpsbJNKWByYDHbMZSo8+twogxKc+snXzQX7HJadXzejaEfWqA/6sBHh
	emcjdSHSG9Bo4FI1CD5/aX8Jxvwoln4y6udQuP1YYdzVawOyynR9Gxm05Fbrpyr+
	WB/7o7hfo/3BZhUhG6ANNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718968707; x=
	1719055107; bh=G0G1El3uK8k2KjVN3fQ6GgP+FCi/pQffGpLCPF/vvhA=; b=d
	Bxu0SwGZw0WkHjTnlnS7fq0zY56CagKJUR47SpgMY7tm6B9aM/Y1dStGHEeQdnDg
	fCRkvjCgGazP2+UAsbWXGxIX4TiO36d0PYJoOC57DTO3WhDbYh5xK7zBmoVWOLQd
	UV4EBFBYqO7zBd5J+yASORFYRWi03tNDqnbRTbKRNbo+q+zXd7VgW8v0wiWvr1B7
	rr2bTE7y7Dc524RRp4nxBdIA76939GnwKcZdixRChC50ONqTr1ex/3RAV1znusd1
	qVxKhyuBnM1lqA9rP9631v35ZlxNjclnFqSQxEdrw2Rq0rUlgSbfXPnyye1vThMO
	HKi85rCTn8v3rXqgdA37A==
X-ME-Sender: <xms:g2F1ZobL1r5dayGb6_dx20VuVd8FBDgwufb-Bfiftejw-qkKSzpUFg>
    <xme:g2F1ZjYozVdl2unO9nK0bwGLrNn3obOQ6jEuV1fZcrNSLO8g0lxxVu71WBEH0SQ8c
    LuxKocgWiSj9kafDa4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:g2F1Zi_7opE70T8E4hvvoIxcDxWUnYzIMUPeLlAZ13rdHvzzcm8Vpg>
    <xmx:g2F1ZiqZSAYUjyGJQIjONpqp-oO0L90SzbNFf0Dan5AkSXCqxAvW1g>
    <xmx:g2F1Zjq3gMEeAhz6Zrx5ISXwXxhEyZe36v_DrzbBAqREz0GH_JhbTg>
    <xmx:g2F1ZgS8yr65kj-LojYGQVGFpxzEflGJ5gpbkoz33gE6-8bc_CSGJA>
    <xmx:g2F1ZkceRkZjBi65qbQal4Sjl6wjS8sAUiKyTFcdy42gAMyIgNykgtBn>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3A04236A0074; Fri, 21 Jun 2024 07:18:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <58f65f4b-9433-44a2-b8de-f18b8d8b0c46@app.fastmail.com>
In-Reply-To: <20240612-mips-clks-v2-6-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <20240612-mips-clks-v2-6-a57e6f49f3db@flygoat.com>
Date: Fri, 21 Jun 2024 12:18:07 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH v2 6/7] clocksource: mips-gic-timer: Refine rating computation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=889:54=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> It is a good clocksource which usually go as fast as CPU core
> and have a low access latency, so raise the base of rating
> from Good to desired when we know that it has a stable frequency.
>
> Increase frequency addend dividend to 10000000 (10MHz) to
> reasonably accommodate multi GHz level clock, also cap rating
> within current level.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Daniel,

Can I get a Review or Ack for this series? As it's mainly clocksource re=
lated.

Thanks.
- Jiaxun

> ---
> v2: Fix number of zeros for 10 MHz
> ---
>  drivers/clocksource/mips-gic-timer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/mips-gic-timer.c=20
> b/drivers/clocksource/mips-gic-timer.c
> index b3ae38f36720..7a03d94c028a 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -197,7 +197,11 @@ static int __init __gic_clocksource_init(void)
>  	gic_clocksource.mask =3D CLOCKSOURCE_MASK(count_width);
>=20
>  	/* Calculate a somewhat reasonable rating value. */
> -	gic_clocksource.rating =3D 200 + gic_frequency / 10000000;
> +	if (mips_cm_revision() >=3D CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FRE=
Q))
> +		gic_clocksource.rating =3D 300; /* Good when frequecy is stable */
> +	else
> +		gic_clocksource.rating =3D 200;
> +	gic_clocksource.rating +=3D clamp(gic_frequency / 10000000, 0, 99);
>=20
>  	ret =3D clocksource_register_hz(&gic_clocksource, gic_frequency);
>  	if (ret < 0)
>
> --=20
> 2.43.0

--=20
- Jiaxun

