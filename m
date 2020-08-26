Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702192524F0
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 03:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgHZBLn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 21:11:43 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:45215 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgHZBLi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Aug 2020 21:11:38 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 97EA72008F;
        Wed, 26 Aug 2020 01:11:35 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 2F4A83F1C5;
        Tue, 25 Aug 2020 21:11:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 763672A90E;
        Wed, 26 Aug 2020 03:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1598404292;
        bh=bKNHV8QveD/p5NgbIWUCPUPbPjKF59Td/+XweN6nEtk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=ktiAugnt5+bUlvMFeqm799jWWiPODSEPfThdMh9MKifksyA+hUCJFSxhxVJui6gpR
         6PEIGzpgLb0bYfbB18fE7V6KLjuhdGEiOnQkx7tIIewb4QPR9CEqUZnpeshhFyKIk9
         s9cyys3VGjyGr9ZyBvp9cQsOEyy8X1+4FzIXWxYY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AUIIMSPDVqYs; Wed, 26 Aug 2020 03:11:31 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 26 Aug 2020 03:11:31 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 242BF41194;
        Wed, 26 Aug 2020 01:11:28 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Wwu1HF0z";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.39])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1CCD540859;
        Wed, 26 Aug 2020 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1598404065;
        bh=bKNHV8QveD/p5NgbIWUCPUPbPjKF59Td/+XweN6nEtk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=Wwu1HF0zSQEc1/U07xbHxfliYEV4M0fkdnj+6PFgk9lz/Ta+2VYABQncdZTsEmwop
         ICxvlZRlm1wHXsro8MM7JYAA+hWQQwfJLC1xefYAmzS0vt6VqdrIsCOOpE5JrlODDv
         Iv19Lty2UJikD5mZn8DzWisHv6BtoIcpPkrKgqMI=
Subject: Re: [PATCH 2/4] MIPS: Loongson2ef: Remove specific mc146818rtc.h
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200825090907.66681-1-tsbogend@alpha.franken.de>
 <20200825090907.66681-2-tsbogend@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <42468082-3ae4-7655-b19a-2a952d888612@flygoat.com>
Date:   Wed, 26 Aug 2020 09:07:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825090907.66681-2-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 242BF41194
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[3];
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



ÔÚ 2020/8/25 ÏÂÎç5:09, Thomas Bogendoerfer Ð´µÀ:
> Loonson2ef's mc146818rtc.h is the same as the generic one -> remove it.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   .../include/asm/mach-loongson2ef/mc146818rtc.h     | 36 ----------------------
>   1 file changed, 36 deletions(-)
>   delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
>
> diff --git a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
> deleted file mode 100644
> index 00d602629a55..000000000000
> --- a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/*
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> - *
> - * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle (ralf@linux-mips.org)
> - *
> - * RTC routines for PC style attached Dallas chip.
> - */
> -#ifndef __ASM_MACH_LOONGSON2EF_MC146818RTC_H
> -#define __ASM_MACH_LOONGSON2EF_MC146818RTC_H
> -
> -#include <linux/io.h>
> -
> -#define RTC_PORT(x)	(0x70 + (x))
> -#define RTC_IRQ		8
> -
> -static inline unsigned char CMOS_READ(unsigned long addr)
> -{
> -	outb_p(addr, RTC_PORT(0));
> -	return inb_p(RTC_PORT(1));
> -}
> -
> -static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
> -{
> -	outb_p(addr, RTC_PORT(0));
> -	outb_p(data, RTC_PORT(1));
> -}
> -
> -#define RTC_ALWAYS_BCD	0
> -
> -#ifndef mc146818_decode_year
> -#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1970)
> -#endif
> -
> -#endif /* __ASM_MACH_LOONGSON2EF_MC146818RTC_H */
