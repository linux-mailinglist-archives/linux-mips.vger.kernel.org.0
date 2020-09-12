Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4732679DE
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgILLLh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgILLIg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:08:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D2BC061799
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so8185343pgd.12
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7i0gIW6ZVxe0Kz2oWVVjX2+xeMrxrMhOBimrxOQ4qek=;
        b=S5Lz8j1V+5MDhgIyUtO7Zuk5BIcx/fBEtHJ2uWE1T7i7NSSd7E5LmNCEC6ozr4kpjk
         NQGZhu80esKFrAatPhTFWLyQP2ihxEW1whGoQ8gIlktjuON8UyQm5Ypv2kMvHF8Y5Zyv
         VlZRUx6tzeRSyjNHg7sA1nyP3jA7Nlxc868Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7i0gIW6ZVxe0Kz2oWVVjX2+xeMrxrMhOBimrxOQ4qek=;
        b=XpHZ9xzYOV3KoTrboacs4BGwi2X7k8yFLjLLDgdXjF4DcgpLh1JkjVwpUep7+IdSP5
         9FIY7AHyg/XmdbQ7C3PwFqg+OPmpk8BFZMh0dLUqJWp0cpEJ/Y4Rirf6NyUj6Z3u9Ovq
         3PwYJM8jD3HLK0FSIIqgx82m7GSHMKOt2bYmprJoknWBu7o59zbPCxb1ngDMb5lLE59y
         nMTPMrgh0oKlcnzx7ynVBrabGzUS39lG9Wjkf1F2q/gbs/hgsehoJatbupZj15iPLKnK
         DadqNXRe85xuiBTGjlcS0aCn4cpcAZcsN4fu5Bjjr6490rvY3QaB+ASFyER0pVPog28T
         QfpA==
X-Gm-Message-State: AOAM532kpBuJk/GYPG5bUxZ+sarHDAC7wLavULd+H/edh75mVJDqgJnH
        U1kaa661iBKCjun4Q9mk2s2ntQ==
X-Google-Smtp-Source: ABdhPJxMdaGZtbhZDV4yoH9fFgwi/E8qseSTjQ9A8Z/0tOX4x9EdzEbqtsscycxXkFKecHmw+zbWwg==
X-Received: by 2002:a63:5e01:: with SMTP id s1mr58767pgb.421.1599908905027;
        Sat, 12 Sep 2020 04:08:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mp3sm4063276pjb.33.2020.09.12.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 04:08:23 -0700 (PDT)
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
Subject: [PATCH 02/15] selftests/seccomp: Provide generic syscall setting macro
Date:   Sat, 12 Sep 2020 04:08:07 -0700
Message-Id: <20200912110820.597135-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to avoid "#ifdef"s in the main function bodies, create a new
macro, SYSCALL_NUM_SET(), where arch-specific logic can live.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index fef15080b575..1c83e743bfb1 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1760,6 +1760,17 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
 
+/*
+ * Most architectures can change the syscall by just updating the
+ * associated register. This is the default if not defined above.
+ */
+#ifndef SYSCALL_NUM_SET
+# define SYSCALL_NUM_SET(_regs, _nr)		\
+	do {					\
+		SYSCALL_NUM(_regs) = (_nr);	\
+	} while (0)
+#endif
+
 /* When the syscall return can't be changed, stub out the tests for it. */
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 # define EXPECT_SYSCALL_RETURN(val, action)	EXPECT_EQ(-1, action)
@@ -1830,14 +1841,14 @@ void change_syscall(struct __test_metadata *_metadata,
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
 	defined(__xtensa__) || defined(__csky__) || defined(__sh__)
 	{
-		SYSCALL_NUM(regs) = syscall;
+		SYSCALL_NUM_SET(regs, syscall);
 	}
 #elif defined(__mips__)
 	{
 		if (SYSCALL_NUM(regs) == __NR_O32_Linux)
 			regs.SYSCALL_SYSCALL_NUM = syscall;
 		else
-			SYSCALL_NUM(regs) = syscall;
+			SYSCALL_NUM_SET(regs, syscall);
 	}
 
 #elif defined(__arm__)
-- 
2.25.1

