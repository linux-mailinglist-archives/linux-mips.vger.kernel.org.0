Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320492CD293
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 10:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgLCJdd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 04:33:33 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:35559 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgLCJda (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 04:33:30 -0500
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id F06C020100;
        Thu,  3 Dec 2020 09:32:36 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id BE9A93F1CF;
        Thu,  3 Dec 2020 10:31:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id E28022A0C9;
        Thu,  3 Dec 2020 04:31:03 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1606987863;
        bh=v7T8V7C33ooClkKj6r4lkNCW6USJAAaf8IdvQWYW4so=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=ICLYPp1Ia73EZtBjRnJ6vYdvO00+NIrbdkW0wS+joafMM5DMugLnjsFX7sKHHidS3
         9ekfkJCbX59AjMPqIg4JRj5MjH4S5aYBXDFyqnF+S5k5Ic18NguJiZT5+skAXsZkgx
         Da19sSAK2zdcIm+3Sh1CWKGV6C3EDEV1bnUUURLg=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mLMK-b_XLpDA; Thu,  3 Dec 2020 04:30:59 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  3 Dec 2020 04:30:59 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 32A8B41F43;
        Thu,  3 Dec 2020 09:30:58 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="ca4EKbpi";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (li1861-199.members.linode.com [172.105.207.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id B1FDE41F43;
        Thu,  3 Dec 2020 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1606987845;
        bh=v7T8V7C33ooClkKj6r4lkNCW6USJAAaf8IdvQWYW4so=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=ca4EKbpi3G8Ya/Vg1SXcTCDTP+7UV29GFJb3zO9wlYgRGsdtw/4ruhIOUW/M+2ufN
         iVg/gGh/WKtvqPn7/uGt+GixhpDxnOdVWMr4bed0tUt+bwDvrES/b+4yv7y3aKdsDp
         Nf4dggsw7c0TYMYjUDN4EQjDFSYzkfitH1TSbZk8=
Date:   Thu, 03 Dec 2020 17:30:39 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Fix up reserving kernel memory range
User-Agent: K-9 Mail for Android
In-Reply-To: <1606299062-7427-1-git-send-email-hejinyang@loongson.cn>
References: <1606299062-7427-1-git-send-email-hejinyang@loongson.cn>
Message-ID: <6390E59E-343C-4864-8FFF-87D82CC5097C@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 32A8B41F43
X-Spamd-Result: default: False [2.90 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.105.207.199:received];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
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
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B411=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
6:11:02, Jinyang He <hejinyang@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Reserve memory from &_text to &_end=2E Otherwise if kernel address
>was modified, the memory range of start_pfn to kernel_start_pfn
>would be reserved=2E Then we could not use this range=2E

I suspect you meant to make use lower memory after relocation?

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

Thanks=2E

- Jiaxun

>
>Signed-off-by: Jinyang He <hejinyang@loongson=2Ecn>
>---
> arch/mips/loongson64/numa=2Ec | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/arch/mips/loongson64/numa=2Ec b/arch/mips/loongson64/numa=2E=
c
>index 509b360=2E=2Ec6f0c48 100644
>--- a/arch/mips/loongson64/numa=2Ec
>+++ b/arch/mips/loongson64/numa=2Ec
>@@ -151,6 +151,9 @@ static void __init node_mem_init(unsigned int node)
> 	NODE_DATA(node)->node_spanned_pages =3D end_pfn - start_pfn;
>=20
> 	if (node =3D=3D 0) {
>+		/* kernel start address */
>+		unsigned long kernel_start_pfn =3D PFN_DOWN(__pa_symbol(&_text));
>+
> 		/* kernel end address */
> 		unsigned long kernel_end_pfn =3D PFN_UP(__pa_symbol(&_end));
>=20
>@@ -158,8 +161,8 @@ static void __init node_mem_init(unsigned int node)
> 		max_low_pfn =3D end_pfn;
>=20
> 		/* Reserve the kernel text/data/bss */
>-		memblock_reserve(start_pfn << PAGE_SHIFT,
>-				 ((kernel_end_pfn - start_pfn) << PAGE_SHIFT));
>+		memblock_reserve(kernel_start_pfn << PAGE_SHIFT,
>+				 ((kernel_end_pfn - kernel_start_pfn) << PAGE_SHIFT));
>=20
> 		/* Reserve 0xfe000000~0xffffffff for RS780E integrated GPU */
> 		if (node_end_pfn(0) >=3D (0xffffffff >> PAGE_SHIFT))
