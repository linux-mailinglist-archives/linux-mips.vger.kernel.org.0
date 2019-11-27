Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95010B438
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 18:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfK0RQg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 12:16:36 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:54524 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK0RQg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 12:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574874992; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vf5lTT4aXK4iGAHqM++8R44k3yczLX4/UVbJOLnrOrw=;
        b=IXbU5zBBeUFblckSDLHfsbBVogmD0Ly6Iz+D1Pl07qFpC1py7ULmMhQ6wopT33j1EGbsHM
        /gF//4MyvrsCmU7IZ+4BgWLcHWMYYkW7w3LewkKaEOIaeNjMrZL5g/5V4W75bSIyT9g5CJ
        IxtwQTyAZDlMvtsPMI1JGhMT6CBMS5g=
Date:   Wed, 27 Nov 2019 18:16:24 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: X1830: Add X1830 system type.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, fancer.lancer@gmail.com, syq@debian.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        malat@debian.org, jiaxun.yang@flygoat.com, sernia.zhou@foxmail.com
Message-Id: <1574874984.3.2@crapouillou.net>
In-Reply-To: <1574749075-99329-2-git-send-email-zhouyanjie@zoho.com>
References: <1574749075-99329-1-git-send-email-zhouyanjie@zoho.com>
        <1574749075-99329-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mar., nov. 26, 2019 at 14:17, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add X1830 system type for cat /proc/cpuinfo to give out X1830.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/include/asm/bootinfo.h |  1 +
>  arch/mips/include/asm/cpu.h      |  5 ++--
>  arch/mips/jz4740/setup.c         |  4 +++
>  arch/mips/kernel/cpu-probe.c     | 65=20
> ++++++++++++++++++++++------------------
>  4 files changed, 44 insertions(+), 31 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/bootinfo.h=20
> b/arch/mips/include/asm/bootinfo.h
> index 34d6222..07f4cfe 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -82,6 +82,7 @@ enum loongson_machine_type {
>  #define  MACH_INGENIC_JZ4770	2	/* JZ4770 SOC		*/
>  #define  MACH_INGENIC_JZ4780	3	/* JZ4780 SOC		*/
>  #define  MACH_INGENIC_X1000		4	/* X1000 SOC		*/
> +#define  MACH_INGENIC_X1830		5	/* X1830 SOC		*/
>=20
>  extern char *system_type;
>  const char *get_system_type(void);
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 7fddcb8..fa7c1e8 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -46,7 +46,7 @@
>  #define PRID_COMP_NETLOGIC	0x0c0000
>  #define PRID_COMP_CAVIUM	0x0d0000
>  #define PRID_COMP_LOONGSON	0x140000
> -#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750 */
> +#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750, X1830 */
>  #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
>  #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
>=20
> @@ -183,7 +183,8 @@
>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_*
>   */
>=20
> -#define PRID_IMP_XBURST	       0x0200
> +#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst with MXU SIMD ISA		*/
> +#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst with MXU2 SIMD ISA	*/
>=20
>  /*
>   * These are the PRID's for when 23:16 =3D=3D PRID_COMP_NETLOGIC
> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> index dc8ee21..880c268 100644
> --- a/arch/mips/jz4740/setup.c
> +++ b/arch/mips/jz4740/setup.c
> @@ -44,6 +44,8 @@ static void __init jz4740_detect_mem(void)
>=20
>  static unsigned long __init get_board_mach_type(const void *fdt)
>  {
> +	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1830"))
> +		return MACH_INGENIC_X1830;
>  	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
>  		return MACH_INGENIC_X1000;
>  	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4780"))
> @@ -86,6 +88,8 @@ void __init device_tree_init(void)
>  const char *get_system_type(void)
>  {
>  	switch (mips_machtype) {
> +	case MACH_INGENIC_X1830:
> +		return "X1830";
>  	case MACH_INGENIC_X1000:
>  		return "X1000";
>  	case MACH_INGENIC_JZ4780:
> diff --git a/arch/mips/kernel/cpu-probe.c=20
> b/arch/mips/kernel/cpu-probe.c
> index 8abadfe..94b3cc5 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1948,10 +1948,8 @@ static inline void cpu_probe_ingenic(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
>=20
>  	switch (c->processor_id & PRID_IMP_MASK) {
> -	case PRID_IMP_XBURST:
> -		c->cputype =3D CPU_XBURST;
> -		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
> -		__cpu_name[cpu] =3D "Ingenic JZRISC";
> +	case PRID_IMP_XBURST_REV1:
> +
>  		/*
>  		 * The XBurst core by default attempts to avoid branch target
>  		 * buffer lookups by detecting & special casing loops. This
> @@ -1959,34 +1957,43 @@ static inline void cpu_probe_ingenic(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  		 * Set cp0 config7 bit 4 to disable this feature.
>  		 */
>  		set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
> -		break;
> -	default:
> -		panic("Unknown Ingenic Processor ID!");
> -		break;
> -	}
>=20
> -	switch (c->processor_id & PRID_COMP_MASK) {
> -	/*
> -	 * The config0 register in the XBurst CPUs with a processor ID of
> -	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
> -	 * mode is not compatible with the MIPS standard, it will cause
> -	 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
> -	 * when starting the init process. After chip reset, the default
> -	 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
> -	 * switch back to VTLB mode to prevent getting stuck.
> -	 */
> -	case PRID_COMP_INGENIC_D1:
> -		write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
> -		break;
> -	/*
> -	 * The config0 register in the XBurst CPUs with a processor ID of
> -	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
> -	 * but they don't actually support this ISA.
> -	 */
> -	case PRID_COMP_INGENIC_D0:
> -		c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
> +		switch (c->processor_id & PRID_COMP_MASK) {
> +
> +		/*
> +		 * The config0 register in the XBurst CPUs with a processor ID of
> +		 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
> +		 * but they don't actually support this ISA.
> +		 */
> +		case PRID_COMP_INGENIC_D0:
> +			c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
> +			break;
> +
> +		/*
> +		 * The config0 register in the XBurst CPUs with a processor ID of
> +		 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
> +		 * mode is not compatible with the MIPS standard, it will cause
> +		 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
> +		 * when starting the init process. After chip reset, the default
> +		 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
> +		 * switch back to VTLB mode to prevent getting stuck.
> +		 */
> +		case PRID_COMP_INGENIC_D1:
> +			write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
> +			break;
> +
> +		default:
> +			break;
> +		}

I see no "break" here. If that's intended, please add a /* fall-through=20
*/ comment here. It will prevent GCC from issuing a warning when=20
-Wimplicit-fallthrough is used.

> +
> +	case PRID_IMP_XBURST_REV2:
> +		c->cputype =3D CPU_XBURST;
> +		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
> +		__cpu_name[cpu] =3D "Ingenic XBurst";

The CPU name switched from "Ingenic JZRISC" to "Ingenic XBurst". If=20
that's intended (I believe it is) please mention it in the commit=20
message.

Cheers,
-Paul

>  		break;
> +
>  	default:
> +		panic("Unknown Ingenic Processor ID!");
>  		break;
>  	}
>  }
> --
> 2.7.4
>=20
>=20

=

