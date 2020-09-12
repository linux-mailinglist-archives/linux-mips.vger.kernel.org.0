Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E072679C0
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgILLKc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgILLJ2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:09:28 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73394C06138D
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id n3so3613253pjq.1
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F4tHM0L8tNnxsWtLsTsMp6Ii6Rnl8nRf7R1d/DJ5GX0=;
        b=Fl2bqtSL2iiRfZluzSWOTXzNL8dmVQDhsUPUUB10qGGSvjXPumusHfP3CokhnSfKCH
         +t1jc2Q7OaXG85BoTd0A91s9q9C//+V6czJh5bMgwh6mcmDIOuQaMrCFly9wGejcGRUz
         s31sojad768defEHNH0ElcsN5owiLsEYQ0XZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F4tHM0L8tNnxsWtLsTsMp6Ii6Rnl8nRf7R1d/DJ5GX0=;
        b=c44NbvxkA/0Sc97WdAopgUzHX7yDpVGLS4UAJFCl4/TdYZca5hJ05o4RXls4t7f7jw
         CYu5i+lBzMgGP7SySzZMMx6cQfSjzTLQv/X0xFNPND5c0jHVni4dlckD6LzXvr5O9I4e
         rji8szRSv2tkHMk3kahNMr5D8TnfrqFCWtVj8OqAKRqBKGId3EJ8s1tXPgAltIchqUIf
         1moe+ZYhnH6fkLg4gNyV2aKkm87rdIxIwkAY63cB68948c2zctX71dbxDOJIAa9b0dCL
         g8+H4hUZTWg3mehTse1lRKLtAM813W/4urJptvykInzYYq2DKx3p8464afJyxMLjj/IN
         rWgw==
X-Gm-Message-State: AOAM532VO2ydABpyFOPlDVQIHvO29PfBlbmTksKggcSh659xIgX5ljeP
        1iRunwSfS+5EcRrOz1FEYDCrDQ==
X-Google-Smtp-Source: ABdhPJxIVZvhB1EkQWrlPCCU/1v4hWzLbZ0KeU8jimuCS6pLb+8hNC5hU2kfhglj/9om5Lrdkt4vIA==
X-Received: by 2002:a17:90b:374b:: with SMTP id ne11mr5637226pjb.21.1599908913988;
        Sat, 12 Sep 2020 04:08:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m24sm4069132pgn.44.2020.09.12.04.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christian Brauner <christian@brauner.io>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/15] selftests/seccomp: Remove SYSCALL_NUM_RET_SHARE_REG in favor of SYSCALL_RET_SET
Date:   Sat, 12 Sep 2020 04:08:16 -0700
Message-Id: <20200912110820.597135-12-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of special-casing the specific case of shared registers, create
a default SYSCALL_RET_SET() macro (mirroring SYSCALL_NUM_SET()), that
writes to the SYSCALL_RET register. For architectures that can't set the
return value (for whatever reason), they can define SYSCALL_RET_SET()
without an associated SYSCALL_RET() macro. This also paves the way for
architectures that need to do special things to set the return value
(e.g. powerpc).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 2790d9cd50f4..623953a53032 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1753,8 +1753,8 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 #elif defined(__s390__)
 # define ARCH_REGS		s390_regs
 # define SYSCALL_NUM(_regs)	(_regs).gprs[2]
-# define SYSCALL_RET(_regs)	(_regs).gprs[2]
-# define SYSCALL_NUM_RET_SHARE_REG
+# define SYSCALL_RET_SET(_regs, _val)			\
+		TH_LOG("Can't modify syscall return on this architecture")
 #elif defined(__mips__)
 # include <asm/unistd_nr_n32.h>
 # include <asm/unistd_nr_n64.h>
@@ -1776,8 +1776,8 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 		else					\
 			(_regs).regs[2] = _nr;		\
 	} while (0)
-# define SYSCALL_RET(_regs)	(_regs).regs[2]
-# define SYSCALL_NUM_RET_SHARE_REG
+# define SYSCALL_RET_SET(_regs, _val)			\
+		TH_LOG("Can't modify syscall return on this architecture")
 #elif defined(__xtensa__)
 # define ARCH_REGS		struct user_pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).syscall
@@ -1804,9 +1804,26 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 		SYSCALL_NUM(_regs) = (_nr);	\
 	} while (0)
 #endif
+/*
+ * Most architectures can change the syscall return value by just
+ * writing to the SYSCALL_RET register. This is the default if not
+ * defined above. If an architecture cannot set the return value
+ * (for example when the syscall and return value register is
+ * shared), report it with TH_LOG() in an arch-specific definition
+ * of SYSCALL_RET_SET() above, and leave SYSCALL_RET undefined.
+ */
+#if !defined(SYSCALL_RET) && !defined(SYSCALL_RET_SET)
+# error "One of SYSCALL_RET or SYSCALL_RET_SET is needed for this arch"
+#endif
+#ifndef SYSCALL_RET_SET
+# define SYSCALL_RET_SET(_regs, _val)		\
+	do {					\
+		SYSCALL_RET(_regs) = (_val);	\
+	} while (0)
+#endif
 
 /* When the syscall return can't be changed, stub out the tests for it. */
-#ifdef SYSCALL_NUM_RET_SHARE_REG
+#ifndef SYSCALL_RET
 # define EXPECT_SYSCALL_RETURN(val, action)	EXPECT_EQ(-1, action)
 #else
 # define EXPECT_SYSCALL_RETURN(val, action)		\
@@ -1870,11 +1887,7 @@ void change_syscall(struct __test_metadata *_metadata,
 
 	/* If syscall is skipped, change return value. */
 	if (syscall == -1)
-#ifdef SYSCALL_NUM_RET_SHARE_REG
-		TH_LOG("Can't modify syscall return on this architecture");
-#else
-		SYSCALL_RET(regs) = result;
-#endif
+		SYSCALL_RET_SET(regs, result);
 
 	/* Flush any register changes made. */
 	if (memcmp(&orig, &regs, sizeof(orig)) != 0)
-- 
2.25.1

