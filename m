Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E189F184B5A
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 16:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbgCMPok (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 11:44:40 -0400
Received: from foss.arm.com ([217.140.110.172]:58572 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727144AbgCMPoi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Mar 2020 11:44:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C3FFEC;
        Fri, 13 Mar 2020 08:44:37 -0700 (PDT)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F1EC3F67D;
        Fri, 13 Mar 2020 08:44:34 -0700 (PDT)
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
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: [PATCH v3 10/26] linux/time.h: Extract common header for vDSO
Date:   Fri, 13 Mar 2020 15:43:29 +0000
Message-Id: <20200313154345.56760-11-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200313154345.56760-1-vincenzo.frascino@arm.com>
References: <20200313154345.56760-1-vincenzo.frascino@arm.com>
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

Split time.h into linux and common headers to make the latter suitable
for inclusion in the vDSO library.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 include/linux/time.h |  5 +----
 include/vdso/time.h  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 include/vdso/time.h

diff --git a/include/linux/time.h b/include/linux/time.h
index 8ef5e5cc9f57..4c325bf44ce0 100644
--- a/include/linux/time.h
+++ b/include/linux/time.h
@@ -111,9 +111,6 @@ static inline bool itimerspec64_valid(const struct itimerspec64 *its)
  */
 #define time_between32(t, l, h) ((u32)(h) - (u32)(l) >= (u32)(t) - (u32)(l))
 
-struct timens_offset {
-	s64	sec;
-	u64	nsec;
-};
+# include <vdso/time.h>
 
 #endif
diff --git a/include/vdso/time.h b/include/vdso/time.h
new file mode 100644
index 000000000000..739f53cd2949
--- /dev/null
+++ b/include/vdso/time.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_TIME_H
+#define __VDSO_TIME_H
+
+#include <uapi/linux/types.h>
+
+struct timens_offset {
+	s64	sec;
+	u64	nsec;
+};
+
+#endif /* __VDSO_TIME_H */
-- 
2.25.1

