Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F891B7270
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 12:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDXKrf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 06:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDXKrf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 06:47:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D70DC09B045
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2020 03:47:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so4469665pgg.2
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2020 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=RI3C5Y623T71sRS9dDQWClp+tbt78RkdvPP0pVBg6Z0=;
        b=ReW3OTSdimWvMpQi6okKn/bUHdMB9TwUeNsGLba/nz68zph/O+gXerikXtSW7hri5o
         aLHrBQyNoExC2C24ILjZb12ornLQbytw3zA5JjdW8/Ch2yp/50/TMF4HGgspiGhRCidX
         l1RB7IQY77mcxuKvKa2N8F1YyEItmQgLRUVhW8ePjWIUJi09MJETVP293tF+QMI3Qn4K
         Sy0ghlyAhZ4yeyB9qlE9AvePn9RUtUBLLnjhxpcjZslaxZRvyD3z6B60BbMVCpOZHWnJ
         rF4/H5ltuN5fZbTEMuJeEysADEjY1WPYvBcZKD4peTFgyzRMEnAPaPEmAApOdSP0srZF
         afAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=RI3C5Y623T71sRS9dDQWClp+tbt78RkdvPP0pVBg6Z0=;
        b=LZQEp3W1+nlSxRuwQWp6hueD7rCimnPjPW6ymmc0aFntB91f5I8kzEgiHgA4zP6RCO
         ZfasejTDZzt056dZrz8mlwRdrZhGMziAchl72w4xBr4iHi+7DAkRVVY5i6tySVsK0iej
         codh3fLDDftE2P8+pCJmXOe8zXZEGFholx16WrorSPdfbvp80HowFMd/YxsqAhAm5jn3
         NYC+46peUhcFFMrjm5tdE7aHpMk6BJ5Uc8JPv1zIbW92AVP3T7G0GBvlQKyd3Y6vqQZV
         WVPElp8jNEsSove8Kg9Sfl7xJMe7+21u2Wr49nGuUHAbZgsuBUdLjL/r56EGRb52/pQv
         Cbag==
X-Gm-Message-State: AGi0PuajvWYF0RcLjQwmqGoGci7Vs0h0umzsCAj9suPpf63XF7Wicjzc
        sYdoFe0cEyEc4p/J9AaFVePC9MDwH6A=
X-Google-Smtp-Source: APiQypKIk5pXIwwJ6bvUu5k9bzuFeLvwtkmxvo2TZEX2lzr2neO6clR244b05sxE5nFwNrc3cm5EKA==
X-Received: by 2002:a63:4d11:: with SMTP id a17mr8203610pgb.392.1587725255082;
        Fri, 24 Apr 2020 03:47:35 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id j2sm5511988pfb.73.2020.04.24.03.47.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 03:47:34 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 1/3] MIPS: Fix the declaration conflict of mm_isBranchInstr()
Date:   Fri, 24 Apr 2020 18:56:44 +0800
Message-Id: <1587725806-4529-1-git-send-email-chenhc@lemote.com>
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

