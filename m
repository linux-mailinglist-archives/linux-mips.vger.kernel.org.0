Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AEF2A5E89
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 08:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgKDHEu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 02:04:50 -0500
Received: from relay5.mymailcheap.com ([159.100.248.207]:39782 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgKDHEu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Nov 2020 02:04:50 -0500
X-Greylist: delayed 92149 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Nov 2020 02:04:48 EST
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id CAF02260EC;
        Wed,  4 Nov 2020 07:04:46 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 891BB3F162;
        Wed,  4 Nov 2020 08:04:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id BB5FD2A3BE;
        Wed,  4 Nov 2020 02:04:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604473483;
        bh=aZc4gDTjovoY1c/1+WQlHNqjh+cUbu0fF1P8IIsFRbY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Y3rrmHzCyltEL2UKZq3EMKpbVWefU518vLnTrOxpUV8lqjhwmMKFxmHognSyFxY5m
         RW9wc2u21nJTI3WsDM/2LLphpMPGlOhVIALut/vnAu4WT26Hjm4AOLCZv4sL+7W0B6
         IcEUt1kAK/KLDuC7Yno+pUFMyC84wMZlUc01bz2Q=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EmKhBeLFrTB2; Wed,  4 Nov 2020 02:04:42 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed,  4 Nov 2020 02:04:42 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B31DE41F36;
        Wed,  4 Nov 2020 07:04:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="HkAg3wdK";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0E6BE41F1E;
        Wed,  4 Nov 2020 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604473471;
        bh=aZc4gDTjovoY1c/1+WQlHNqjh+cUbu0fF1P8IIsFRbY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HkAg3wdKAdznpPZHk/4lHw1H1IJ6EDFGxd4LsBpx0t+P0TH5++H7n3YuzkHah6gWa
         WQq6n6Kngv0kHzWhbQbpad0+DNYA1xFsvHwdNvoOVRWLq0yMe/XNlxGDCUtpraveNF
         PFf7d+qhEAiVINzS/UgKOqau8c0ZkHQo/BmQ2PGQ=
Subject: Re: [PATCH v3 5/6] MIPS: Loongson64: SMP: Fix up play_dead jump
 indicator
To:     Jinyang He <hejinyang@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-6-git-send-email-yangtiezhu@loongson.cn>
 <e534bc91-a946-fde7-a411-bf200abbe6a5@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <85ce1b63-1c39-d567-1bb1-8a6431c9c895@flygoat.com>
Date:   Wed, 4 Nov 2020 15:04:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e534bc91-a946-fde7-a411-bf200abbe6a5@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B31DE41F36
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
         RCPT_COUNT_SEVEN(0.00)[9];
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



在 2020/11/4 14:31, Jinyang He 写道:
> Hi, all,
>
> On 11/03/2020 03:12 PM, Tiezhu Yang wrote:
>> In play_dead function, the whole 64-bit PC mailbox was used as a 
>> indicator
>> to determine if the master core had written boot jump information.
>>
>> However, after we introduced CSR mailsend, the hardware will not 
>> guarante
>> an atomic write for the 64-bit PC mailbox. Thus we have to use the lower
>> 32-bit which is written at the last as the jump indicator instead.
>>
>> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
>> Signed-off-by: Jun Yi <yijun@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> v2: No changes
>> v3: Update the commit message and comment
>>
>>   arch/mips/loongson64/smp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
>> index 736e98d..aa0cd72 100644
>> --- a/arch/mips/loongson64/smp.c
>> +++ b/arch/mips/loongson64/smp.c
>> @@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int 
>> *state_addr)
>>           "1: li    %[count], 0x100             \n" /* wait for init 
>> loop */
>>           "2: bnez  %[count], 2b                \n" /* limit mailbox 
>> access */
>>           "   addiu %[count], -1                \n"
>> -        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via 
>> mailbox */
> I have some confusion here. Play_dead CPUs is always brought up by 
> cpu_up().
> On Loongson64, it calls loongson3_boot_secondary(). The value of 
> startargs[0]
> is the address of smp_bootstrap() which is in CKSEG0 and a constant 
> after the
> kernel is compiled. That means its value likes 0xffffffff8... and only 
> the low
> 32bit is useful. As "lw" is sign-extended, could we replace "ld" with 
> "lw" simply?

Hi Jinyang,

I'd prefer not to do so. In future we may have kernel running in other 
spaces,
(e.g. xkphys), and there is no reason to add a barrier on that without 
actual benefit.
I had check PMON firmware and it's also loading the full 64-bit address.

Also to keep consistent, mailbox writing part needs to be refined to 
match the
behavior of reading. Otherwise other readers will be confused.

Thus leaving it as is looks much more reasonable.

Thanks.

- Jiaxun

>
> Thanks,
> Jinyang
>> +        "   lw    %[initfunc], 0x20(%[base])  \n" /* check lower 
>> 32-bit as jump indicator */
>>           "   beqz  %[initfunc], 1b             \n"
>>           "   nop                               \n"
>> +        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 
>> 64-bit) via mailbox */
>>           "   ld    $sp, 0x28(%[base])          \n" /* get SP via 
>> mailbox */
>>           "   ld    $gp, 0x30(%[base])          \n" /* get GP via 
>> mailbox */
>>           "   ld    $a1, 0x38(%[base])          \n"
