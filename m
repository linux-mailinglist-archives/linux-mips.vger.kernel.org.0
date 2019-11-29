Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A610D71D
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 15:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfK2OhO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 09:37:14 -0500
Received: from foss.arm.com ([217.140.110.172]:48610 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfK2OhN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Nov 2019 09:37:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA971FB;
        Fri, 29 Nov 2019 06:37:13 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C2A93F6C4;
        Fri, 29 Nov 2019 06:37:11 -0800 (PST)
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
To:     vincenzo.frascino@arm.com, paulburton@kernel.org, hns@goldelico.com
Cc:     mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Fix gettimeofday() in the vdso library
Date:   Fri, 29 Nov 2019 14:36:58 +0000
Message-Id: <20191129143658.12224-1-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The libc provides a discovery mechanism for vDSO library and its
symbols. When a symbol is not exposed by the vDSOs the libc falls back
on the system calls.

With the introduction of the unified vDSO library on mips this behavior
is not honored anymore by the kernel in the case of gettimeofday().

The issue has been noticed and reported due to a dhclient failure on the
CI20 board:

root@letux:~# dhclient
../../../../lib/isc/unix/time.c:200: Operation not permitted
root@letux:~#

Restore the original behavior fixing gettimeofday() in the vDSO library.

Cc: Paul Burton <paulburton@kernel.org>
Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Testes-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with JZ4780
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/mips/include/asm/vdso/gettimeofday.h | 13 -------------
 arch/mips/vdso/vgettimeofday.c            | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index b08825531e9f..0ae9b4cbc153 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -26,8 +26,6 @@
 
 #define __VDSO_USE_SYSCALL		ULLONG_MAX
 
-#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
-
 static __always_inline long gettimeofday_fallback(
 				struct __kernel_old_timeval *_tv,
 				struct timezone *_tz)
@@ -48,17 +46,6 @@ static __always_inline long gettimeofday_fallback(
 	return error ? -ret : ret;
 }
 
-#else
-
-static __always_inline long gettimeofday_fallback(
-				struct __kernel_old_timeval *_tv,
-				struct timezone *_tz)
-{
-	return -1;
-}
-
-#endif
-
 static __always_inline long clock_gettime_fallback(
 					clockid_t _clkid,
 					struct __kernel_timespec *_ts)
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 6ebdc37c89fc..6b83b6376a4b 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -17,12 +17,22 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
+#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
+
+/*
+ * This is behind the ifdef so that we don't provide the symbol when there's no
+ * possibility of there being a usable clocksource, because there's nothing we
+ * can do without it. When libc fails the symbol lookup it should fall back on
+ * the standard syscall path.
+ */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
+#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
+
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
@@ -43,12 +53,22 @@ int __vdso_clock_gettime(clockid_t clock,
 	return __cvdso_clock_gettime(clock, ts);
 }
 
+#ifdef CONFIG_MIPS_CLOCK_VSYSCALL
+
+/*
+ * This is behind the ifdef so that we don't provide the symbol when there's no
+ * possibility of there being a usable clocksource, because there's nothing we
+ * can do without it. When libc fails the symbol lookup it should fall back on
+ * the standard syscall path.
+ */
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
 	return __cvdso_gettimeofday(tv, tz);
 }
 
+#endif /* CONFIG_MIPS_CLOCK_VSYSCALL */
+
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {
-- 
2.24.0

