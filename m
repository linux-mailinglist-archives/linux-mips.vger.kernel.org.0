Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEF129FC7B
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 05:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgJ3EGu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 00:06:50 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:45602 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3EGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Oct 2020 00:06:50 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 6284D2008F;
        Fri, 30 Oct 2020 04:06:45 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id E2D003F201;
        Fri, 30 Oct 2020 04:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 3264B2A5BA;
        Fri, 30 Oct 2020 05:06:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604030802;
        bh=1LwxbMvjUf6G+bMLyD+c+pOXa0xTdNUpXqQ5KI5Fanw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Wgp0uBXI0pAb4gTVQLdPuOD35EM//UaRyIEZS/oVOG6Q9+6LyKN6m7eEAoCd3UBgS
         SifVeZM5ao04AnzJQi4IpqrbihVdV0KGh6l9MOaYXOvVVipWHh9txZ9eLglK3CHJSc
         IGF8UdRil/jEDAXhjxh54LhXAxKGkek20kVM4ASo=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id h7JiQbxMOL_w; Fri, 30 Oct 2020 05:06:40 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 30 Oct 2020 05:06:40 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 06B6341F19;
        Fri, 30 Oct 2020 04:06:40 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="lGv7AWke";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 9717241F14;
        Fri, 30 Oct 2020 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604030793;
        bh=1LwxbMvjUf6G+bMLyD+c+pOXa0xTdNUpXqQ5KI5Fanw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lGv7AWkeFUuif+G2CEDS50Rl3rDcs1eDZJzYQNFeFSfnn7Jwhf7JAWhSuQelNBbsu
         mV9sqOFtHh0tqHDkjMtve4iAytLFVkWQipEAS6mOEzeN8Hv4rJFbpdrKgsZDjpciCd
         fDoGW986LP2d426KJE1zH8LSFAa6w944vjHK4Mnc=
Subject: Re: [PATCH 4/6] MIPS: Loongson64: Add Mail_Send support for 3A4000+
 CPU
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-5-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8acd5e34-43c1-4571-fa29-5a145d4834bc@flygoat.com>
Date:   Fri, 30 Oct 2020 12:06:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1603958581-4723-5-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 06B6341F19
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/10/29 16:02, Tiezhu Yang 写道:
> Loongson 3A4000+ CPU has per-core Mail_Send register to send mail,
> there is no need to maintain register address of each core and node,
> just simply specify cpu number.
>
> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   .../include/asm/mach-loongson64/loongson_regs.h    | 10 +++
>   arch/mips/loongson64/smp.c                         | 75 +++++++++++++++++-----
>   2 files changed, 68 insertions(+), 17 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> index 83dbb9f..1659935 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> @@ -227,6 +227,16 @@ static inline void csr_writeq(u64 val, u32 reg)
>   #define CSR_IPI_SEND_CPU_SHIFT	16
>   #define CSR_IPI_SEND_BLOCK	BIT(31)
>   
> +#define LOONGSON_CSR_MAIL_BUF0		0x1020
> +#define LOONGSON_CSR_MAIL_SEND		0x1048
> +#define CSR_MAIL_SEND_BLOCK		BIT_ULL(31)
> +#define CSR_MAIL_SEND_BOX_LOW(box)	(box << 1)
> +#define CSR_MAIL_SEND_BOX_HIGH(box)	((box << 1) + 1)
> +#define CSR_MAIL_SEND_BOX_SHIFT		2
> +#define CSR_MAIL_SEND_CPU_SHIFT		16
> +#define CSR_MAIL_SEND_BUF_SHIFT		32
> +#define CSR_MAIL_SEND_H32_MASK		0xFFFFFFFF00000000ULL
> +
>   static inline u64 drdtime(void)
>   {
>   	int rID = 0;
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 7d58853..33597d2 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -54,6 +54,26 @@ static uint32_t core0_c0count[NR_CPUS];
>   u32 (*ipi_read_clear)(int cpu);
>   void (*ipi_write_action)(int cpu, u32 action);
>   
> +/* send mail via Mail_Send register for 3A4000+ CPU */
> +static void csr_mail_send(uint64_t data, int cpu, int mailbox)
> +{
> +	uint64_t val;
> +
> +	/* send high 32 bits */
> +	val = CSR_MAIL_SEND_BLOCK;
> +	val |= (CSR_MAIL_SEND_BOX_HIGH(mailbox) << CSR_MAIL_SEND_BOX_SHIFT);
> +	val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
> +	val |= (data & CSR_MAIL_SEND_H32_MASK);
> +	csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
> +
> +	/* send low 32 bits */
> +	val = CSR_MAIL_SEND_BLOCK;
> +	val |= (CSR_MAIL_SEND_BOX_LOW(mailbox) << CSR_MAIL_SEND_BOX_SHIFT);
> +	val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
> +	val |= (data << CSR_MAIL_SEND_BUF_SHIFT);
> +	csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
> +};
> +
>   static u32 csr_ipi_read_clear(int cpu)
>   {
>   	u32 action;
> @@ -348,7 +368,10 @@ static void loongson3_init_secondary(void)
>   	/* Set interrupt mask, but don't enable */
>   	change_c0_status(ST0_IM, imask);
>   
> -	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
> +	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI)
> +		csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);

Hi Tiezhu,

Feature cheking is duplicated. could you please abstract them to 
callbacks and set
them in csr_ipi probe?

e.g.
ipi_write_enable


> +	else
> +		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
>   
>   	per_cpu(cpu_state, cpu) = CPU_ONLINE;
>   	cpu_set_core(&cpu_data[cpu],
> @@ -380,8 +403,12 @@ static void loongson3_smp_finish(void)
>   
>   	write_c0_compare(read_c0_count() + mips_hpt_frequency/HZ);
>   	local_irq_enable();
> -	loongson3_ipi_write64(0,
> -			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
> +
> +	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI)
> +		csr_writel(0, LOONGSON_CSR_MAIL_BUF0);
> +	else
> +		loongson3_ipi_write64(0, ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
> +

ditto here,
ipi_write_buf

>   	pr_info("CPU#%d finished, CP0_ST=%x\n",
>   			smp_processor_id(), read_c0_status());
>   }
> @@ -414,12 +441,18 @@ static void __init loongson3_smp_setup(void)
>   	}
>   
>   	csr_ipi_probe();
> -	ipi_set0_regs_init();
> -	ipi_clear0_regs_init();
> -	ipi_status0_regs_init();
> -	ipi_en0_regs_init();
> -	ipi_mailbox_buf_init();
> -	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
> +
> +	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
> +		csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
> +	} else {
> +		ipi_set0_regs_init();
> +		ipi_clear0_regs_init();
> +		ipi_status0_regs_init();
> +		ipi_en0_regs_init();
> +		ipi_mailbox_buf_init();
> +		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
> +	}
> +
>   	cpu_set_core(&cpu_data[0],
>   		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
>   	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
> @@ -452,14 +485,22 @@ static int loongson3_boot_secondary(int cpu, struct task_struct *idle)
>   	pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
>   			cpu, startargs[0], startargs[1], startargs[2]);
>   
> -	loongson3_ipi_write64(startargs[3],
> -			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
> -	loongson3_ipi_write64(startargs[2],
> -			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
> -	loongson3_ipi_write64(startargs[1],
> -			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
> -	loongson3_ipi_write64(startargs[0],
> -			ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
> +	if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & LOONGSON_CSRF_IPI) {
> +		csr_mail_send(startargs[3], cpu_logical_map(cpu), 3);
> +		csr_mail_send(startargs[2], cpu_logical_map(cpu), 2);
> +		csr_mail_send(startargs[1], cpu_logical_map(cpu), 1);
> +		csr_mail_send(startargs[0], cpu_logical_map(cpu), 0);
ditto

Thanks.

- Jiaxun

> +	} else {
> +		loongson3_ipi_write64(startargs[3],
> +				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
> +		loongson3_ipi_write64(startargs[2],
> +				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
> +		loongson3_ipi_write64(startargs[1],
> +				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
> +		loongson3_ipi_write64(startargs[0],
> +				ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
> +	}
> +
>   	return 0;
>   }
>   
