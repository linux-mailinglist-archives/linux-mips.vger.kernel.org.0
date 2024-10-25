Return-Path: <linux-mips+bounces-6442-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C139B0A2E
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 18:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013021F21249
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 16:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E9C1865ED;
	Fri, 25 Oct 2024 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Imyjs+VL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MdfgWDS8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A16F099;
	Fri, 25 Oct 2024 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874619; cv=none; b=VrQCUUFpbhTSWOEBXEnwFvJKKO3ybR8oTGZThzLTbxHWV9L+IMOptklRApS3uFm1n87JWG760RIf2nFvmVyt1QLYQMp6fthw4uMvQIiR+36OwYUegq3Dp03bW+UbLIx7dGNalwTBvFKmJKfZ9kk052yNMloyRswF+pXXYT9WIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874619; c=relaxed/simple;
	bh=nl8PTZHMs391Grc52/YR+m6vSD9wfaJRFqlM+dR9eDo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h4aqI00DWjnxh8u5XIkZb0NFsIKTFfa6VVpxRp3LhQpkwWJAx7jJRXHs2JudjIW15kdXYCKY8dhQYi4JOlkEmEc+4I34SZsr5Eg5cILfgrdvWfFmuIXpysB/IXRowmfkivkIy3kz9JDVpy0A42MFGt375uaRhGa86k4+a0Q5Z+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Imyjs+VL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MdfgWDS8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C2E7138044B;
	Fri, 25 Oct 2024 12:43:35 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 25 Oct 2024 12:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729874615;
	 x=1729961015; bh=wNOTdNAdu9C8WH20srhIE/t2GxUFmkNCF+jRglNEPIA=; b=
	Imyjs+VLhOXHZLLTIBHx2xPWtFNQwFcF3Rwy5OzfJEMhOxLUlgtZygta6TIXeI8j
	y+BerGlNvCU63WYgztjN15bBxbJPNJcHdCXhk2k0CQn/XQaKquKUFPOuPv8SQ5ZL
	Dn8hpO7RHIp9iQr35VLDwCnuAwHUEf4jgFYjiOsmXsVNb5W+TRQdkMMEKRdfjo+G
	f8XgGuaCw1+C2nnyR2iDNO5dScXv+B5c4k7ETa/mw2OFRxCTBWmqD1JLcpjk9vLe
	nMirCld39wSzRMIoPw+te0IMNt0r+o/f1vG9uJjUWq49Q1gBNcHdKSIOH6ZUAxnZ
	zETk7BhccLTQfwKu1/oQkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729874615; x=
	1729961015; bh=wNOTdNAdu9C8WH20srhIE/t2GxUFmkNCF+jRglNEPIA=; b=M
	dfgWDS8/MKR9Ka6tjNNLHJ99a2bZeBzGZnyjTPy5bQFFVT0GIz5CxUCkFbKtU0AI
	e5wPiQBJab3jgK3pq7icrQrzxXEyJOTQfwJlwMGOQ4R8ydiNEylVM3vreHjLk0oS
	TG3zPTT4JFKQ7S1KBbiTnmyTYHbE1iNiqw1mY34c5JVG5FhLyPDWyLHaVqeGGG9d
	czvOMJf3BDY3UJNBpeSNJKDhF3ghbrL24vjjUCP5abXWStZiZLpZVwGJFGEISUNf
	uFAmqrJ514OzSc5ruhnc+arOKw5ggdbFTbMjkPN6oehlX6GZJ1ggFnqAcAUIqViR
	cJakqRqkMfnoBKfy3nXNw==
X-ME-Sender: <xms:tsobZ0WqwX_LGuhSE4u248Q6kqNkIGVjkyL8jmzwC1OpgwaxMTD9pw>
    <xme:tsobZ4mZAXpS5OA_qnY1oMJ_MtgUMWmzrCDmCPBj-fCDMKB2usJrrEVVTTW_8hmPg
    mwX4OyeSfHLfyBw5zo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeevtedtueevfefhkefh
    udfggeetjeffjeduueehueejgfeludevkedutdeuheenucffohhmrghinhepkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoh
    epuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvg
    hnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegs
    ohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhise
    gsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrihhkrghlohesghhmrghilhdrtgho
    mhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhope
    htrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehv
    lhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tsobZ4bNS7JVxw0oQT2NIYzZww5DOr9ka-BqpPbrb1fBV1iGfE5OIw>
    <xmx:tsobZzVSWPXHDyBW4jC7MSTjs7Gd1K5mUulA6gToAtAiZqqBFe-K9Q>
    <xmx:tsobZ-lilssynAJ_lTNWNWwEKrnaORdQmT9wGvbmIcgDbf9i3_4LMw>
    <xmx:tsobZ4cPmImqseoQYerfHTOkoqwa4Mwdbd2xxriVMpX_R3XcEVitIg>
    <xmx:t8obZzhqKjlkqQaX53GBuqvMecNYjtyBEoO835ZMmmpx1McLvcawsV0->
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4690F1C20066; Fri, 25 Oct 2024 12:43:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 17:43:14 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-Id: <70b28614-e40e-4022-818b-80711c05c7a4@app.fastmail.com>
In-Reply-To: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
References: <20241025-no-cpu-cluster-support-v1-1-5e81fcf9f25c@bootlin.com>
Subject: Re: [PATCH] irqchip: mips-gic: Handle case with cluster without CPU cores
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8825=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=884:46=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> It is possible to have no CPU cores in a cluster; in such cases, it is
> not possible to access the GIC, and any indirect access leads to an
> exception. This patch dynamically skips the indirect access in such
> situations.

Hi Gregory,

I'm a little bit confused here, as I have never seen such wired configur=
ation.

Is second cluster IOCU only?

Thanks
- Jiaxun

>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> This patch is a follow-up of the series "MIPS: Support I6500
> multi-cluster configuration"
> https://lore.kernel.org/lkml/20241019071037.145314-1-arikalo@gmail.com=
/#t
> ---
>  drivers/irqchip/irq-mips-gic.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips=
-gic.c
> index f42f69bbd6fb1..bca8053864b2c 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -141,7 +141,8 @@ static bool gic_irq_lock_cluster(struct irq_data *=
d)
>  	cl =3D cpu_cluster(&cpu_data[cpu]);
>  	if (cl =3D=3D cpu_cluster(&current_cpu_data))
>  		return false;
> -
> +	if (mips_cps_numcores(cl) =3D=3D 0)
> +		return false;
>  	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
>  	return true;
>  }
> @@ -507,6 +508,9 @@ static void gic_mask_local_irq_all_vpes(struct irq=
_data *d)
>  	struct gic_all_vpes_chip_data *cd;
>  	int intr, cpu;
>=20
> +	if (!mips_cps_multicluster_cpus())
> +		return;
> +
>  	intr =3D GIC_HWIRQ_TO_LOCAL(d->hwirq);
>  	cd =3D irq_data_get_irq_chip_data(d);
>  	cd->mask =3D false;
> @@ -520,6 +524,9 @@ static void gic_unmask_local_irq_all_vpes(struct=20
> irq_data *d)
>  	struct gic_all_vpes_chip_data *cd;
>  	int intr, cpu;
>=20
> +	if (!mips_cps_multicluster_cpus())
> +		return;
> +
>  	intr =3D GIC_HWIRQ_TO_LOCAL(d->hwirq);
>  	cd =3D irq_data_get_irq_chip_data(d);
>  	cd->mask =3D true;
> @@ -687,8 +694,10 @@ static int gic_irq_domain_map(struct irq_domain=20
> *d, unsigned int virq,
>  	if (!gic_local_irq_is_routable(intr))
>  		return -EPERM;
>=20
> -	for_each_online_cpu_gic(cpu, &gic_lock)
> -		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
> +	if (mips_cps_multicluster_cpus()) {
> +		for_each_online_cpu_gic(cpu, &gic_lock)
> +			write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
> +	}
>=20
>  	return 0;
>  }
> @@ -982,7 +991,7 @@ static int __init gic_of_init(struct device_node *=
node,
>  				change_gic_trig(i, GIC_TRIG_LEVEL);
>  				write_gic_rmask(i);
>  			}
> -		} else {
> +		} else if (mips_cps_numcores(cl) !=3D 0) {
>  			mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
>  			for (i =3D 0; i < gic_shared_intrs; i++) {
>  				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
> @@ -990,6 +999,9 @@ static int __init gic_of_init(struct device_node *=
node,
>  				write_gic_redir_rmask(i);
>  			}
>  			mips_cm_unlock_other();
> +
> +		} else {
> +			pr_warn("No CPU cores on the cluster %d skip it\n", cl);
>  		}
>  	}
>=20
>
> ---
> base-commit: 10e44701486e25d630d714ace2b0c6d9a178b331
> change-id: 20241025-no-cpu-cluster-support-1745e8abd7d1
>
> Best regards,
> --=20
> Gregory CLEMENT <gregory.clement@bootlin.com>

--=20
- Jiaxun

