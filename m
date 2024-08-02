Return-Path: <linux-mips+bounces-4668-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7565945B4D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 11:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546951F22AED
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447F41D1F54;
	Fri,  2 Aug 2024 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mwmueyYt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GG2XEYP1"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B62256D;
	Fri,  2 Aug 2024 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591849; cv=none; b=h/OmBjYeBlnbiWdC2MkwzFlBfWRe3YOk9XgtgtjNl9OP1Vvlu6u3z09xDE8UGGlZPjLjOJM4i5F8z8n7KCfWOU5g8UWjcuQJSqhiyG7dDQd2ZDaH7RjxyChGxJrwxuu7wHDke3pcJX907IR8GvWxa5eHEMVPZ5USxKDBZ2IB/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591849; c=relaxed/simple;
	bh=E6PUPysLPIvvEguCB3o+Frxa86QTQZXRqViq1Akk17M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pt8qBmmvlmU8qgDmYOyei/mbrH9BfH+5RTEJxw/2DyJAH94g3Qx9yELwfUPU1KDgcKzwZglqQ7lsrCSElYfmeuhNGEjWFHQMCjoRPhQyjjNhKT/lwH4hqxyF9O1OAHskStsi5JrzLWEtIVuG5Jq/4xQOAZCO06KvOw0mjWzrr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mwmueyYt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GG2XEYP1; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 493C0138FC2E;
	Fri,  2 Aug 2024 05:44:06 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Fri, 02 Aug 2024 05:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1722591846;
	 x=1722678246; bh=6YYbM+hbo6Lixf7WFtKBaaOQauYlqYL6o2rvnYuPrCI=; b=
	mwmueyYtSSN20D0edXNVyFRulpQS9D0hQtOIh3FuEl0rm/ds9a/9Hunfw8txswi7
	zSQZh7dYPQJH+I2gSAqtYbdDk37cr3A68aL9W3oJpEBZVT73EnvMRZp40LzIJmbo
	Drrs46NnFfvCW1wR/18/3HqMUhTZgjt4W3aGMjBmufrNsJq00PMzHNWvyAHo1qgF
	5aK7TaiDeop53qPvhB8zJ7OtvRpGOpU8kOJFoLIHtiBPHhpo6G+plL1HGuWJeGI1
	sw7gRxwA567PBJz2ElJkEATML8EpGX4TZj/IZ3SALEukbBTuy9tEVpTxo0VXgr4P
	3fRmEe1EUKES9CpjqHV7rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722591846; x=
	1722678246; bh=6YYbM+hbo6Lixf7WFtKBaaOQauYlqYL6o2rvnYuPrCI=; b=G
	G2XEYP1buz5eZ53QZ4dD7ozQ3dL/vZJ+ZbLdpEz/xbvclYgXFS5vtebwO3xhJB5V
	VKbgWZXVxisFIjiCCybB98Ig56qPnzxVkt9S9Fjs/d52r3p2ZxK0/xfJJ3vsSl7F
	4cvBHz/rdNCqdyOwFCF3egkXGMOEefx5B66hnXeII0dN8uFAjBrvMwlt05JwTJyb
	Xh83SNHRu/KOM0YnDMxZpKtOH8ndciWSyOGRpkYdBlM3x3nkV3Bc/CKThvfIHI5o
	hKC3WcovzQNrkIJ5beyOnp1m7LNN6yCBjNxdyMFtQ+9V8VxGIUOazyu7EsGuYk4L
	1u8GI45Mp7eRcA/ipqaHg==
X-ME-Sender: <xms:ZaqsZkSy-C-rznqidSbEhopuSxBrrJ2KeEY6fd6A0yLsG2uALFz2KQ>
    <xme:ZaqsZhwbs3PnMz1f-MpGnA8iJGPxk7JCIVfpc5-5b4bKmMQh5Y9cyJ4sgNHUe8Ax8
    zsQohAv1sY_zhiQah0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffef
    keehheegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgt
    phhtthhopedt
X-ME-Proxy: <xmx:ZaqsZh0LzmoUSHUr-HZB3VMJLXa1VxKHRjFYkUxPyFD7jxm-e0RD5w>
    <xmx:ZaqsZoA1VkH8d4CPEx0chY0aKqqr37ydO7tx7u8HocJgS2VYGAPQwA>
    <xmx:ZaqsZtiLCdS6IP96FGn4y_mkIHRahmHzcVIzxw4FlfKApCCW_zVs2w>
    <xmx:ZaqsZko3u5fkponFC-l4JgEe-e3s6ayKaIzoHlnbwjP3-sF4j-ynNA>
    <xmx:ZqqsZmaq2q4YgBtvtCZsVFTUFawTXXPfn-4Cg7c77kXrJv8IePTsM19s>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B750619C0069; Fri,  2 Aug 2024 05:44:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 17:43:45 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Kelvin Cheung" <keguang.zhang@gmail.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <8d875eb0-d236-46f3-a417-08bff3c0087d@app.fastmail.com>
In-Reply-To: 
 <6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k>
References: <6szkkqxpsw26zajwysdrwplpjvhl5abpnmxgu2xuj3dkzjnvsf@4daqrz4mf44k>
Subject: Re: [RFC] MIPS: smp: Sleeping func called from start_secondary()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=882=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=884:45=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
> Hi folks,
>
> To debug some another problem I recently enabled the
> CONFIG_DEBUG_ATOMIC_SLEEP config for my SoC based on the 2xP5600 cores
> with MIPS GIC as IRQ-controller. That caused the next BUG backtrace
> started being printed to the system log during the device boot-up:

Hi Serge,

Thanks for reporting the problem!

I actually have a patch lying around somewhere to convert cevt-r4k to us=
e CPUHP
interface and avoid requesting interrupt on secondary CPUs.

Will post after getting more platform tests.

Thanks
- Jiaxun

>
> [    0.118053] BUG: sleeping function called from invalid context at=20
> kernel/locking/mutex.c:283
> [    0.118062] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:=20
> 0, name: swapper/1
> [    0.118069] preempt_count: 1, expected: 0
> [    0.118074] RCU nest depth: 0, expected: 0
> [    0.118078] Preemption disabled at:
> [    0.118082] [<80105040>] arch_dup_task_struct+0x20/0x118
> [    0.118116] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted=20
> 6.11.0-rc1-bt1-00312-gca6f9469050c-dirty #2460
> [    0.118134] Stack : 816d0000 801b89bc 81870000 00000004 a02d0c08=20
> 00000000 84ae7dcc 801b84c0
> [    0.118167]         00000000 00000002 00000000 00000000 00000000=20
> 00000001 84ae7d70 84aaf200
> [    0.118195]         00000000 00000000 81115acc 00000000 00000059=20
> 84ae7bec 00000000 00000000
> [    0.118222]         00000000 ffffffff ffffffea 00000020 816d0000=20
> 00000000 81115acc 00000002
> [    0.118250]         00000000 04240021 a02d0c08 00000000 00000000=20
> 00000000 30400000 ac24242a
> [    0.118277]         ...
> [    0.118286] Call Trace:
> [    0.118289] [<8010af2c>] show_stack+0x88/0x120
> [    0.118309] [<80f09dfc>] dump_stack_lvl+0x78/0xb0
> [    0.118323] [<801778d0>] __might_resched+0x190/0x1f0
> [    0.118349] [<80f10f80>] mutex_lock+0x20/0x74
> [    0.118365] [<801c8590>] irq_create_mapping_affinity+0x48/0x104
> [    0.118390] [<801121ec>] r4k_clockevent_init+0x58/0x38c
> [    0.118402] [<80116658>] start_secondary+0x34/0x134
> [    0.118411] [<80f0b1e4>] smp_bootstrap+0x68/0x98
> [    0.118424]=20
>
> I managed to investigate the problem a bit and the reason turned out t=
o be
> in the irq_create_mapping() method eventually invoked in the framework=
 of the
> secondary CPU start-up procedure. The more detailed calls chain is:
> start_secondary()
> +-> mips_clockevent_init()
>     +-> r4k_clockevent_init()
>         +-> get_c0_compare_int()
>             +-> gic_get_c0_compare_int()
>                 +-> irq_create_mapping()
>                     +-> irq_create_mapping_affinity()
>                         +-> mutex_lock()
>                             +-> might_sleep()
>                                 +-> might_resched()
>                                     +-> __might_resched()
>                                         +-> Print the log above
>
> I currently lack of free time for further investigation in an attempt =
to
> find a reasonable solution. So here is just a report and a short summa=
ry
> of the problem. Should you have any idea of how to fix the problem I'l=
l be
> very glad to test it out on a short notice.
>
> -Serge(y)

--=20
- Jiaxun

