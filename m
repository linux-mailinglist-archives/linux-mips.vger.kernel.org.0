Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7D453679A
	for <lists+linux-mips@lfdr.de>; Fri, 27 May 2022 21:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354508AbiE0TkF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 May 2022 15:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354581AbiE0Tj5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 May 2022 15:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B9CEAEE10
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653680393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zdu7Pg4zKxm1uKLLvvDVMRmZFDVUqRIRXozl857+hu4=;
        b=Hwcs0HYNGSzkeVsbnLl+HTWF/uU3RK1aWDdyItwvQf+nG/d5FWH+ZXImJHkiryx5jVO5cZ
        hEYhx6XSWFbGh3Ce5Iq3IFJ6wi+0N+oqjPxEslYWG6N4puSaAaeGuwfc2vnc1yZWO8go3r
        ACePsnnng8YtwL7b9gpN6pdpG+YUuQM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-07UMyCPRPDSC-4KgzuM0Hg-1; Fri, 27 May 2022 15:39:47 -0400
X-MC-Unique: 07UMyCPRPDSC-4KgzuM0Hg-1
Received: by mail-il1-f197.google.com with SMTP id l8-20020a056e021aa800b002cf778c63caso3632378ilv.10
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zdu7Pg4zKxm1uKLLvvDVMRmZFDVUqRIRXozl857+hu4=;
        b=zBWPrx3p2uPXh32BjKWzBroLDBhzsplyb7hrBZJL6QtcuhlTEUa4vj+mzl2bir3jGd
         hyta6IPmX65Ir1vfX1eo0B7RW0YV5Lqlg4BVYJMc92W187o6MPw31X2bERndO9+p3ixm
         rEi0cr+ES9Or+CzeBm+ZFrI0nBL61LOcIfMqu6KG/ZLwdov2mzoepp/JJ5h4RKFFNZ6V
         dqKi4cyABwLNI3ZSnlclmBw2sYbqVLrEx5ZLdaMmRfTa7mhb1EZxUdYDlaPILF6hOXDr
         uILasrBsChceH5F9v1DGqjoQ/QfrEbAt0yZDLmzB2Ck7PFBfcj61Z35qvj67yCNiGQ0u
         zHbQ==
X-Gm-Message-State: AOAM530F/NSx06ZVw1u/8bnuZiX1IvaABfr13WouuB2GxOqeoJm1R/fq
        oLypD1Uegcg0jnC+TU39DrZZYQHAjJHPoiFMEUqwczrbacX0qFneQX6iU/6kOICckNgV5iopYy8
        xCS61KwIOhevJSu1OmiacRA==
X-Received: by 2002:a05:6638:1925:b0:32e:dc08:ced3 with SMTP id p37-20020a056638192500b0032edc08ced3mr11834866jal.212.1653680383685;
        Fri, 27 May 2022 12:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycszExypDCmz/kq06KoOIqbe7IWTgWCyXrKhxfATY7rwpEo/+Qx+suJB7x0DjnJcxaZa6AhQ==
X-Received: by 2002:a05:6638:1925:b0:32e:dc08:ced3 with SMTP id p37-20020a056638192500b0032edc08ced3mr11834857jal.212.1653680383300;
        Fri, 27 May 2022 12:39:43 -0700 (PDT)
Received: from localhost.localdomain (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id t2-20020a92c902000000b002d10291f973sm1530215ilp.4.2022.05.27.12.39.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 May 2022 12:39:42 -0700 (PDT)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Will Deacon <will@kernel.org>, Matt Turner <mattst88@gmail.com>,
        linux-s390@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
        linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
        Jonas Bonn <jonas@southpole.se>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-snps-arc@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        David Hildenbrand <david@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        Richard Henderson <rth@twiddle.net>,
        Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org,
        Andrea Arcangeli <aarcange@redhat.com>,
        Helge Deller <deller@gmx.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-um@lists.infradead.org, "H . Peter Anvin" <hpa@zytor.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        openrisc@lists.librecores.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "David S . Miller" <davem@davemloft.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chris Zankel <chris@zankel.net>,
        Michal Simek <monstr@monstr.eu>, x86@kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>, peterx@redhat.com,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Richard Weinberger <richard@nod.at>,
        Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v4] mm: Avoid unnecessary page fault retires on shared memory types
Date:   Fri, 27 May 2022 15:39:36 -0400
Message-Id: <20220527193936.30678-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I observed that for each of the shared file-backed page faults, we're very
likely to retry one more time for the 1st write fault upon no page.  It's
because we'll need to release the mmap lock for dirty rate limit purpose
with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).

Then after that throttling we return VM_FAULT_RETRY.

We did that probably because VM_FAULT_RETRY is the only way we can return
to the fault handler at that time telling it we've released the mmap lock.

However that's not ideal because it's very likely the fault does not need
to be retried at all since the pgtable was well installed before the
throttling, so the next continuous fault (including taking mmap read lock,
walk the pgtable, etc.) could be in most cases unnecessary.

It's not only slowing down page faults for shared file-backed, but also add
more mmap lock contention which is in most cases not needed at all.

To observe this, one could try to write to some shmem page and look at
"pgfault" value in /proc/vmstat, then we should expect 2 counts for each
shmem write simply because we retried, and vm event "pgfault" will capture
that.

To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
show that we've completed the whole fault and released the lock.  It's also
a hint that we should very possibly not need another fault immediately on
this page because we've just completed it.

This patch provides a ~12% perf boost on my aarch64 test VM with a simple
program sequentially dirtying 400MB shmem file being mmap()ed and these are
the time it needs:

  Before: 650.980 ms (+-1.94%)
  After:  569.396 ms (+-1.38%)

I believe it could help more than that.

We need some special care on GUP and the s390 pgfault handler (for gmap
code before returning from pgfault), the rest changes in the page fault
handlers should be relatively straightforward.

Another thing to mention is that mm_account_fault() does take this new
fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.

I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
them as-is.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Vineet Gupta <vgupta@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v4:
- Picked up a-bs and r-bs
- Fix grammar in the comment of faultin_page() [Ingo]
- Fix s390 for gmap since gmap needs the mmap lock [Heiko]
v3:
- Rebase to akpm/mm-unstable
- Copy arch maintainers
---
 arch/alpha/mm/fault.c         |  4 ++++
 arch/arc/mm/fault.c           |  4 ++++
 arch/arm/mm/fault.c           |  4 ++++
 arch/arm64/mm/fault.c         |  4 ++++
 arch/csky/mm/fault.c          |  4 ++++
 arch/hexagon/mm/vm_fault.c    |  4 ++++
 arch/ia64/mm/fault.c          |  4 ++++
 arch/m68k/mm/fault.c          |  4 ++++
 arch/microblaze/mm/fault.c    |  4 ++++
 arch/mips/mm/fault.c          |  4 ++++
 arch/nios2/mm/fault.c         |  4 ++++
 arch/openrisc/mm/fault.c      |  4 ++++
 arch/parisc/mm/fault.c        |  4 ++++
 arch/powerpc/mm/copro_fault.c |  5 +++++
 arch/powerpc/mm/fault.c       |  5 +++++
 arch/riscv/mm/fault.c         |  4 ++++
 arch/s390/mm/fault.c          | 12 ++++++++++++
 arch/sh/mm/fault.c            |  4 ++++
 arch/sparc/mm/fault_32.c      |  4 ++++
 arch/sparc/mm/fault_64.c      |  5 +++++
 arch/um/kernel/trap.c         |  4 ++++
 arch/x86/mm/fault.c           |  4 ++++
 arch/xtensa/mm/fault.c        |  4 ++++
 include/linux/mm_types.h      |  2 ++
 mm/gup.c                      | 34 +++++++++++++++++++++++++++++++++-
 mm/memory.c                   |  2 +-
 26 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ec20c1004abf..ef427a6bdd1a 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -155,6 +155,10 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index dad27e4d69ff..5ca59a482632 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -146,6 +146,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/*
 	 * Fault retry nuances, mmap_lock already relinquished by core mm
 	 */
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index a062e07516dd..46cccd6bf705 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -322,6 +322,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		return 0;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (!(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 77341b160aca..e401d416bbd6 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -607,6 +607,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
 		return 0;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (fault & VM_FAULT_RETRY) {
 		mm_flags |= FAULT_FLAG_TRIED;
 		goto retry;
diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index 7215a46b6b8e..e15f736cca4b 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -285,6 +285,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index 4fac4b9eb316..f73c7cbfe326 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -96,6 +96,10 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/* The most common case -- we are done. */
 	if (likely(!(fault & VM_FAULT_ERROR))) {
 		if (fault & VM_FAULT_RETRY) {
diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index 07379d1a227f..ef78c2d66cdd 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -139,6 +139,10 @@ ia64_do_page_fault (unsigned long address, unsigned long isr, struct pt_regs *re
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		/*
 		 * We ran out of memory, or some other thing happened
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 71aa9f6315dc..4d2837eb3e2a 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -141,6 +141,10 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return 0;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/microblaze/mm/fault.c b/arch/microblaze/mm/fault.c
index a9626e6a68af..5c40c3ebe52f 100644
--- a/arch/microblaze/mm/fault.c
+++ b/arch/microblaze/mm/fault.c
@@ -222,6 +222,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 44f98100e84e..6f72bac39bf2 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -162,6 +162,10 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/nios2/mm/fault.c b/arch/nios2/mm/fault.c
index a32f14cd72f2..edaca0a6c1c1 100644
--- a/arch/nios2/mm/fault.c
+++ b/arch/nios2/mm/fault.c
@@ -139,6 +139,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
index 80bb66ad42f6..c18f7abd64df 100644
--- a/arch/openrisc/mm/fault.c
+++ b/arch/openrisc/mm/fault.c
@@ -167,6 +167,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index f114e102aaf2..fe57175a7792 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -309,6 +309,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		/*
 		 * We hit a shared mapping outside of the file, or some
diff --git a/arch/powerpc/mm/copro_fault.c b/arch/powerpc/mm/copro_fault.c
index c1cb21a00884..7c507fb48182 100644
--- a/arch/powerpc/mm/copro_fault.c
+++ b/arch/powerpc/mm/copro_fault.c
@@ -65,6 +65,11 @@ int copro_handle_mm_fault(struct mm_struct *mm, unsigned long ea,
 
 	ret = 0;
 	*flt = handle_mm_fault(vma, ea, is_write ? FAULT_FLAG_WRITE : 0, NULL);
+
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (*flt & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (unlikely(*flt & VM_FAULT_ERROR)) {
 		if (*flt & VM_FAULT_OOM) {
 			ret = -ENOMEM;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index d53fed4eccbd..014005428687 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -511,6 +511,10 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		goto out;
+
 	/*
 	 * Handle the retry right now, the mmap_lock has been released in that
 	 * case.
@@ -525,6 +529,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (unlikely(fault & VM_FAULT_ERROR))
 		return mm_fault_error(regs, address, fault);
 
+out:
 	/*
 	 * Major/minor page fault accounting.
 	 */
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 4e9efbe46d5f..d6a87f4137ca 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -330,6 +330,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_RETRY)) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index e173b6187ad5..4608cc962ecf 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -433,6 +433,17 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 			goto out_up;
 		goto out;
 	}
+
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED) {
+		/*
+		 * Gmap will need the mmap lock again, so retake it.  TODO:
+		 * only conditionally take the lock when CONFIG_PGSTE set.
+		 */
+		mmap_read_lock(mm);
+		goto out_gmap;
+	}
+
 	if (unlikely(fault & VM_FAULT_ERROR))
 		goto out_up;
 
@@ -452,6 +463,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 		mmap_read_lock(mm);
 		goto retry;
 	}
+out_gmap:
 	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
 		address =  __gmap_link(gmap, current->thread.gmap_addr,
 				       address);
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index e175667b1363..acd2f5e50bfc 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -485,6 +485,10 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 		if (mm_fault_error(regs, error_code, address, fault))
 			return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (fault & VM_FAULT_RETRY) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index ad569d9bd124..91259f291c54 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -190,6 +190,10 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 253e07043298..4acc12eafbf5 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -427,6 +427,10 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		goto exit_exception;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		goto lock_released;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -449,6 +453,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	}
 	mmap_read_unlock(mm);
 
+lock_released:
 	mm_rss = get_mm_rss(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
 	mm_rss -= (mm->context.thp_pte_count * (HPAGE_SIZE / PAGE_SIZE));
diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index d1d5d0be0308..d3ce21c4ca32 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -76,6 +76,10 @@ int handle_page_fault(unsigned long address, unsigned long ip,
 		if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
 			goto out_nosemaphore;
 
+		/* The fault is fully completed (including releasing mmap lock) */
+		if (fault & VM_FAULT_COMPLETED)
+			return 0;
+
 		if (unlikely(fault & VM_FAULT_ERROR)) {
 			if (fault & VM_FAULT_OOM) {
 				goto out_of_memory;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index d0074c6ed31a..12ed70b432d6 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1408,6 +1408,10 @@ void do_user_addr_fault(struct pt_regs *regs,
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/*
 	 * If we need to retry the mmap_lock has already been released,
 	 * and if there is a fatal signal pending there is no guarantee
diff --git a/arch/xtensa/mm/fault.c b/arch/xtensa/mm/fault.c
index 06d0973a0d74..5f64305ba8d7 100644
--- a/arch/xtensa/mm/fault.c
+++ b/arch/xtensa/mm/fault.c
@@ -118,6 +118,10 @@ void do_page_fault(struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c09b7f0555b8..decc275db3c9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -729,6 +729,7 @@ typedef __bitwise unsigned int vm_fault_t;
  * @VM_FAULT_NEEDDSYNC:		->fault did not modify page tables and needs
  *				fsync() to complete (for synchronous page faults
  *				in DAX)
+ * @VM_FAULT_COMPLETED:		->fault completed, meanwhile mmap lock released
  * @VM_FAULT_HINDEX_MASK:	mask HINDEX value
  *
  */
@@ -746,6 +747,7 @@ enum vm_fault_reason {
 	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
 	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
 	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
+	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
 	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
 };
 
diff --git a/mm/gup.c b/mm/gup.c
index 2e07cff3b31b..a63d330b9d43 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -951,6 +951,25 @@ static int faultin_page(struct vm_area_struct *vma,
 	}
 
 	ret = handle_mm_fault(vma, address, fault_flags, NULL);
+
+	if (ret & VM_FAULT_COMPLETED) {
+		/*
+		 * With FAULT_FLAG_RETRY_NOWAIT we'll never release the
+		 * mmap lock in the page fault handler. Sanity check this.
+		 */
+		WARN_ON_ONCE(fault_flags & FAULT_FLAG_RETRY_NOWAIT);
+		if (locked)
+			*locked = 0;
+		/*
+		 * We should do the same as VM_FAULT_RETRY, but let's not
+		 * return -EBUSY since that's not reflecting the reality of
+		 * what has happened - we've just fully completed a page
+		 * fault, with the mmap lock released.  Use -EAGAIN to show
+		 * that we want to take the mmap lock _again_.
+		 */
+		return -EAGAIN;
+	}
+
 	if (ret & VM_FAULT_ERROR) {
 		int err = vm_fault_to_errno(ret, *flags);
 
@@ -1177,6 +1196,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			case 0:
 				goto retry;
 			case -EBUSY:
+			case -EAGAIN:
 				ret = 0;
 				fallthrough;
 			case -EFAULT:
@@ -1303,6 +1323,18 @@ int fixup_user_fault(struct mm_struct *mm,
 		return -EINTR;
 
 	ret = handle_mm_fault(vma, address, fault_flags, NULL);
+
+	if (ret & VM_FAULT_COMPLETED) {
+		/*
+		 * NOTE: it's a pity that we need to retake the lock here
+		 * to pair with the unlock() in the callers. Ideally we
+		 * could tell the callers so they do not need to unlock.
+		 */
+		mmap_read_lock(mm);
+		*unlocked = true;
+		return 0;
+	}
+
 	if (ret & VM_FAULT_ERROR) {
 		int err = vm_fault_to_errno(ret, 0);
 
@@ -1368,7 +1400,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 			/* VM_FAULT_RETRY couldn't trigger, bypass */
 			return ret;
 
-		/* VM_FAULT_RETRY cannot return errors */
+		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
 		if (!*locked) {
 			BUG_ON(ret < 0);
 			BUG_ON(ret >= nr_pages);
diff --git a/mm/memory.c b/mm/memory.c
index 54d106e0c999..a8be2d7a8718 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3020,7 +3020,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
 		balance_dirty_pages_ratelimited(mapping);
 		if (fpin) {
 			fput(fpin);
-			return VM_FAULT_RETRY;
+			return VM_FAULT_COMPLETED;
 		}
 	}
 
-- 
2.32.0

