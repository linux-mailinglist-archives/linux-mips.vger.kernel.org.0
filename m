Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ECE2679D4
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgILLLN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgILLJG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:09:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93993C0617BD
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n3so3613224pjq.1
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=92Q8oZHyAg95yaZcgBPqYzJZs65e2ppMcBco02q7zS4=;
        b=oKxTswLtIOK07XsveENLHZWzEqRRWXa47NwfzGG/t34zibm0+Q5y6KxKGUyKdfoQJm
         WcOstLYJHtY8SjcIiE3lEzI8GfTXVy2Q+3Wr6si7RPVCGD9IY0lOI6Bzu+EU1MuOCBr+
         vwWMsIRYqobBaUwMudq9qDyqwr6DmrbuVMorM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=92Q8oZHyAg95yaZcgBPqYzJZs65e2ppMcBco02q7zS4=;
        b=XxdwXAUtkrqO6ekphYtcEpGJwn3dfutP+KeXtMG7eLD9u7qXi2ff1jDC16lAO5gc2z
         XO98IFaLBfIHxwCr2gQdfQHtnGyHvZev8kmRUvmbqikwVxhS45GNBneCLjqvbJegb8e3
         yM12VBLdgQMXu9gZxFUzqsmztl873XMyvFxYt1w02G7DRw0JFe0NcWg5QKTin37ENmG1
         DVqwyO8DQNvxrw2YqZs3bKVK4z7kz2ntW89poJpBt9GRIqu5NsJBUIkmQopmlOz6kmtv
         I4F2wV341QkwRQGP4P3gk5D90Lv71oTQsnO/USxK0z0NDmYjDJjvlzvUf6DHrqjc9XGD
         buZw==
X-Gm-Message-State: AOAM531IbWBqbg6Ddk9q/NIWUfNdMyG+GubAbrbmk+y55Pa3mzkqBRXE
        xAO3mmjA4Rlp3bll3zXMAV8EUQ==
X-Google-Smtp-Source: ABdhPJweZZl3gQqRJfY1jLrAEz5YsIr84x1nX2bdgki+nYDKxKRM+1q2OEofassUExMJ/pEA6/fMaQ==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id w10mr5837835pjy.165.1599908910885;
        Sat, 12 Sep 2020 04:08:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id nl10sm3907425pjb.11.2020.09.12.04.08.25
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
Subject: [PATCH 07/15] selftests/seccomp: Remove syscall setting #ifdefs
Date:   Sat, 12 Sep 2020 04:08:12 -0700
Message-Id: <20200912110820.597135-8-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With all architectures now using the common SYSCALL_NUM_SET() macro, the
arch-specific #ifdef can be removed from change_syscall() itself.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index aa1c224371d1..3b77bdbe7125 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1865,20 +1865,9 @@ void change_syscall(struct __test_metadata *_metadata,
 	iov.iov_len = sizeof(regs);
 	ret = ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
 #endif
-	EXPECT_EQ(0, ret) {}
+	EXPECT_EQ(0, ret);
 
-#if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
-	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
-	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
-	defined(__mips__) || defined(__arm__) || defined(__aarch64__)
-	{
-		SYSCALL_NUM_SET(regs, syscall);
-	}
-#else
-	ASSERT_EQ(1, 0) {
-		TH_LOG("How is the syscall changed on this architecture?");
-	}
-#endif
+	SYSCALL_NUM_SET(regs, syscall);
 
 	/* If syscall is skipped, change return value. */
 	if (syscall == -1)
@@ -1888,6 +1877,7 @@ void change_syscall(struct __test_metadata *_metadata,
 		SYSCALL_RET(regs) = result;
 #endif
 
+	/* Flush any register changes made. */
 #ifdef HAVE_GETREGS
 	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
 #else
-- 
2.25.1

