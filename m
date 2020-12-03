Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F092CCDB0
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 05:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgLCEBg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 23:01:36 -0500
Received: from relay5.mymailcheap.com ([159.100.248.207]:55192 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgLCEBf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Dec 2020 23:01:35 -0500
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 4E7B3260EB;
        Thu,  3 Dec 2020 04:00:43 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 50CE63F157;
        Thu,  3 Dec 2020 03:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 8988C2A6DF;
        Thu,  3 Dec 2020 04:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1606967950;
        bh=pbHmkiVjEYzqhucLk4DY2TPZHGhnZIDgErghBAhOyf8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WGgMxGVhnHTXlAlVTAMlS4oc2GTDgisg5Vs4xVp60rhl1FlSA74S4Bz1tmz0+7mQX
         hxl04SFA11bzNYZLcnewdZycmDifxpaQN/ZAZpat1SKBMsgVCDZAMUe0P8SQylFneY
         LWz3E/W3fX0P8hzMC+lK5xwMhqIcHrTkSVJ5VUM4=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3rb4s9I0KOpn; Thu,  3 Dec 2020 04:59:08 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  3 Dec 2020 04:59:08 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 710D6400D5;
        Thu,  3 Dec 2020 03:59:07 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="oLQH0UpH";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1861-199.members.linode.com [172.105.207.199])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4C3634100D;
        Thu,  3 Dec 2020 03:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1606967937;
        bh=pbHmkiVjEYzqhucLk4DY2TPZHGhnZIDgErghBAhOyf8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oLQH0UpHxt1/yDA8aOWTrRLmCNEilsU84LJd8S9oe81b7ZDwYjlzYdYPIB7/f70Zw
         L1Z2LFfZhr3+mc7lQdgiAdkiuPPmbok875VSbTrSnU19WjJFQud/qO7PWqq6IJomB1
         5GEFIwyiEUat+xMy1hglu1JE6if3wJRHDctM4sXs=
Subject: Re: [PATCH 2/2] MIPS: Select ARCH_KEEP_MEMBLOCK to enable sysfs
 memblock debug
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1606965544-22611-1-git-send-email-yangtiezhu@loongson.cn>
 <1606965544-22611-3-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <9c9af0de-387b-f113-b0a2-c5767c31c16d@flygoat.com>
Date:   Thu, 3 Dec 2020 11:58:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1606965544-22611-3-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 710D6400D5
X-Spamd-Result: default: False [2.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.105.207.199:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
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
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/12/3 ÉÏÎç11:19, Tiezhu Yang Ð´µÀ:
> In the current code, CONFIG_ARCH_KEEP_MEMBLOCK is not set for MIPS arch,
> memblock_discard() will discard memory and reserved arrays if they were
> allocated, select ARCH_KEEP_MEMBLOCK to give a chance to track "memory"
> and "reserved" memblocks after early boot, with this patch, we can see
> the following two sysfs interfaces under DEBUG_FS.
>
> /sys/kernel/debug/memblock/memory
> /sys/kernel/debug/memblock/reserved

Is this really necessary?
memblock data is not really necessary after boot for non-debug purpose.

Given that MIPS is widely used in embedded systems which doesn't have much
memory, keeping unused data after boot is kinda unconvincing.

If you intend to debug that please do it locally.

Thanks.

- Jiaxun


>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/mips/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 44a47ad..f65da197 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -9,6 +9,7 @@ config MIPS
>   	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
> +	select ARCH_KEEP_MEMBLOCK
>   	select ARCH_SUPPORTS_UPROBES
>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
