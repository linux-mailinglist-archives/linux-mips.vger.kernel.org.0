Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66742A0516
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 13:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJ3MNi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 08:13:38 -0400
Received: from relay3.mymailcheap.com ([217.182.66.161]:52292 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3MNi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Oct 2020 08:13:38 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 6B37A3ECDF;
        Fri, 30 Oct 2020 13:13:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id AFD262A0F9;
        Fri, 30 Oct 2020 08:13:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604060013;
        bh=Dmc4WgCmy0bLnq4AUakBedzgrdY7inhMkFJ0bs9ifZ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ui4rOwU3Al6lLfr7t90XquObxnxwcVEc7HIGijM/wjo0XtjWFsr+VUQrEePO8cFiI
         +q33UhlrqxHbBQu3w+IQ09aZq9tky8t+JjQOPwpy7rEKCWKzLcbvsDyt1BBvnPfeaT
         YGmD/SqD9kOicisTWj/HzfoF/GpXxxhECHqIdeCM=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YMKHTEy304Jo; Fri, 30 Oct 2020 08:13:31 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 30 Oct 2020 08:13:31 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 20384400BD;
        Fri, 30 Oct 2020 12:13:27 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="swMfAQFZ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8F29D400BD;
        Fri, 30 Oct 2020 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604060000;
        bh=Dmc4WgCmy0bLnq4AUakBedzgrdY7inhMkFJ0bs9ifZ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=swMfAQFZSKLmDxUHCBd7DXVObgX6pBNMxqDIanlJd11kI/4cTbpOBFQfWCMGC4DCe
         STvlAYPxItZAvhAwzFGi/uJ+r1be8NeYO4azA0RTv0leovmdMh/7wWVRd4HyYGitF5
         jbrU5udsvAEy16Nsb4RdQkq0Ec+ateJ8T3Mklm8k=
Subject: Re: [PATCH 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
 <a384c467-048d-1296-4a0d-ecbf4cea844d@flygoat.com>
 <7306f77f-b70a-862d-b4c5-d8f20102dc62@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a3e4cd0f-7500-b994-15b1-8df1cff24ab5@flygoat.com>
Date:   Fri, 30 Oct 2020 20:13:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7306f77f-b70a-862d-b4c5-d8f20102dc62@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 20384400BD
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
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



在 2020/10/30 14:22, Tiezhu Yang 写道:
> On 10/30/2020 12:00 PM, Jiaxun Yang wrote:
>>
>>
>> 在 2020/10/29 16:02, Tiezhu Yang 写道:
>>> The field LPA of CP0_CONFIG3 register is read only for Loongson64, 
>>> so the
>>> write operations are meaningless, remove them.
>>>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 
>>> --------
>>>   arch/mips/loongson64/numa.c                               | 3 ---
>>>   2 files changed, 11 deletions(-)
>> Hi Tiezhu,
>>
>> AFAIK it's not read only on 3A1000.
>> Have you check with hardware guys?
>
> Hi Jiaxun,
>
> Yes, I checked it before send this patch,  the field LPA of CP0_CONFIG3
> on 3A1000 is also read only,  we can see the related description in the
> chapter 3.22 of Loongson_3A1000_cpu_user_2.

On page 36, it said:
"能否写ELPA位依赖于Config3寄存器的LPA域 。当Config3的LPA位为0时，
PageGrain的ELPA位被置位。"

Don't know if it matters.

@Huacai, Any comments? Do you know why it exists here?

Thanks

- Jiaxun

