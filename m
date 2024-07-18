Return-Path: <linux-mips+bounces-4371-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BC9348FA
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2024 09:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9A32842D6
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2024 07:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDE274058;
	Thu, 18 Jul 2024 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="cKoR0Q5q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qOcJ8VT/"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CAB55886;
	Thu, 18 Jul 2024 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288094; cv=none; b=DX+qOtmA6k2EL/KU1yYJ74MK5LWymem5eJQNXXJy5ykHan7oINyWAsQmRRfyCNuwsQf5AXpc/p/bNmuF5F0CGcNMrq+lhFndX8K43NxjTETHh2vvVm8J7rimWwttmTYrNJlk16ODIeh3Pts3+mAkiOuK1YhkdxTu5oupIpwWJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288094; c=relaxed/simple;
	bh=JVkht1qZnDP6g6HGVT2/BKn0/OqsW09NZSc/8nVhE/8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=QeRN/nalnKvf2nZ9j5LGsk/BnP4/qwerVZ8F55Drh78c1zS02tN7aBukBfvUviUXivWnGuC2M4mkFwQ1qfW61kEeJE/+qCl4r7sUkWk2AOfNa57MljpoXeDb90utsd8/ZknF5pBBVx24N0AVhC2/JKEwq0x8tIDjbnT/Ly4Bm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=cKoR0Q5q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qOcJ8VT/; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id CFBC913802C9;
	Thu, 18 Jul 2024 03:34:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute1.internal (MEProxy); Thu, 18 Jul 2024 03:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1721288091;
	 x=1721374491; bh=FJF+1LemGg91SooO0HjNNjauHiI7Fh3BqdTtr1TiD3o=; b=
	cKoR0Q5qunqzFDWh8FOnLL3NBAMpgH2vzXhi65Ey9tqsPeCoZZ7NTCG3oIgaCH4i
	xeR0vFb5m8m8JZcVP26Y7C+irapT1hnUdfnrwNtQpMp+pD0/wMNLnZRVFnBWECgR
	+8Mg25LiHc92N3pwTIVb0Wqu/nbrcSvabK6QFa6YMFxmNSS29Q+iXDQmEnF+LQR1
	TjtoThwr86ztgjFaiDnG5cyHXkz1xifrWSNPEXZxGaO9YRPVlvKGzPXHqkYzC2XM
	nQLQCLTo5g/6eZfKtMJF0u0tFfiB+HUi7URtPCHMDMZUrRU/I17+7wfw+3lEY8lA
	Jj8a6haTim0ls4vA1MrBLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721288091; x=
	1721374491; bh=FJF+1LemGg91SooO0HjNNjauHiI7Fh3BqdTtr1TiD3o=; b=q
	OcJ8VT/+7WL5YcldfPq42DcqDiwksCfnSpt7uhZ7CLAl5xUlaUyB0g73ZtXjtCgE
	G8S50Jk75ajf9BnBOlwYigjSvYTVnAN6zCFKMqjKHSlkph0t1xjoDIZ5GeOtsC0c
	4aqqHxiuYwhu/65tQ35t+zCCz+h2rSe9y9g380vYuhcP1jR+yNKQeZRJrCm1x1DS
	XPgatu7qu2RnwwXj0ZTzPobHQ0IRxuwlQ7lFwX64GeH3JHXtjHZvF0nA+nTt2gBG
	McPL5w/vqTIFMNS3R1x/2bg0tiI291N707xWkvS1S5rlEEg5l2wk7WE+Nv9HNCLx
	da4KtV3KmlBEACxf/P2Og==
X-ME-Sender: <xms:msWYZl7t7JtZytLhJJBKKNDwQDuFshRFcZz21-MHF1PuiiY1lUtRxw>
    <xme:msWYZi6hwd8pmGbjYYeVAa6RJbpsAf0M47tS2fFW8yYeRYwSnhPSVH_Mt6oqwavn3
    9LKF8Xjq4fhss762q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeekgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:msWYZsdMCa5F1_uuIKKyei-0jpUnZVnLiPX4nyzbePfWUd-qgowJ7w>
    <xmx:msWYZuLmRxPCIqxRrk_mLV3nz5h-nskJTqd8mI_yj05eO-fvmsb0Cg>
    <xmx:msWYZpIeqN-_J6cv4hbZnVVnvbBfeEDEGC5z-biLLAF3YyuK-45_yQ>
    <xmx:msWYZnzMipEdgqp0SfxX6kXu5BhvM9_KHUNsx2buRVKkobtzsPUoUw>
    <xmx:m8WYZp3FeW_Sy3NFp5HM7BP0M0VhF3QKWYNUWfQKI_LVgfArZzlYUxAz>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 353EC36A0074; Thu, 18 Jul 2024 03:34:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e68b7f44-8a3c-4963-8d95-be8747bf9a61@app.fastmail.com>
In-Reply-To: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
Date: Thu, 18 Jul 2024 15:34:30 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8814=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:41=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Nowadays SYNC_R4K is performing better than Loongson64's
> custom sync mechanism.
>
> Switch to SYNC_R4K to improve performance and reduce code
> duplication.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Last minute for 6.11 :-)

Hi Thomas,

Could you please apply this to 6.11 PR, or 6.11 fixes?

This is technically a left over of previous clock source series, and it =
does help
on preventing random RCU stall for multi-node Loongson-3 systems.

Thanks
- Jiaxun

> ---
>  arch/mips/Kconfig           |  1 +
>  arch/mips/include/asm/smp.h |  1 -
>  arch/mips/loongson64/smp.c  | 35 ++---------------------------------
>  3 files changed, 3 insertions(+), 34 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 1236ea122061..e163059dd4d3 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -478,6 +478,7 @@ config MACH_LOONGSON64
>  	select BOARD_SCACHE
>  	select CSRC_R4K
>  	select CEVT_R4K
> +	select SYNC_R4K
>  	select FORCE_PCI
>  	select ISA
>  	select I8259
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index bc2c240f414b..2427d76f953f 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -50,7 +50,6 @@ extern int __cpu_logical_map[NR_CPUS];
>  #define SMP_CALL_FUNCTION	0x2
>  /* Octeon - Tell another core to flush its icache */
>  #define SMP_ICACHE_FLUSH	0x4
> -#define SMP_ASK_C0COUNT		0x8
>=20
>  /* Mask of CPUs which are currently definitely operating coherently */
>  extern cpumask_t cpu_coherent_mask;
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 66d049cdcf14..147acd972a07 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -33,7 +33,6 @@ static void __iomem *ipi_clear0_regs[16];
>  static void __iomem *ipi_status0_regs[16];
>  static void __iomem *ipi_en0_regs[16];
>  static void __iomem *ipi_mailbox_buf[16];
> -static uint32_t core0_c0count[NR_CPUS];
>=20
>  static u32 (*ipi_read_clear)(int cpu);
>  static void (*ipi_write_action)(int cpu, u32 action);
> @@ -382,11 +381,10 @@ loongson3_send_ipi_mask(const struct cpumask=20
> *mask, unsigned int action)
>  		ipi_write_action(cpu_logical_map(i), (u32)action);
>  }
>=20
> -
>  static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
>  {
> -	int i, cpu =3D smp_processor_id();
> -	unsigned int action, c0count;
> +	int cpu =3D smp_processor_id();
> +	unsigned int action;
>=20
>  	action =3D ipi_read_clear(cpu);
>=20
> @@ -399,26 +397,14 @@ static irqreturn_t loongson3_ipi_interrupt(int=20
> irq, void *dev_id)
>  		irq_exit();
>  	}
>=20
> -	if (action & SMP_ASK_C0COUNT) {
> -		BUG_ON(cpu !=3D 0);
> -		c0count =3D read_c0_count();
> -		c0count =3D c0count ? c0count : 1;
> -		for (i =3D 1; i < nr_cpu_ids; i++)
> -			core0_c0count[i] =3D c0count;
> -		nudge_writes(); /* Let others see the result ASAP */
> -	}
> -
>  	return IRQ_HANDLED;
>  }
>=20
> -#define MAX_LOOPS 800
>  /*
>   * SMP init and finish on secondary CPUs
>   */
>  static void loongson3_init_secondary(void)
>  {
> -	int i;
> -	uint32_t initcount;
>  	unsigned int cpu =3D smp_processor_id();
>  	unsigned int imask =3D STATUSF_IP7 | STATUSF_IP6 |
>  			     STATUSF_IP3 | STATUSF_IP2;
> @@ -432,23 +418,6 @@ static void loongson3_init_secondary(void)
>  		     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package);
>  	cpu_data[cpu].package =3D
>  		cpu_logical_map(cpu) / loongson_sysconf.cores_per_package;
> -
> -	i =3D 0;
> -	core0_c0count[cpu] =3D 0;
> -	loongson3_send_ipi_single(0, SMP_ASK_C0COUNT);
> -	while (!core0_c0count[cpu]) {
> -		i++;
> -		cpu_relax();
> -	}
> -
> -	if (i > MAX_LOOPS)
> -		i =3D MAX_LOOPS;
> -	if (cpu_data[cpu].package)
> -		initcount =3D core0_c0count[cpu] + i;
> -	else /* Local access is faster for loops */
> -		initcount =3D core0_c0count[cpu] + i/2;
> -
> -	write_c0_count(initcount);
>  }
>=20
>  static void loongson3_smp_finish(void)
>
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240714-loongson64-cevt-r4k-eb74d4ad984c
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

