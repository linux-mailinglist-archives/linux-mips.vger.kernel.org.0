Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF84446EB9
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 16:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhKFPwC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 11:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhKFPwC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Nov 2021 11:52:02 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA45C061570;
        Sat,  6 Nov 2021 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=j8qzGlwrTBpEce87Vbe9I6pnNIX+NnMeGnNkeHgq+lQ=; b=LEtRIktCpeq7jStDHIH3vhgFt8
        8s3cLkKE+EbSglwi87PnWjSwUv3pMsScC6pnasRg/Txwt62HCDGqVRNzGakKcxOvBQosB96ru8mVG
        lB0wenHtxaHbRuCiEuLYjFrAUYJpAjTyIE+0KxVj7YpP9p7VTQTh01/RoO/qX83tCzI+SGxOMsE9Q
        sujEMHZFiPe67/AXpb/YX+uSY6cHXUSZDOn1f84dXcDiHm7Sr3KlX7oBfrGsmBldqmtpkB8eBoX8c
        zGSdgmZT7YZwKot+mkieTkmR4XlVM3bHairfxLLzMnBV64xTm0RFv+567WKNpvE6WiLDqf0vq+YCY
        re60/uOg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjNwS-008ZI5-1w; Sat, 06 Nov 2021 15:49:16 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2] mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
Date:   Sat,  6 Nov 2021 08:49:11 -0700
Message-Id: <20211106154911.26222-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
but kconfig symbol BCM63XX does not provide that info. This leads
to many build errors, e.g.:

   arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
           return x - PAGE_OFFSET + PHYS_OFFSET;
   arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
   #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
   arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
           return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
   arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
   #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)

arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
           return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;


Selecting the SYS_HAS_CPU_BMIPS* symbols causes SYS_HAS_CPU_BMIPS to be
set, which then selects CPU_SUPPORT_32BIT_KERNEL, which causes
CONFIG_32BIT to be set. (a bit more indirect than v1 [RFC].)

Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-mips@vger.kernel.org
Cc: Paul Burton <paulburton@kernel.org>
Cc: Maxime Bizon <mbizon@freebox.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>
Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
---
v2: select 3 SYS_HAS_CPU_BMIPS* symbols that will cause
    CPU_SUPPORTS_32BIT_KERNEL to be set (Florian)

 arch/mips/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20211105.orig/arch/mips/Kconfig
+++ linux-next-20211105/arch/mips/Kconfig
@@ -332,6 +332,9 @@ config BCM63XX
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_CPU_BMIPS32_3300
+	select SYS_HAS_CPU_BMIPS4350
+	select SYS_HAS_CPU_BMIPS4380
 	select SWAP_IO_SPACE
 	select GPIOLIB
 	select MIPS_L1_CACHE_SHIFT_4
