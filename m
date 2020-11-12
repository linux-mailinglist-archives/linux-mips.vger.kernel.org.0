Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB6D2B0281
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 11:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgKLKJf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 05:09:35 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:49915 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgKLKJf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 05:09:35 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 3E63B3ECDF;
        Thu, 12 Nov 2020 11:09:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 22C532A7E9;
        Thu, 12 Nov 2020 11:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1605175772;
        bh=NlIHu2jLAeMCc08fA5CldPEhSWuTo3YbGR98d+676LU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=TvLxNDXH+yPXYcA8PquO6rIiQnOcsDFHi3p420QeEhQfDBNd/ZYjDBb2jzoCaGINO
         L2cfz/BT5vnYgCaLTqw/2yP6j1KaAEO2x7hNXgHFNrGuFJjaF7fXhsNorSWmY4Ac69
         eqNktyJwXzmEtChMfASexPUnR3BaHYYEFeTbcqz0=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Fh95Qr0wFCol; Thu, 12 Nov 2020 11:09:31 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 12 Nov 2020 11:09:31 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id A4EA441DB0;
        Thu, 12 Nov 2020 10:09:30 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="LD4GEss/";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id DCF9541DB0;
        Thu, 12 Nov 2020 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1605175763;
        bh=NlIHu2jLAeMCc08fA5CldPEhSWuTo3YbGR98d+676LU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=LD4GEss/iLp7HkKvA+8OdNvI5FK0c5bHB3V+LYMIGNRO5L6yDQllFAssI/Q1XY93T
         UEH8tF6S0qfzVxSASRGlGv6+yrWAgjAn93RdrEVZnKMXNE1Hi9D2AR2/yg+8IW9MvK
         JYHbLoDIWY80YheoNu+Qmgwk1yZDuY60s5xVjZVs=
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
 <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
Message-ID: <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com>
Date:   Thu, 12 Nov 2020 18:09:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A4EA441DB0
X-Spamd-Result: default: False [2.90 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[113.52.132.214:received];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[7];
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



在 2020/11/12 18:04, Jiaxun Yang 写道:
> Hi Tiezhu,
>
> 在 2020/11/12 16:29, Tiezhu Yang 写道:
>> Add read_persistent_clock64() to read the time from the battery backed
>> persistent clock. With this patch, we can fix the wrong time issue due
>> to the system clock is not consistent with hardware clock after resume
>> from sleep state S3 (suspend to RAM), at the same time, the system time
>> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc 
>> driver.
>>
>> start_kernel()
>>    timekeeping_init()
>>      read_persistent_wall_and_boot_offset()
>>        read_persistent_clock64()
>>
>> timekeeping_resume()
>>    read_persistent_clock64()
>>
>> timekeeping_suspend()
>>    read_persistent_clock64()
>
> It is highly discoraged to do anything with bridgetype, which isn't 
> probed via
> devicetree.
>
> Please check if you can deal with that inside RTC framework, or make 
> it as
> a part of RTC driver (e.g. set up a callback).
>
> Also you should submit RTC driver at first if you intend to complete 
> LS7A support.

Oops,
Just dig it deeper, I guess simply select RTC_HCTOSYS would solve the issue.
We're trying very hard to decouple all the drivers and conponents,
DeviceTree for all!

>
> Thanks.
>
> - Jiaxun
>
>>
>> Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
