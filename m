Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6E8281CE4
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 22:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgJBUYk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 16:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgJBUYk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Oct 2020 16:24:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4ADC0613D0;
        Fri,  2 Oct 2020 13:24:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so3084162wrw.11;
        Fri, 02 Oct 2020 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cfd+HSOs2aYoH4xk+wPWxWI0w6RvzQ0BinW11qn5T+s=;
        b=WwtcoX7n015idBD4AzKxXzD43eUPEcP4lJ38PgGgJW1Ass0Vv30yGKHP67twX0meU2
         AINSc8MIu3dr5QHtj2ldMuTN3kXN7XdS1/7qVL9r8MRmQiqvwW5Xh0WjaKRmOwjrKKeg
         oK2aKGoVCA3ElsM4ioE0Rblt4OU7uQZar45uh72tZzkkg0ZuAs2aycPpXNxlQ3N8f6Lo
         mvD/dE8l/SxSIDcJ3SQDO5Y+/clr3NcfOysEFSdCmFagycMd1vuJvwk0PYtpFVKdA0Or
         f3zuNek0SS8ETpfxpAtVLk2NTYh0lxzCfjSYOXbT/9qbROLX82m/OEddckMepmDUDmaw
         Yclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cfd+HSOs2aYoH4xk+wPWxWI0w6RvzQ0BinW11qn5T+s=;
        b=T1s4C2ku9o/i52jMWAuRRV8e+T1pslQmPk3HDJPsdko/YXi8XSVMhLJYDQ16clZIqP
         HLJcdlvvhf2MYibWbOmlgTWKUs/mHc50/iOUsn2Sxv9OcX9N2TWjJTDFnw/xsNXWvn8S
         WfAyBKotYoCbDmBCHjnwymmSEfBadzn2o9nGkmZSV4fQ+dgHmRD1h3v0cvwxUfq3dVBt
         lndYB/LN3i7N38pnIRFfHk8/3qWeYgQWjEDeh0oRQu9uynve+TMtrAa0czbZtdm+pZM+
         pLLmTD3io3h8vyggFj5kNXzfdw04Scri0v0rPaSqkK6tds5pSgbw9nNzVIvQRtq7Q1sd
         5pzg==
X-Gm-Message-State: AOAM5310O8yhbpJULIfaIQUScrSYuSm4GE7d1fUjtY4l/nxuqCBQ7G5r
        wOexSbSteWWIlavmieclbNU=
X-Google-Smtp-Source: ABdhPJzeGjHVzCOjvPYM7aEE6oppe38S/WC1ZsrcdNYbczdCIsbBK4Wkl74z8gRQCPx+lG6V3w5lGA==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr4849687wrw.199.1601670277032;
        Fri, 02 Oct 2020 13:24:37 -0700 (PDT)
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id o16sm2805015wrp.52.2020.10.02.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 13:24:35 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     ltp@lists.linux.it
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Ofer Levi <oferle@nvidia.com>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: [PATCH 1/1] cacheflush01: Rewrite into new API
Date:   Fri,  2 Oct 2020 22:24:16 +0200
Message-Id: <20201002202416.28972-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This syscall is currently (v5.9) supported on these architectures:
arc, csky, mips, m68k, nds32, sh

constants are missing for m68k, not sure if the testcase is valid for it.
Untested.

Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
<asm/cachectl.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

FYI: I was going to ask for removal of this test, but all these archs are
still supported. This test compiles on all archs now, but I haven't run
it (I don't have access to none of these archs, not sure if LTP is even
tested on these archs).

Kind regards,
Petr

 .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
 1 file changed, 40 insertions(+), 133 deletions(-)

diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
index 29cf2014a..85125f2ee 100644
--- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
+++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
@@ -1,157 +1,64 @@
-/******************************************************************************/
-/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009                      */
-/* LKML Reference: http://lkml.org/lkml/2009/4/9/203                          */
-/* This program is free software;  you can redistribute it and/or modify      */
-/* it under the terms of the GNU General Public License as published by       */
-/* the Free Software Foundation; either version 2 of the License, or          */
-/* (at your option) any later version.                                        */
-/*                                                                            */
-/* This program is distributed in the hope that it will be useful,            */
-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
-/* the GNU General Public License for more details.                           */
-/*                                                                            */
-/* You should have received a copy of the GNU General Public License          */
-/* along with this program;  if not, write to the Free Software               */
-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
-/*                                                                            */
-/******************************************************************************/
-/******************************************************************************/
-/*                                                                            */
-/* File:        cacheflush01.c                                                */
-/*                                                                            */
-/* Description: The cacheflush_check() syscall                     	      */
-/*		Tests EINVAL error of cacheflush system call.		      */
-/* 		Its expected behaviour is cacheflush() should return -EINVAL  */
-/*		when cache parameter is not one of ICACHE, DCACHE, or BCACHE. */
-/*                                                                            */
-/* Usage:  <for command-line>                                                 */
-/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                          */
-/*      where,  -c n : Run n copies concurrently.                             */
-/*              -e   : Turn on errno logging.                                 */
-/*              -i n : Execute test n times.                                  */
-/*              -I x : Execute test for x seconds.                            */
-/*              -P x : Pause for x seconds between iterations.                */
-/*              -t   : Turn on syscall timing.                                */
-/*                                                                            */
-/* Total Tests: 1                                                             */
-/*                                                                            */
-/* Test Name:   cacheflush01                                                  */
-/******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
 
-#include <unistd.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
 
 #if __NR_cacheflush != __LTP__NR_INVALID_SYSCALL
+
 #include <asm/cachectl.h>
-#else
+
+/*
+ * m68k does not have these constants
+ */
+
 #ifndef   ICACHE
-#define   ICACHE   (1<<0)	/* flush instruction cache        */
+# define   ICACHE   (1<<0)
 #endif
+
 #ifndef   DCACHE
-#define   DCACHE   (1<<1)	/* writeback and flush data cache */
+# define   DCACHE   (1<<1)
 #endif
+
 #ifndef   BCACHE
-#define   BCACHE   (ICACHE|DCACHE)	/* flush both caches              */
-#endif
+# define   BCACHE   (ICACHE|DCACHE)
 #endif
 
-char *TCID = "cacheflush01";
-int TST_TOTAL = 1;
+#define CACHE_DESC(x) .cache = x, .desc = #x
 
-/* Extern Global Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    cleanup                                                       */
-/*                                                                            */
-/* Description: Performs all one time clean up for this test on successful    */
-/*              completion,  premature exit or  failure. Closes all temporary */
-/*              files, removes all temporary directories exits the test with  */
-/*              appropriate return code by calling tst_exit() function.       */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
-/*              On success - Exits calling tst_exit(). With '0' return code.  */
-/*                                                                            */
-/******************************************************************************/
-void cleanup(void)
-{
+static struct test_case_t {
+	int cache;
+	const char *desc;
+} test_cases[] = {
+	{ CACHE_DESC(ICACHE) },
+	{ CACHE_DESC(DCACHE) },
+	{ CACHE_DESC(BCACHE) },
+};
 
-	tst_rmdir();
-}
+static char *addr;
 
-/* Local  Functions */
-/******************************************************************************/
-/*                                                                            */
-/* Function:    setup                                                         */
-/*                                                                            */
-/* Description: Performs all one time setup for this test. This function is   */
-/*              typically used to capture signals, create temporary dirs      */
-/*              and temporary files that may be used in the course of this    */
-/*              test.                                                         */
-/*                                                                            */
-/* Input:       None.                                                         */
-/*                                                                            */
-/* Output:      None.                                                         */
-/*                                                                            */
-/* Return:      On failure - Exits by calling cleanup().                      */
-/*              On success - returns 0.                                       */
-/*                                                                            */
-/******************************************************************************/
-void setup(void)
+static void setup(void)
 {
-	/* Capture signals if any */
-	/* Create temporary directories */
-	TEST_PAUSE;
-	tst_tmpdir();
+	addr = SAFE_MALLOC(getpagesize());
 }
 
-int main(int ac, char **av)
+static void test_cacheflush(unsigned int i)
 {
+	struct test_case_t *tc = &test_cases[i];
 
-	char *addr = NULL;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	tst_count = 0;
-	/* Create some user address range */
-	addr = malloc(getpagesize());
-	if (addr == NULL) {
-		tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
-	}
-
-	/* Invokes cacheflush() with proper parameters */
-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
-	if (TEST_RETURN == 0) {
-		tst_resm(TPASS, "passed with no errno");
-	} else {
-		tst_resm(TFAIL, "failed with unexpected errno");
-	}
-
-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
-	if (TEST_RETURN == 0) {
-		tst_resm(TPASS, "passed with no errno");
+	TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache));
+	if (TST_RET == 0) {
+		tst_res(TPASS, "%s passed", tc->desc);
 	} else {
-		tst_resm(TFAIL, "failed with unexpected errno");
+		tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
 	}
+}
 
-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
-	if (TEST_RETURN == 0) {
-		tst_resm(TPASS, "passed with no errno");
-	} else {
-		tst_resm(TFAIL, "failed with unexpected errno");
-	}
+static struct tst_test test = {
+	.setup = setup,
+	.test = test_cacheflush,
+	.tcnt = ARRAY_SIZE(test_cases),
+};
 
-	cleanup();
-	tst_exit();
-}
+#else
+	TST_TEST_TCONF("system doesn't support cacheflush()");
+#endif
-- 
2.28.0

