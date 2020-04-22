Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9AA1B3B5C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 11:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgDVJbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 05:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726284AbgDVJbX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 05:31:23 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E978C03C1A8
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:31:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x77so791992pfc.0
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=RI3C5Y623T71sRS9dDQWClp+tbt78RkdvPP0pVBg6Z0=;
        b=cfQ8GQuIyqAphS3/Pn6a4NMWB5x8taU7YLkfalofNizh/hmVA+zm+pzcEVxQhEdR/P
         zCy2XjVu/D1ge3vAFX6JyCimqGatBA7R36Q3ZGpZ8wEsTk7IcSA8hUkA93S9s3gvjXTN
         ajrSirg1G6whCH/M8kP4dR27AVMxzVd2fX3cqGU/a9+doB2VmkX7zim6nyd2bicGttcY
         1/i4ii+I83pkkszp3JSr2AQ9lR+T+F9EMYopNq8sY9gEbzyuV9kPa9yXR8MpNZQtTzg8
         HkStQH6ZKqA3fQ+oNynoUFS56HI1dhYSb7eSrTWPE/T1wrPuQ1uwTx3wc/uK9OJOEpz3
         piew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=RI3C5Y623T71sRS9dDQWClp+tbt78RkdvPP0pVBg6Z0=;
        b=eWitxooHlNpAqBMnOV/TQ2dWm9CaRvkNZMFS/dQvDUvhX+RcVa6Wo8yIQDqiBEQxsa
         5iwAx3fmHei08knXjgK/7ssVpY7nBVxAOLl55cEOgaMreZ7zY5twmNzug6pQq3W8AiFy
         Sc38lQ7AJCcUnxJeGDnnEggNP2z8179P60CZsmEkvWBVr9lg+xsENeOGEG//AZXeU4fQ
         xmQru5aTbrL+6w4oWYu+e3Ihc+nJGgESMyQiJN8NhuWe6889dPkC/Hqu9RY+mqp2kzw3
         sIZ3nZnggxUZNC42t3El9Ysb/FOYfnShN8SPqOsqOlb+zEMjERFO/51deJs9ak4KvxWd
         F6/g==
X-Gm-Message-State: AGi0PubClPs4Fng6W1pHyF51yY5byEBC+343YwHNu5KgqENRgpzag63K
        q66mm6HJnsr9TYshNxF8ied1nfYFQEg=
X-Google-Smtp-Source: APiQypL1XX+DLYvuU/EWf88bjb9OObf17De2gNtm1gFycryfwcFWq9gocm6VIIRcl4ZaQf/CQDRQBw==
X-Received: by 2002:a62:e418:: with SMTP id r24mr15276598pfh.86.1587547882574;
        Wed, 22 Apr 2020 02:31:22 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id n69sm4957772pjc.8.2020.04.22.02.31.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:31:22 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 1/3] MIPS: Fix the declaration conflict of mm_isBranchInstr()
Date:   Wed, 22 Apr 2020 17:40:20 +0800
Message-Id: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

mm_isBranchInstr() is declared both in branch.h and in fpu_emulator.h
but the two declarations are conflict. If both of them are included by
a same file, they will cause a build error:

./arch/mips/include/asm/branch.h:33:19: error: static declaration of 'mm_isBranchInstr' follows non-static declaration
 static inline int mm_isBranchInstr(struct pt_regs *regs,
                   ^
./arch/mips/include/asm/fpu_emulator.h:177:5: note: previous declaration of 'mm_isBranchInstr' was here
 int mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,

Fix this error by removing both isBranchInstr() and mm_isBranchInstr()
in fpu_emulator.h, and declaring both of them in branch.h.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/branch.h       | 3 +++
 arch/mips/include/asm/fpu_emulator.h | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/branch.h b/arch/mips/include/asm/branch.h
index da80878..fa3dcbf 100644
--- a/arch/mips/include/asm/branch.h
+++ b/arch/mips/include/asm/branch.h
@@ -27,6 +27,9 @@ extern int __MIPS16e_compute_return_epc(struct pt_regs *regs);
 #define MM_POOL32A_MINOR_SHIFT	0x6
 #define MM_MIPS32_COND_FC	0x30
 
+int isBranchInstr(struct pt_regs *regs,
+	struct mm_decoded_insn dec_insn, unsigned long *contpc);
+
 extern int __mm_isBranchInstr(struct pt_regs *regs,
 	struct mm_decoded_insn dec_insn, unsigned long *contpc);
 
diff --git a/arch/mips/include/asm/fpu_emulator.h b/arch/mips/include/asm/fpu_emulator.h
index bb7c71f..f67759e 100644
--- a/arch/mips/include/asm/fpu_emulator.h
+++ b/arch/mips/include/asm/fpu_emulator.h
@@ -172,10 +172,6 @@ void force_fcr31_sig(unsigned long fcr31, void __user *fault_addr,
 		     struct task_struct *tsk);
 int process_fpemu_return(int sig, void __user *fault_addr,
 			 unsigned long fcr31);
-int isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
-		  unsigned long *contpc);
-int mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
-		     unsigned long *contpc);
 
 /*
  * Mask the FCSR Cause bits according to the Enable bits, observing
-- 
2.7.0

