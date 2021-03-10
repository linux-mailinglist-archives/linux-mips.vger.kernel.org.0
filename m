Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7AD333ADA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 11:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhCJK60 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 05:58:26 -0500
Received: from mout.gmx.net ([212.227.17.20]:44533 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232519AbhCJK54 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 05:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1615373847;
        bh=ceVDJimNHckNaqTFUy7erE/Uh5gwxkuTnCDczDbqbm4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=VdHsa7/AW6L9WC7Rx7Ek9JD4awO/W9XiOJYhswj3bitvJSHMB6SDue46IcnZBrQy+
         ifVkD7f9P62edJ3K4Q4lzQ9jIzU/i6x4/1rld+Y6Pq8q8gkDQ3vuALU3XOhgFSg7ui
         1gTzIZ4eM5IKLLVdj0tLuTG5p7RpF1oMp//lTBv4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.55] ([95.91.192.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1lBB7X02YS-00QQKg; Wed, 10
 Mar 2021 11:57:27 +0100
Subject: Re: [PATCH v4 2/7] MIPS: Loongson64: Distinguish firmware
 dependencies DTB/LEFI
To:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-3-zhangqing@loongson.cn>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <2484af69-13d1-09ff-3785-6c89cac4ffbd@rempel-privat.de>
Date:   Wed, 10 Mar 2021 11:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310075639.20372-3-zhangqing@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n4lPGT+5t3AFSwUqLLFlUXLZpZFKE7YUKdDOFC+M5Qcxvugq5VU
 BLqLPROBSwueh8o4vCmFcsFYo1l2gNBu/iIR7VvHjOw90YDg1FIEND3IIVTuP7kCSdtjXgm
 KR4VU3oIkTy4yUxW8ppKl1x5SQLRyPkYhyKaD8Es7YzUOm5aUsIV+gKwZRFctmtqgse28IM
 fSW1+AkuVhfMe88h/KLyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GF6s6vnUSn4=:9il9PiZE5fZKJhfJzRs++o
 92g+2LnnbWa4f2TzN10Srv19DEJP13JZ2powSNFuM3bpXA4h2RPe5bJSrVt3yGB56vvVf/RCo
 W7QIwoD5r64bRKBRLHb9H+5CfcqXnp9qoZQjVezlgdIKYYwFBudR8HZQey/45SSxMc2okGdkZ
 2gLbwbQcN79PiwzY55jrGbMVr4bsZMJmQ6CtF8oZ9oAKH/+1+ISf2ap13ItcPJko8orvFCwG3
 /5A8OPV3bxxgQXY+mBoSZW0bn335jW78zarqN6jkcTpZyl+JfskoR3jZ/RKzNFtkf3KtaJtLS
 cPb9E2nMV6btoyC/1G56y7GVmg9ToVa6rVfl/t2Ks0EXxqqbbQwNmUGX/go8lzOQ1IQP8upqM
 RKAn4+VJpU5k0sTTMTqC0dOzna0/moFqZT6DsM/S+9Qtt2lKWdxHKmwogM4MiJJpuO3pQQUR7
 McMairRMbrNpkRv7W7SShQ33O77cGe2vUF+FRdntoejp0EJJR6zA78MFI3l6/LV5uZJGG6+Hz
 g+nYJ7JtfwLu/4A44w5TB0Tqbnltp4uW6Su9/tdeDBRMCclaz84TZxyFMx1ach80NjnDQ6zjb
 M8YQyUrpcif8kdUZ1J7eLuuheT5f19Fu5xw0i+rpi4BFBmfQKxJVuJuzPdZ44KeFjk54mbFBX
 vAf12bhzs65+YDU0tAQAsXi2m1i/Qt44eOmi+vfOgJV4VtLfF3BiPOCQ+l5tFpMuCtk0JclAN
 YEgrMDNi/FI4tfMhg8DlQ2TWVRHhTg8yIBd+T5MipxB/+Spx+zogII7OUIeP8onLtkzoQy7Sz
 kqWth6V/OR7kACizdnOoLI6siLOakeDHa8EcZ4FTgXRqTzJJmt3o3VVq5RfNXufipSdTQJqPU
 GMxtYvH5paRpfrGHFnxg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Am 10.03.21 um 08:56 schrieb Qing Zhang:
> Add DTB boot support, only support Loongson-2K1000 processor
> for now, determine whether to use the built-in DTB or the DTB
> from the firmware by checking the range of CKSEG0 and XKPHYS.
> loongson_fw_interface will be used in the future.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Tested-by: Ming Wang <wangming01@loongson.cn>
> ---
>
> v3-v4: Standard submission of information
>        Fix error handling
>
>  .../include/asm/mach-loongson64/boot_param.h     |  6 ++++++
>  arch/mips/include/asm/mach-loongson64/loongson.h |  3 ++-
>  arch/mips/loongson64/env.c                       | 13 ++++++++++++-
>  arch/mips/loongson64/init.c                      | 16 ++++++++++++++--
>  4 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/m=
ips/include/asm/mach-loongson64/boot_param.h
> index 4592841b6b0c..43737401dc06 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -198,7 +198,13 @@ enum loongson_bridge_type {
>  	VIRTUAL =3D 3
>  };
>
> +enum loongson_fw_interface {
> +	LOONGSON_LEFI,
> +	LOONGSON_DTB,
> +};
> +
>  struct loongson_system_configuration {
> +	enum loongson_fw_interface fw_interface;
>  	u32 nr_cpus;
>  	u32 nr_nodes;
>  	int cores_per_node;
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mip=
s/include/asm/mach-loongson64/loongson.h
> index ac1c20e172a2..3f885fa26ba6 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -23,7 +23,8 @@ extern u32 memsize, highmemsize;
>  extern const struct plat_smp_ops loongson3_smp_ops;
>
>  /* loongson-specific command line, env and memory initialization */
> -extern void __init prom_init_env(void);
> +extern void __init prom_dtb_init_env(void);
> +extern void __init prom_lefi_init_env(void);
>  extern void __init szmem(unsigned int node);
>  extern void *loongson_fdt_blob;
>
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 51a5d050a94c..e7d3a06175e3 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -43,7 +43,18 @@ const char *get_system_type(void)
>  	return "Generic Loongson64 System";
>  }
>
> -void __init prom_init_env(void)
> +
> +void __init prom_dtb_init_env(void)
> +{
> +	if ((fw_arg2 < CKSEG0 || fw_arg2 > CKSEG1)
> +		&& (fw_arg2 < XKPHYS || fw_arg2 > XKSEG))
> +
> +		loongson_fdt_blob =3D __dtb_loongson64_2core_2k1000_begin;
> +	else
> +		loongson_fdt_blob =3D (void *)fw_arg2;
> +}
> +
> +void __init prom_lefi_init_env(void)
>  {
>  	struct boot_params *boot_p;
>  	struct loongson_params *loongson_p;
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index cfa788bca871..ed280b73bf89 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -52,6 +52,10 @@ void __init szmem(unsigned int node)
>  	static unsigned long num_physpages;
>  	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
>
> +	/* Otherwise come from DTB */
> +	if (loongson_sysconf.fw_interface !=3D LOONGSON_LEFI)
> +		return;
> +
>  	/* Parse memory information and activate */
>  	for (i =3D 0; i < loongson_memmap->nr_map; i++) {
>  		node_id =3D loongson_memmap->map[i].node_id;
> @@ -94,12 +98,20 @@ static void __init prom_init_memory(void)
>  void __init prom_init(void)
>  {
>  	fw_init_cmdline();
> -	prom_init_env();
> +
> +	if (fw_arg2 =3D=3D 0 || (fdt_magic(fw_arg2) =3D=3D FDT_MAGIC)) {
> +		loongson_sysconf.fw_interface =3D LOONGSON_DTB;
> +		prom_dtb_init_env();
> +	} else {
> +		loongson_sysconf.fw_interface =3D LOONGSON_LEFI;
> +		prom_lefi_init_env();
> +	}

Is it possible to make it compatible with MIPS UHI boot protocol? So boot =
loaders will be able to
handle Loongson kernel images as any other MIPS kernel images?

This protocol is described here on page 15, "3. Boot protocols"
https://docplayer.net/62444141-Unified-hosting-interface-md01069-reference=
-manual.html

According to this protocol, you should have:
fw_arg0 =3D -2
fw_arg1 =3D Virtual (kseg0) address of Device Tree Blob

This would made LS a first grade resident for many boot loaders and save a=
 lot of needles headaches.

=2D-
Regards,
Oleksij
