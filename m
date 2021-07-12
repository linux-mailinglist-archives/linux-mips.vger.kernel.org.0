Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277463C6559
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 23:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhGLVXg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 12 Jul 2021 17:23:36 -0400
Received: from aposti.net ([89.234.176.197]:58580 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhGLVXg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Jul 2021 17:23:36 -0400
Date:   Mon, 12 Jul 2021 22:20:33 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: Ingenic: Add system type for new Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, paulburton@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        cand@gmx.com, git@xen0n.name, chenhuacai@kernel.org,
        maoxiaochuan@loongson.cn, f.fainelli@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Message-Id: <9YH5WQ.JHPWOQWG7E3R@crapouillou.net>
In-Reply-To: <1625764602-67310-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1625764602-67310-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le ven., juil. 9 2021 at 01:16:42 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add JZ4730, JZ4760, JZ4760B, X2000H, and X2100 system type for
> cat /proc/cpuinfo to give out JZ4730, JZ4760, JZ4760B, X2000H,
> and X2100.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

You could add JZ4750 and JZ4755 too, while you're at it. (Or not, I'm 
fine with both).

Cheers,
-Paul

> ---
>  arch/mips/generic/board-ingenic.c | 15 +++++++++++++++
>  arch/mips/include/asm/bootinfo.h  |  3 +++
>  arch/mips/include/asm/cpu.h       |  4 ++--
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/generic/board-ingenic.c 
> b/arch/mips/generic/board-ingenic.c
> index 0cec0be..303bee6 100644
> --- a/arch/mips/generic/board-ingenic.c
> +++ b/arch/mips/generic/board-ingenic.c
> @@ -21,6 +21,10 @@
>  static __init char *ingenic_get_system_type(unsigned long machtype)
>  {
>  	switch (machtype) {
> +	case MACH_INGENIC_X2100:
> +		return "X2100";
> +	case MACH_INGENIC_X2000H:
> +		return "X2000H";
>  	case MACH_INGENIC_X2000E:
>  		return "X2000E";
>  	case MACH_INGENIC_X2000:
> @@ -37,8 +41,14 @@ static __init char 
> *ingenic_get_system_type(unsigned long machtype)
>  		return "JZ4775";
>  	case MACH_INGENIC_JZ4770:
>  		return "JZ4770";
> +	case MACH_INGENIC_JZ4760B:
> +		return "JZ4760B";
> +	case MACH_INGENIC_JZ4760:
> +		return "JZ4760";
>  	case MACH_INGENIC_JZ4725B:
>  		return "JZ4725B";
> +	case MACH_INGENIC_JZ4730:
> +		return "JZ4730";
>  	default:
>  		return "JZ4740";
>  	}
> @@ -61,8 +71,11 @@ static __init const void *ingenic_fixup_fdt(const 
> void *fdt, const void *match_d
>  }
> 
>  static const struct of_device_id ingenic_of_match[] __initconst = {
> +	{ .compatible = "ingenic,jz4730", .data = (void 
> *)MACH_INGENIC_JZ4730 },
>  	{ .compatible = "ingenic,jz4740", .data = (void 
> *)MACH_INGENIC_JZ4740 },
>  	{ .compatible = "ingenic,jz4725b", .data = (void 
> *)MACH_INGENIC_JZ4725B },
> +	{ .compatible = "ingenic,jz4760", .data = (void 
> *)MACH_INGENIC_JZ4760 },
> +	{ .compatible = "ingenic,jz4760b", .data = (void 
> *)MACH_INGENIC_JZ4760B },
>  	{ .compatible = "ingenic,jz4770", .data = (void 
> *)MACH_INGENIC_JZ4770 },
>  	{ .compatible = "ingenic,jz4775", .data = (void 
> *)MACH_INGENIC_JZ4775 },
>  	{ .compatible = "ingenic,jz4780", .data = (void 
> *)MACH_INGENIC_JZ4780 },
> @@ -71,6 +84,8 @@ static const struct of_device_id ingenic_of_match[] 
> __initconst = {
>  	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 
> },
>  	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 
> },
>  	{ .compatible = "ingenic,x2000e", .data = (void 
> *)MACH_INGENIC_X2000E },
> +	{ .compatible = "ingenic,x2000h", .data = (void 
> *)MACH_INGENIC_X2000H },
> +	{ .compatible = "ingenic,x2100", .data = (void *)MACH_INGENIC_X2100 
> },
>  	{}
>  };
> 
> diff --git a/arch/mips/include/asm/bootinfo.h 
> b/arch/mips/include/asm/bootinfo.h
> index 4c2e817..2128ba9 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -75,6 +75,7 @@ enum ingenic_machine_type {
>  	MACH_INGENIC_JZ4750,
>  	MACH_INGENIC_JZ4755,
>  	MACH_INGENIC_JZ4760,
> +	MACH_INGENIC_JZ4760B,
>  	MACH_INGENIC_JZ4770,
>  	MACH_INGENIC_JZ4775,
>  	MACH_INGENIC_JZ4780,
> @@ -83,6 +84,8 @@ enum ingenic_machine_type {
>  	MACH_INGENIC_X1830,
>  	MACH_INGENIC_X2000,
>  	MACH_INGENIC_X2000E,
> +	MACH_INGENIC_X2000H,
> +	MACH_INGENIC_X2100,
>  };
> 
>  extern char *system_type;
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 9e6211e..c70cac7 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -46,8 +46,8 @@
>  #define PRID_COMP_NETLOGIC	0x0c0000
>  #define PRID_COMP_CAVIUM	0x0d0000
>  #define PRID_COMP_LOONGSON	0x140000
> -#define PRID_COMP_INGENIC_13	0x130000	/* X2000 */
> -#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750, X1830 */
> +#define PRID_COMP_INGENIC_13	0x130000	/* X2000, X2100 */
> +#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, 
> JZ4760, X1830 */
>  #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
>  #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
> 
> --
> 2.7.4
> 


