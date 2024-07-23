Return-Path: <linux-mips+bounces-4424-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8393985E
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 04:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B531F2267F
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 02:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB76137748;
	Tue, 23 Jul 2024 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Ditt9l6Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h840+DoC"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B258B3D6A;
	Tue, 23 Jul 2024 02:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721702598; cv=none; b=P3Jv3tZ809ou0dbaAFhh9dPOjHbIt7PUW1gw010BcHyvCZQZBR8zF35WkJtDvt4suuE1YFpKSQ1fKLVdp2i6QY6Ht1/50kb/81ySgTRk0fgM41zRVU4tpFSbP19qeJInHhEoBSLXqN75Zeg6iIanGzmTtleEZpkrElz7G+I7vDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721702598; c=relaxed/simple;
	bh=tsV3zyvW0uWJzFfdL6s7/c5IYEyzwvVZHiL6dZ7wtjc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=KccTQ5L29aCYoG3Isedf9DH+Hh+ga/vUZG4xC95NAg1502LiKGhl2mqEd7+JzsCs4jxmsq46njhxaratmGx1Pc5DffkFGv66XXcA+skdzPsJqOxZ1qF0IlRsk47Qvv+Y7HTljKraVMFQQpJtMzAQAsGNTQ6zLWl/3gDsGZF//8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Ditt9l6Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h840+DoC; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B1B2111400D7;
	Mon, 22 Jul 2024 22:43:14 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Mon, 22 Jul 2024 22:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721702594;
	 x=1721788994; bh=LSmySmI5qAd8Vu3NRH9uiUbqkvTERI94Q9FZeFbuDOY=; b=
	Ditt9l6ZLji/wbeQORCFE+CPO41I+E1vqACKJMKEHOFdzY2kS8lrk/ddXVqqv/0m
	HE1+vGbujgz5x+6hbii51pX0pZGADKksTR/kQ3USea9MJ2edsLdJwqFfLdvOHUtk
	/nfKdVMM5lYMWUZ1p6xQ/vOa25mbttaLsQK+W9J0nA2pAI14RkszHaLgQzv+50hI
	yDAESR/VTb2KO68Fb2r/qox0W6zSkkZB6pr9jDSps0s4+8y8vuYhMMLKwHwVTmxL
	/5QZGZAexf+K+Fk4Siiup+ADmVDHZwPTEmkLSdsjSQvMfeb1K5MqdUckgwuM1LW3
	7oY9iw0cZdWUS06AufR+7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721702594; x=
	1721788994; bh=LSmySmI5qAd8Vu3NRH9uiUbqkvTERI94Q9FZeFbuDOY=; b=h
	840+DoC+QM7TuaR0rf1JW/YoNnHTPCd8X1J8j5jZDqmKcin6AM5ih3IRPP6finGj
	TxTw3L/R7HvtznpE7K6F0Yqcpk0R5StiQBIL6ZaFXZR0oWxKsmFpOjZPQUWShchr
	Qt9c6nmQcb8QYcCcZxX4m5w0i+5D4pvy0za984GNBBHN7F8F7twgMhSQqQIwTD9k
	yCFcNSkg6bVYtOmcVoWc0CMgm2PB2jeeNBFfWh2Ndlaz9d60FPdzPE4QiS7l7CDE
	InSlTBz1VkN2dat4geL6SxYXjxJncC16Y/4LYhQlLitMN7qaQBepUBQwtHyQ8PEz
	NeZxZv6/OL+tkFQi1WqBA==
X-ME-Sender: <xms:whifZlZfTJIMvaibMt4TytLT5iOa21KRndmAlU3YGRttsraG_snnTw>
    <xme:whifZsb3aac_9Fnxs8K7IT6W1JInBEWcHQaqkISXtF2R_qxin_r7jOmkH_ljgWNfo
    v97PdbrQcQy7p6pFpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheekgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepkeelveffhedtiefgkeefhffftdduffdvueevtdffteeh
    ueeihffgteelkeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:whifZn-7opLfyemJwMqkUFeyzYDMV4MpCJCMGD6Q7OfGavBuv6_lpA>
    <xmx:whifZjpbteNoNAYFa9kaDwRbk7FePsuR-liYPwXtIuaK-7x9AW6p6g>
    <xmx:whifZgq46YWpkcOcgn1MJHb7b2CJCiQKs7lpmVBtu7juvL4nS4gq5A>
    <xmx:whifZpT0-tUFz161nDjyetBPaA7NWRIPeEDxqBBGC6y2IcNiMyI3Dg>
    <xmx:whifZseBA04qOdw6KWbkGaZD67horxaPPMoX1_-t4QS9djR2X7xkMchY>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3600519C0069; Mon, 22 Jul 2024 22:43:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e6d7001c-f852-4e35-a440-57bc5c1e6c60@app.fastmail.com>
In-Reply-To: <20240722-smp_i6500-v2-1-3101459cba29@bootlin.com>
References: <20240722-smp_i6500-v2-1-3101459cba29@bootlin.com>
Date: Tue, 23 Jul 2024 10:42:40 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and
 later
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8822=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=889:15=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> When the CM block migrated from CM2.5 to CM3.0, the address offset for
> the Global CSR Access Privilege register was modified. We saw this in
> the "MIPS64 I6500 Multiprocessing System Programmer's Guide," it is
> stated that "the Global CSR Access Privilege register is located at
> offset 0x0120" in section 5.4. It is at least the same for I6400.
>
> This fix allows to use the VP cores in SMP mode if the reset values
> were modified by the bootloader.
>
> Based on the work of Vladimir Kondratiev
> <vladimir.kondratiev@mobileye.com> and the feedback from Jiaxun Yang
> <jiaxun.yang@flygoat.com>.
>
> Fixes: 197e89e0984a ("MIPS: mips-cm: Implement mips_cm_revision")
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for getting it corrected!
This patch is ideal for fixes tree.

Thanks
- Jiaxun

> ---
> Changes in v2:
> - Based the detection on the CM version and not on a single CPU version
> - Renamed the macro accordingly
> - Link to v1:=20
> https://lore.kernel.org/r/20240719-smp_i6500-v1-1-8738e67d4802@bootlin=
.com
> ---
>  arch/mips/include/asm/mips-cm.h | 4 ++++
>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/m=
ips-cm.h
> index 3d9efc802e36..10e96b119c36 100644
> --- a/arch/mips/include/asm/mips-cm.h
> +++ b/arch/mips/include/asm/mips-cm.h
> @@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
>  GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
>  #define CM_GCR_CPC_STATUS_EX			BIT(0)
>=20
> +/* GCR_ACCESS - Controls core/IOCU access to GCRs */
> +GCR_ACCESSOR_RW(32, 0x120, access_cm3)
> +#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
> +
>  /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=3D=
1=20
> */
>  GCR_ACCESSOR_RW(32, 0x130, l2_config)
>  #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index e074138ffd7f..05174aa9881c 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned=20
> int vpe_id)
>  	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
>=20
>  	/* Ensure the core can access the GCRs */
> -	set_gcr_access(1 << core);
> +	if (mips_cm_revision() < CM_REV_CM3)
> +		set_gcr_access(1 << core);
> +	else
> +		set_gcr_access_cm3(1 << core);
>=20
>  	if (mips_cpc_present()) {
>  		/* Reset the core */
>
> ---
> base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
> change-id: 20240719-smp_i6500-8cb233878c41
>
> Best regards,
> --=20
> Gregory CLEMENT <gregory.clement@bootlin.com>

--=20
- Jiaxun

