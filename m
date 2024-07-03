Return-Path: <linux-mips+bounces-4102-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FEA925585
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 10:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80C11F22625
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 08:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD9413AD16;
	Wed,  3 Jul 2024 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="dtd5+O6h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mA6IRps7"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow6-smtp.messagingengine.com (flow6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961413AA3B;
	Wed,  3 Jul 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995902; cv=none; b=e7yQBVLjLleuIGN0Hhn7/+54IzcS34r4I1u/fy8t2VqW3aI62KK2Azu6DV7XytaWEddA6XiK+HldRKRONGiDU/1KPgO/CBjTM6nYjW6Rnw8n12m4kNgYB4BUBDeJp1CnLhzvKR8aYCxN9hVGWqzZeAXlf0xQQGHm3ZhLPGki9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995902; c=relaxed/simple;
	bh=kEN36qs/hN/7g4ogG6sR5ZwQmmdGHlhVIyQnF3GlXTg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=d4dOzLw4PhtJ91gcFfCzyXQ/Wx2gIXqJgIj/WZHmNORMAGfDcLiqTSDeYrAnxue+12PEA5TFSZTYUwrTBk6VvRx6dcKE6DVRoayX8qYbd5bJ/2Gb3QBhjnox3wgaMnMnRLAqFRc5TB36aLdb9vygddQznsI8NhUDMTEy14IcZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=dtd5+O6h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mA6IRps7; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 6371F200419;
	Wed,  3 Jul 2024 04:38:19 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 04:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719995899;
	 x=1720003099; bh=qrzUNwDDig8PtPt/24+oUO+QBT7a2qMALdmnmgk36jw=; b=
	dtd5+O6hcUBXunGBgnD1/LHF+StS2fcf4jGJkdVOeBXe6gCrSyJ5wjuGO8vD+xnm
	O0rGtJJE456g5NnUWWjzzX3oX8lXUIorA0ySEGizJAGNPfC23FLa57HUj6Jc9yXD
	MdrRYJwgEHNUruJfqLv6GNLWvINxVwQlwptOD5alJcEeUrBcYtXWS5lioXBxj7YD
	D4eZ4KC2TVNq9EuPJ9BCW+7IzSP+IP5md4LM4/dVVGCkJeTxB2yWFahAB/wAENtI
	J0apcGJibNEJy4yR3U36156z71B70FCOOMxcYGQOcUYZBhyAfLyOn6pL7KT995gN
	QAMiVNUvM1GJKITT2z5dbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
	1719995899; x=1720003099; bh=qrzUNwDDig8PtPt/24+oUO+QBT7a2qMALdm
	nmgk36jw=; b=mA6IRps7n/QbXGdFcxVi/7dLgy3eG83rMtuPiJLOGQFumNNvWwz
	lV95cxJXwJUim5VRwXVIk9buDsAqetoYmrE/bN0/WiEPwdato/4pb1dwBv9U4aeK
	6PcRfv3EsyRGbu+va2s3Zdod6g1/ouMWPscrMH2Z/MHEZ1J8VF+R5lvmo1bmJVUs
	ucRSvO+cyviSBLWwJzfzvWVosJr+2O93biAMqaUPxSl7O4mxw8CMbp57DrNHLHW0
	DODL6W9DPlLZWd+K+xHddYFck9+zILi2eU/tosTv46Mm7EYYA2atXCtWVxWWtJt6
	vk15w1+bzBCDw/j2sPobNFUq3i+89sw923g==
X-ME-Sender: <xms:-w2FZj_YrNVAqcUHORipSHGeQ_LOYf7vefE2fh4aD5mlBv0eTRpXtw>
    <xme:-w2FZvvI6ogfD41lDBN73E-4y6ueoZXqHogljm7lvxnqmerI8WcpdWcaQTngMgN3-
    T_MdSkanYA-XlL0Uuk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:-w2FZhBtTSXdbjqlo-EqZGixlhgvI-Z4PmjNuNWSXydz3zS6m5TWbQ>
    <xmx:-w2FZvc7lyGbefh0tdcV6xlSwAL23jMaSKrhbAymmaf8cFjTDFlD_Q>
    <xmx:-w2FZoM2POOZZ-HvTk05iHLAP-OLeCC5AGD0G2eAHJPQ31gUTSZvxg>
    <xmx:-w2FZhmERzXtfIUlKmGVL96tziP4Sh5dpua0Wp0MtCbsUUm7CwnKDw>
    <xmx:-w2FZitGy9eRWM-3DxmUErbsb_SkpLfY2Vlu0pZwoo4Oi46pkegPUKGG>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 381AA36A0074; Wed,  3 Jul 2024 04:38:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <55bab585-6a3b-43c0-98da-0b325687e61f@app.fastmail.com>
In-Reply-To: 
 <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
Date: Wed, 03 Jul 2024 16:37:58 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] MIPS: IPI Improvements
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8817=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=885:03=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This series improved general handling to MIPS IPI interrupts, made
> IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
> users on mux.

Ping :-)

>
> It is a prerequisite for enabling IRQ_WORK for MIPS.
>
> It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,
> Cavium CN7130 (EdgeRouter 4), and an unannounced interaptiv UP MT
> platform with EIC.
>
> I don't really know broadcom platforms and SGI platforms well so
> changes to those platforms are kept minimal (no functional change).
>
> Please review.
> Thanks
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Jiaxun Yang (10):
>       MIPS: smp: Make IPI interrupts scalable
>       MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
>       MIPS: smp: Provide platform IPI virq & domain hooks
>       MIPS: Move mips_smp_ipi_init call after prepare_cpus
>       MIPS: smp: Implement IPI stats
>       irqchip: irq-mips-gic: Switch to ipi_mux
>       MIPS: Implement get_mips_sw_int hook
>       MIPS: GIC: Implement get_sw_int hook
>       irqchip: irq-mips-cpu: Rework software IRQ handling flow
>       MIPS: smp-mt: Rework IPI functions
>
>  arch/mips/Kconfig                |   2 +
>  arch/mips/cavium-octeon/smp.c    | 109 +++++++-------------
>  arch/mips/generic/irq.c          |  15 +++
>  arch/mips/include/asm/ipi.h      |  71 +++++++++++++
>  arch/mips/include/asm/irq.h      |   1 +
>  arch/mips/include/asm/irq_cpu.h  |   3 +
>  arch/mips/include/asm/mips-gic.h |  10 ++
>  arch/mips/include/asm/smp-ops.h  |   8 +-
>  arch/mips/include/asm/smp.h      |  42 +++-----
>  arch/mips/kernel/irq.c           |  21 ++++
>  arch/mips/kernel/smp-bmips.c     |  43 ++++----
>  arch/mips/kernel/smp-cps.c       |   1 +
>  arch/mips/kernel/smp-mt.c        |  70 +++++++++++++
>  arch/mips/kernel/smp.c           | 216 ++++++++++++++++++++++++------=
---------
>  arch/mips/loongson64/smp.c       |  51 ++++-----
>  arch/mips/mm/c-octeon.c          |   2 +-
>  arch/mips/sgi-ip27/ip27-smp.c    |  15 +--
>  arch/mips/sgi-ip30/ip30-smp.c    |  15 +--
>  arch/mips/sibyte/bcm1480/smp.c   |  19 ++--
>  arch/mips/sibyte/sb1250/smp.c    |  13 +--
>  drivers/irqchip/Kconfig          |   2 +-
>  drivers/irqchip/irq-mips-cpu.c   | 180 +++++++++---------------------=
--
>  drivers/irqchip/irq-mips-gic.c   | 213 ++++++++++++++----------------=
--------
>  23 files changed, 594 insertions(+), 528 deletions(-)
> ---
> base-commit: a2a47d53ca1f74f60931487c27eeba3c17fb69c9
> change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

