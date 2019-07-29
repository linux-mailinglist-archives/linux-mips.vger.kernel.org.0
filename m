Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2085479AAE
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 23:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbfG2VKo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 17:10:44 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:52070 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729626AbfG2VKo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 17:10:44 -0400
Received: by mail-pg1-f201.google.com with SMTP id n23so27200877pgf.18
        for <linux-mips@vger.kernel.org>; Mon, 29 Jul 2019 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=xwrp+21u5eMaNhEA/rdpeLPdIpATKFWq+XtNgIYdLsk=;
        b=nR6rThRrSJlJJsQV5l5Vh48GpWZVzx3EORmd6Dy/ocAyzJewpwHUnPd/qA9KXAlHyn
         TgAPWGRvM0bYvV+63TWGXmoAJg9KbMwm2o0xWUiWL5nB+PeVdG/VnzJoKr6q7FwFkoxv
         Pfji0h7fRghn/60GhqBFvruZTa080G+fEkA+uVlztn7EBWIhJcp6aZg8P2JMvXElugLB
         1gES93CDPeOKW2AjgRgsMtRrPl5UBy2JA9wRV/wERMQ/zQSQ3HSjsdagbuIuZlRR82cy
         rF/oqS15CbF0l3/8ay3H5ihxI2b1x1r0IwREl7OQCGD++PjnptSwlCoAhhiVyPIzRpVa
         mokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=xwrp+21u5eMaNhEA/rdpeLPdIpATKFWq+XtNgIYdLsk=;
        b=ViGpQpRMdeso4Piebj0d7cNycnIpTDe51YQ6cukXqcqJrdRuFg1PQXXIm6smdULSH9
         bIXsv33XwBNUEClwv1nX27bh07XMuEoulUzfXoF55mjEZ725/N865ezcXnPIHpE7T1VH
         iOv3OSW/VgWftWalVf3eeWO/i9sT12QwRgpfsXnH6yXFzHLo+XlpE/ZB56P6omMvbKiK
         13zuTcw+ITIaNhwrU4+TZrJdan190RYPdWs4zCamTtAMgjSeW5S60/vmd+VIwu3AvDKL
         5d09aTaOPNVbuqgBZK8fC9Jzk7q0/QIwZ2RWQdas9uwxQnXQB//k6Mvzd6AdFOJB5O2K
         wXpg==
X-Gm-Message-State: APjAAAVv1yRhJAOim2ZXhmyCkWd5LU559H0T/VEMxImbEunoIYMHMHaW
        z5u7tVVFq1mtMZoPckw1JV0ORMlSJNG/Rug0OaQ=
X-Google-Smtp-Source: APXvYqzFdbSoDGLc6KH/a/EIcx1TS86Gq7S8+4DkNtfDFUDr5oQ/sOO1VHdq0pmgMuOG+U4dpbIEEU4Efxke4f46GKw=
X-Received: by 2002:a65:584f:: with SMTP id s15mr89215850pgr.175.1564434642782;
 Mon, 29 Jul 2019 14:10:42 -0700 (PDT)
Date:   Mon, 29 Jul 2019 14:10:12 -0700
Message-Id: <20190729211014.39333-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH] mips: avoid explicit UB in assignment of mips_io_port_base
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The code in question is modifying a variable declared const through
pointer manipulation.  Such code is explicitly undefined behavior, and
is the lone issue preventing malta_defconfig from booting when built
with Clang:

If an attempt is made to modify an object defined with a const-qualified
type through use of an lvalue with non-const-qualified type, the
behavior is undefined.

LLVM is removing such assignments. A simple fix is to not declare
variables const that you plan on modifying.  Limiting the scope would be
a better method of preventing unwanted writes to such a variable.

Further, the code in question mentions "compiler bugs" without any links
to bug reports, so it is difficult to know if the issue is resolved in
GCC. The patch was authored in 2006, which would have been GCC 4.0.3 or
4.1.1. The minimal supported version of GCC in the Linux kernel is
currently 4.6.

For what its worth, there was UB before the commit in question, it just
added a barrier and got lucky IRT codegen. I don't think there's any
actual compiler bugs related, just runtime bugs due to UB.

Link: https://github.com/ClangBuiltLinux/linux/issues/610
Fixes: 966f4406d903 ("[MIPS] Work around bad code generation for <asm/io.h>.")
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: Eli Friedman <efriedma@quicinc.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/include/asm/io.h | 14 ++------------
 arch/mips/kernel/setup.c   |  2 +-
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 97a280640daf..d58ff2229738 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -63,21 +63,11 @@
  * instruction, so the lower 16 bits must be zero.  Should be true on
  * on any sane architecture; generic code does not use this assumption.
  */
-extern const unsigned long mips_io_port_base;
+extern unsigned long mips_io_port_base;
 
-/*
- * Gcc will generate code to load the value of mips_io_port_base after each
- * function call which may be fairly wasteful in some cases.  So we don't
- * play quite by the book.  We tell gcc mips_io_port_base is a long variable
- * which solves the code generation issue.  Now we need to violate the
- * aliasing rules a little to make initialization possible and finally we
- * will need the barrier() to fight side effects of the aliasing chat.
- * This trickery will eventually collapse under gcc's optimizer.  Oh well.
- */
 static inline void set_io_port_base(unsigned long base)
 {
-	* (unsigned long *) &mips_io_port_base = base;
-	barrier();
+	mips_io_port_base = base;
 }
 
 /*
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index ab349d2381c3..675223a66d0c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -76,7 +76,7 @@ static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
  * mips_io_port_base is the begin of the address space to which x86 style
  * I/O ports are mapped.
  */
-const unsigned long mips_io_port_base = -1;
+unsigned long mips_io_port_base = -1;
 EXPORT_SYMBOL(mips_io_port_base);
 
 static struct resource code_resource = { .name = "Kernel code", };
-- 
2.22.0.709.g102302147b-goog

