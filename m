Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9C8270B5A
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 09:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgISHLQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 03:11:16 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:55632 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISHLQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Sep 2020 03:11:16 -0400
X-Greylist: delayed 146809 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 03:11:15 EDT
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id AA5AA200FE;
        Sat, 19 Sep 2020 07:11:13 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id C1F2B3EDEC;
        Sat, 19 Sep 2020 09:11:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 1490E2A3DD;
        Sat, 19 Sep 2020 03:11:10 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600499470;
        bh=z3hhAnAd+DvuM65wkNs1DzrGfBi7t9dZg0UuB7pEzZ8=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=WAj0NNWN61qggB5rfUhQfOMCnjqFyFlxYy30hSuN6JmlZqf3BkBcrWfOgAJchujUY
         c3rYfgpMKZNkee4xKV9ceVm+MQzBhB1xc5GvE7WiDzaYNarafkPznKrA3zeHDXf07A
         bNLyVLdLyFJufRFGaoLCo5yQZWIWUbs4YevOlQI0=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d1t-r5_IWFR8; Sat, 19 Sep 2020 03:11:08 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 19 Sep 2020 03:11:07 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id DAA8C40FE5;
        Sat, 19 Sep 2020 07:11:06 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="mN0NlHE5";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [113.52.132.216])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5A97940FC3;
        Sat, 19 Sep 2020 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600498966;
        bh=z3hhAnAd+DvuM65wkNs1DzrGfBi7t9dZg0UuB7pEzZ8=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=mN0NlHE5SRD6zhr/21NfitIjGekcdpwzX3sDD4eBAFrj/SQs8CsDZWhVlX1FD4CZO
         anAztMQJwdY7BvQBcO5d9E8V/kHK3XR2GnRQvGO3E96I9YL+hRZR/0APjpcATSToaQ
         y7F0Y4iTUFbuGnmei0VKLM9Nzmn8SRfmowcOJLhk=
Date:   Sat, 19 Sep 2020 15:02:38 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Youling Tang <tangyouling@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kexec: Add crashkernel=YM handling
User-Agent: K-9 Mail for Android
In-Reply-To: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
References: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
Message-ID: <3F79DD89-BE1E-456F-9297-273DDBB4E12A@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DAA8C40FE5
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
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B49=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=889=
:55:46, Youling Tang <tangyouling@loongson=2Ecn> =E5=86=99=E5=88=B0:
>When the kernel crashkernel parameter is specified with just a size,
>we are supposed to allocate a region from RAM to store the crashkernel=2E
>However, MIPS merely reserves physical address zero with no checking
>that there is even RAM there=2E
>
>Fix this by lifting similar code from x86, importing it to MIPS with the
>MIPS specific parameters added=2E In the absence of any platform specific
>information, we allocate the crashkernel region from the first 512MB of
>physical memory (limited to CKSEG0 or KSEG0 address range)=2E
>
>When X is not specified, crash_base defaults to 0 (crashkernel=3DYM@XM)=
=2E
>
>E=2Eg=2E without this patch:
>
>The environment as follows:
>[    0=2E000000] MIPS: machine is loongson,loongson64c-4core-ls7a
>=2E=2E=2E
>[    0=2E000000] Kernel command line: root=3D/dev/sda2 crashkernel=3D96M =
=2E=2E=2E
>
>The warning as follows:
>[    0=2E000000] Invalid memory region reserved for crash kernel
>
>And the iomem as follows:
>00200000-0effffff : System RAM
>  00200000-00b47f87 : Kernel code
>  00b47f88-00dfffff : Kernel data
>  00e60000-01f73c7f : Kernel bss
>1a000000-1bffffff : pci@1a000000
>=2E=2E=2E
>
>With this patch:
>
>After increasing crash_base <=3D 0 handling=2E
>
>And the iomem as follows:
>00200000-0effffff : System RAM
>  00200000-00b47f87 : Kernel code
>  00b47f88-00dfffff : Kernel data
>  00e60000-01f73c7f : Kernel bss
>  04000000-09ffffff : Crash kernel
>1a000000-1bffffff : pci@1a000000
>=2E=2E=2E
>
>Signed-off-by: Youling Tang <tangyouling@loongson=2Ecn>
>---
> arch/mips/kernel/setup=2Ec | 24 +++++++++++++++++++++---
> 1 file changed, 21 insertions(+), 3 deletions(-)
>
>diff --git a/arch/mips/kernel/setup=2Ec b/arch/mips/kernel/setup=2Ec
>index bf5f5ac=2E=2E59a88ea 100644
>--- a/arch/mips/kernel/setup=2Ec
>+++ b/arch/mips/kernel/setup=2Ec
>@@ -477,6 +477,11 @@ early_param("elfcorehdr", early_parse_elfcorehdr);
> #endif
>=20
> #ifdef CONFIG_KEXEC
>+
>+/* 64M alignment for crash kernel regions */
>+#define CRASH_ALIGN	SZ_64M
>+#define CRASH_ADDR_MAX	SZ_512M

Hi Youling

How do you determine the alignment requirement?

Can we relax it?

Thanks=2E

- Jiaxun

>+
> static void __init mips_parse_crashkernel(void)
> {
> 	unsigned long long total_mem;
>@@ -489,9 +494,22 @@ static void __init mips_parse_crashkernel(void)
> 	if (ret !=3D 0 || crash_size <=3D 0)
> 		return;
>=20
>-	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_=
size, 1)) {
>-		pr_warn("Invalid memory region reserved for crash kernel\n");
>-		return;
>+	if (crash_base <=3D 0) {
>+		crash_base =3D memblock_find_in_range(CRASH_ALIGN, CRASH_ADDR_MAX,
>+							crash_size, CRASH_ALIGN);
>+		if (!crash_base) {
>+			pr_warn("crashkernel reservation failed - No suitable area found=2E\n=
");
>+			return;
>+		}
>+	} else {
>+		unsigned long long start;
>+
>+		start =3D memblock_find_in_range(crash_base, crash_base + crash_size,
>+						crash_size, 1);
>+		if (start !=3D crash_base) {
>+			pr_warn("Invalid memory region reserved for crash kernel\n");
>+			return;
>+		}
> 	}
>=20
> 	crashk_res=2Estart =3D crash_base;
