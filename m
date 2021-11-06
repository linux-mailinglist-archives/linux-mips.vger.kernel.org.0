Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871C2446C20
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 03:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhKFDBJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 23:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhKFDBI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 23:01:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A99CC061570;
        Fri,  5 Nov 2021 19:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=qQH0nBTUcxXKHal9giqwqa8esN9py6mZ5ZFCCMzF95g=; b=tRW2HvXoPmpAAdwHky8fw3NQvF
        JvKO3zhkGEc1/bYt0BZBpOdIV2JYL+KOdyWW3fnnJqnahOyWgjObo+IGUoX9oqcJzMuEVOb+B9emS
        1+xeMl5QDfZrthTjmPtRMAi+5JiK6DhY3SsCKhv3TzKyL8kEhgh9TK7Ixy8uJKvJH+8yF2Rtr1bPL
        h6OGRWPNbHERYT3OhDln71jKbJsAYRD2D/wyWU6swfM7pUFtlpsRV+G90baKkP0Ee1Vwc2LMT9o5K
        iDCp41uuJVaD6xKQZerRjXa1xMmeYX4BgVpS68V73V/WgMCg0dTCv4pMkkskeRtbFMfbJuP5aVdC2
        H+GDOyDA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mjBuS-00CbKs-4g; Sat, 06 Nov 2021 02:58:24 +0000
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
Subject: [RFC PATCH] mips: BCM63XX: select CPU_SUPPORTS_32BIT_KERNEL
Date:   Fri,  5 Nov 2021 19:58:23 -0700
Message-Id: <20211106025823.32437-1-rdunlap@infradead.org>
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
---
Note: I did see a bunch of build errors like this one:
../arch/mips/kernel/r4k_fpu.S:217: Error: opcode not supported on this processor: mips1 (mips1) `ldc1 $f24,192($4)'
but I'm hoping/guessing that this is due to not having a proper compiler
for the BCM63xx target.

 arch/mips/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211105.orig/arch/mips/Kconfig
+++ linux-next-20211105/arch/mips/Kconfig
@@ -329,6 +329,7 @@ config BCM63XX
 	select SYNC_R4K
 	select DMA_NONCOHERENT
 	select IRQ_MIPS_CPU
+	select CPU_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
