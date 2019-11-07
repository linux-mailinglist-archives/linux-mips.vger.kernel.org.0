Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B591F2632
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 05:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733118AbfKGECL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 23:02:11 -0500
Received: from forward101j.mail.yandex.net ([5.45.198.241]:60452 "EHLO
        forward101j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733102AbfKGECK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 23:02:10 -0500
Received: from mxback30j.mail.yandex.net (mxback30j.mail.yandex.net [IPv6:2a02:6b8:0:1619::230])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id D99941BE0E13;
        Thu,  7 Nov 2019 07:02:07 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback30j.mail.yandex.net (mxback/Yandex) with ESMTP id sNgr661AJy-27quBTtL;
        Thu, 07 Nov 2019 07:02:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573099327;
        bh=ABNYoeFbjFr6GJhXKkIl7kshYus453HnOTgEbmSAk10=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=bQZ/jf1sYK+qlYtelGo4Bus4PsjmHS/6R37d2JLLVMo9yjKiZA1G2cyD+UqspAu36
         IJdyvL2t90/UVd+I1PjXfZymErdv9VmAMBzGuHczR3/2A2e/RELxn+qJ6wUvbk5ZC8
         oZlzlPlzI6fzvBUF/LxX1IHFxj3YrRJNPR8Ns8+U=
Authentication-Results: mxback30j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id Z8DeRIVREY-24VmHglB;
        Thu, 07 Nov 2019 07:02:06 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/5] MIPS: Loongson64: Drop setup_pcimap
Date:   Thu,  7 Nov 2019 12:01:18 +0800
Message-Id: <20191107040118.10685-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
References: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

setup_pcimap is used to setup address windows for Loongson-3
built-in PCI-X controller, but this function is never been used
in the real world and lack of support in kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/pci.c | 43 --------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
index 7bbe2388f38e..e84ae20c3290 100644
--- a/arch/mips/loongson64/pci.c
+++ b/arch/mips/loongson64/pci.c
@@ -31,54 +31,11 @@ static struct pci_controller  loongson_pci_controller = {
 	.io_offset	= 0x00000000UL,
 };
 
-static void __init setup_pcimap(void)
-{
-	/*
-	 * local to PCI mapping for CPU accessing PCI space
-	 * CPU address space [256M,448M] is window for accessing pci space
-	 * we set pcimap_lo[0,1,2] to map it to pci space[0M,64M], [320M,448M]
-	 *
-	 * pcimap: PCI_MAP2  PCI_Mem_Lo2 PCI_Mem_Lo1 PCI_Mem_Lo0
-	 *	     [<2G]   [384M,448M] [320M,384M] [0M,64M]
-	 */
-	LOONGSON_PCIMAP = LOONGSON_PCIMAP_PCIMAP_2 |
-		LOONGSON_PCIMAP_WIN(2, LOONGSON_PCILO2_BASE) |
-		LOONGSON_PCIMAP_WIN(1, LOONGSON_PCILO1_BASE) |
-		LOONGSON_PCIMAP_WIN(0, 0);
-
-	/*
-	 * PCI-DMA to local mapping: [2G,2G+256M] -> [0M,256M]
-	 */
-	LOONGSON_PCIBASE0 = 0x80000000ul;   /* base: 2G -> mmap: 0M */
-	/* size: 256M, burst transmission, pre-fetch enable, 64bit */
-	LOONGSON_PCI_HIT0_SEL_L = 0xc000000cul;
-	LOONGSON_PCI_HIT0_SEL_H = 0xfffffffful;
-	LOONGSON_PCI_HIT1_SEL_L = 0x00000006ul; /* set this BAR as invalid */
-	LOONGSON_PCI_HIT1_SEL_H = 0x00000000ul;
-	LOONGSON_PCI_HIT2_SEL_L = 0x00000006ul; /* set this BAR as invalid */
-	LOONGSON_PCI_HIT2_SEL_H = 0x00000000ul;
-
-	/* avoid deadlock of PCI reading/writing lock operation */
-	LOONGSON_PCI_ISR4C = 0xd2000001ul;
-
-	/* can not change gnt to break pci transfer when device's gnt not
-	deassert for some broken device */
-	LOONGSON_PXARB_CFG = 0x00fe0105ul;
-
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-	/*
-	 * set cpu addr window2 to map CPU address space to PCI address space
-	 */
-	LOONGSON_ADDRWIN_CPUTOPCI(ADDRWIN_WIN2, LOONGSON_CPU_MEM_SRC,
-		LOONGSON_PCI_MEM_DST, MMAP_CPUTOPCI_SIZE);
-#endif
-}
 
 extern int sbx00_acpi_init(void);
 
 static int __init pcibios_init(void)
 {
-	setup_pcimap();
 
 	loongson_pci_controller.io_map_base = mips_io_port_base;
 	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
-- 
2.20.1

