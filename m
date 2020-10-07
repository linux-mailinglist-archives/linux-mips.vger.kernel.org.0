Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0F5285CA9
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgJGKRJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:17:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:41302 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgJGKRJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Oct 2020 06:17:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BD004AAC6;
        Wed,  7 Oct 2020 10:17:07 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP28: disable use of ll/sc in kernel
Date:   Wed,  7 Oct 2020 12:17:04 +0200
Message-Id: <20201007101704.110101-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGI-IP28 systems only use broken R10k rev 2.5 CPUs, which could lock
up, if ll/sc sequences are issued in certain order. Since those systems
are all non-SMP, we can disable ll/sc usage in kernel.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h
index ba8b4e30b3e2..613bbc10c1f2 100644
--- a/arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h
@@ -25,7 +25,7 @@
 #define cpu_has_mcheck		0
 #define cpu_has_ejtag		0
 
-#define cpu_has_llsc		1
+#define cpu_has_llsc		0
 #define cpu_has_vtag_icache	0
 #define cpu_has_dc_aliases	0 /* see probe_pcache() */
 #define cpu_has_ic_fills_f_dc	0
-- 
2.16.4

