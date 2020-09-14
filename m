Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10F62683B2
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 06:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgINEf4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 00:35:56 -0400
Received: from relay4.mymailcheap.com ([137.74.80.154]:37457 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgINEfz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Sep 2020 00:35:55 -0400
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 928593F1CF;
        Mon, 14 Sep 2020 06:35:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 5F0322A7D9;
        Mon, 14 Sep 2020 06:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600058151;
        bh=A/5yL0BOx2box3oKLSTZYopSLFSON7BKKBi1tNjw4YM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=zMM2Ns4/V9cr3stuZl6W/6DYsZ4fSPamg5k4C2IAGS8qSy+B5a9sP4Z9LFMymfXrp
         rjZapn1/fgd+kmMlAvAPxLoZdKUgOyATlglm9HK3ARW8mSehP0vDJaJZZj1yf8DJ6N
         INLQeW+jP5UkB1pfK+oxLXsDKLqTCFUGf0YxJU8k=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2LzTw4deotr6; Mon, 14 Sep 2020 06:35:49 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 14 Sep 2020 06:35:49 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B5B3240EEC;
        Mon, 14 Sep 2020 04:35:46 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="uJnqo27J";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8E72540FFE;
        Mon, 14 Sep 2020 04:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600057933;
        bh=A/5yL0BOx2box3oKLSTZYopSLFSON7BKKBi1tNjw4YM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uJnqo27J/0mSbwtRX9cy2MozObgWFyl4cykt+vo0a1ym5mpfUAFIg1+FM4aCnb9NZ
         q2VfNINpsLAuWqaC+wRz7O2TJwjakPGvGz+4Ftl3zlrL6/cZdNOsqOhJL9ZH5hAnf/
         AwbSPyh/15Qe7v/mJnMc1At2yW4H9wueMxlxUB+Y=
Subject: Re: [PATCH] MIPS: Remove unused BOOT_MEM_INIT_RAM
To:     Youling Tang <tangyouling@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1599875955-9207-1-git-send-email-tangyouling@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <f2349dc3-8086-64ee-e2d7-7a69afac6623@flygoat.com>
Date:   Mon, 14 Sep 2020 12:32:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <1599875955-9207-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B5B3240EEC
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
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
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/9/12 9:59, Youling Tang Ð´µÀ:
> Commit a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") left
> the BOOT_MEM_INIT_RAM unused, remove it.
>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   arch/mips/include/asm/bootinfo.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
> index 147c932..39196ae 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -91,7 +91,6 @@ extern unsigned long mips_machtype;
>   #define BOOT_MEM_RAM		1
>   #define BOOT_MEM_ROM_DATA	2
>   #define BOOT_MEM_RESERVED	3
> -#define BOOT_MEM_INIT_RAM	4

If you're willing to remove that you'd better turn the memtype struct
into a enum.

Btw: It seems you've done a lot of minor clean-up works recently,
if you'd like to I think you can try to turn all the platforms into memblock
and remove all these gules between memblock and legacy code.

Thanks.

- Jiaxun

>   #define BOOT_MEM_NOMAP		5
>   
>   extern void add_memory_region(phys_addr_t start, phys_addr_t size, long type);
