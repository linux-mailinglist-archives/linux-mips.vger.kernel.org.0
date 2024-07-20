Return-Path: <linux-mips+bounces-4402-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB4937ED1
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 05:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4283DB20D02
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 03:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE569441;
	Sat, 20 Jul 2024 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="sTOV2TeJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="smY5ENRb"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609C8F44;
	Sat, 20 Jul 2024 03:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721446056; cv=none; b=aUepH4JkRN8WKDOgWzrYteeU3aCwkzxTHCgDKnJVVUCUBH1+M232ykMh7Hpu31yyx0e43BssHoF+HN3p9IVG9kkM54kp/J6qXu2dVcNPZLNwaaOhY0tD54JqAMfLZTDTloCAD5OZHLt33MvFVvirteJa9SBO97l5FYREmCR0jZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721446056; c=relaxed/simple;
	bh=eyyKxiv8OoFiRWvDhU7i8Vf5kY78HuB4iIxFhQRztE8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=AWLfqrHLovBeZYUCgU6kh1gfMaYUIquTj0wDGtE95hsg9TsHxpfe3FntEyffJYVtTUsEOWfy2vlzZbP3RQo65nUkZw5lfdgODmRziQTBpRvMjFeCI4u069EjCMz8htfk+9eOKeJ6jMdjIGgWwCfUFMOINxAHWLyOmPNXjxthnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=sTOV2TeJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=smY5ENRb; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id D41AD138024D;
	Fri, 19 Jul 2024 23:27:33 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute1.internal (MEProxy); Fri, 19 Jul 2024 23:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1721446053;
	 x=1721532453; bh=+5jghaF7ZlUhd5Q7RAo+GoMD2gAgdTxfIOe3hBMMz2A=; b=
	sTOV2TeJYFMZRnc1LVOSBi8Xfz6wzTNZ4Y5m2hTAIa0F7ucFQvNK3rcjOaGmoInJ
	z1KcigPdbuulhXGnzJpTYKhkDXyuUWWXBlvBb6s4IJ/eXKqUmudAoa20R/473yqB
	y1XYfKrZPN80VSg0THmSrZLfumqvKXT39Lqhfi9FUYRzEiwJB7MxrhmTIdVQIr1g
	sE4A5IUrTOmnBzciSZngJF63NTr7RsFqr6Xx2U17hgZID4XcNCDTYeEbuV3p12E+
	iWY3KBN7/taGafyRm62MWeyzR1xF3LRyiW0IwsDRQsNvPXmhE3eNyGgyINmpSBRN
	0aHFcQI8GFiy80l6lwra/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1721446053; x=
	1721532453; bh=+5jghaF7ZlUhd5Q7RAo+GoMD2gAgdTxfIOe3hBMMz2A=; b=s
	mY5ENRbM2Z/1us/fsDgWeMG7ggQa5dQNzT2WcrwgSFtO9FGBXVdUpHY20RJq6uBd
	4xZ3MIweY0yfFuUggF+g81gh5cnjjZEoKYUfW9l13ji7NJnkGVppSdYYLDuPoaul
	yvNFzgGIN5o3vbFEnKWzFzd8cGV3H/Si721NUpbNiD57hYUU5gNCzFoIk2h+ClDW
	8+70LTFCiSlgkXXXrRx/sVIHNBgnL86UHGPcltbrhEY6dE95RyjK6pnjxe3s0j5u
	tOIseEXVszHatTOrWzPpjkL16yrGkyGmmtCraXHjmmjX/W21aNW7KCzIwSNPf7tL
	ycCw/Ob1MJR34bzmMcAag==
X-ME-Sender: <xms:pS6bZqxZtnFv69xFCniZngFvF-5HIIFqhAspJ6BAchAmLOiMB0YC6Q>
    <xme:pS6bZmTSulkIaDIIb_RWUWdQX2EhPk6qAdApSyGFmj4TcGFMBbp-JLnrZt1aT5jv8
    IxImk5_tEmsO9mwzb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedvgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pS6bZsXEIbGX1r1inwJpj7i4QI3uUOutidS1RXepOk5JUzsf87O6Hw>
    <xmx:pS6bZggyqUJZvm2RPChbTyocxZf4Dh84IJowGJDjqtjdyAtSn4Um5A>
    <xmx:pS6bZsBBobBovCGJ1DYTn3LiRx6mCs2vngmDD44AfXOiekplgIFciA>
    <xmx:pS6bZhIborMJWAEpAaP-p_9QM7rlj8U_fy3JIhYeU_yDGP8TfgBfeQ>
    <xmx:pS6bZo1oD37u0qjYgzCNuBtezulq-rsclvAIfmTy5G_TLmTbXPE2e5Dj>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7AE3F19C0069; Fri, 19 Jul 2024 23:27:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6cbe8375-c11d-4fbf-8e4f-b15828ac3480@app.fastmail.com>
In-Reply-To: <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
References: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
 <302ca8fb-0185-4872-9d82-d472854e5a43@app.fastmail.com>
Date: Sat, 20 Jul 2024 11:27:12 +0800
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



=E5=9C=A82024=E5=B9=B47=E6=9C=8820=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=8811:13=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B47=E6=9C=8819=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:14=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> Unlike most other MIPS CPUs, the I6500 CPUs have different address
>> offsets for the Global CSR Access Privilege register. In the "MIPS64
>> I6500 Multiprocessing System Programmer's Guide," it is stated that
>> "the Global CSR Access Privilege register is located at offset 0x0120"
>> in section 5.4.
>>
>> However, this is not the case for other MIPS64 CPUs such as the
>> P6600. In the "MIPS64=C2=AE P6600 Multiprocessing System Software Use=
r's
>> Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
>> offset of 0x0020.
>
> Hi Gregory,
>
> I confirmed this is a CM3 feature rather than CPU core (Samruai) featu=
re.

Oh I=E2=80=99m not really sure if it=E2=80=99s CM 3.5 only.

Let me check this Monday once I can checkout old design database for I64=
00.

Hardware resets GCR_ACCESS to the most permissive value so I assume it=E2=
=80=99s your bootloader doing wired hacks.

Thanks

>
> Please use CM version to select register region.
> (And perhaps Cc stable for this patch?)
>
> Thanks
> - Jiaxun
>
>>
>> This fix allows to use the VP cores in SMP mode.
>>
>> Based on the work of Vladimir Kondratiev <vladimir.kondratiev@mobiley=
e.com>
>>
>> Fixes: 859aeb1b0dd1 ("MIPS: Probe the I6500 CPU")
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  arch/mips/include/asm/mips-cm.h | 4 ++++
>>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/=
mips-cm.h
>> index 3d9efc802e36..41bf9b3a98fb 100644
>> --- a/arch/mips/include/asm/mips-cm.h
>> +++ b/arch/mips/include/asm/mips-cm.h
>> @@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
>>  GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
>>  #define CM_GCR_CPC_STATUS_EX			BIT(0)
>>=20
>> +/* GCR_ACCESS - Controls core/IOCU access to GCRs */
>> +GCR_ACCESSOR_RW(32, 0x120, access_i6500)
>> +#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
>> +
>>  /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=
=3D1=20
>> */
>>  GCR_ACCESSOR_RW(32, 0x130, l2_config)
>>  #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
>> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
>> index e074138ffd7f..60590890b6da 100644
>> --- a/arch/mips/kernel/smp-cps.c
>> +++ b/arch/mips/kernel/smp-cps.c
>> @@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigne=
d=20
>> int vpe_id)
>>  	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
>>=20
>>  	/* Ensure the core can access the GCRs */
>> -	set_gcr_access(1 << core);
>> +	if (current_cpu_type() !=3D CPU_I6500)
>> +		set_gcr_access(1 << core);
>> +	else
>> +		set_gcr_access_i6500(1 << core);
>>=20
>>  	if (mips_cpc_present()) {
>>  		/* Reset the core */
>>
>> ---
>> base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
>> change-id: 20240719-smp_i6500-8cb233878c41
>>
>> Best regards,
>> --=20
>> Gregory CLEMENT <gregory.clement@bootlin.com>
>
> --=20
> - Jiaxun

--=20
- Jiaxun

