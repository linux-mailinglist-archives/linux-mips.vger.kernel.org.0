Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24C32758E1
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 15:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgIWNiC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 09:38:02 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:49840 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgIWNiC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 09:38:02 -0400
X-Greylist: delayed 13922 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 09:37:59 EDT
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 0C8AB260EB
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2020 13:37:58 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id B6C9F3F1D0;
        Wed, 23 Sep 2020 15:37:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id E89A52A0F2;
        Wed, 23 Sep 2020 09:37:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600868276;
        bh=4yNbKUZ+QYBZ+Gs4tzeI9ABYWyrdvJtQtWr3BsAoT2Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FNR0sb4ZcDFrqPwtkLcXZFg2TG2lZCPVz3uxsGBZ9d0nBW77JOijRjp7uP2XmGYGW
         paD6evfrpFxhB3TZrrwg/7IkXQppG2UqEKNlPq6gMFTcm9eqv9k+u7fL7JYY0hr+AY
         mwdj5K2zwVsIN5E/zC+RfUwmkXxY2T9rToYfo4dY=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fjz6fmGS8rFl; Wed, 23 Sep 2020 09:37:54 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 09:37:53 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 2CB5D40858;
        Wed, 23 Sep 2020 13:37:52 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="FlPwzhCh";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1FDC440FEE;
        Wed, 23 Sep 2020 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600868163;
        bh=4yNbKUZ+QYBZ+Gs4tzeI9ABYWyrdvJtQtWr3BsAoT2Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FlPwzhChhwOZkNyhnFexQKlZnX9morXmnfG1uGDSG3+HklBdZwrseRefIf9hDjwvI
         Mt1qBTPgIiNHmtrfSUvrEkfL3de57DmX7cuEOENszKQTUvF/7AExFj5Xyrb69b4lHO
         uYKzrC2+H9Fh2El1APaWivjKCD6eOIczLTMsKxhE=
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add kexec/kdump support
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
 <1600828257-31316-3-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <46167e76-3179-825c-606c-fc35fda8eb4e@flygoat.com>
Date:   Wed, 23 Sep 2020 21:35:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <1600828257-31316-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2CB5D40858
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[12];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lemote.com,gmail.com,loongson.cn];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/9/23 10:30, Huacai Chen Ð´µÀ:
> Add kexec/kdump support for Loongson64 by:
> 1, Provide Loongson-specific kexec functions: loongson_kexec_prepare,
>     loongson_kexec_shutdown and loongson_crash_shutdown;
> 2, Provide Loongson-specific assembly code in kexec_smp_wait;
> 3, Clear mailbox in loongson3_smp_setup() since KEXEC bypass BIOS;
> 4, KEXEC always run at boot CPU, but KDUMP may triggered at non-boot
>     CPU. Loongson64 assume boot CPU is the first possible cpu, so fix
>     boot_cpu_id in prom_init_env();
>
> To start Loongson64, The boot CPU needs 3 parameters:
> fw_arg0: the number of arguments in cmdline (i.e., argc).
> fw_arg1: structure holds cmdline such as "root=/dev/sda1 console=tty"
>           (i.e., argv).
> fw_arg2: environment (i.e., envp, additional boot parameters from LEFI).
>
> Non-boot CPUs do not need parameters at once. They query their own IPI
> mailbox to get PC, SP and GP in a loop until boot CPU brings them up.
>
> loongson_kexec_prepare(): Setup cmdline for kexec/kdump. The kexec/kdump
> cmdline comes from kexec's "append" option string. This structure will
> be parsed in fw_init_cmdline() of arch/mips/fw/lib/cmdline.c. Both image
> ->control_code_page and the cmdline need to be in a safe memory region
> (memory allocated by the old kernel may be corrupted by the new kernel).
> In order to maintain compatibility for the old firmware, the low 2MB is
> reserverd and safe for Loongson. So let KEXEC_CTRL_CODE and KEXEC_ARGV_
> ADDR be here. LEFI parameters may be corrupted at runtime, so backup it
> at mips_reboot_setup(), and then restore it at loongson_kexec_shutdown()
> /loongson_crash_shutdown().
>
> loongson_kexec_shutdown(): Wake up all present CPUs and let them go to
> reboot_code_buffer. Pass the kexec parameters to kexec_args.
>
> loongson_crash_shutdown(): Pass the kdump parameters to kexec_args.
>
> The assembly part in kexec_smp_wait provide a routine as BIOS does, in
> order to keep secondary CPUs in a querying loop.
>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   arch/mips/kernel/relocate_kernel.S |  27 +++++++++
>   arch/mips/loongson64/env.c         |   7 +++
>   arch/mips/loongson64/reset.c       | 111 +++++++++++++++++++++++++++++++++++++
>   arch/mips/loongson64/smp.c         |   5 ++
>   4 files changed, 150 insertions(+)
>
> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> index ac87089..91b2932 100644
> --- a/arch/mips/kernel/relocate_kernel.S
> +++ b/arch/mips/kernel/relocate_kernel.S
> @@ -133,6 +133,33 @@ LEAF(kexec_smp_wait)
>   #else
>   	sync
>   #endif

Hi Jingyang, Huacai,

Thanks a lot for what you have done on Loongson64 support.

Just add my cents here.

> +
> +#ifdef CONFIG_CPU_LOONGSON64
> +#define MAILBOX_BASE 0x900000003ff01000
> +	/* s0:prid s1:initfn */
> +	/* t0:base t1:cpuid t2:node t9:count */
> +	mfc0  t1, CP0_EBASE
> +	andi  t1, MIPS_EBASE_CPUNUM
> +	dli   t0, MAILBOX_BASE    /* mailbox base */
> +	dins  t0, t1, 8, 2        /* insert core id*/
> +	dext  t2, t1, 2, 2
> +	dins  t0, t2, 44, 2       /* insert node id */
> +	mfc0  s0, CP0_PRID
> +	andi  s0, s0, 0xf
> +	blt   s0, 0x6, 1f         /* Loongson-3A1000 */
> +	bgt   s0, 0x7, 1f         /* Loongson-3A2000/3A3000 */
> +	dins  t0, t2, 14, 2       /* Loongson-3B1000/3B1500 need bit 15~14 */
> +1:	li    t9, 0x100           /* wait for init loop */
> +2:	addiu t9, -1              /* limit mailbox access */
> +	bnez  t9, 2b
> +	ld    s1, 0x20(t0)        /* get PC via mailbox reg0 */
> +	beqz  s1, 1b
> +	ld    sp, 0x28(t0)        /* get SP via mailbox reg1 */
> +	ld    gp, 0x30(t0)        /* get GP via mailbox reg2 */
> +	ld    a1, 0x38(t0)
> +	jr    s1                  /* jump to initial PC */
> +#endif
> +

I'm just a little bit uncomfortable with this kind of hardcoded address.
Is it possible to generate kexec_smp_wait with uasm, or pass the SMP
base as a parameter of this function?

Also I do think we can handle kexec_flag in Loongson's platform SMP,
or even generic MIPS SMP code just like what cavium did so this kind
of platform quirk can be avoided.

>   	j		s1
>   	END(kexec_smp_wait)
>   #endif
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 134cb8e..e937f31 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -120,6 +120,13 @@ void __init prom_init_env(void)
>   	loongson_sysconf.nr_cpus = ecpu->nr_cpus;
>   	loongson_sysconf.boot_cpu_id = ecpu->cpu_startup_core_id;
>   	loongson_sysconf.reserved_cpus_mask = ecpu->reserved_cores_mask;
> +#ifdef CONFIG_KEXEC
> +	loongson_sysconf.boot_cpu_id = get_ebase_cpunum();
> +	loongson_sysconf.reserved_cpus_mask |=
> +		(1 << loongson_sysconf.boot_cpu_id) - 1;
> +	pr_info("Boot CPU ID is being fixed from %d to %d\n",
> +		ecpu->cpu_startup_core_id, loongson_sysconf.boot_cpu_id);
> +#endif

This could be done unconditionally and split to another patch,
"MIPS: Loongson64: Quirk inaccurate bootcore from the firmware"

>   	if (ecpu->nr_cpus > NR_CPUS || ecpu->nr_cpus == 0)
>   		loongson_sysconf.nr_cpus = NR_CPUS;
>   	loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index 3bb8a1e..b1e71f37 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -6,9 +6,14 @@
>    * Copyright (C) 2009 Lemote, Inc.
>    * Author: Zhangjin Wu, wuzhangjin@gmail.com
>    */
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
>   #include <linux/init.h>
> +#include <linux/kexec.h>
>   #include <linux/pm.h>
> +#include <linux/slab.h>
>   
> +#include <asm/bootinfo.h>
>   #include <asm/idle.h>
>   #include <asm/reboot.h>
>   
> @@ -47,12 +52,118 @@ static void loongson_halt(void)
>   	}
>   }
>   
> +#ifdef CONFIG_KEXEC
> +
> +/* 0X80000000~0X80200000 is safe */
> +#define MAX_ARGS	64
> +#define KEXEC_CTRL_CODE	0xFFFFFFFF80100000UL
> +#define KEXEC_ARGV_ADDR	0xFFFFFFFF80108000UL
> +#define KEXEC_ARGV_SIZE	COMMAND_LINE_SIZE
> +#define KEXEC_ENVP_SIZE	4800
I won't say it's safe.
Loongson-2K's PMON may place reboot vector here, also some
UEFI firmware may place their suspend stack here.
What if we allocate these buffer at runtime?

Thanks.

- Jiaxun

