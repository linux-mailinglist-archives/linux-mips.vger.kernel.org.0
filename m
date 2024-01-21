Return-Path: <linux-mips+bounces-1029-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FCF835541
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 11:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72940B2146C
	for <lists+linux-mips@lfdr.de>; Sun, 21 Jan 2024 10:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D948364CB;
	Sun, 21 Jan 2024 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lyjH2ijS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AS7ykS2V"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A112E6A
	for <linux-mips@vger.kernel.org>; Sun, 21 Jan 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705833371; cv=none; b=lfqlf82cEiVZNdpvjUn+TjWbliqOA3JSkTJNjYSu5IDlBl5EVQ75ojHJCYOSK9WCZN7VlUlTpDv7QLRkjUF6vooo3tTYUBZV5hnF+5y64O9NZcZRy1ppuxCKdRLDv4dTqWO98gUNIz56UX17v4jqGf33z2LJ3vA3V/z2tLhF1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705833371; c=relaxed/simple;
	bh=Uy83JKcToWhVxdaqqljLcS5mnd3mO6fO5K7KajYpVoE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ioKyODY8E55wMkWpsF5i274zCZ2K/lBXxxmVhzpN2X0T9Y76X1xoUqcZ2bB1YU/fqbrYbCrcS8hVO+sL7NqESmZa/myhW47eMHYrvnAoX6LHuEx8EOYWnDsXmsKTUQGUgzHbsLJZyCpvDtXVNlUYT/4noZPAuD/MYBdicu4C4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lyjH2ijS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AS7ykS2V; arc=none smtp.client-ip=64.147.123.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 428D73200AD3;
	Sun, 21 Jan 2024 05:36:07 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sun, 21 Jan 2024 05:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1705833366;
	 x=1705919766; bh=aS6OF6sRDX1kY5UtXH/LE3+Yd3tEGdozwhWj6w3GDPE=; b=
	lyjH2ijSG5BIoZcVXjvhhJBiih0CpFk4aNCNEqpRFCtsh5ckytWMFicqjw3zh7gj
	QgyCDfJixDhEabQQ8AdR3e7qLsR3NZtqyDhKhUH52hDvqIvgb2WvKIoC07Hv9k9H
	YSrPktsUDp65W/yvM2W3p7qDYRwCwY4Y0d1vQh4CIbQVc9mHU202i/qmj+Jd1GpI
	DlRNLOkTMQXd91NasuyT2l1hhX6mzR46uFRU/C5Wnn8gNFnz4ZsuTNJsfLX/YwHE
	Zo5MZjv6aNozfWU/qvt5PJENn3bQKV70b+5x1ICbXtUpiPQEUxGgcJYzkwjRoXJQ
	X3T2XhiLk8121QhPW5bl1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1705833366; x=
	1705919766; bh=aS6OF6sRDX1kY5UtXH/LE3+Yd3tEGdozwhWj6w3GDPE=; b=A
	S7ykS2VsabdqFnZ9oIqw2kJd5YW7EXhMKBbX8qNYzOoe7V3vrqUcUfCg0iSYW/NZ
	HCT2p0TzSe5hP9jshKzo6mR2+y8ZLwI1mCedcuz+dI54Ei7kS8EYFQMC3vyM3oMN
	QQGQ5GpKbiyoOcY7klTQ+IX5+gsvV8Mj+lCcC2vI/fAbqQKttu5Mj74e/FZ9Kgc7
	7UJlIhXwtMgsCh6JSDnYP6fRloLMlLsrKn2MbpdOTdfDBSarLZ3DskbokgCgvXHC
	rdMg41y2yrD7qm3j2jXK2qmiMjFWrlCwrEZg6AEjGfp5fWafOR4QwmSvXGwc8sVi
	OvOd+ZcW6UFGSrens6Ynw==
X-ME-Sender: <xms:lfOsZcgAJKdc9aehjdlsqyBGAxhzlgcx7Vpy4-XALFZcArFTwf29bg>
    <xme:lfOsZVAhXvOi8nSZuI7yY7IbCCq_mP-pXD6JqxRx8QcqsYCbievM7bRCCKSlyeFEs
    WLT0a3V000rz6RnlH0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekgedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:lfOsZUFnIj6I4S22t3lYjhKNgP-RHE5YEtxGo9m4DxYND75-GiK_qQ>
    <xmx:lfOsZdTIOTCNvBPTw81YxWWijKsNNEmHOIsPDoScWYzU7jKM5aYSWw>
    <xmx:lfOsZZy-vKruMScSF_r67zQTSfBxy9eCn_YTLzRIkWePpOr9jurIqA>
    <xmx:lvOsZQkoM74LSnsUGQpv_4L7AAngtblaPNxYa43FB6TsFHqipNA16g>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7327F36A0076; Sun, 21 Jan 2024 05:36:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1374-gc37f3abe3d-fm-20240102.001-gc37f3abe
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ec90388e-390b-4357-83a1-4707ef48bd49@app.fastmail.com>
In-Reply-To: <20240121021412.obdprwuqcqnc4qfq@Board-3A3000>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
 <20240119040240.392442-3-huangpei@loongson.cn>
 <4f1fc736-6e44-4313-acdc-d1c88cda15f6@flygoat.com>
 <20240121021412.obdprwuqcqnc4qfq@Board-3A3000>
Date: Sun, 21 Jan 2024 10:35:44 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huang Pei" <huangpei@loongson.cn>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Bibo Mao" <maobibo@loongson.cn>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Xuefeng Li" <lixuefeng@loongson.cn>, "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Gao Juxin" <gaojuxin@loongson.cn>, "Huacai Chen" <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock region
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B41=E6=9C=8821=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=882:14=EF=BC=8CHuang Pei=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Jan 19, 2024 at 10:05:39AM +0000, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A8 2024/1/19 04:02, Huang Pei =E5=86=99=E9=81=93:
>> > Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()) reve=
als
>> > that reserved memblock regions have no valid node id set, just set =
it
>> > right since loongson64 firmware makes it clear in memory layout inf=
o.
>> >=20
>> > This works around booting failure on 3A1000+ since commit 61167ad5f=
ecd
>> > ("mm: pass nid to reserve_bootmem_region()) under
>> > CONFIG_DEFERRED_STRUCT_PAGE_INIT.
>>=20
>> This should be done at MIPS arch level I guess.
> You mean the real fix or the set nid for the reserved memblock region?

Set nid for reserved region.

>
> + the real fix is [1](see old mail).
>
> I do not think MIPS arch needs it:
>
> + This ONLY matters on NUMA, most of MIPS platforms is UMA.

There are still some NUMA capable platforms around, such as SGI-IP27.

Thanks
- Jiaxun

>
> + MM does not care about the nid of reserved memblock region provided =
by=20
> arch/platform, nor it provide "memblock_reserved_node" like
> "memblock_add_node". Loongson64 knows about nid of reserved region and=
 the
> regular distribution of physical memory bewtween nodes, that is why it=
 can
> be done by simple "memblock_set_node" and I add it.
>
>>=20
>> Thanks
>> - Jiaxun
>>=20
>> >=20
>> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
>> > ---
>> >   arch/mips/loongson64/init.c | 2 ++
>> >   arch/mips/loongson64/numa.c | 2 ++
>> >   2 files changed, 4 insertions(+)
>> >=20
>> > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/ini=
t.c
>> > index f25caa6aa9d3..000ba91c0886 100644
>> > --- a/arch/mips/loongson64/init.c
>> > +++ b/arch/mips/loongson64/init.c
>> > @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
>> >   	if (loongson_sysconf.vgabios_addr)
>> >   		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_=
addr),
>> >   				SZ_256K);
>> > +	/* set nid for reserved memory */
>> > +	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock=
.reserved, node);
>> >   }
>> >   #ifndef CONFIG_NUMA
>> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/num=
a.c
>> > index 8f61e93c0c5b..6345e096c532 100644
>> > --- a/arch/mips/loongson64/numa.c
>> > +++ b/arch/mips/loongson64/numa.c
>> > @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int n=
ode)
>> >   		/* Reserve pfn range 0~node[0]->node_start_pfn */
>> >   		memblock_reserve(0, PAGE_SIZE * start_pfn);
>> > +		/* set nid for reserved memory on node 0 */
>> > +		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
>> >   	}
>> >   }
>>=20
>> --=20
>> ---
>> Jiaxun Yang

--=20
- Jiaxun

