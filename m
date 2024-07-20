Return-Path: <linux-mips+bounces-4401-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D25937ECC
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 05:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAAEE282334
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 03:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ECF8F5D;
	Sat, 20 Jul 2024 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hbK7Sl4V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QaSgcaH9"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F88F59;
	Sat, 20 Jul 2024 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721445218; cv=none; b=hOJ+iOiFpm/+N1Mixqjy4rkvhuD03HbMDIrYu1T7XMHZYEX5zd96Y7vHAr/nBH/wSC3oLDI8we8UoNZmaCwnIMuiey2jIvrt0s/u1LQpxHG47R6IINOw+nGcI6KMl3inzu3bMOCMTT+wTP4a2fP+tdFBVjcJ0OpGOVRfpOCRN78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721445218; c=relaxed/simple;
	bh=2ZilqTLkTvzRAGRV71O4njOlNtRmotDkZ7EUQaeKXGE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=iKdVp/B+PTuojpfRE76zfVR9z0jh5LC7hT4Tzptbe1yFviLMtI8M1sn4hMJwOS9yOPibL7Tm0uMCo5/MwgGCawvXi+BfUfbrcR/VZwdxeyZ8LyZKSj7orlTIN7xWNa17gl2bGMLpm//qqqe/QT4MCSVqTz/aXK3pxTyKqbgQ7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hbK7Sl4V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QaSgcaH9; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 929F713801E8;
	Fri, 19 Jul 2024 23:13:34 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute1.internal (MEProxy); Fri, 19 Jul 2024 23:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721445214;
	 x=1721531614; bh=2U6BMTxf8tCK9CNUiA58/32vLWBP+Uq0Adano3nAte4=; b=
	hbK7Sl4VWiqmvzRIId22NUM8pPvULZYTD0EFBxTqG0Shcm9IF5vDtZWmUubRh9px
	Y5y2RQWp5sCp9cMDpX+ira+wrGOIjA+GTHy9FxAj3c7X4uECufgUbSl2/uyDxaSW
	VhM/FGMRi40avCGLdPhpabYLJQlh8mgRCy46MEEubB68rj+IDv79QnNJjiqpPet6
	bbj41M5SwtBg0E8m5VvTeKLxAiWAALk7oS2iKwliBBccoLyQd/nVHsMs/YWGoCVE
	otZfAq63h98CRBkwPNoU39xpcA4PT0qcENlftv+B3ILP50PsBL3HDqjZaqkYu+fC
	HjqpqNowhCCCdUZYjiD7Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721445214; x=
	1721531614; bh=2U6BMTxf8tCK9CNUiA58/32vLWBP+Uq0Adano3nAte4=; b=Q
	aSgcaH9+sVvH1vs6BuNicf90MrFQhvvk5AnOxUeP1aisBZC1URHJ2J8P3rZ46+oo
	vIrgVZNNoSIOuLMS4pimXd40bdNhTRSH9TZp/S4fHpJQANeHTxufC0yeleZtznCr
	VADpVoAosr+Q6xH58SZGWlc4LhwFgfNCpH/nHscj/ForN7m8e4Sstn3MAeVhLrQr
	xyxon63GEYOhL9lGVAF2Ck13NdHuf6LcBNBz6oPqJyKnEOdX9/QavnDbjiUXwQ9i
	znQBqCUvondt8E5tG03HYspuJPo6QHfnNDdpchYFytf2v+Ns3bXeUeclr8/7bcFP
	p+9lSgYAOtRPOZoD7gUEA==
X-ME-Sender: <xms:XSubZrwhbaEc973HxgDX17lfnsbDfd4LorehqGKN4VB_O_KMbtO_BQ>
    <xme:XSubZjRhDDGdCK1cJdjH49FKWEy5GG4NSm1jw8qm903NrSfXEoBm65E3ZkP4E98Lb
    r9N80Stf-AkmZ564zM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedvgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:XSubZlVz6qyJ_W3ycQzdr0yjtmcTzW2-fa4ibvl3hNLsheuJnclY7g>
    <xmx:XSubZljlsJAb2yPMHEBh3RziSQfjwsCK8C-N9Wi7idhmnHaIuIuY7A>
    <xmx:XSubZtB6woKyP9sORnjAMnQ5qgxcEl81ruMHXZII5aWjPGarhfzqYw>
    <xmx:XSubZuLGy39xHSw5pVSLSBywHS4xocpZP-Jji6Fd5tv5ResFmVRa1g>
    <xmx:XiubZh3boBZtvylGVV8Y-qZWEm3xKGBzAQrx5xyf9z8eUop5WQbRvZnQ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C446819C0069; Fri, 19 Jul 2024 23:13:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
In-Reply-To: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
Date: Sat, 20 Jul 2024 11:13:12 +0800
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
Subject: Re: [PATCH] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for I6500
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> Unlike most other MIPS CPUs, the I6500 CPUs have different address
> offsets for the Global CSR Access Privilege register. In the "MIPS64
> I6500 Multiprocessing System Programmer's Guide," it is stated that
> "the Global CSR Access Privilege register is located at offset 0x0120"
> in section 5.4.
>
> However, this is not the case for other MIPS64 CPUs such as the
> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software User=
's
> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
> offset of 0x0020.

Hi Gregory,

I confirmed this is a CM3 feature rather than CPU core (Samruai) feature.

Please use CM version to select register region.
(And perhaps Cc stable for this patch?)

Thanks
- Jiaxun

>
> This fix allows to use the VP cores in SMP mode.
>
> Based on the work of Vladimir Kondratiev <vladimir.kondratiev@mobileye=
.com>
>
> Fixes: 859aeb1b0dd1 ("MIPS: Probe the I6500 CPU")
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/include/asm/mips-cm.h | 4 ++++
>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/m=
ips-cm.h
> index 3d9efc802e36..41bf9b3a98fb 100644
> --- a/arch/mips/include/asm/mips-cm.h
> +++ b/arch/mips/include/asm/mips-cm.h
> @@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
>  GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
>  #define CM_GCR_CPC_STATUS_EX			BIT(0)
>=20
> +/* GCR_ACCESS - Controls core/IOCU access to GCRs */
> +GCR_ACCESSOR_RW(32, 0x120, access_i6500)
> +#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
> +
>  /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=3D=
1=20
> */
>  GCR_ACCESSOR_RW(32, 0x130, l2_config)
>  #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index e074138ffd7f..60590890b6da 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned=20
> int vpe_id)
>  	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
>=20
>  	/* Ensure the core can access the GCRs */
> -	set_gcr_access(1 << core);
> +	if (current_cpu_type() !=3D CPU_I6500)
> +		set_gcr_access(1 << core);
> +	else
> +		set_gcr_access_i6500(1 << core);
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

