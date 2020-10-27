Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C31E29C789
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 19:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1813541AbgJ0See (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 14:34:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40771 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1796344AbgJ0See (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Oct 2020 14:34:34 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kXTni-0007Bv-QW; Tue, 27 Oct 2020 18:34:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Kconfig: fix a few trivial spelling mistakes
Date:   Tue, 27 Oct 2020 18:34:30 +0000
Message-Id: <20201027183430.56772-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes in the Kconfig, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2b0220..ddaff19a9580 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2645,7 +2645,7 @@ config WAR_R4600_V1_INDEX_ICACHEOP
 #  18. The CACHE instructions Hit_Writeback_Invalidate_D, Hit_Writeback_D,
 #      Hit_Invalidate_D and Create_Dirty_Excl_D should only be
 #      executed if there is no other dcache activity. If the dcache is
-#      accessed for another instruction immeidately preceding when these
+#      accessed for another instruction immediately preceding when these
 #      cache instructions are executing, it is possible that the dcache
 #      tag match outputs used by these cache instructions will be
 #      incorrect. These cache instructions should be preceded by at least
@@ -3086,7 +3086,7 @@ config MIPS_O32_FP64_SUPPORT
 
 	  Although binutils currently supports use of this flag the details
 	  concerning its effect upon the O32 ABI in userland are still being
-	  worked on. In order to avoid userland becoming dependant upon current
+	  worked on. In order to avoid userland becoming dependent upon current
 	  behaviour before the details have been finalised, this option should
 	  be considered experimental and only enabled by those working upon
 	  said details.
@@ -3124,7 +3124,7 @@ choice
 
 		    objcopy --update-section .appended_dtb=<filename>.dtb vmlinux
 
-		  This is meant as a backward compatiblity convenience for those
+		  This is meant as a backward compatibility convenience for those
 		  systems with a bootloader that can't be upgraded to accommodate
 		  the documented boot protocol using a device tree.
 
-- 
2.27.0

