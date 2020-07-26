Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107F122DE93
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 13:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgGZLbD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 07:31:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:43040 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgGZLbD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 07:31:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D55C0AF33;
        Sun, 26 Jul 2020 11:31:10 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: cpu-feature-overrides: Remove not needed overrides
Date:   Sun, 26 Jul 2020 13:30:54 +0200
Message-Id: <20200726113055.28692-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clean up cpu-feature-overrides, which only repeat the default.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-dec/cpu-feature-overrides.h      | 1 -
 arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h     | 3 ---
 arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h     | 3 ---
 arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h | 1 -
 4 files changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h b/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
index 00beb69bfab9..1896e88f6000 100644
--- a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
@@ -43,7 +43,6 @@
 #define cpu_has_dsp2			0
 #define cpu_has_mipsmt			0
 #define cpu_has_userlocal		0
-#define cpu_hwrena_impl_bits		0
 #define cpu_has_perf_cntr_intr_bit	0
 #define cpu_has_vz			0
 #define cpu_has_fre			0
diff --git a/arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h
index 136d6d464e32..58f829c9b6c7 100644
--- a/arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h
@@ -25,8 +25,6 @@
 #define cpu_has_4kex			1
 #define cpu_has_3k_cache		0
 #define cpu_has_4k_cache		1
-#define cpu_has_6k_cache		0
-#define cpu_has_8k_cache		0
 #define cpu_has_tx39_cache		0
 #define cpu_has_fpu			1
 #define cpu_has_nofpuex			0
@@ -67,7 +65,6 @@
 #define cpu_has_mipsmt			0
 #define cpu_has_userlocal		0
 #define cpu_has_inclusive_pcaches	1
-#define cpu_hwrena_impl_bits		0
 #define cpu_has_perf_cntr_intr_bit	0
 #define cpu_has_vz			0
 #define cpu_has_fre			0
diff --git a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
index cfa02f3d25df..49a93e82c252 100644
--- a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
@@ -28,8 +28,6 @@
 #define cpu_has_4kex			1
 #define cpu_has_3k_cache		0
 #define cpu_has_4k_cache		1
-#define cpu_has_6k_cache		0
-#define cpu_has_8k_cache		0
 #define cpu_has_tx39_cache		0
 #define cpu_has_fpu			1
 #define cpu_has_nofpuex			0
@@ -69,7 +67,6 @@
 #define cpu_has_mipsmt			0
 #define cpu_has_userlocal		0
 #define cpu_has_inclusive_pcaches	1
-#define cpu_hwrena_impl_bits		0
 #define cpu_has_perf_cntr_intr_bit	0
 #define cpu_has_vz			0
 #define cpu_has_fre			0
diff --git a/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h b/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
index 725e1ed83f6a..23ecf816daa7 100644
--- a/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
@@ -29,7 +29,6 @@
 #define cpu_has_octeon_cache	1
 #define cpu_has_4k_cache	0
 #else
-#define cpu_has_octeon_cache	0
 #define cpu_has_4k_cache	1
 #endif
 
-- 
2.16.4

