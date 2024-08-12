Return-Path: <linux-mips+bounces-4860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01C94EC1A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 13:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C381F22630
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 11:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FBC17995B;
	Mon, 12 Aug 2024 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aU0CuDXX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EOh3JZi3"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A3178387;
	Mon, 12 Aug 2024 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463432; cv=none; b=Ikk8Hg/L7vwL0oNjzGyI/6aPrfCaoBnOuMuaXKimS55+pVAmbu8NTDgZKcKSpswsMTE5whSdfGXfTL+ZKPCNcbnTRMUobG43UtMs8i/X08OyaLY3Mu/esySoc0BIu0qWkFGfe2uqAR3ILqSW3b1nSQRrc1HVhCrkT23mGlaqdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463432; c=relaxed/simple;
	bh=Sf9vrU9Uopkb5XY1U1x57/msh+c/P44Y/DKqhKtj6Cw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T17yJ4Vz3LzTKcyOyfas0LmcWcrZ6QcCHLOS3d0UccoBbkucULhiGKm3Zm07Nv55iC0sQTxZCgCoxDiyqwsrWq0WoEQg3T/1DIj2YLsf3X+zmkedmUjPMDtV9uFf2Pcer5rwLndab43Ec6LoarruNActfI9xt8uj4HvIolb78AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aU0CuDXX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EOh3JZi3; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 94382138FCC6;
	Mon, 12 Aug 2024 07:50:28 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Mon, 12 Aug 2024 07:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723463428;
	 x=1723549828; bh=SMZ3gJ+tqxtINCi1Pl0/NWqgm/TSqtQaQQAterG233E=; b=
	aU0CuDXX+tYk+wQ1jfxfFUZYfyAKFG3lwHQaTD2m2HT9haXT9dT0ru62CX9YU9E3
	ICrFkSCv/DvYurde4fV5GGaFNkSYkxqOj+manXKWAxIgzH9Z96/gLnCd2q5w1BF+
	pb29SGqdtqlQRaVYBAm9jByosMmNjVjVb3FKVlhU0PWKqruk6Njm/b/rOEXUzMU+
	FAQn3D/DwEMNgZ1aKusEePVVFGT3rTRGNfA+HQo0qHKxN8UHoaY5fX9DKmPpcByX
	P+6Gj78qvcizoxsKhsa6hqxZhKzmjpiFAJQQgrKbcob1n9GGGvAUoes71botUvc+
	6zMJ1ZwnE5EHC82GqgnhTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723463428; x=
	1723549828; bh=SMZ3gJ+tqxtINCi1Pl0/NWqgm/TSqtQaQQAterG233E=; b=E
	Oh3JZi3NEsYBqpSJaBxaeHBjr3b7SotIWXg/dy+/9A3ia5+JuNFZe4tZnbJKdlKE
	kcrrZVE7Fo6aUyyYMtcwTThY8cNcoh54m0teXcC+Fh1kWB7GEpSUL4yd78n17S23
	n9ouJLEVdQCQ5Jy4FWESmQ0D5HpRgVpF7DAErxR3C2+Ue6GOkQve4tg52FGpeOur
	Tk7QWumrH78qH3za6haoMg+CKNCjSao135NBOUd6BwEO4uy00XkInAd/UbSBVBvW
	mrsXD+E+38bkOcCkEFHC/DjA4MEXVjnViETMw+8SC/HIuQpCvx1OnpLY45oOJ2E6
	DQ6+OSDfWgBjMTdBxvQEg==
X-ME-Sender: <xms:A_e5Zn9C2bfBDH-lShLgd62KalyMcgDxhwburmJuun2Xk7x5bLVg3g>
    <xme:A_e5ZjuGSTAvSdiWVMny1g5ViJFlVP8wkE3qV_xO8wDfzAqMPwlU2JwxUpeMqg2UT
    LCjsEXMlh0mXdZg1FE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddttddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmh
    gvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopehfrghntggvrhdrlhgrnhgtvghrsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepkhgvghhurghnghdriihhrghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprghkphhm
    sehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:BPe5ZlCBq306_0dgS_Buj8KxjHcEAQTuSVG3ib1Sul6bOJprntZDjg>
    <xmx:BPe5Zjdb13LUvHUSbfarV0FSRDJIKvPuR7gKZ8g6mYatUqdxiqNtyA>
    <xmx:BPe5ZsMEnWY2zTYg8JpYRKqapGEKX4GkGQmQw2Qz1HM0ZmnvITjI-Q>
    <xmx:BPe5ZlnVzMHhH5MLOBV69lTbC8OaihxlmwauO0J6TwhWkHB7gPVOtw>
    <xmx:BPe5ZonPCirCX8PFSCtqLOQEMrsyMqL_jFuxHEvuXe5HGZ12Ozf4CA2w>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E618619C0089; Mon, 12 Aug 2024 07:50:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 Aug 2024 12:50:07 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Arnd Bergmann" <arnd@arndb.de>,
 "Kelvin Cheung" <keguang.zhang@gmail.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <01050429-94e8-4576-a51b-11b11cb8a562@app.fastmail.com>
In-Reply-To: 
 <utfmb7mxm6emxditrq7fwalatnhszzcztu4gnqs5mf44umvfwa@k4i7gamaj5mw>
References: <6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k>
 <8d875eb0-d236-46f3-a417-08bff3c0087d@app.fastmail.com>
 <utfmb7mxm6emxditrq7fwalatnhszzcztu4gnqs5mf44umvfwa@k4i7gamaj5mw>
Subject: Re: [RFC] MIPS: smp: Sleeping func called from start_secondary()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=882=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:53=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
> Hi Jiaxun
>
> On Fri, Aug 02, 2024 at 05:43:45PM +0800, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B48=E6=9C=882=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=
=E5=8D=884:45=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
>> > Hi folks,
>> >
>> > To debug some another problem I recently enabled the
>> > CONFIG_DEBUG_ATOMIC_SLEEP config for my SoC based on the 2xP5600 co=
res
>> > with MIPS GIC as IRQ-controller. That caused the next BUG backtrace
>> > started being printed to the system log during the device boot-up:
>>=20
>> Hi Serge,
>>=20
>> Thanks for reporting the problem!
>>=20
>> I actually have a patch lying around somewhere to convert cevt-r4k to=
 use CPUHP
>> interface and avoid requesting interrupt on secondary CPUs.
>>=20
>> Will post after getting more platform tests.
>
> Great! Thanks. I'll test it out upon submission.
>
> * Although I doubt that such (presumably) complicated change might be
> considered as a backportable fix. But at least it shall fix the proble=
m for the
> mainline kernel.

It's actually harder than I expected, as managing it with percpu interru=
pt API would
break system sharing PCI with TI.

Maybe we need to come up a driver handle IRQ MUX.

Avoid calling get_c0_compare_int on secondary CPU init is easy, will pos=
t a patch.

Thanks

>
> Thanks,
> -Serge(y)
>
>>=20
>> Thanks
>> - Jiaxun
>>=20
>> >
>> > [    0.118053] BUG: sleeping function called from invalid context a=
t=20
>> > kernel/locking/mutex.c:283
>> > [    0.118062] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pi=
d:=20
>> > 0, name: swapper/1
>> > [    0.118069] preempt_count: 1, expected: 0
>> > [    0.118074] RCU nest depth: 0, expected: 0
>> > [    0.118078] Preemption disabled at:
>> > [    0.118082] [<80105040>] arch_dup_task_struct+0x20/0x118
>> > [    0.118116] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted=20
>> > 6.11.0-rc1-bt1-00312-gca6f9469050c-dirty #2460
>> > [    0.118134] Stack : 816d0000 801b89bc 81870000 00000004 a02d0c08=20
>> > 00000000 84ae7dcc 801b84c0
>> > [    0.118167]         00000000 00000002 00000000 00000000 00000000=20
>> > 00000001 84ae7d70 84aaf200
>> > [    0.118195]         00000000 00000000 81115acc 00000000 00000059=20
>> > 84ae7bec 00000000 00000000
>> > [    0.118222]         00000000 ffffffff ffffffea 00000020 816d0000=20
>> > 00000000 81115acc 00000002
>> > [    0.118250]         00000000 04240021 a02d0c08 00000000 00000000=20
>> > 00000000 30400000 ac24242a
>> > [    0.118277]         ...
>> > [    0.118286] Call Trace:
>> > [    0.118289] [<8010af2c>] show_stack+0x88/0x120
>> > [    0.118309] [<80f09dfc>] dump_stack_lvl+0x78/0xb0
>> > [    0.118323] [<801778d0>] __might_resched+0x190/0x1f0
>> > [    0.118349] [<80f10f80>] mutex_lock+0x20/0x74
>> > [    0.118365] [<801c8590>] irq_create_mapping_affinity+0x48/0x104
>> > [    0.118390] [<801121ec>] r4k_clockevent_init+0x58/0x38c
>> > [    0.118402] [<80116658>] start_secondary+0x34/0x134
>> > [    0.118411] [<80f0b1e4>] smp_bootstrap+0x68/0x98
>> > [    0.118424]=20
>> >
>> > I managed to investigate the problem a bit and the reason turned ou=
t to be
>> > in the irq_create_mapping() method eventually invoked in the framew=
ork of the
>> > secondary CPU start-up procedure. The more detailed calls chain is:
>> > start_secondary()
>> > +-> mips_clockevent_init()
>> >     +-> r4k_clockevent_init()
>> >         +-> get_c0_compare_int()
>> >             +-> gic_get_c0_compare_int()
>> >                 +-> irq_create_mapping()
>> >                     +-> irq_create_mapping_affinity()
>> >                         +-> mutex_lock()
>> >                             +-> might_sleep()
>> >                                 +-> might_resched()
>> >                                     +-> __might_resched()
>> >                                         +-> Print the log above
>> >
>> > I currently lack of free time for further investigation in an attem=
pt to
>> > find a reasonable solution. So here is just a report and a short su=
mmary
>> > of the problem. Should you have any idea of how to fix the problem =
I'll be
>> > very glad to test it out on a short notice.
>> >
>> > -Serge(y)
>>=20
>> --=20
>> - Jiaxun

--=20
- Jiaxun

