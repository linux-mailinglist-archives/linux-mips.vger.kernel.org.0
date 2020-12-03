Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA4B2CD28F
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 10:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387563AbgLCJac (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 04:30:32 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:35553 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728619AbgLCJab (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 04:30:31 -0500
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id C3C7720101;
        Thu,  3 Dec 2020 09:29:37 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id F0D433ECDA;
        Thu,  3 Dec 2020 10:28:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 428CC2A0C9;
        Thu,  3 Dec 2020 04:28:05 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1606987685;
        bh=+gUfBrjNvVoX5DQET2mmuU5KBNhPv9dhMqEBwM5WILw=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=x3ux+XDIH3E/Xwi9HkF99MqHTlBJZ/Eo2yj8XjarkmUEr5jit/vWljx7IHkHQLJcE
         CVKA/cE0YkP5TMoFytgtZUSA3HtCiEyvUAiCA2IaG3wM23hUYeJu+lPcMxJ8cim9Ug
         3u6uvcSmJISpDh/szCvqsEmRDFMXScCoINVD/6F4=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WmoD59LflxFz; Thu,  3 Dec 2020 04:28:03 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  3 Dec 2020 04:28:02 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 29A3041F6A;
        Thu,  3 Dec 2020 09:28:01 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="gIkfMOXQ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (li1861-199.members.linode.com [172.105.207.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 9331741F62;
        Thu,  3 Dec 2020 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1606987672;
        bh=+gUfBrjNvVoX5DQET2mmuU5KBNhPv9dhMqEBwM5WILw=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=gIkfMOXQBvHno58Zl1uug6Ignee9/Q7FAdSdtNsasffNPDvJQwoQyBxJUKLB3CUT1
         vUe8nZihtHfOqvT0Alvrt4wRumI9zf0TTKGo5t+IJ8zqvPayukGK8+fvXpwIlg9Hxw
         v3eJ/1cteq0RvwOEnTrMdRtveW5PDnrflChk4GQo=
Date:   Thu, 03 Dec 2020 17:27:45 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Add fix_range_node after parse "mem=" parameter
User-Agent: K-9 Mail for Android
In-Reply-To: <1606985867-9791-3-git-send-email-hejinyang@loongson.cn>
References: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn> <1606985867-9791-3-git-send-email-hejinyang@loongson.cn>
Message-ID: <A9C59E61-FBF7-4AED-AF87-DB3AAB913871@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 29A3041F6A
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



=E4=BA=8E 2020=E5=B9=B412=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:57:47, Jinyang He <hejinyang@loongson=2Ecn> =E5=86=99=E5=88=B0:
>This problem may only occur on NUMA platforms=2E When machine start
>with the "mem=3D" parameter on Loongson64, it cannot boot=2E When parsing=
 the
>"mem=3D" parameter, first all the RAM was removed, and then the memory wa=
s
>not added by memblock_add_node(), which caused the newly added memory to
>be on MAX_NUMNODES=2E The key to solve this problem is to fix these memor=
y
>nodes through memblock_set_node() before bootmem_init() or earlier=2E So
>it would be better to fix it before check_kernel_sections_mem()=2E
>The check_kernel_sections_mem() will check whether the current RAM can be
>used by the kernel=2E If this fix is added after that, it will do a redun=
dant
>memblock_add operation=2E Adding the fixup_region_node() function can als=
o
>provide a reference for future platforms using NUMA when encountering
>such problems=2E

Hi Jingyang,

Is it possible to do it when parsing cmdline to avoid this kind of fixup?

Thanks=2E

- Jiaxun

>
>Signed-off-by: Jinyang He <hejinyang@loongson=2Ecn>
>---
> arch/mips/include/asm/bootinfo=2Eh |  1 +
> arch/mips/kernel/setup=2Ec         |  6 +++++-
> arch/mips/loongson64/numa=2Ec      | 11 +++++++++++
> 3 files changed, 17 insertions(+), 1 deletion(-)
>
>diff --git a/arch/mips/include/asm/bootinfo=2Eh b/arch/mips/include/asm/b=
ootinfo=2Eh
>index aa03b12=2E=2Eddc17b1 100644
>--- a/arch/mips/include/asm/bootinfo=2Eh
>+++ b/arch/mips/include/asm/bootinfo=2Eh
>@@ -91,6 +91,7 @@ const char *get_system_type(void);
> extern unsigned long mips_machtype;
>=20
> extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min, =
 phys_addr_t sz_max);
>+extern void fixup_region_node(void);
>=20
> extern void prom_init(void);
> extern void prom_free_prom_memory(void);
>diff --git a/arch/mips/kernel/setup=2Ec b/arch/mips/kernel/setup=2Ec
>index b3a711e=2E=2Efe93882 100644
>--- a/arch/mips/kernel/setup=2Ec
>+++ b/arch/mips/kernel/setup=2Ec
>@@ -110,6 +110,8 @@ void __init detect_memory_region(phys_addr_t start, p=
hys_addr_t sz_min, phys_add
> 	memblock_add(start, size);
> }
>=20
>+void __weak fixup_region_node(void) {}
>+
> /*
>  * Manage initrd
>  */
>@@ -631,8 +633,10 @@ static void __init arch_mem_init(char **cmdline_p)
>=20
> 	parse_early_param();
>=20
>-	if (usermem)
>+	if (usermem) {
> 		pr_info("User-defined physical RAM map overwrite\n");
>+		fixup_region_node();
>+	}
>=20
> 	check_kernel_sections_mem();
>=20
>diff --git a/arch/mips/loongson64/numa=2Ec b/arch/mips/loongson64/numa=2E=
c
>index c6f0c48=2E=2Ed8661cc 100644
>--- a/arch/mips/loongson64/numa=2Ec
>+++ b/arch/mips/loongson64/numa=2Ec
>@@ -220,6 +220,17 @@ void __init mem_init(void)
> 	mem_init_print_info(NULL);
> }
>=20
>+void __init fixup_region_node(void)
>+{
>+	phys_addr_t start, end;
>+	u64 i;
>+
>+	for_each_mem_range(i, &start, &end) {
>+		memblock_set_node(start, end - start,
>+				  &memblock=2Ememory, pa_to_nid(start));
>+	}
>+}
>+
> /* All PCI device belongs to logical Node-0 */
> int pcibus_to_node(struct pci_bus *bus)
> {
