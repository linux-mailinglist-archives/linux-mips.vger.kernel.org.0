Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2970895CA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 05:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfHLDbf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Aug 2019 23:31:35 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39533 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfHLDbe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Aug 2019 23:31:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id t16so13199976wra.6;
        Sun, 11 Aug 2019 20:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vWEzzku9YP0pC2dVc45a5odEYQH6f9+aCPyBPp3kmxo=;
        b=SE46LZAyzH6U02vpi2RK3qP0aLUW1s+/BySNKx1Vx4S8RXZICkMsI/eJv+OqXAwPP3
         zvcL+q8quy9DClR6kQeC2lScNnSM+ejjox7aOtH5YfkUQwBYBgn/2tfaqVFaY5PaboST
         lkmwAEWyFKNvfXTrltJpGO+rWBYvxYpWbEhUVcR0Y8ftxIA+BwLfv2xdTsS1ywqc8Nwq
         DjDFHd0hqOILYBuv+Hdku+V8EeM67hr3aueaUlu9dmvJXUjVs75WpAeguDfsiSjI9PNp
         Y8QYv175125TSd/rQ63ui22KWJSxRI+34UAgeSBdM1PVSGCTDQZBjm8Vy6trqLCHRipJ
         mEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vWEzzku9YP0pC2dVc45a5odEYQH6f9+aCPyBPp3kmxo=;
        b=KdMnbGsrAuHssIOgZBC79FZbMuA5XtI3xzqd2kmCt9wxaHlrpzceS5dto4b+TSOfcn
         ZDDwbYcqBCflYaerKpwJetTS16J8q1uCi+ai6A1B3uEVTrVqs/blxfagjuVU/f7hacHB
         PSQMB1FGANv7YmY/kb4bCAwiEx+dPAPWgzrpMPT/u2LquIbhB5LWPl2OFSW3N67+FR9T
         mvUuRi/WUokUaV3VQbMMRbrVFL4ChlMd+o7Cyi9XePa2p527rJzc0fgEldlA42ZOP3v5
         zODYvLPr1SYrAtv8uRCLrI3Oex6NvHsVoFy5G3lAqYSsJ7GUM6ZXEBDMIYo5U/JUxzzW
         Y/2A==
X-Gm-Message-State: APjAAAUo3qYi/zEVIIzkGL5viLdHWD3FJkQlLPuAvlMY8Kg86RcKAtkk
        x5Efcqhw8NuHyfk+IXMxisQ=
X-Google-Smtp-Source: APXvYqxmGrFmRa688YKY6KKrrvbIKQnMYH/dlZ8HtOC/RsQAE59TS2Ihfg/5QMeiJhniZfHANkVALg==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr37798273wro.133.1565580691538;
        Sun, 11 Aug 2019 20:31:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f12sm117299330wrg.5.2019.08.11.20.31.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 20:31:31 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 1/5] MIPS: Don't use bc_false uninitialized in __mm_isBranchInstr
Date:   Sun, 11 Aug 2019 20:31:16 -0700
Message-Id: <20190812033120.43013-2-natechancellor@gmail.com>
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

arch/mips/kernel/branch.c:148:8: error: variable 'bc_false' is used
uninitialized whenever switch case is taken
[-Werror,-Wsometimes-uninitialized]
                case mm_bc2t_op:
                     ^~~~~~~~~~
arch/mips/kernel/branch.c:157:8: note: uninitialized use occurs here
                        if (bc_false)
                            ^~~~~~~~
arch/mips/kernel/branch.c:149:8: error: variable 'bc_false' is used
uninitialized whenever switch case is taken
[-Werror,-Wsometimes-uninitialized]
                case mm_bc1t_op:
                     ^~~~~~~~~~
arch/mips/kernel/branch.c:157:8: note: uninitialized use occurs here
                        if (bc_false)
                            ^~~~~~~~
arch/mips/kernel/branch.c:142:4: note: variable 'bc_false' is declared
here
                        int bc_false = 0;
                        ^
2 errors generated.

When mm_bc1t_op and mm_bc2t_op are taken, the bc_false initialization
does not happen, which leads to a garbage value upon use, as illustrated
below with a small sample program.

$ mipsel-linux-gnu-gcc --version | head -n1
mipsel-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0

$ clang --version | head -n1
ClangBuiltLinux clang version 9.0.0 (git://github.com/llvm/llvm-project
544315b4197034a3be8acd12cba56a75fb1f08dc) (based on LLVM 9.0.0svn)

$ cat test.c
 #include <stdio.h>

 static void switch_scoped(int opcode)
 {
	 switch (opcode) {
	 case 1:
	 case 2: {
		 int bc_false = 0;

		 bc_false = 4;
	 case 3:
	 case 4:
		 printf("\t* switch scoped bc_false = %d\n", bc_false);
	 }
	 }
 }

 static void function_scoped(int opcode)
 {
	 int bc_false = 0;

	 switch (opcode) {
	 case 1:
	 case 2: {
		 bc_false = 4;
	 case 3:
	 case 4:
		 printf("\t* function scoped bc_false = %d\n", bc_false);
	 }
	 }
 }

 int main(void)
 {
	 int opcode;

	 for (opcode = 1; opcode < 5; opcode++) {
		 printf("opcode = %d:\n", opcode);
		 switch_scoped(opcode);
		 function_scoped(opcode);
		 printf("\n");
	 }

	 return 0;
 }

$ mipsel-linux-gnu-gcc -std=gnu89 -static test.c && \
  qemu-mipsel a.out
opcode = 1:
        * switch scoped bc_false = 4
        * function scoped bc_false = 4

opcode = 2:
        * switch scoped bc_false = 4
        * function scoped bc_false = 4

opcode = 3:
        * switch scoped bc_false = 2147483004
        * function scoped bc_false = 0

opcode = 4:
        * switch scoped bc_false = 2147483004
        * function scoped bc_false = 0

$ clang -std=gnu89 --target=mipsel-linux-gnu -m32 -static test.c && \
  qemu-mipsel a.out
opcode = 1:
        * switch scoped bc_false = 4
        * function scoped bc_false = 4

opcode = 2:
        * switch scoped bc_false = 4
        * function scoped bc_false = 4

opcode = 3:
        * switch scoped bc_false = 2147483004
        * function scoped bc_false = 0

opcode = 4:
        * switch scoped bc_false = 2147483004
        * function scoped bc_false = 0

Move the definition up so that we get the right behavior and mark it
__maybe_unused as it will not be used when CONFIG_MIPS_FP_SUPPORT
isn't enabled.

Fixes: 6a1cc218b9cc ("MIPS: branch: Remove FP branch handling when CONFIG_MIPS_FP_SUPPORT=n")
Link: https://github.com/ClangBuiltLinux/linux/issues/603
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/kernel/branch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index 1db29957a931..2c38f75d87ff 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -58,6 +58,7 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 		       unsigned long *contpc)
 {
 	union mips_instruction insn = (union mips_instruction)dec_insn.insn;
+	int __maybe_unused bc_false = 0;
 
 	if (!cpu_has_mmips)
 		return 0;
@@ -139,7 +140,6 @@ int __mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
 #ifdef CONFIG_MIPS_FP_SUPPORT
 		case mm_bc2f_op:
 		case mm_bc1f_op: {
-			int bc_false = 0;
 			unsigned int fcr31;
 			unsigned int bit;
 
-- 
2.23.0.rc2

