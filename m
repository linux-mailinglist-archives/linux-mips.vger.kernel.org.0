Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB9D45BA86
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 13:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242517AbhKXMLy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 07:11:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:37610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242533AbhKXMJy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Nov 2021 07:09:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33E026108F;
        Wed, 24 Nov 2021 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637755540;
        bh=EkrfjSHJIhk6udq4vSbGkQNFqN7ZQ8xcRYJwJ2803tI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p4e9OuJST50eFWustqca23GjROsxg2P/fBGovUGj8EG360f1EYMN7fJDlUXhb1gOT
         VvC0uPBP9OumyzCcLcXE18XNz3pcNRQGC0OaVCnmpe/En8Bi79hJWgEb5ivv6EzRN/
         G8U6okXmyoMlIneGVzb/f/wUSmmi4YEv356oyb1Y=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.4 133/162] mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
Date:   Wed, 24 Nov 2021 12:57:16 +0100
Message-Id: <20211124115702.590354018@linuxfoundation.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124115658.328640564@linuxfoundation.org>
References: <20211124115658.328640564@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 5eeaafc8d69373c095e461bdb39e5c9b62228ac5 ]

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
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9f1376788820e..98312d3e4f414 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -211,6 +211,9 @@ config BCM63XX
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_CPU_BMIPS32_3300
+	select SYS_HAS_CPU_BMIPS4350
+	select SYS_HAS_CPU_BMIPS4380
 	select SWAP_IO_SPACE
 	select ARCH_REQUIRE_GPIOLIB
 	select HAVE_CLK
-- 
2.33.0



