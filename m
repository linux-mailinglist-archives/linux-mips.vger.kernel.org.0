Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FA922D5A1
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 09:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgGYHFM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 03:05:12 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:39817 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYHFM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 03:05:12 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 4A2BE200DC
        for <linux-mips@vger.kernel.org>; Sat, 25 Jul 2020 07:05:08 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id B83FA3ECDA;
        Sat, 25 Jul 2020 09:05:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id E451E2A3B2;
        Sat, 25 Jul 2020 03:05:04 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1595660704;
        bh=FyZ0suWkWdaOe9IBFajzdMzE8Qwwp1gogauqnNmWitY=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=uhd0JryCJXlkpONmtw39yNX4K+HiFW32jYtyBw/jEtGrZIfeQNiKBkjTDYwlBx7hf
         TLeNsNkhLsZ7YCoV3E86zdRvWnkPIHDchqPmdRRRJanylQLsC+MAj1xFVy3+OWggfW
         h47JIkibfQXcJTjhqIFZYxRCd0tjBoXw5gbeZkec=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TOlWXv40L7DO; Sat, 25 Jul 2020 03:05:03 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 25 Jul 2020 03:05:03 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id ABDA540136;
        Sat, 25 Jul 2020 07:05:01 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="uRnykR2M";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1CFB54085A;
        Sat, 25 Jul 2020 07:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1595660489;
        bh=FyZ0suWkWdaOe9IBFajzdMzE8Qwwp1gogauqnNmWitY=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=uRnykR2M5Wn6HSmqPePgMytfwXEKAGYu6ZDsDCk1CsWZoLhFseeQE3958/6F0V5Zn
         Y2UdiVUAj0dE9W4OLQVkgGNqRCkMZAcfR/PrXCqVes/vpKg0NnIJTMbAk3cxunC8BI
         RNUfnh3KL9iGNJxf7ytmZTxwhQAyZQGpHvELB2jE=
Subject: Re: [PATCH] MIPS: Fix unable to reserve memory for Crash kernel
To:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org
References: <1595656598-10859-1-git-send-email-hejinyang@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d3ef6a9e-527c-e536-1654-d006cd1b317c@flygoat.com>
Date:   Sat, 25 Jul 2020 15:01:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <1595656598-10859-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ABDA540136
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCPT_COUNT_TWO(0.00)[2];
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



在 2020/7/25 13:56, Jinyang He 写道:
> Use 0 as the align parameter in memblock_find_in_range() is
> incorrect when we reserve memory for Crash kernel.
>
> The environment as follows:
> [    0.000000] MIPS: machine is loongson,loongson64c-4core-rs780e
> ...
> [    1.951016]     crashkernel=64M@128M
>
> The warning as follows:
> [    0.000000] Invalid memory region reserved for crash kernel
>
> And the iomem as follows:
> 00200000-0effffff : System RAM
>    04000000-0484009f : Kernel code
>    048400a0-04ad7fff : Kernel data
>    04b40000-05c4c6bf : Kernel bss
> 1a000000-1bffffff : pci@1a000000
> ...
>
> The align parameter may be finally used by round_down() or round_up().
> Like the following call tree:
>
> mips-next: mm/memblock.c
>
> memblock_find_in_range
> └── memblock_find_in_range_node
>      ├── __memblock_find_range_bottom_up
>      │   └── round_up
>      └── __memblock_find_range_top_down
>          └── round_down
> \#define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
> \#define round_down(x, y) ((x) & ~__round_mask(x, y))
> \#define __round_mask(x, y) ((__typeof__(x))((y)-1))
>
> The round_down(or round_up)'s second parameter must be a power of 2.
> If the second parameter is 0, it both will return 0.
>
> Use 1 as the parameter to fix the bug and the iomem as follows:
> 00200000-0effffff : System RAM
>    04000000-0484009f : Kernel code
>    048400a0-04ad7fff : Kernel data
>    04b40000-05c4c6bf : Kernel bss
>    08000000-0bffffff : Crash kernel
> 1a000000-1bffffff : pci@1a000000
> ...
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Oops, looks like my fault during switch boot_mem_map to memblock.

Thanks.

- Jiaxun

> ---
>   arch/mips/kernel/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 7b537fa..588b212 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -497,7 +497,7 @@ static void __init mips_parse_crashkernel(void)
>   	if (ret != 0 || crash_size <= 0)
>   		return;
>   
> -	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 0)) {
> +	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 1)) {
>   		pr_warn("Invalid memory region reserved for crash kernel\n");
>   		return;
>   	}
