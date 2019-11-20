Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0280A103903
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 12:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfKTLpr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 06:45:47 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39940 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727645AbfKTLpr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 06:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574250345; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uqbLnehMf46+5kt404rXN6aG71fiFr33xXgRiSLdiUw=;
        b=s6sWRKAI+ZAEKhAXcJpbghRVYToKsOH1GQhv5Zmj4Q6uOFz6H83nKpLGGX9ZbMy552gRlc
        pk4m/beFfFUD/9rGFdAkAnPHalKJ3k82TSCHHkopF1hb6kLQIucyk0UqeRFj5jMRVUlPex
        YM+yKcWJg6v1ljXAko1jb6FIaEvdvd8=
Date:   Wed, 20 Nov 2019 12:45:38 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2 v3] MIPS: Ingenic: Disable abandoned HPTLB function.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paulburton@kernel.org, jhogan@kernel.org,
        jiaxun.yang@flygoat.com, gregkh@linuxfoundation.org,
        malat@debian.org, tglx@linutronix.de, chenhc@lemote.com
Message-Id: <1574250338.3.3@crapouillou.net>
In-Reply-To: <1574173727-123321-3-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
        <1574173727-123321-1-git-send-email-zhouyanjie@zoho.com>
        <1574173727-123321-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mar., nov. 19, 2019 at 22:28, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page tlb,
> this mode is not compatible with the MIPS standard, it will cause
> tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
> when starting the init process. write 0xa9000000 to cp0 register 5
> sel 4 to disable this function to prevent getting stuck. Confirmed
> by Ingenic, this operation will not adversely affect processors
> without HPTLB function.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

> ---
>  arch/mips/include/asm/mipsregs.h |  6 ++++++
>  arch/mips/kernel/cpu-probe.c     | 21 +++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)

Still no changelog here :)


> diff --git a/arch/mips/include/asm/mipsregs.h=20
> b/arch/mips/include/asm/mipsregs.h
> index bdbdc19..0d5a309 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -689,6 +689,9 @@
>  #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
>  #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
>=20
> +/* Ingenic HPTLB off bits */
> +#define XBURST_PAGECTRL_HPTLB_DIS 0xa9000000
> +
>  /* Ingenic Config7 bits */
>  #define MIPS_CONF7_BTB_LOOP_EN	(_ULCAST_(1) << 4)
>=20
> @@ -1971,6 +1974,9 @@ do {									\
>  #define read_c0_brcm_sleepcount()	__read_32bit_c0_register($22, 7)
>  #define write_c0_brcm_sleepcount(val)	__write_32bit_c0_register($22,=20
> 7, val)
>=20
> +/* Ingenic page ctrl register */
> +#define write_c0_page_ctrl(val)	__write_32bit_c0_register($5, 4, val)
> +
>  /*
>   * Macros to access the guest system control coprocessor
>   */
> diff --git a/arch/mips/kernel/cpu-probe.c=20
> b/arch/mips/kernel/cpu-probe.c
> index 7a0e33c..3b5f4fb 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1965,13 +1965,30 @@ static inline void cpu_probe_ingenic(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  		break;
>  	}
>=20
> +	switch (c->processor_id & PRID_COMP_MASK) {
> +	/*
> +	 * The config0 register in the XBurst CPUs with a processor ID of
> +	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
> +	 * mode is not compatible with the MIPS standard, it will cause
> +	 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
> +	 * when starting the init process. After chip reset, the default
> +	 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
> +	 * switch back to VTLB mode to prevent getting stuck.
> +	 */
> +	case PRID_COMP_INGENIC_D1:
> +		write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
> +		break;
>  	/*
> -	 * The config0 register in the Xburst CPUs with a processor ID of
> +	 * The config0 register in the XBurst CPUs with a processor ID of
>  	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
>  	 * but they don't actually support this ISA.
>  	 */
> -	if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D0)
> +	case PRID_COMP_INGENIC_D0:
>  		c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
> +		break;
> +	default:
> +		break;
> +	}
>  }
>=20
>  static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int=20
> cpu)
> --
> 2.7.4
>=20
>=20

=

