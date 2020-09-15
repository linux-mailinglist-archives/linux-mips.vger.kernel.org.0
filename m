Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0654269DC6
	for <lists+linux-mips@lfdr.de>; Tue, 15 Sep 2020 07:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgIOFXc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Sep 2020 01:23:32 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:45836 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgIOFX2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Sep 2020 01:23:28 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id DB92F260EC
        for <linux-mips@vger.kernel.org>; Tue, 15 Sep 2020 05:23:24 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 558093ECD9;
        Tue, 15 Sep 2020 07:23:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 333942A915;
        Tue, 15 Sep 2020 07:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600147402;
        bh=pBHxIokCZynYw3ScP/nVOVKseKLK233vgSqlpJUmg8A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bIT0cp+OUDccBEjI4exCMEETszF6VAaJNDul4g5Pw4+cDePoH1Hqn4z8zldu6osaK
         N/waUdna8r2WRIQAzqXoUUmx2U0Rq9GktutljBOBF6zboWtkmCAajw4zj5uCtnGVmd
         C/vznaqS4no7swxbwWZrthnw2cNEuI1B/YjaGz9w=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WzuQ6Z2bmB7U; Tue, 15 Sep 2020 07:23:20 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Tue, 15 Sep 2020 07:23:20 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 1E83040EB6;
        Tue, 15 Sep 2020 05:23:19 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="M2Vxjr+b";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id A31AE40EB6;
        Tue, 15 Sep 2020 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600147301;
        bh=pBHxIokCZynYw3ScP/nVOVKseKLK233vgSqlpJUmg8A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=M2Vxjr+bqYCs2uI1Ehg4PTFLqOQt2Wg93SvP4fLHxJ566MAd5LGFwSqUCjzLUOob0
         30l4v8cgGUd4ZmYthhPsnwp9yGAPdEpIPRJ3367oMX/dEABXhA4BRScVc3dCxAr1uF
         sxzoivehszQyKQEH1k3a8no/E0QSGlZU49iwPv/c=
Subject: Re: [PATCH V6 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
 <1599473169-6599-2-git-send-email-chenhc@lemote.com>
 <20200914111118.GB8974@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2a0e87d6-f157-d645-cbb3-bbc3e0f33c7a@flygoat.com>
Date:   Tue, 15 Sep 2020 13:21:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200914111118.GB8974@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1E83040EB6
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
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
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



ÔÚ 2020/9/14 19:11, Thomas Bogendoerfer Ð´µÀ:
> On Mon, Sep 07, 2020 at 06:06:08PM +0800, Huacai Chen wrote:
>> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
>> index 409cb48..9fc88ec 100644
>> --- a/arch/mips/boot/compressed/head.S
>> +++ b/arch/mips/boot/compressed/head.S
>> @@ -14,11 +14,16 @@
>>   
>>   #include <asm/asm.h>
>>   #include <asm/regdef.h>
>> +#include <asm/mipsregs.h>
>>   
>>   	.set noreorder
>>   	.cprestore
>>   	LEAF(start)
>>   start:
>> +	mfc0    t0, CP0_STATUS
>> +	or	t0, ST0_KERNEL_CUMASK
>> +	mtc0    t0, CP0_STATUS
>> +
>>   	/* Save boot rom start args */
>>   	move	s0, a0
>>   	move	s1, a1
> please to compiler flags in arch/mips/boot/compressed/Makefile to
> disable generation of instruction not supported, if CU2 is disabled
> (and don't forget about 2ef).

I don't think it's worthy to have different CFLAGS between zboot and rest of
the kernel.

On GCC version prior to 9, there is no flag to control the generation of
these instructions, unless drop supplied "-march=loongson3a" option,
that's messy and unreliable for Makefile.

By contrast, enabling CU2 in zboot have no side effect. Some firmware even
did it in early ROM initilization stage.

Thanks.

- Jiaxun

>
> Rest of the patch LGTM.
>
> Thomas.
>
