Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89ED029FC72
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 05:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJ3ECh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 00:02:37 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:37934 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgJ3ECg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Oct 2020 00:02:36 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id CB103260EB;
        Fri, 30 Oct 2020 04:02:03 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id A5F203F162;
        Fri, 30 Oct 2020 05:01:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id C02C82A0F9;
        Fri, 30 Oct 2020 00:00:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1604030459;
        bh=Z75WvSo9SEXtJ8alXdBsXk5kc8Id6pr148RzsDd1w2k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LDh34qEAFtOBpeb9lkDu6d72a7OjofQUszmHSve7c5p5lxz0YUc4grNdCmRNPnhD/
         QLZQwy75XgWB2oktoRMzEOystH3C++oz8gZGRwvl2bRb+rGOmDSDDqDwWsKpcIhjuq
         W8MFRf1eX3SvtUbYb2IxzCJhjJOkkTQs1f5dcMsc=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qD6W3XabIEuZ; Fri, 30 Oct 2020 00:00:58 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 30 Oct 2020 00:00:58 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 3AE7141F14;
        Fri, 30 Oct 2020 04:00:57 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="jECxoBGQ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [113.52.132.214])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id EE15C41F1A;
        Fri, 30 Oct 2020 04:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1604030449;
        bh=Z75WvSo9SEXtJ8alXdBsXk5kc8Id6pr148RzsDd1w2k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jECxoBGQn43D8JNHYmy4MoHic5+QZW7YRH4It5t7Ur1U5v4W+yKZiOee5nrOaN10Y
         I0W8Ki7PIoY6P4Li+Q5MnQsGvt8B08lQloSPYApltXExYMeuiUhWUu6awION9POc8z
         RLkH0kC9csy6sjxiGQVecs+DZOPHbkQXqraRE8Aw=
Subject: Re: [PATCH 1/6] MIPS: Loongson64: Do not write the read only field
 LPA of CP0_CONFIG3
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a384c467-048d-1296-4a0d-ecbf4cea844d@flygoat.com>
Date:   Fri, 30 Oct 2020 12:00:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3AE7141F14
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



ÔÚ 2020/10/29 16:02, Tiezhu Yang Ð´µÀ:
> The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
> write operations are meaningless, remove them.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
>   arch/mips/loongson64/numa.c                               | 3 ---
>   2 files changed, 11 deletions(-)
Hi Tiezhu,

AFAIK it's not read only on 3A1000.
Have you check with hardware guys?

Thanks.

- Jiaxun
