Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217532679B4
	for <lists+linux-mips@lfdr.de>; Sat, 12 Sep 2020 13:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgILLJp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Sep 2020 07:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgILLIu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Sep 2020 07:08:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FDCC0617AA
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d19so2151143pld.0
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3J7MvYoMlaGuN7yVMKkag28LdGQJPgP1WxJ8QtPQoM=;
        b=NBsYM7ZA2xLFPsW+g7xI4uSwuLDS/YWZe+CQs99zby4BiS/UEXeHTutTwxGWe10Faq
         zzVCCULcwcPrx0x8pINH9GHfop8YFq0UHshiMj1cEQVNWRo/v0Oq8echAAh0+52Z5GP7
         wfbnSgaZL/7rVN29Eg/pgrrlbaulEtSUQQPAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3J7MvYoMlaGuN7yVMKkag28LdGQJPgP1WxJ8QtPQoM=;
        b=h+TB3ICUSjXf1d/++oYHiHBVH1qXPEmbPKfrcEZ3XSeBgXHHAcb7JFfvITUFhfuRWA
         kkvlWtN/8gdgxrjqGDxuLww+wK6S1UOjvNo7X048wP0fghSCb2+yZ6yRGRERh2QDFm5p
         4X+ox75iy3Kyiz23/b4aSCHL9htCcm+2D9cMxePQxER38ejD+UAnfEArYSQuPkUfD2AR
         qoU7ANMkpoKP73C/MyCTgk7zKdfzl0tsr8Jasaa7rjtzzlhxhKA7aCaGKPYVhpDCUEWG
         StvMBXaNUARKs844Sr2hke5+jCSu8jhWM/GxqHqj5naW3KepIDNOpYh4JF3D02NfS2UQ
         7OdQ==
X-Gm-Message-State: AOAM531SUMfLLgT28lZugBE3nNUpmga06CEx4/lTcKj1hl1VmINWq22b
        rTno5KQg+6xQVbmOLfxcxTPlVg==
X-Google-Smtp-Source: ABdhPJxRa+Y7Ek+ZNrL34mW+RpQ1PjHNb9p3FQvoVqIwzTgKyuIG7orY4wHGc9z3T0PDW9rOmddhZQ==
X-Received: by 2002:a17:902:9303:: with SMTP id bc3mr6163396plb.170.1599908909019;
        Sat, 12 Sep 2020 04:08:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z11sm5125838pfc.181.2020.09.12.04.08.25
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
Subject: [PATCH 06/15] selftests/seccomp: mips: Remove O32-specific macro
Date:   Sat, 12 Sep 2020 04:08:11 -0700
Message-Id: <20200912110820.597135-7-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of having the mips O32 macro special-cased, pull the logic into
the SYSCALL_NUM() macro. Additionally include the ABI headers, since
these appear to have been missing, leaving __NR_O32_Linux undefined.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index cfa606d96086..aa1c224371d1 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1756,9 +1756,19 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define SYSCALL_RET(_regs)	(_regs).gprs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
 #elif defined(__mips__)
+# include <asm/unistd_nr_n32.h>
+# include <asm/unistd_nr_n64.h>
+# include <asm/unistd_nr_o32.h>
 # define ARCH_REGS		struct pt_regs
-# define SYSCALL_NUM(_regs)	(_regs).regs[2]
-# define SYSCALL_SYSCALL_NUM	regs[4]
+# define SYSCALL_NUM(_regs)				\
+	({						\
+		typeof((_regs).regs[2]) _nr;		\
+		if ((_regs).regs[2] == __NR_O32_Linux)	\
+			_nr = (_regs).regs[4];		\
+		else					\
+			_nr = (_regs).regs[2];		\
+		_nr;					\
+	})
 # define SYSCALL_NUM_SET(_regs, _nr)			\
 	do {						\
 		if ((_regs).regs[2] == __NR_O32_Linux)	\
@@ -1838,10 +1848,6 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 	}
 #endif
 
-#if defined(__mips__)
-	if (SYSCALL_NUM(regs) == __NR_O32_Linux)
-		return regs.SYSCALL_SYSCALL_NUM;
-#endif
 	return SYSCALL_NUM(regs);
 }
 
-- 
2.25.1

