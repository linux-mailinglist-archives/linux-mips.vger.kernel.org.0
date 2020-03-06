Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0BB17BEED
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 14:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgCFNdA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 08:33:00 -0500
Received: from foss.arm.com ([217.140.110.172]:33324 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgCFNdA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Mar 2020 08:33:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6469101E;
        Fri,  6 Mar 2020 05:32:59 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3201D3F6CF;
        Fri,  6 Mar 2020 05:32:57 -0800 (PST)
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
To:     linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        clang-built-linux@googlegroups.com, x86@kernel.org
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Salyzyn <salyzyn@android.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Collingbourne <pcc@google.com>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrei Vagin <avagin@openvz.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 02/20] linux/bits.h: Extract common header for vDSO
Date:   Fri,  6 Mar 2020 13:32:24 +0000
Message-Id: <20200306133242.26279-3-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306133242.26279-1-vincenzo.frascino@arm.com>
References: <20200306133242.26279-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The vDSO library should only include the necessary headers required for
a userspace library (UAPI and a minimal set of kernel headers). To make
this possible it is necessary to isolate from the kernel headers the
common parts that are strictly necessary to build the library.

Split bits.h into linux and common headers to make the latter suitable
for inclusion in the vDSO library.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 include/common/bits.h | 9 +++++++++
 include/linux/bits.h  | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 include/common/bits.h

diff --git a/include/common/bits.h b/include/common/bits.h
new file mode 100644
index 000000000000..6da493992e52
--- /dev/null
+++ b/include/common/bits.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __COMMON_BITS_H
+#define __COMMON_BITS_H
+
+#include <common/const.h>
+
+#define BIT(nr)			(UL(1) << (nr))
+
+#endif	/* __COMMON_BITS_H */
diff --git a/include/linux/bits.h b/include/linux/bits.h
index 669d69441a62..aeb76fede77a 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -3,9 +3,9 @@
 #define __LINUX_BITS_H
 
 #include <linux/const.h>
+#include <common/bits.h>
 #include <asm/bitsperlong.h>
 
-#define BIT(nr)			(UL(1) << (nr))
 #define BIT_ULL(nr)		(ULL(1) << (nr))
 #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
-- 
2.25.1

