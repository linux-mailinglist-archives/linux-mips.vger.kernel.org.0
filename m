Return-Path: <linux-mips+bounces-847-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BB820913
	for <lists+linux-mips@lfdr.de>; Sun, 31 Dec 2023 00:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAEECB214EB
	for <lists+linux-mips@lfdr.de>; Sat, 30 Dec 2023 23:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F36D510;
	Sat, 30 Dec 2023 23:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="nOTG89a6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KiD7S7qu"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427BFD309;
	Sat, 30 Dec 2023 23:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id B0F6F3200A34;
	Sat, 30 Dec 2023 18:17:03 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 30 Dec 2023 18:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1703978223;
	 x=1704064623; bh=D2j+IkplKclKfwScHt+wIjc231Jf4+YQWKxoc2FQ8tI=; b=
	nOTG89a67okEsJV8EUN5or9vcsGSunFLLZS/MDyMvS+eZulTK+qi406lKZtVMsJ5
	OjyTxe+GnmxynXQQsdmN/vNn5T+EcihBt7pDDFe3P0MVysdSHlFqY5+Uf9glJxHW
	J8uAoWQMfn8mkHB4zw1p4OtGlP0Mg1G9y+OtnCxlHjJU6EmZw5RoqSx0q3mQjF2X
	14qEH9taIoMfT/td0deo+2JNvs67PvQhmSZpXC7Dp8QOC9S9uZ3lZQzKnm5lK0rH
	uLNiFETIB/Th7pBuyprdzU22ndMitaf0hQfWgpMxobzhheNPKmNxYxT1AW39l2ow
	QAmfswzi+nTFe2wIMTJKRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703978223; x=
	1704064623; bh=D2j+IkplKclKfwScHt+wIjc231Jf4+YQWKxoc2FQ8tI=; b=K
	iD7S7quqb2EOzPJo6ZlJMv059ffsd7Ucou1e9LhrO7rNafbEG+IMcx2uAF20HVoG
	FRqa00dp9PwS1P5zhH23EvR/HqSpTD3TPqvj5fwowrM9yUq0HK/KbQIL35n6291q
	v/2oBMwQJzphln5sgzGQzQpPFJ2cyfRUM7EMsAhqhUN3dsZ9hHOR6sWwPdA+JNAb
	RAAbXmYHCXzbpgV06TzakswtPqVFNjD0ZodOPu80U1D9x1VhLU1+zcll2lqy2Lnl
	Vupopal/MMAtbQHstWngKRbZEygiM7bu215QhAtuf1Ep1v3xQRkmcWuTB6hNroaH
	sKnNiY3zH7MeNbDgFw3rA==
X-ME-Sender: <xms:7qSQZe2JY72hoezAR7tEvnrOjApR5qEsPtgrrV_qU40alFAd0oNR5g>
    <xme:7qSQZRHEvgURXGE-NfkevsoPdbM5L26UihId5qOa282GAUOO7wbOTDlHJDDiYV9zH
    a5gxOt4UwPROuUEGjc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdefiedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:7qSQZW4ZbUt3dmVJ3JTMv3fYXtOWvUka6BfockVkv3SULu90csFiXA>
    <xmx:7qSQZf0TmDzv8PdZkteAK0tlPlYsq5__yvgcx7KfH8ZB9xL1p68QCw>
    <xmx:7qSQZRGVNX5cXKdlB1GVbw2CbMQxbQiyQL9c-fZHjGft9HhxhlenBA>
    <xmx:76SQZaPUSNouoSO1-i0c1k81pstnBXMKSCITslHlSABBDmg0hEBjxw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 25C1B36A0076; Sat, 30 Dec 2023 18:17:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8d70aead-6ed5-4d53-b920-d12167787f0b@app.fastmail.com>
In-Reply-To: <ZZBx01WttA3R1XjI@eldamar.lan>
References: <20231211182019.802717483@linuxfoundation.org>
 <20231211182023.277870337@linuxfoundation.org> <ZZBx01WttA3R1XjI@eldamar.lan>
Date: Sat, 30 Dec 2023 23:16:41 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Salvatore Bonaccorso" <carnil@debian.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 patches@lists.linux.dev, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Christoph Hellwig" <hch@lst.de>, "Huacai Chen" <chenhuacai@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 5.10 81/97] MIPS: Loongson64: Enable DMA noncoherent support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B412=E6=9C=8830=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8B=E5=8D=887:38=EF=BC=8CSalvatore Bonaccorso=E5=86=99=E9=81=93=EF=
=BC=9A
> Hi,
>
> On Mon, Dec 11, 2023 at 07:22:24PM +0100, Greg Kroah-Hartman wrote:
>> 5.10-stable review patch.  If anyone has any objections, please let m=
e know.
>>=20
>> ------------------
>>=20
>> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>=20
>> commit edc0378eee00200a5bedf1bb9f00ad390e0d1bd4 upstream.
>>=20
>> There are some Loongson64 systems come with broken coherent DMA
>> support, firmware will set a bit in boot_param and pass nocoherentio
>> in cmdline.
>>=20
>> However nonconherent support was missed out when spin off Loongson-2EF
>> form Loongson64, and that boot_param change never made itself into
>> upstream.
>>=20
>> Support DMA noncoherent properly to get those systems working.
>>=20
>> Cc: stable@vger.kernel.org
>> Fixes: 71e2f4dd5a65 ("MIPS: Fork loongson2ef from loongson64")
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>  arch/mips/Kconfig                                  |    2 ++
>>  arch/mips/include/asm/mach-loongson64/boot_param.h |    3 ++-
>>  arch/mips/loongson64/env.c                         |   10 +++++++++-
>>  3 files changed, 13 insertions(+), 2 deletions(-)
>>=20
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -468,6 +468,7 @@ config MACH_LOONGSON2EF
>> =20
>>  config MACH_LOONGSON64
>>  	bool "Loongson 64-bit family of machines"
>> +	select ARCH_DMA_DEFAULT_COHERENT
>>  	select ARCH_SPARSEMEM_ENABLE
>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>>  	select ARCH_MIGHT_HAVE_PC_SERIO
>> @@ -1379,6 +1380,7 @@ config CPU_LOONGSON64
>>  	select CPU_SUPPORTS_MSA
>>  	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
>>  	select CPU_MIPSR2_IRQ_VI
>> +	select DMA_NONCOHERENT
>>  	select WEAK_ORDERING
>>  	select WEAK_REORDERING_BEYOND_LLSC
>>  	select MIPS_ASID_BITS_VARIABLE
>> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
>> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
>> @@ -117,7 +117,8 @@ struct irq_source_routing_table {
>>  	u64 pci_io_start_addr;
>>  	u64 pci_io_end_addr;
>>  	u64 pci_config_addr;
>> -	u32 dma_mask_bits;
>> +	u16 dma_mask_bits;
>> +	u16 dma_noncoherent;
>>  } __packed;
>> =20
>>  struct interface_info {
>> --- a/arch/mips/loongson64/env.c
>> +++ b/arch/mips/loongson64/env.c
>> @@ -13,6 +13,8 @@
>>   * Copyright (C) 2009 Lemote Inc.
>>   * Author: Wu Zhangjin, wuzhangjin@gmail.com
>>   */
>> +
>> +#include <linux/dma-map-ops.h>
>>  #include <linux/export.h>
>>  #include <linux/pci_ids.h>
>>  #include <asm/bootinfo.h>
>> @@ -131,8 +133,14 @@ void __init prom_init_env(void)
>>  	loongson_sysconf.pci_io_base =3D eirq_source->pci_io_start_addr;
>>  	loongson_sysconf.dma_mask_bits =3D eirq_source->dma_mask_bits;
>>  	if (loongson_sysconf.dma_mask_bits < 32 ||
>> -		loongson_sysconf.dma_mask_bits > 64)
>> +			loongson_sysconf.dma_mask_bits > 64) {
>>  		loongson_sysconf.dma_mask_bits =3D 32;
>> +		dma_default_coherent =3D true;
>> +	} else {
>> +		dma_default_coherent =3D !eirq_source->dma_noncoherent;
>> +	}
>> +
>> +	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on"=
 : "off");
>> =20
>>  	loongson_sysconf.restart_addr =3D boot_p->reset_system.ResetWarm;
>>  	loongson_sysconf.poweroff_addr =3D boot_p->reset_system.Shutdown;
>
> While preparing an update for Debian and finally building for all
> supported architecture, the builds for mipsel and mips64el were
> failing with:
>
> /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c: In function=20
> 'prom_init_env':
> /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: error:=20
> 'dma_default_coherent' undeclared (first use in this function); did yo=
u=20
> mean 'dma_free_coherent'?
>   138 |   dma_default_coherent =3D true;
>       |   ^~~~~~~~~~~~~~~~~~~~
>       |   dma_free_coherent
> /<<PKGBUILDDIR>>/arch/mips/loongson64/env.c:138:3: note: each=20
> undeclared identifier is reported only once for each function it=20
> appears in
> make[6]: *** [/<<PKGBUILDDIR>>/scripts/Makefile.build:291:=20
> arch/mips/loongson64/env.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
>
> Is here a prerequisite missing for the commit?
>
> Backporting though 6d4e9a8efe3d ("driver core: lift dma_default_cohere=
nt into
> common code") which is from 5.12-rc1 though seems too intrusive, corre=
ct? Would
> the alternative be to just revert the 3ee7e2faef87 ("MIPS: Loongson64:=
 Enable
> DMA noncoherent support") commit which landed in 5.10.204?

Hi,

Sorry for not spotting the issue in the first place.

It actually requires more dependencies such as c00a60d6f4a1 ("of: addres=
s: always
use dma_default_coherent for default coherency").

I'll try to produce a backport series but better to drop this patch from=
 stable
for now.

Thanks
>
> Regards,
> Salvatore

--=20
- Jiaxun

