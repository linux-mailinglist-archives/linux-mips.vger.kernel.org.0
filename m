Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0C02414D9
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 04:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgHKCRt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 22:17:49 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:40607 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgHKCRt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Aug 2020 22:17:49 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 76E6720090
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 02:17:45 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 3CCB73F1C5;
        Mon, 10 Aug 2020 22:17:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 1DE642A347;
        Mon, 10 Aug 2020 22:17:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1597112263;
        bh=th2oq4x3GbTahC+jwU8v/GUzlWO20lXMUPtMldCVrxw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZZUH/Owev54dptJladFI+JA4QXKlwTTWgcTv9hBHBtEYcexgzezsKzn639a1wrg/O
         Xta/VYM3ln4DqW2SxjH6ZXTCrpekN2epioa385Rm6SXctIJ9lHR6QHKWDsU02fPmDn
         q06wGrs1mFRMpypydWNKpCLfWiOuHe2QvE8TkYpM=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jYKVuduAN0f9; Mon, 10 Aug 2020 22:17:41 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 10 Aug 2020 22:17:41 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 2889140EFD;
        Tue, 11 Aug 2020 02:17:40 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="CVKkiB8b";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5D1324085B;
        Tue, 11 Aug 2020 02:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1597112178;
        bh=th2oq4x3GbTahC+jwU8v/GUzlWO20lXMUPtMldCVrxw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CVKkiB8bIU6eHJ1NFhL55DHblbORcP2lbfh3w6SljtAl+kzd6OZRgDU3DVQxVoi5s
         s0gFDcwW/bnJdQd1uaAx+nlBtSlpNxJD78R2Ja8NsAabJwSHio9xCIxYhMtBfxA1/Q
         7TPFtPrz2oGtRYmhKddUp/wjNZbEer/LD2DGnsWw=
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
 <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
 <20200810141219.GA2844@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
Date:   Tue, 11 Aug 2020 10:16:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200810141219.GA2844@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2889140EFD
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/8/10 22:12, Thomas Bogendoerfer Ð´µÀ:
> On Sun, Aug 09, 2020 at 10:53:13PM +0800, Jiaxun Yang wrote:
>> Thus we still need to enable CU2 with exception for user space, and we can
>> always enable CU2 in
>> kernel since kernel won't be compiled with hard-float. :-)
> I see, how about the patch below
That looks fine for me.
Is it good with you, Huacai?

Thanks.

- Jiaxun

>
> Thomas.
>
>
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 4ddc12e4444a..f7144116b43b 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -389,6 +389,13 @@
>   #define ST0_CU3			0x80000000
>   #define ST0_XX			0x80000000	/* MIPS IV naming */
>   
> +/* in-kernel enabled CUs */
> +#ifdef CONFIG_CPU_LOONGSOON64
> +#define ST0_KERNEL_CUMASK	(ST0_CU0 | ST_CU2)
> +#else
> +#define ST0_KERNEL_CUMASK	ST0_CU0
> +#endif
> +
>   /*
>    * Bitfields and bit numbers in the coprocessor 0 IntCtl register. (MIPSR2)
>    */
> diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
> index 3e8d2aaf96af..aa430a6c68b2 100644
> --- a/arch/mips/include/asm/stackframe.h
> +++ b/arch/mips/include/asm/stackframe.h
> @@ -450,7 +450,7 @@
>    */
>   		.macro	CLI
>   		mfc0	t0, CP0_STATUS
> -		li	t1, ST0_CU0 | STATMASK
> +		li	t1, ST0_KERNEL_CUMASK | STATMASK
>   		or	t0, t1
>   		xori	t0, STATMASK
>   		mtc0	t0, CP0_STATUS
> @@ -463,7 +463,7 @@
>    */
>   		.macro	STI
>   		mfc0	t0, CP0_STATUS
> -		li	t1, ST0_CU0 | STATMASK
> +		li	t1, ST0_KERNEL_CUMASK | STATMASK
>   		or	t0, t1
>   		xori	t0, STATMASK & ~1
>   		mtc0	t0, CP0_STATUS
> @@ -477,7 +477,7 @@
>    */
>   		.macro	KMODE
>   		mfc0	t0, CP0_STATUS
> -		li	t1, ST0_CU0 | (STATMASK & ~1)
> +		li	t1, ST0_KERNEL_CUMASK | (STATMASK & ~1)
>   #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
>   		andi	t2, t0, ST0_IEP
>   		srl	t2, 2
> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index 7dd234e788e6..61b73580b877 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -35,7 +35,7 @@
>   	.macro	setup_c0_status set clr
>   	.set	push
>   	mfc0	t0, CP0_STATUS
> -	or	t0, ST0_CU0|\set|0x1f|\clr
> +	or	t0, ST0_KERNEL_CUMASK|\set|0x1f|\clr
>   	xor	t0, 0x1f|\clr
>   	mtc0	t0, CP0_STATUS
>   	.set	noreorder
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index ff5320b79100..90b869297893 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -68,7 +68,7 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp)
>   	unsigned long status;
>   
>   	/* New thread loses kernel privileges. */
> -	status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_FR|KU_MASK);
> +	status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_CU2|ST0_FR|KU_MASK);
>   	status |= KU_USER;
>   	regs->cp0_status = status;
>   	lose_fpu(0);
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index b95ef98fc847..f4362ac172c6 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2190,7 +2190,7 @@ static void configure_status(void)
>   	 * flag that some firmware may have left set and the TS bit (for
>   	 * IP27).  Set XX for ISA IV code to work.
>   	 */
> -	unsigned int status_set = ST0_CU0;
> +	unsigned int status_set = ST0_KERNEL_CUMASK;
>   #ifdef CONFIG_64BIT
>   	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
>   #endif
>
