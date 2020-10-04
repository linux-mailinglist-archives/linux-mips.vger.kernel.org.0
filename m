Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE550282D91
	for <lists+linux-mips@lfdr.de>; Sun,  4 Oct 2020 22:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgJDUuK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Oct 2020 16:50:10 -0400
Received: from crapouillou.net ([89.234.176.41]:45496 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgJDUuJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 4 Oct 2020 16:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601844607; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CWn9LPqMiEyecOu8vR9hPIcK4K0WPOW8o5AJFCYfgNk=;
        b=aAeoOJjgXIpRApHMMlIHb6iwd/oghKo9HQkOAfRD8GGrbkRSvtPQ6/c72P37bMneUAod5s
        2PosfE/4Tp/8xK3racxDW/cnH+lV9XfcL/akTWhIl0KdfFYmCu0AJ9b6wXmtxW+2CHihE7
        9wUDYRfvjlM8LIW5HA7WrSEssVfs6p0=
Date:   Sun, 04 Oct 2020 22:49:55 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: cevt-r4k: Enable intimer for Loongson64 CPUs with
 extimer
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Paul Burton <paulburton@kernel.org>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Message-Id: <773PHQ.F1MX5ZDA2SEE@crapouillou.net>
In-Reply-To: <20200923110301.58125-1-jiaxun.yang@flygoat.com>
References: <20200923110301.58125-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mer. 23 sept. 2020 =E0 19:02, Jiaxun Yang <jiaxun.yang@flygoat.com> a=20
=E9crit :
> Loongson64C and Loongson64G have extimer feature, which is a
> timer sharing Cause.TI with cevt-r4k (named intimer).
>=20
> To ensure the cevt-r4k's usability, we need to add a callback for
> clock device to switch intimer.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/cpu-features.h |  4 ++++
>  arch/mips/include/asm/cpu.h          |  1 +
>  arch/mips/kernel/cevt-r4k.c          | 25 +++++++++++++++++++++++++
>  arch/mips/kernel/cpu-probe.c         |  6 +++++-
>  4 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/include/asm/cpu-features.h=20
> b/arch/mips/include/asm/cpu-features.h
> index 78cf7e300f12..aec458eee2a5 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -576,6 +576,10 @@
>  # define cpu_has_gsexcex	__opt(MIPS_CPU_GSEXCEX)
>  #endif
>=20
> +#ifndef cpu_has_extimer
> +# define cpu_has_extimer	__opt(MIPS_CPU_EXTIMER)
> +#endif
> +
>  #ifdef CONFIG_SMP
>  /*
>   * Some systems share FTLB RAMs between threads within a core=20
> (siblings in
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 388a82f28a87..854e1b44254b 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -429,6 +429,7 @@ enum cpu_type_enum {
>  #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support=20
> MAC2008 Fused multiply-add instruction */
>  #define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity=20
> exception */
>  #define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
> +#define MIPS_CPU_EXTIMER	BIT_ULL(63)	/* CPU has External Timer=20
> (Loongson) */
>=20
>  /*
>   * CPU ASE encodings
> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> index 995ad9e69ded..fae49e9215b4 100644
> --- a/arch/mips/kernel/cevt-r4k.c
> +++ b/arch/mips/kernel/cevt-r4k.c
> @@ -15,6 +15,8 @@
>=20
>  #include <asm/time.h>
>  #include <asm/cevt-r4k.h>
> +#include <asm/cpu-features.h>
> +#include <asm/mipsregs.h>
>=20
>  static int mips_next_event(unsigned long delta,
>  			   struct clock_event_device *evt)
> @@ -294,6 +296,24 @@ core_initcall(r4k_register_cpufreq_notifier);
>=20
>  #endif /* !CONFIG_CPU_FREQ */
>=20
> +#ifdef CONFIG_CPU_LOONGSON64
> +static int c0_compare_int_enable(struct clock_event_device *cd)
> +{
> +	if (cpu_has_extimer)
> +		set_c0_config6(LOONGSON_CONF6_INTIMER);
> +
> +	return 0;
> +}
> +
> +static int c0_compare_int_disable(struct clock_event_device *cd)
> +{
> +	if (cpu_has_extimer)
> +		clear_c0_config6(LOONGSON_CONF6_INTIMER);
> +
> +	return 0;
> +}
> +#endif

static int __maybe_unused c0_compare_int_enable(...)
{
    ...
}

without the #ifdef.

Or better, move these two to loongson64 board code, with "extern int=20
c0_compare_int_enable" in a header somewhere.

> +
>  int r4k_clockevent_init(void)
>  {
>  	unsigned long flags =3D IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
> @@ -329,6 +349,11 @@ int r4k_clockevent_init(void)
>  	cd->set_next_event	=3D mips_next_event;
>  	cd->event_handler	=3D mips_event_handler;
>=20
> +#ifdef CONFIG_CPU_LOONGSON64
> +	cd->set_state_oneshot =3D c0_compare_int_enable;
> +	cd->set_state_shutdown =3D c0_compare_int_disable;
> +#endif
> +

if (IS_ENABLED(CONFIG_CPU_LOONGSON64)) {
    cd->set_state_oneshot =3D ...;
}

Although I think this is still incorrect: here you check whether the=20
kernel supports this CPU, instead of checking what CPU you're running=20
on.

Cheers,
-Paul

>  	clockevents_config_and_register(cd, mips_hpt_frequency, min_delta,=20
> 0x7fffffff);
>=20
>  	if (cp0_timer_irq_installed)
> diff --git a/arch/mips/kernel/cpu-probe.c=20
> b/arch/mips/kernel/cpu-probe.c
> index 6be23f205e74..4f1e9ef2644e 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -2030,6 +2030,9 @@ static inline void decode_cpucfg(struct=20
> cpuinfo_mips *c)
>  	if (cfg2 & LOONGSON_CFG2_LEXT2)
>  		c->ases |=3D MIPS_ASE_LOONGSON_EXT2;
>=20
> +	if (cfg2 & LOONGSON_CFG2_LLFTP)
> +		c->options |=3D MIPS_CPU_EXTIMER;
> +
>  	if (cfg2 & LOONGSON_CFG2_LSPW) {
>  		c->options |=3D MIPS_CPU_LDPTE;
>  		c->guest.options |=3D MIPS_CPU_LDPTE;
> @@ -2088,7 +2091,8 @@ static inline void cpu_probe_loongson(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  		 * Also some early Loongson-3A2000 had wrong TLB type in Config
>  		 * register, we correct it here.
>  		 */
> -		c->options |=3D MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
> +		c->options |=3D MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE |
> +			      MIPS_CPU_EXTIMER;
>  		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>  		c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>  			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
> --
> 2.28.0
>=20


