Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D672229031
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 07:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGVF5v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 01:57:51 -0400
Received: from relay3.mymailcheap.com ([217.182.119.157]:57325 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgGVF5u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jul 2020 01:57:50 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 73DB23ECDF;
        Wed, 22 Jul 2020 07:57:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 9EDF42A3B7;
        Wed, 22 Jul 2020 01:57:46 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1595397466;
        bh=GJoB7Hu1HHYwLx+18m5vh2TqCsCvOamF2pFuHKFNT7Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SG5Xm6VchAkjw/SYaCkgiNtbs0tuZAdlfUhLTud/L4U6vi1LIOfqqmgzlqEmaPEwc
         UX3FRXLO7FC37co1kMHNECHLJG/U9DocJJ3Vmsr1/h681Dide6GYcrJtRx0OL6KeYc
         QtrZYozDNR0dY0idaLEjSPjXVpSFBm9cCzL0Zqss=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hcoPqqim3Gns; Wed, 22 Jul 2020 01:57:44 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 22 Jul 2020 01:57:44 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E68044083C;
        Wed, 22 Jul 2020 05:57:40 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="hl2XJLBL";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [210.140.199.71])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6D24F4083C;
        Wed, 22 Jul 2020 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1595397456;
        bh=GJoB7Hu1HHYwLx+18m5vh2TqCsCvOamF2pFuHKFNT7Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hl2XJLBLMvj8A0Wa+uCdDHB6Tpfp9pkthBN2FcPis0CQT5TU++MevcZzo9mOx5JfI
         kbancRKEkJDtDxtOVt8wHLZzWquf/iPJZcI1LJc9RERmZ+PII7u2i4o1xtjB+sTp04
         9vz8vnUhe7nMQQ6q9MHGysLlQk06saH6LYygj1Rs=
Subject: Re: [PATCH v2 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
To:     linux-mips@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
 <20200721141742.996350-4-jiaxun.yang@flygoat.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <004c3248-95f6-03ef-1d39-956794a844a7@flygoat.com>
Date:   Wed, 22 Jul 2020 13:57:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721141742.996350-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: E68044083C
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[11];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[kernel.org,alpha.franken.de,lemote.com,gmail.com,arndb.de,google.com,vger.kernel.org];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/21 ÏÂÎç10:17, Jiaxun Yang Ð´µÀ:
> It can be very big on LS7A PCH systems.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/include/asm/io.h                     | 3 ++-
>   arch/mips/include/asm/mach-loongson64/spaces.h | 3 +--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 346fffd9e972..0072489325fa 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -50,8 +50,9 @@
>   # define __relaxed_ioswabq ioswabq
>   
>   /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
> -
> +#ifndef IO_SPACE_LIMIT
>   #define IO_SPACE_LIMIT 0xffff
> +#endif
>   
>   /*
>    * On MIPS I/O ports are memory mapped, so we access them using normal
> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
> index 3de0ac9d8829..fa5ea4ee8b6c 100644
> --- a/arch/mips/include/asm/mach-loongson64/spaces.h
> +++ b/arch/mips/include/asm/mach-loongson64/spaces.h
> @@ -11,8 +11,7 @@
>   #define PCI_IOSIZE	SZ_16M
>   #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
>   
> -/* Reserved at the start of PCI_IOBASE for legacy drivers */
> -#define MMIO_LOWER_RESERVED	0x10000
> +#define IO_SPACE_LIMIT  PCI_IOSIZE
Oops, it should be (PCI_IOSIZE - 1), will fix in next revision.

Sorry for the noise.

Thanks.

- Jiaxun

>   
>   #include <asm/mach-generic/spaces.h>
>   #endif
