Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65217B121
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbfG3SDF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 14:03:05 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:48030 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387722AbfG3SDF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 14:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564509783; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xx9v2bvdhkwqBeJF1UPfxb804gp20xzTw1fS+vRh8dQ=;
        b=gQug1WvVy6t6iHG5FWnzCIrJFs1D2WI0sR9kTMAiotBbnsjN+3Re1/1OLwdW7vZNWHlLAI
        kk8eaMt+FNAFQWdYThZzKvnkL+BSDf4jr2BJE39/YyQWN9vvs9i1Ku3CQbEXZw+XSpj7p6
        a0pcPgJUI3usTor5MYhBYkyv13uXlls=
Date:   Tue, 30 Jul 2019 14:02:47 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: Ingenic: Fix bugs when detecting X1000's
 parameters.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
Message-Id: <1564509767.15799.0@crapouillou.net>
In-Reply-To: <1564498510-3751-2-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
        <1564498510-3751-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,



Le mar. 30 juil. 2019 =E0 10:55, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> 1.fix bugs when detecting L2 cache sets value.
> 2.fix bugs when detecting L2 cache ways value.
> 3.fix bugs when calculate bogoMips and loops_per_jiffy.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/kernel/cpu-probe.c |  7 ++++++-
>  arch/mips/mm/sc-mips.c       | 18 +++++++++++++++---
>  2 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/mips/kernel/cpu-probe.c=20
> b/arch/mips/kernel/cpu-probe.c
> index eb527a1..a914435 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1960,11 +1960,16 @@ static inline void cpu_probe_ingenic(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  	c->options &=3D ~MIPS_CPU_COUNTER;
>  	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
>  	switch (c->processor_id & PRID_IMP_MASK) {
> -	case PRID_IMP_XBURST:
> +	case PRID_IMP_XBURST: {
> +		unsigned int config7;
>  		c->cputype =3D CPU_XBURST;
>  		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>  		__cpu_name[cpu] =3D "Ingenic XBurst";
> +		config7 =3D read_c0_config7();
> +		config7 |=3D (1 << 4);
> +		write_c0_config7(config7);

If you add __BUILD_SET_C0(config7) in arch/mips/include/asm/mipsregs.h
(search for this macro) then you can call directly=20
set_c0_config7(BIT(4)).

It's preferred to use the BIT(x) macro instead of the (1 << x)=20
construct.

Finally, what does that bit do? I can't find it any documentation about
it. Please add a comment describing what it does.


>  		break;
> +	}
>  	default:
>  		panic("Unknown Ingenic Processor ID!");
>  		break;
> diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
> index 9385ddb..ed953d4 100644
> --- a/arch/mips/mm/sc-mips.c
> +++ b/arch/mips/mm/sc-mips.c
> @@ -215,6 +215,14 @@ static inline int __init mips_sc_probe(void)
>  	else
>  		return 0;
>=20
> +	/*
> +	 * According to config2 it would be 512-sets, but that is=20
> contradicted
> +	 * by all documentation.
> +	 */
> +	if (current_cpu_type() =3D=3D CPU_XBURST &&
> +				mips_machtype =3D=3D MACH_INGENIC_X1000)
> +		c->scache.sets =3D 256;
> +
>  	tmp =3D (config2 >> 0) & 0x0f;
>  	if (tmp <=3D 7)
>  		c->scache.ways =3D tmp + 1;
> @@ -225,9 +233,13 @@ static inline int __init mips_sc_probe(void)
>  	 * According to config2 it would be 5-ways, but that is contradicted
>  	 * by all documentation.
>  	 */
> -	if (current_cpu_type() =3D=3D CPU_XBURST &&
> -				mips_machtype =3D=3D MACH_INGENIC_JZ4770)
> -		c->scache.ways =3D 4;
> +	if (current_cpu_type() =3D=3D CPU_XBURST) {
> +		switch (mips_machtype) {
> +		case MACH_INGENIC_JZ4770:
> +		case MACH_INGENIC_X1000:
> +			c->scache.ways =3D 4;
> +		}
> +	}
>=20
>  	c->scache.waysize =3D c->scache.sets * c->scache.linesz;
>  	c->scache.waybit =3D __ffs(c->scache.waysize);
> --
> 2.7.4
>=20
>=20

=

