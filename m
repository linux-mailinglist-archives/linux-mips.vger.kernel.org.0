Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D340D895D5
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 05:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfHLDbf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Aug 2019 23:31:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46925 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfHLDbf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Aug 2019 23:31:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so103319548wru.13;
        Sun, 11 Aug 2019 20:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CIiORaxsknShCfRL75nn07wOJCPKFADThWQpO+7rVHs=;
        b=REkzW2FUBdfwjt8SG6zkKNG2pEIOqqyOP2yzOlSdGozMLfLnoluynhn025S+HivChz
         U1+db6NzVUPDXrBAX823rdwC8tmmAdJIBp4wtCnwYKVgOJ1L8XkGye7yE57cNPnAihMy
         PWIzuL2KSWQXis50w/eUGuLZ354Nkb1ZuJYXjTpO+ucGx3XaWib83cNY7Y6ELEEH6pxb
         nvURelBgS9WXqo6xlJqAXywsuzkubg3o1YIGXYxjRH+NFwUy+W4VvGKSb6sAl+ChN53h
         RTDDXeNQck58h4F8Df30RvZOsNGeu2BI36jezR2x7Emt1XU4rdzJhCoVX+Gk6S4ckPFZ
         3SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CIiORaxsknShCfRL75nn07wOJCPKFADThWQpO+7rVHs=;
        b=fPK9N8eBCJ+Ql/+kIqs6uYrq4XHd5R4RpVOYsgCdLxoQi0EF/Ii1kBRWldufdOR6lY
         tbgEVMpbjmIe0OrvOCR6Gw1LXSLz4hgeVmzSKs9jrAy9i4TUj6qP7yrFF2d0Y0PJyXQn
         XjK6/mej9SJJD959eZVwmz0e794HO9YVVznOC3DOHQjsfCXdSiyvWbfcBo0Ko/ZCJhc6
         fwj8BAG0hP9Vs3XjULVDaC9yZbljpf7rniGGmo7eb30JovOcEityCvaOxYRI59GbHeNB
         JbXozjJ6wXuTaUm05xW/tGTTkK/EqN7AzAnqkMLcSnlHsr0+oP43mFgw3989ombH6l1p
         a71g==
X-Gm-Message-State: APjAAAWlHAu9IZm0SXhoyktzZzruVFV/Ep7tKl8eULCT43PYDdxjPXgn
        g/jCxg4ze60r/W82RD7MLS8=
X-Google-Smtp-Source: APXvYqxtDSZUjQr/+MByGolBL7ow/DNNzEu+D63hZIlHg20khUaLSJzrBbSnipi0bAR2bu1xADrSpg==
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr39563914wrc.4.1565580692982;
        Sun, 11 Aug 2019 20:31:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f12sm117299330wrg.5.2019.08.11.20.31.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 20:31:32 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 2/5] MIPS/ptrace: Update mips_get_syscall_arg's return type
Date:   Sun, 11 Aug 2019 20:31:17 -0700
Message-Id: <20190812033120.43013-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
In-Reply-To: <20190812033120.43013-1-natechancellor@gmail.com>
References: <20190812033120.43013-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

clang warns:

arch/mips/include/asm/syscall.h:136:3: error: variable 'ret' is
uninitialized when used here [-Werror,-Wuninitialized]
                ret |= mips_get_syscall_arg(args++, task, regs, i++);
                ^~~
arch/mips/include/asm/syscall.h:129:9: note: initialize the variable
'ret' to silence this warning
        int ret;
               ^
                = 0
1 error generated.

It's not wrong; however, it's not an issue in practice because ret is
only assigned to, not read from. ret could just be initialized to zero
but looking into it further, ret has been unused since it was first
added in 2012 so just get rid of it and update mips_get_syscall_arg's
return type since none of the return values are ever checked. If it is
ever needed again, this commit can be reverted and ret can be properly
initialized.

Fixes: c0ff3c53d4f9 ("MIPS: Enable HAVE_ARCH_TRACEHOOK.")
Link: https://github.com/ClangBuiltLinux/linux/issues/604
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/include/asm/syscall.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index 83bb439597d8..25fa651c937d 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -54,7 +54,7 @@ static inline void mips_syscall_update_nr(struct task_struct *task,
 		task_thread_info(task)->syscall = regs->regs[2];
 }
 
-static inline unsigned long mips_get_syscall_arg(unsigned long *arg,
+static inline void mips_get_syscall_arg(unsigned long *arg,
 	struct task_struct *task, struct pt_regs *regs, unsigned int n)
 {
 	unsigned long usp __maybe_unused = regs->regs[29];
@@ -63,23 +63,24 @@ static inline unsigned long mips_get_syscall_arg(unsigned long *arg,
 	case 0: case 1: case 2: case 3:
 		*arg = regs->regs[4 + n];
 
-		return 0;
+		return;
 
 #ifdef CONFIG_32BIT
 	case 4: case 5: case 6: case 7:
-		return get_user(*arg, (int *)usp + n);
+		get_user(*arg, (int *)usp + n);
+		return;
 #endif
 
 #ifdef CONFIG_64BIT
 	case 4: case 5: case 6: case 7:
 #ifdef CONFIG_MIPS32_O32
 		if (test_tsk_thread_flag(task, TIF_32BIT_REGS))
-			return get_user(*arg, (int *)usp + n);
+			get_user(*arg, (int *)usp + n);
 		else
 #endif
 			*arg = regs->regs[4 + n];
 
-		return 0;
+		return;
 #endif
 
 	default:
@@ -126,21 +127,13 @@ static inline void syscall_get_arguments(struct task_struct *task,
 {
 	unsigned int i = 0;
 	unsigned int n = 6;
-	int ret;
 
 	/* O32 ABI syscall() */
 	if (mips_syscall_is_indirect(task, regs))
 		i++;
 
 	while (n--)
-		ret |= mips_get_syscall_arg(args++, task, regs, i++);
-
-	/*
-	 * No way to communicate an error because this is a void function.
-	 */
-#if 0
-	return ret;
-#endif
+		mips_get_syscall_arg(args++, task, regs, i++);
 }
 
 extern const unsigned long sys_call_table[];
-- 
2.23.0.rc2

