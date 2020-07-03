Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04307213076
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2020 02:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGCAcd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Jul 2020 20:32:33 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:35336 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGCAcc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Jul 2020 20:32:32 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 67E83262F0
        for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2020 00:32:29 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 8D0273F201;
        Thu,  2 Jul 2020 20:32:26 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id D4CDD2A4F0;
        Fri,  3 Jul 2020 02:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1593736345;
        bh=GRPJVYy2hhvBckQWrUxVKG+/mLpWeEktTCIXOgs9i/o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sSVZ0TtcRY/sEMxwlWtZS5tNWzpywwFtKNPhaiG1h+em9Cv+YfTWNMrpG7mHDKc1d
         Xd59WZfsZn9o713oE8NwXxgllJnj5nD+8xF6h9OsbTR4i+ShUz5NR6yRweU7kxexyA
         Qt+PZDCWNBv8XdGHCksIw8ua50QqkaTpsz8n436s=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a1-QQBFeuNBf; Fri,  3 Jul 2020 02:32:23 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  3 Jul 2020 02:32:23 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 39E7C4084C;
        Fri,  3 Jul 2020 00:32:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="RGNFEc5R";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [38.39.233.129])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1AFBA403B3;
        Fri,  3 Jul 2020 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1593736328;
        bh=GRPJVYy2hhvBckQWrUxVKG+/mLpWeEktTCIXOgs9i/o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RGNFEc5Rlc7Cyii1p1X09WTi6RrSSL7QCAFUH+SnfazYyk3Rh5kO+d9BGXfIReXzi
         fKcCCbx+AkGu2EF1EEezIT0S0T3yBmoD9jFSHLl+8ER0M1ru6I4U85XsjSYQ4getjL
         8SxVN7kSKk9ED5LwoCeTL4V1K6Pxfm7LZIhXoj6o=
Subject: Re: [PATCH] MIPS: Fix ejtag debug buffer address of per cpu
To:     Heiher <r@hev.cc>, linux-mips@linux-mips.org
Cc:     Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
References: <20200703000533.1716-1-r@hev.cc>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <95165841-879d-c9fc-6628-446899bcd315@flygoat.com>
Date:   Fri, 3 Jul 2020 08:32:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703000533.1716-1-r@hev.cc>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 39E7C4084C
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
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



ÔÚ 2020/7/3 ÉÏÎç8:05, Heiher Ð´µÀ:
> From: Heiher <r@hev.cc>
>
> We can directly calculate pointer type offset of per cpu
> by shifting SMP_CPUID_PTRSHIFT.
>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Heiher <r@hev.cc>
> ---
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Btw:
linux-mips@linux-mips.org have been abandoned, please go to the new
list: linux-mips@vger.kernel.org.

Thanks.

>   arch/mips/kernel/genex.S | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a1b966f3578e..a1ebb94b3626 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -369,7 +369,6 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
>   
>   	ASM_CPUID_MFC0 k1, ASM_SMP_CPUID_REG
>   	PTR_SRL	k1, SMP_CPUID_PTRSHIFT
> -	PTR_SLL	k1, LONGLOG
>   	PTR_LA	k0, ejtag_debug_buffer_per_cpu
>   	PTR_ADDU k0, k1
>   
> @@ -392,7 +391,6 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
>   #ifdef CONFIG_SMP
>   	ASM_CPUID_MFC0 k1, ASM_SMP_CPUID_REG
>   	PTR_SRL	k1, SMP_CPUID_PTRSHIFT
> -	PTR_SLL	k1, LONGLOG
>   	PTR_LA	k0, ejtag_debug_buffer_per_cpu
>   	PTR_ADDU k0, k1
>   	LONG_L	k1, 0(k0)
