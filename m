Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195CD2DED6D
	for <lists+linux-mips@lfdr.de>; Sat, 19 Dec 2020 07:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgLSGKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Dec 2020 01:10:39 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:49462 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgLSGKj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Dec 2020 01:10:39 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 148B03F15F;
        Sat, 19 Dec 2020 07:09:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 411CB2A370;
        Sat, 19 Dec 2020 01:09:04 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1608358144;
        bh=gk2cwIf9GWzw4+jxbPQD/ehzAKpzPzbwiRv/v9E0dt8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=alFmUqs9PPPOTfvnx5vy4ttyVeRnNjvjGy5rADw0vjkArAr7qlwrgDLMFEsJ5rPhj
         oKueTvq4oeW8ics4aFum4kJaBeAy78gm3JBzhYtorTlgfZKv3s7TJp561V7jwnUNgU
         dN89ghlRGZ5Gn1X0f/Rn7mikLndvRyFhVtkRLhLc=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id s4CBEzzpZQ_O; Sat, 19 Dec 2020 01:09:03 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 19 Dec 2020 01:09:03 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 5E0E842F8B;
        Sat, 19 Dec 2020 06:09:00 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="qbeQHR5A";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (114-42-199-102.dynamic-ip.hinet.net [114.42.199.102])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7D4D842F8B;
        Sat, 19 Dec 2020 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1608358136;
        bh=gk2cwIf9GWzw4+jxbPQD/ehzAKpzPzbwiRv/v9E0dt8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qbeQHR5A2T8fFK7CPxTOz9t0Lql4K8Wa1dVeLwJgrox5eL9ycxXQnnLGmIDW0Ghsn
         V03yWpY0bW785ObGs3aSElWHpmWkpj3Fg0jjaGlIe3F67eN7mYnhlGzZJ60dwujwnh
         0s07nGx7MeER3VPGgR2YbSrPnlm4gaBLxi00pDJQ=
Subject: Re: [PATCH] MIPS: OCTEON: Add OCTEON II build and configuration
 option
To:     jiaqingtong97@163.com, tsbogend@alpha.franken.de,
        mark.tomlinson@alliedtelesis.co.nz, paulburton@kernel.org
Cc:     linux-mips@vger.kernel.org
References: <20201218162845.9317-1-jiaqingtong97@163.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c749749f-0d9b-461d-0f9b-f8ac828a7681@flygoat.com>
Date:   Sat, 19 Dec 2020 14:08:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218162845.9317-1-jiaqingtong97@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[114.42.199.102:received];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[163.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[163.com,alpha.franken.de,alliedtelesis.co.nz,kernel.org];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 5E0E842F8B
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/19 上午12:28, jiaqingtong97@163.com 写道:
> From: Jia Qingtong <jiaqingtong97@163.com>
>
> If building for OCTEON II only,we can select compiler options that
> give better code, but will not run on earlier chips.


I'd rather add a workaround Kconfig option and default y for it.
In case no other optimization can be enabled for OCTANE2, like

WORKAROUND_OCTANE_BARRIER

Thanks

- Jiaxun

>
> Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
> ---
>   arch/mips/cavium-octeon/Kconfig | 9 +++++++++
>   arch/mips/include/asm/sync.h    | 3 ++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
> index 4984e462be30..3e0759142656 100644
> --- a/arch/mips/cavium-octeon/Kconfig
> +++ b/arch/mips/cavium-octeon/Kconfig
> @@ -1,6 +1,15 @@
>   # SPDX-License-Identifier: GPL-2.0
>   if CPU_CAVIUM_OCTEON
>   
> +config CAVIUM_OCTEON2
> +	bool "Build the kernel to be used only OCTEON II processor cores"
> +	default "n"
> +	help
> +		This option enables the generation of Octeon2 specific
> +		instructions by the compiler, resulting in a kernel that is
> +		more efficient, but that will not run on Octeon and
> +		OcteonPlus processor cores.
> +
>   config CAVIUM_CN63XXP1
>   	bool "Enable CN63XXP1 errata workarounds"
>   	default "n"
> diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
> index aabd097933fe..fda181c16c5f 100644
> --- a/arch/mips/include/asm/sync.h
> +++ b/arch/mips/include/asm/sync.h
> @@ -155,10 +155,11 @@
>    * effective barrier as noted by commit 6b07d38aaa52 ("MIPS: Octeon: Use
>    * optimized memory barrier primitives."). Here we specify that the affected
>    * sync instructions should be emitted twice.
> + * Cavium OcteonII and later CPUs has fixed above bug.
>    * Note that this expression is evaluated by the assembler (not the compiler),
>    * and that the assembler evaluates '==' as 0 or -1, not 0 or 1.
>    */
> -#ifdef CONFIG_CPU_CAVIUM_OCTEON
> +#if defined CONFIG_CPU_CAVIUM_OCTEON && !defined CONFIG_CAVIUM_OCTEON2
>   # define __SYNC_rpt(type)	(1 - (type == __SYNC_wmb))
>   #else
>   # define __SYNC_rpt(type)	1
