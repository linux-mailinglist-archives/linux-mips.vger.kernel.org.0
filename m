Return-Path: <linux-mips+bounces-9463-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281BAE5FB2
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 10:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C3A19214BE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 08:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F8126B0AE;
	Tue, 24 Jun 2025 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="SPXYg2iN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UfI9GbRk"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5C26A1AE;
	Tue, 24 Jun 2025 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754558; cv=none; b=bZSsDHKqeP45dvMkRtdng4q3OBLKxWGKIBeh/mHmv2n6No7KHlrgzCe+McsoiazErVOwVPpZMhOzpuK4BeD/T058DcIDzSdKmj2op3JysVqEsA3W1JnYws/SDUzqlt8/G6MVTvYbzds286YLc9VKoSNbVXkpi1oaIoHeXCr5dfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754558; c=relaxed/simple;
	bh=IJbXgE2ic8EcuieZkS1NE5Xz+m8iUFG/k9AgCnaIFsU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fCI6Q0CbZ8gzwFPbWWVD2FC7nraKw3TR1GnJZi+lWKhVix2frtoUUxoGZKor4ZNEPtvEgEFS9uV4jMhkWo8RM2VczWUKXWCuJtV7XsZui0BfgYifi5jeGXQW12iO+NoxbEEzlnCbpppatLKGmVTnllF+CLR/H7NfzuufFL6qvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=SPXYg2iN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UfI9GbRk; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 5FDD31380CBA;
	Tue, 24 Jun 2025 04:42:35 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 04:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1750754555;
	 x=1750840955; bh=grGqUxi/05MhI/cvKY7PBXz+A7rPGZM+hVfckJHh1ZY=; b=
	SPXYg2iNL/xF3dTCaRaS057p/BXSBnY6GbkzQDzgIfw9pjcnIx1IEssoStZdZOH/
	O60bYJqwPvlEJm9HNX7HtwWKmFuRxh/vuYZUvq8ZGS1zfvOs1L1dkQOicNpjSlOp
	YmrgjdYSFm/pxY/N7b/RHKwdIFs7R9Y2YO5dnULNu+IbYnfXhDsOHTLbkUgpMttN
	YJTuXAuawVtFSo441dhK9oyw+HnXl4xOi6N/2v0YOtQ/iBMFihdV9Gwh8AZPyiaU
	LuJp0iViKrKQracNg6YkOOnWHX7ov0rrteRMDyt6+yq0sA6qPMylf/u4R3eT8L1m
	LunSDNPZfKsx0nafDPR+Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750754555; x=
	1750840955; bh=grGqUxi/05MhI/cvKY7PBXz+A7rPGZM+hVfckJHh1ZY=; b=U
	fI9GbRkH4a1Qx6afCqadOgsU6IP/QjvifnrVaXLCh6pHNmKarRI9HxHlwI/gPw/m
	LAErMdcaiOEo8q0AuGEclleiPA26ZOg5gIvtC+E8/2ExjUMf2uvCDThA+IM/4jYE
	aTFKtB+Qrw0kLiF+cJMG6oCCWI44YuK//R9ZvNQxJ5TE7KAT7XcAzpDO6V36PKUp
	uqItehE5y7S/cfYjWlcRzLiXO2old8mTEabygJ1UL9REmPZCvpUZUzrcUU+EKuPQ
	jnuIKoMl4o4QdZe6GR2Oqq2EdkC5rNMPM+yq/Grj+9ap+0w1spyQktlv/0dIfBLE
	KhDoOkfoc/1MW+HUJon/Q==
X-ME-Sender: <xms:-mRaaNjcUj6ox1ADZ5osWyBCQLa5QQvS9k1ZZLusGtpsnYth7TAJwA>
    <xme:-mRaaCA0yCqO4sBDA-pZ2z730vQ0_K2W7LEqpUi-HJoMScxqDXrZ9byzHIsA-Ve0h
    9wjzfasX6KekWEqGps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeffkeevtedtueevfefhkefhudfggeetjeffjeduueehueejgfel
    udevkedutdeuheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdp
    rhgtphhtthhopehsthgrsghlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrtg
    hrohesohhrtggrmhdrmhgvrdhukhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-mRaaNFJ89rSTNbhOrnaC5YdokrOynCu2977Qze_q9TnqNFHoumV7Q>
    <xmx:-mRaaCSgd11zvWe4YlMo8MJDOjByuBKzH6yIO9pLFhSqwtbuyU3WvQ>
    <xmx:-mRaaKxLQ1s0z53qLCKDzKXbCSMi2Ra9ckzXEh-rDIFsWuxA5xoipQ>
    <xmx:-mRaaI5cGr0WNB5GsnynkRhYeHJmmeO1B6uhG3HGMbbLpLbpvGRZow>
    <xmx:-2RaaCQbtMqpdOBGsmP0Veg-mWXVgCAkfN-omv26T1LQ1RkPnWzY9KRZ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A0DCE2CE0072; Tue, 24 Jun 2025 04:42:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T4b9790859b38a261
Date: Tue, 24 Jun 2025 09:42:14 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Message-Id: <7ebe1a12-5975-4ed1-8580-905662059a27@app.fastmail.com>
In-Reply-To: <20250607-tlb-fix-v2-1-6751eccd86f1@flygoat.com>
References: <20250607-tlb-fix-v2-1-6751eccd86f1@flygoat.com>
Subject: Re: [PATCH v2] MIPS: mm: tlb-r4k: Uniquify TLB entries on init
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B46=E6=9C=887=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=
=8D=881:43=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hardware or bootloader will initialize TLB entries to any value, which
> may collide with kernel's UNIQUE_ENTRYHI value. On MIPS microAptiv/M51=
50
> family of cores this will trigger machine check exception and cause bo=
ot
> failure. On M5150 simulation this could happen 7 times out of 1000 boo=
ts.
>
> Replace local_flush_tlb_all() with r4k_tlb_uniquify() which probes each
> TLB ENTRIHI unique value for collisions before it's written, and in ca=
se
> of collision try a different ASID.

A gentle ping :-)

>
> Cc: stable@kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Cycle ASID instead of ENTRYHI index in case of collison.
> - Avoid int over flow UB (Maciej)
> - Link to v1:=20
> https://lore.kernel.org/r/20250605-tlb-fix-v1-1-4af496f17b2f@flygoat.c=
om
> ---
>  arch/mips/mm/tlb-r4k.c | 56=20
> +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> index=20
> 76f3b9c0a9f0ce60c42e4a9ea8025e1283678bd1..347126dc010dd59904820d9d9e34=
cdeeb011832f=20
> 100644
> --- a/arch/mips/mm/tlb-r4k.c
> +++ b/arch/mips/mm/tlb-r4k.c
> @@ -508,6 +508,60 @@ static int __init set_ntlb(char *str)
>=20
>  __setup("ntlb=3D", set_ntlb);
>=20
> +/* Initialise all TLB entries with unique values */
> +static void r4k_tlb_uniquify(void)
> +{
> +	int entry =3D num_wired_entries();
> +
> +	htw_stop();
> +	write_c0_entrylo0(0);
> +	write_c0_entrylo1(0);
> +
> +	while (entry < current_cpu_data.tlbsize) {
> +		unsigned long asid_mask =3D cpu_asid_mask(&current_cpu_data);
> +		unsigned long asid =3D 0;
> +		int idx;
> +
> +		/* Skip wired MMID to make ginvt_mmid work */
> +		if (cpu_has_mmid)
> +			asid =3D MMID_KERNEL_WIRED + 1;
> +
> +		/* Check for match before using UNIQUE_ENTRYHI */
> +		do {
> +			if (cpu_has_mmid) {
> +				write_c0_memorymapid(asid);
> +				write_c0_entryhi(UNIQUE_ENTRYHI(entry));
> +			} else {
> +				write_c0_entryhi(UNIQUE_ENTRYHI(entry) | asid);
> +			}
> +			mtc0_tlbw_hazard();
> +			tlb_probe();
> +			tlb_probe_hazard();
> +			idx =3D read_c0_index();
> +			/* No match or match is on current entry */
> +			if (idx < 0 || idx =3D=3D entry)
> +				break;
> +			/*
> +			 * If we hit a match, we need to try again with
> +			 * a different ASID.
> +			 */
> +			asid++;
> +		} while (asid < asid_mask);
> +
> +		if (idx >=3D 0 && idx !=3D entry)
> +			panic("Unable to uniquify TLB entry %d", idx);
> +
> +		write_c0_index(entry);
> +		mtc0_tlbw_hazard();
> +		tlb_write_indexed();
> +		entry++;
> +	}
> +
> +	tlbw_use_hazard();
> +	htw_start();
> +	flush_micro_tlb();
> +}
> +
>  /*
>   * Configure TLB (for init or after a CPU has been powered off).
>   */
> @@ -547,7 +601,7 @@ static void r4k_tlb_configure(void)
>  	temp_tlb_entry =3D current_cpu_data.tlbsize - 1;
>=20
>  	/* From this point on the ARC firmware is dead.	 */
> -	local_flush_tlb_all();
> +	r4k_tlb_uniquify();
>=20
>  	/* Did I tell you that ARC SUCKS?  */
>  }
>
> ---
> base-commit: 911483b25612c8bc32a706ba940738cc43299496
> change-id: 20250605-tlb-fix-578bac7be546
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

