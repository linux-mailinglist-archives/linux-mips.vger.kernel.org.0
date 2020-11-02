Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E402A2880
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 11:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgKBKsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 05:48:15 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:46677 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgKBKsP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Nov 2020 05:48:15 -0500
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id E24632008F;
        Mon,  2 Nov 2020 10:48:12 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 7E12D3F162;
        Mon,  2 Nov 2020 11:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id B65132A2AD;
        Mon,  2 Nov 2020 05:48:09 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604314089;
        bh=hxyT1poswWBoJaaTTVRkPcnfH3Dt9A7ZnvVAXTURqp0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=kwzTvnUad35wr7nSLP7jIoJnMszrTJEAXrP5VK+uYUJZQHllAcEqFU60GQXqFVbhB
         cgolExmx4fGFYMOoJ1XEA+srW4t59POtyRxBe2xhP/HFWiLSTpPCQBHLORt6s5qGEo
         rBJ/EkSnoK/bjcPFPNCIZVLNbkRgHFsg42TLHgJE=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Iz4ZV5Fm_N97; Mon,  2 Nov 2020 05:48:06 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Mon,  2 Nov 2020 05:48:06 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 6E1C041E24;
        Mon,  2 Nov 2020 10:48:03 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="h6AS1WVv";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id A185841E24;
        Mon,  2 Nov 2020 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604314078;
        bh=hxyT1poswWBoJaaTTVRkPcnfH3Dt9A7ZnvVAXTURqp0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=h6AS1WVvpr4zgF+1O2oE8n1L+6ASF9u3h/KFM+mQC+MEqIIySpIIV0LLb2iholfXC
         4Y6l6XG4rA4zobYzSZ3wNzmLApWsZ6MUAsL/Wfa6TGcumoZWVWiH/+RqxMF2OkEpRR
         0EcnrUrN3kywYLT+DhJXR3p+bzjN+tE7UPxwIbww=
Subject: Re: [PATCH 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
 <a384c467-048d-1296-4a0d-ecbf4cea844d@flygoat.com>
 <7306f77f-b70a-862d-b4c5-d8f20102dc62@loongson.cn>
 <a3e4cd0f-7500-b994-15b1-8df1cff24ab5@flygoat.com>
Message-ID: <f901dcdc-9724-a725-87ca-afe2aa216a94@flygoat.com>
Date:   Mon, 2 Nov 2020 18:47:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a3e4cd0f-7500-b994-15b1-8df1cff24ab5@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6E1C041E24
X-Spamd-Result: default: False [3.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         RECEIVED_SPAMHAUS_CSS(1.00)[113.52.132.214:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         ARC_NA(0.00)[];
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



在 2020/10/30 20:13, Jiaxun Yang 写道:
>
>
> 在 2020/10/30 14:22, Tiezhu Yang 写道:
>> On 10/30/2020 12:00 PM, Jiaxun Yang wrote:
>>>
>>>
>>> 在 2020/10/29 16:02, Tiezhu Yang 写道:
>>>> The field LPA of CP0_CONFIG3 register is read only for Loongson64, 
>>>> so the
>>>> write operations are meaningless, remove them.
>>>>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> ---
>>>>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 
>>>> --------
>>>>   arch/mips/loongson64/numa.c | 3 ---
>>>>   2 files changed, 11 deletions(-)
>>> Hi Tiezhu,
>>>
>>> AFAIK it's not read only on 3A1000.
>>> Have you check with hardware guys?
>>
>> Hi Jiaxun,
>>
>> Yes, I checked it before send this patch,  the field LPA of CP0_CONFIG3
>> on 3A1000 is also read only,  we can see the related description in the
>> chapter 3.22 of Loongson_3A1000_cpu_user_2.
>
> On page 36, it said:
> "能否写ELPA位依赖于Config3寄存器的LPA域 。当Config3的LPA位为0时，
> PageGrain的ELPA位被置位。"
>
> Don't know if it matters.
>
> @Huacai, Any comments? Do you know why it exists here?

Confirmed by another rev of the manual that it's only a tip for implementer.
I guess my assumption was wrong.
LPA should be read-only though.....

Thanks
- Jiaxun

>
> Thanks
>
> - Jiaxun
