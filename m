Return-Path: <linux-mips+bounces-3911-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BFA915BF3
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 03:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C63801C203AD
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2024 01:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0901D54F;
	Tue, 25 Jun 2024 01:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="GTiiv6GN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sigM7+rw"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351831CA8D;
	Tue, 25 Jun 2024 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719280759; cv=none; b=SbUhOV6KZsjcVfcbYpRl+d53syG5nd1iMMjz+3hs31oK4BQMh5KmVWCRrSqp1Y2mJe94H97kHW07n9JjPcqdl23XAo9cVz60X/ZRLNja1rnWKolssGpY5C1FLCgfoLa+8B2sselcDyj577ccukTmVwqE2XV8DJoFVr62sOtTMJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719280759; c=relaxed/simple;
	bh=5ISwQrLocAPpPCHPnCOQsR0JRHFii5Dmj8nYLlct1NM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=BEJpyEouux6EoDvrCM/45TlSXdcnOdbc0jqkQInJmH/EvBA1Gq0e3eF/tQlpW4ztXWYjYd3B+Jwar1CVHt6GxXKPgJA5WMdh9Sv5Xgk2ztJ0hDU5V2Im9t81DAC8Is1B1cFMRpLHV5wvFfnEuvcRPRtTG0v6yy7k815DfRjjpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=GTiiv6GN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sigM7+rw; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4669D1140165;
	Mon, 24 Jun 2024 21:59:16 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 24 Jun 2024 21:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719280756;
	 x=1719367156; bh=ah4oKUM9Pp9ggriO1lYIDIQcFEKOqXG/hsQHXe+i1WY=; b=
	GTiiv6GNYUPET5jWECYu+r3t9sxg4op/KobZQFsIw8ufuGjX82s4G3YuuzqxRGCr
	iarG3RexreT9ABET+A/vMhAe4JIM0yABjFDuc+O4yr8IcXe1Wbsqtdj7zvcWOgyR
	Gx11sc/+tXEGP7Gr6IE9hbQYFGZz2T9IIl62vx/+E0d0zDlh8VNKhM5QSHKdsg4B
	/93aYFwP4mN+k7wNJOPtE0PbH/dqCWayGCaMk0z3PybRfFeV3YmVUSM2Vd/tFuhC
	+fL/F/X6OXD1zBNXEPETmxA/tfGRfbKixZfRwX5ouVFleazrGl96O/MyRCRMay7d
	fFxD0BCV1QroDcs8PQfaeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719280756; x=
	1719367156; bh=ah4oKUM9Pp9ggriO1lYIDIQcFEKOqXG/hsQHXe+i1WY=; b=s
	igM7+rwywsOf09akm5xkdNppA3Ce7nt+j6WHOKfJIhX+yQ/J1Lm1LwrJtX8nZ00u
	ohjaVWOBsyYEUYUSe2mPFuROc+Y/As0XroZE8nrERXM/ZtoAdZuwA5F7Mgcubrvr
	tl42WDKfGeSOFZarg44vdn3slcjhrmvl1ylkhpCDgXEXYvRfiboeqrl/BRiasbUt
	jTX1S3jo1keI+IYLYH34cPwAy+DByPHfRS9hRkch3FnKSdDICP04uDbJTg3PoTXs
	/O0LH32Co2IiMoSB5s69XSmFWDA+uRm+Otqh3HOP/WJts/1eNnnJgIfKoQVYR6kf
	uLQeE+vCFmfAVPZ0re30A==
X-ME-Sender: <xms:cyR6Zg28oxh4XeSZGSWCPEHx-HhsD9Iq_br46OsjGnhRNEiYqgke1w>
    <xme:cyR6ZrHbnILnioNqR6b5F1Fwgq_sVCbHxqsuFqZR80fF4nnW7g0U0P2Xwe8J0jSSM
    0SqevZtyoDSJ3vFT1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeftefhkeefffevveejtdekiefguefhveetjedtveef
    leehteeuffeijeekjefgfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:cyR6Zo7otobT1YELojFVQLusKy2gpwJlo8pQcdvAFiDT2AeJn4mJOA>
    <xmx:cyR6Zp0EnHzJHci9OqNEUfZrB3jMxFfKd8JOAcrFV-lmOQTX8D7YbA>
    <xmx:cyR6ZjHJkt0jed-CUOrkkfsD8udraowo1-gWUlbsqWel6YFxLjSzcg>
    <xmx:cyR6Zi9MVLCloQx8uyTf36v6ME85EILElFjMqo62E27c0p6rl-VUdA>
    <xmx:dCR6Zr8JcoLBdNyk2DMAJ3TXQXx8hmnYFb1j6AohqN8IXwCfZThbrJhi>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6EAA436A0074; Mon, 24 Jun 2024 21:59:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0ffe69cc-3a82-4d2c-86d8-5ab9b176ce4a@app.fastmail.com>
In-Reply-To: 
 <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 25 Jun 2024 02:58:54 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Shiji Yang" <yangshiji66@outlook.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Khalid Aziz" <khalid@gonehiking.org>, "Baoquan He" <bhe@redhat.com>,
 "Serge Semin" <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 "Mieczyslaw Nalewaj" <namiltd@yahoo.com>
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=882:44=EF=BC=8CShiji Yang=E5=86=99=E9=81=93=EF=BC=9A
> The detect_memory_region() has been broken on 6.6 kernel[1]. This
> patch fixes it by:
> 1. Do not use memcmp() on unallocated memory, as the new introduced
>    fortify dynamic object size check[2] will return unexpected result.
> 2. Use a fixed pattern instead of a random function pointer as the
>    magic value.
> 3. Flip magic value and double check it.
> 4. Enable this feature only for 32-bit CPUs. Currently, only ath79 and
>    ralink CPUs are using it. And 64-bit CPU doesn't have the KSEG1ADDR
>    definition.

Hi Shiji,

Thanks for your patch.

Please don't break 64bit system.
Use CKSEG1ADDR_OR_64BIT instead.

Thanks
- Jiaxun

>
> [1]=20
> https://github.com/openwrt/openwrt/pull/14774#issuecomment-1989356746
> [2] commit 439a1bcac648 ("fortify: Use __builtin_dynamic_object_size()=20
> when available")
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> Tested-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> ---
>  arch/mips/include/asm/bootinfo.h |  2 ++
>  arch/mips/kernel/setup.c         | 17 ++++++++++++-----
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/=
bootinfo.h
> index 2128ba903391..8516c11916a4 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -93,7 +93,9 @@ const char *get_system_type(void);
>=20
>  extern unsigned long mips_machtype;
>=20
> +#ifndef CONFIG_64BIT
>  extern void detect_memory_region(phys_addr_t start, phys_addr_t=20
> sz_min,  phys_addr_t sz_max);
> +#endif
>=20
>  extern void prom_init(void);
>  extern void prom_free_prom_memory(void);
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 12a1a4ffb602..3a3bc1b7e62e 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -86,21 +86,27 @@ static struct resource bss_resource =3D { .name =3D=20
> "Kernel bss", };
>  unsigned long __kaslr_offset __ro_after_init;
>  EXPORT_SYMBOL(__kaslr_offset);
>=20
> -static void *detect_magic __initdata =3D detect_memory_region;
> -
>  #ifdef CONFIG_MIPS_AUTO_PFN_OFFSET
>  unsigned long ARCH_PFN_OFFSET;
>  EXPORT_SYMBOL(ARCH_PFN_OFFSET);
>  #endif
>=20
> +#ifndef CONFIG_64BIT
> +static u32 detect_magic __initdata;
> +#define MIPS_MEM_TEST_PATTERN		0xaa5555aa
> +
>  void __init detect_memory_region(phys_addr_t start, phys_addr_t=20
> sz_min, phys_addr_t sz_max)
>  {
> -	void *dm =3D &detect_magic;
> +	void *dm =3D (void *)KSEG1ADDR(&detect_magic);
>  	phys_addr_t size;
>=20
>  	for (size =3D sz_min; size < sz_max; size <<=3D 1) {
> -		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
> -			break;
> +		__raw_writel(MIPS_MEM_TEST_PATTERN, dm);
> +		if (__raw_readl(dm) =3D=3D __raw_readl(dm + size)) {
> +			__raw_writel(~MIPS_MEM_TEST_PATTERN, dm);
> +			if (__raw_readl(dm) =3D=3D __raw_readl(dm + size))
> +				break;
> +		}
>  	}
>=20
>  	pr_debug("Memory: %lluMB of RAM detected at 0x%llx (min: %lluMB, max=
:=20
> %lluMB)\n",
> @@ -111,6 +117,7 @@ void __init detect_memory_region(phys_addr_t start=
,=20
> phys_addr_t sz_min, phys_add
>=20
>  	memblock_add(start, size);
>  }
> +#endif /* CONFIG_64BIT */
>=20
>  /*
>   * Manage initrd
> --=20
> 2.45.1

--=20
- Jiaxun

