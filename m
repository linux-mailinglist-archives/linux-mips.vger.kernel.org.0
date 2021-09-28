Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378F041AA18
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 09:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbhI1HyK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 03:54:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:35528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239287AbhI1HyJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 03:54:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5137D61130;
        Tue, 28 Sep 2021 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632815550;
        bh=lFsTmsn7BYcrty0qzd1AqSPHwOiCHDnCX/Te4vlwM7A=;
        h=From:To:Cc:Subject:Date:From;
        b=WJNbYy6q2dLmrox1V9lvJ3yNXIMuZp8b7wEDV18kZkrcMMEkz4ZdaL6+wMd/EJuzu
         rCVh5UO5rDIvSMr3BDOE/uQnc8i5D1Q9+JeiaFU/tIjaphu0W1GPoetd8AQBZjw1L8
         0shNSrZjCEMwmQ4lAz7eX9+gzn2cfrRChhTiVafD5FTWjnzkJLmdRGCJJAUrXGYmRR
         xWRUINz2rJ3DofuTl/d+o5LYqevL22s3N3ljhF9382UP92IH2f538r4skWsFBqOxEO
         tqwBVxxgOpwAZI8EZexXd4qGch5isT0eB+UmUDVvwm1yAlEkEW4xjjT4KCRUn+5IP0
         tEuej0ZCMgWjA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] firmware: include drivers/firmware/Kconfig unconditionally
Date:   Tue, 28 Sep 2021 09:50:26 +0200
Message-Id: <20210928075216.4193128-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing drivers that require access to a firmware layer
fails when that firmware symbol is unavailable. This happened
twice this week:

 - My proposed to change to rework the QCOM_SCM firmware symbol
   broke on ppc64 and others.

 - The cs_dsp firmware patch added device specific firmware loader
   into drivers/firmware, which broke on the same set of
   architectures.

We should probably do the same thing for other subsystems as well,
but fix this one first as this is a dependency for other patches
getting merged.

Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Not sure how we'd want to merge this patch, if two other things
need it. I'd prefer to merge it along with the QCOM_SCM change
through the soc tree, but that leaves the cirrus firmware broken
unless we also merge it the same way (rather than through ASoC
as it is now).

Alternatively, we can try to find a different home for the Cirrus
firmware to decouple the two problems. I'd argue that it's actually
misplaced here, as drivers/firmware is meant for kernel code that
interfaces with system firmware, not for device drivers to load
their own firmware blobs from user space.
---
 arch/arm/Kconfig    | 2 --
 arch/arm64/Kconfig  | 2 --
 arch/ia64/Kconfig   | 2 --
 arch/mips/Kconfig   | 2 --
 arch/parisc/Kconfig | 2 --
 arch/riscv/Kconfig  | 2 --
 arch/x86/Kconfig    | 2 --
 drivers/Kconfig     | 2 ++
 8 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ad96f3dd7e83..194d10bbff9e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1993,8 +1993,6 @@ config ARCH_HIBERNATION_POSSIBLE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 if CRYPTO
 source "arch/arm/crypto/Kconfig"
 endif
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ebb49585a63f..8749517482ae 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1931,8 +1931,6 @@ source "drivers/cpufreq/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 045792cde481..1e33666fa679 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -388,8 +388,6 @@ config CRASH_DUMP
 	  help
 	    Generate crash dump after being started by kexec.
 
-source "drivers/firmware/Kconfig"
-
 endmenu
 
 menu "Power management and ACPI options"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 771ca53af06d..6b8f591c5054 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3316,8 +3316,6 @@ source "drivers/cpuidle/Kconfig"
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "arch/mips/kvm/Kconfig"
 
 source "arch/mips/vdso/Kconfig"
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4742b6f169b7..27a8b49af11f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -384,6 +384,4 @@ config KEXEC_FILE
 
 endmenu
 
-source "drivers/firmware/Kconfig"
-
 source "drivers/parisc/Kconfig"
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 301a54233c7e..6a6fa9e976d5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -561,5 +561,3 @@ menu "Power management options"
 source "kernel/power/Kconfig"
 
 endmenu
-
-source "drivers/firmware/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e5ba8afd29a0..5dcec5f13a82 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2834,8 +2834,6 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
-source "drivers/firmware/Kconfig"
-
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.assembler"
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 30d2db37cc87..0d399ddaa185 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -17,6 +17,8 @@ source "drivers/bus/Kconfig"
 
 source "drivers/connector/Kconfig"
 
+source "drivers/firmware/Kconfig"
+
 source "drivers/gnss/Kconfig"
 
 source "drivers/mtd/Kconfig"
-- 
2.29.2

