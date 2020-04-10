Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888F71A4242
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 07:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgDJFfa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 01:35:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41351 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgDJFfa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 01:35:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id b8so623283pfp.8
        for <linux-mips@vger.kernel.org>; Thu, 09 Apr 2020 22:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FalcJewdCmgfGzFX/aMfFs5NaeR/JIcK0Q8CJ4LSUoQ=;
        b=BWVHUltcFNDq7L5BEiwW4sbg47YLIq/X4+uA+C8Ah7Q3wGcxW/3hXOgdX6t3no6jMf
         GW2OMlHiKPKp59Z3qiHAFPj1urclXl985O/b0Q0jby3hynt2JMri8b/pAgw5M2oCt3/F
         m3mkLy0bIWQYHG2x9ZbQKiH13OULoC0e5yVC35o1adXLioOVaJ2WnqOlbA326JWzaq5u
         TkfPi7NT947VZ460GZEeFpWfNyku1juxpWBplvgh00byycGvb18xWrFVYGaaSt0nyzOz
         BSKPwVmy9jbR8Zix0exCOvxY0P1SjGGVjwVG3mbKRYrkaCFMdMpvFDu1XQ8g3PqOqJ1s
         V2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=FalcJewdCmgfGzFX/aMfFs5NaeR/JIcK0Q8CJ4LSUoQ=;
        b=r7ZO/kL4FnA0iRovcCpQAZ9V+6CcozXk3vc66eLQuPpG5gatnSFjSivF9cKZL0IRUf
         ADScUZAxxtnSXLtVuah+cxEOSAS8E5EE1lBRd6oUarkxviKO6JPObhE/jy2D+Ous10m1
         cqy/2JrmXIVLJ1Tu5Qx5x+sTYt3rEztjLVbwK9/ORG26LtT9GfucHY/YwbHz0D3H0ymv
         zN2HXtXNDEb+dLzEHGFg2BWCWItaUiY6m2C3e7PNGuF3VufOuIyCQh6kMbySrgVNwA6c
         ayHigS2QUNs2kXlttQBzJFdvFGivhnlw25Ndn9VA01MLteCyy3HyNgS+xQMAl7szx0XO
         MMNg==
X-Gm-Message-State: AGi0PubFhm/9SST5F35Quaa9p8Z/qQtPf2J77kbynm7/zTU6A81UQbdZ
        HHtbUqjjHYRv+oId1tFEVZA=
X-Google-Smtp-Source: APiQypKv6x84McrsGqOKJgzQnEcCDG2W0B6RYAN3XvV3dvK3m2i5mH7nzoa1+L/hGRFp0lr8V96wjw==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr2850060pgm.443.1586496928123;
        Thu, 09 Apr 2020 22:35:28 -0700 (PDT)
Received: from software.domain.org ([104.207.149.93])
        by smtp.gmail.com with ESMTPSA id c126sm780398pfb.83.2020.04.09.22.35.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 22:35:27 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/3] MIPS: Fix the declaration conflict of mm_isBranchInstr()
Date:   Fri, 10 Apr 2020 13:43:58 +0800
Message-Id: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
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

