Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E102A3BEF
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 06:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKCF3D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 00:29:03 -0500
Received: from relay5.mymailcheap.com ([159.100.248.207]:39337 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgKCF3B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Nov 2020 00:29:01 -0500
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id D2CF7260EB;
        Tue,  3 Nov 2020 05:28:58 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 61E6E3ECDA;
        Tue,  3 Nov 2020 06:28:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 8C6972A2AC;
        Tue,  3 Nov 2020 00:28:55 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604381335;
        bh=GOnSbMLdOvGxt4Ou0iinP/mHH3Ln71unuX6HvSiRG7A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rg1geAZXSXgdqCVSDwOVBTn/g8l+pDQLvuFyANm3fs4fMR5qsaj7S8FB/aa4wvlYK
         6wK5cWUBHcyU0IyGTzs1Dh9AsfrEcb8KkNCnE/j4Mo6AiDPG/Crq3JP6tEut0RXBqF
         LkohLcu4UDQ+9TMLfbGKNluxojsUiy8jt4iQI9x4=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VaskAYvXfNMU; Tue,  3 Nov 2020 00:28:53 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Tue,  3 Nov 2020 00:28:53 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 720864012A;
        Tue,  3 Nov 2020 05:28:50 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Es9+8y5U";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 23B144012A;
        Tue,  3 Nov 2020 05:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604381326;
        bh=GOnSbMLdOvGxt4Ou0iinP/mHH3Ln71unuX6HvSiRG7A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Es9+8y5UeYcoRBX66J8s7Va8GwxUVn/UAWpmZex/szVI+a3PV+83cwAkDBe706Ff1
         YNmvvDOTbToEjsn0XvnohnNI9cV5edhupbamecHHupuOFYZKz8kSflKL3ZkZSlbrta
         5KI9lK4nZoWGYQuYU0Fg1GxG8DGim+s9E3GVemjg=
Subject: Re: [PATCH v2 5/6] MIPS: Loongson64: Make sure the PC address is
 correct when 3A4000+ CPU hotplug
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
 <1604373306-3599-6-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b67e3a4b-2f2f-37c5-88fa-24e11ac21cac@flygoat.com>
Date:   Tue, 3 Nov 2020 13:28:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604373306-3599-6-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 720864012A
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/11/3 11:15, Tiezhu Yang Ð´µÀ:
> In loongson3_type3_play_dead(), in order to make sure the PC address is
> correct, use lw to read the low 32 bits first, if the result is not zero,
> then use ld to read the whole 64 bits, otherwise there maybe exists atomic
> problem due to write high 32 bits first and then low 32 bits, like this:
>
> high 32 bits (write done)
>                                    -- only read high 32-bits which is wrong
> low 32 bits (not yet write done)
>
> This problem is especially for Loongson 3A4000+ CPU due to using Mail_Send
> register which can only send 32 bits data one time. Although it is hard to
> reproduce, we can do something at the software level to avoid the risks for
> 3A4000+ CPU, this change has no influence on the other Loongson CPUs.
>
> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
> Signed-off-by: Jun Yi <yijun@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Hi Tiezhu,

Sorry that I didn't look this patch carefully in previous rev, here's my 
comments,

Firstly the commit message and code comment looks bogus...

I'd prefer

---
MIPS: Loongson64: SMP: Fix up play_dead jump indicator

In play_dead function, the whole 64-bit PC mailbox was used as a indicator
to determine if the master core had written boot jump information.

However, after we introduced CSR mailsend, the 64-bit PC mailbox won't be
written atomicly. Thus we have to use the lower 32-bit, which will be 
written at
the last, as the jump indicator instead.
--

Thanks.

> ---
>
> v2: No changes
>
>   arch/mips/loongson64/smp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 736e98d..e32b46e 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int *state_addr)
>   		"1: li    %[count], 0x100             \n" /* wait for init loop */
>   		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
>   		"   addiu %[count], -1                \n"
> -		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via mailbox */
> +		"   lw    %[initfunc], 0x20(%[base])  \n" /* get PC (low 32 bits) via mailbox */

Here you can comment as "Check jump indicator (lower 32-bit of PC mailbox)"

Thanks.

- Jiaxun
>   		"   beqz  %[initfunc], 1b             \n"
>   		"   nop                               \n"
> +		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 64 bits) via mailbox */
>   		"   ld    $sp, 0x28(%[base])          \n" /* get SP via mailbox */
>   		"   ld    $gp, 0x30(%[base])          \n" /* get GP via mailbox */
>   		"   ld    $a1, 0x38(%[base])          \n"
