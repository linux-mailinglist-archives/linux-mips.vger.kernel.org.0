Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F233A4865
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 20:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhFKSGt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 14:06:49 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:39580 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhFKSGb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 14:06:31 -0400
Received: by mail-wr1-f48.google.com with SMTP id l2so6981153wrw.6
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vVGuSNXWbfjaldG1IhliMoxhhtotqO3ePDulHlgQze8=;
        b=Fe3cjQKb0+SXQJENkP/5P0Pxs/R7x6MoMPdePxTQXG82lzx2CMB4niwuvBFYgp3CBC
         QQl7pCQVeDhw91xbfrM5AzvP6v650wvXsFhGCMXC4XZwadQ8F/OGwZ42QWdCm/NZB1po
         zViLKr2KeYUUaYTLV//X1qWfcinpHv2OgEYQAH88qWgbpTfc5h1U5yLy6OmhEhMihEbW
         2ZZnoMwo8EgFLfFps7HmXfm1MHZxEOiy6uRs69ftx+vbONSfy28se9TI9oklNdGZDTSD
         xIp2QPMXMGJjbAdmPMoGnKPmE1CXLqe4C5MpKjsXvfLn+1w+El/MnFQYzoL+iN1WYDBH
         r3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vVGuSNXWbfjaldG1IhliMoxhhtotqO3ePDulHlgQze8=;
        b=J4cDOe9W69FRONmY5S2C6oa4bX6K43v/AA5gLT1Qk7o5bewnbir1sATbEiblBt5POv
         K+X1n04eQ/hfZ/1owdybl98+gX2QzliDcOJx4rPGwj0JwzIlamKKBU6Fp6eYFGS8PSo+
         l4dOz9sHTYbkh6Dng57GGOQjAA6+D/Y2iOxEIGoUgI+UN40vBgxUDzI3ZWwKyeEWCg7A
         hl5/mJ28d2lXEgKGnHfuvW/HE5lZO+agiCw/v3Tt0oc8xq3jYsc8Q4ZMf3n2lsue6Vwl
         cKwSWpo33hxD/27QX8MU6sC6UKSIvl5EW2kcsrPLV+q/rMr4qfsMWcfWBv/Jf427VD1Q
         z0OA==
X-Gm-Message-State: AOAM531Ja4wK3ok0V4eVJ1vC5h+XRnc06GAR3uRdmNptVajQ0EzHO+YZ
        WMU9iRcjtK87O3aLOHKquxE00w==
X-Google-Smtp-Source: ABdhPJxz9rnzky/Oj1iwMOFsP582nAiPhNa+4cHnLc5DdqZvOMrHxazhJ2t+zdAmD5GHyJAm2S0Mpg==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr5527143wrc.122.1623434596301;
        Fri, 11 Jun 2021 11:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id v15sm7425881wrw.24.2021.06.11.11.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 11:03:15 -0700 (PDT)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, x86@kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v3 16/23] mm: Add vdso_base in mm_struct
Date:   Fri, 11 Jun 2021 19:02:35 +0100
Message-Id: <20210611180242.711399-17-dima@arista.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611180242.711399-1-dima@arista.com>
References: <20210611180242.711399-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of having every architecture to define vdso_base/vdso_addr etc,
provide a generic mechanism to track vdso_base for landing in userspace.
It'll minimize per-architecture difference, the number of callbacks to
provide.

Originally, it started from thread [1] where the need for .close()
callback on vm_special_mapping was pointed, this generic code besides
removing duplicated .mremap() callbacks provides a cheaper way to
support munmap() on vdso mappings without introducing .close() callbacks
for every architecture (which would bring even more code duplication).

[1]: https://lore.kernel.org/linux-arch/CAJwJo6ZANqYkSHbQ+3b+Fi_VT80MtrzEV5yreQAWx-L8j8x2zA@mail.gmail.com/
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/Kconfig                              |  3 +++
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  3 ++-
 fs/aio.c                                  |  3 ++-
 include/linux/mm.h                        |  3 ++-
 include/linux/mm_types.h                  | 17 +++++++++++++++++
 kernel/fork.c                             |  1 +
 mm/mmap.c                                 | 19 ++++++++++++++++++-
 mm/mremap.c                               |  2 +-
 8 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index c45b770d3579..0e648a1ae412 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1235,6 +1235,9 @@ config HAVE_SPARSE_SYSCALL_NR
 config ARCH_HAS_VDSO_DATA
 	bool
 
+config ARCH_HAS_VDSO_BASE
+	bool
+
 config HAVE_STATIC_CALL
 	bool
 
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 05a89e33fde2..5ab191855816 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -1458,7 +1458,8 @@ static int pseudo_lock_dev_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static int pseudo_lock_dev_mremap(struct vm_area_struct *area)
+static int pseudo_lock_dev_mremap(struct vm_area_struct *old_vma,
+				  struct vm_area_struct *new_vma)
 {
 	/* Not supported */
 	return -EINVAL;
diff --git a/fs/aio.c b/fs/aio.c
index 76ce0cc3ee4e..0b27e9300d0f 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -323,7 +323,8 @@ static void aio_free_ring(struct kioctx *ctx)
 	}
 }
 
-static int aio_ring_mremap(struct vm_area_struct *vma)
+static int aio_ring_mremap(struct vm_area_struct *old_vma,
+			   struct vm_area_struct *vma)
 {
 	struct file *file = vma->vm_file;
 	struct mm_struct *mm = vma->vm_mm;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c274f75efcf9..6ef91b337f9d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -589,7 +589,8 @@ struct vm_operations_struct {
 	void (*close)(struct vm_area_struct * area);
 	/* Called any time before splitting to check if it's allowed */
 	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area);
+	int (*mremap)(struct vm_area_struct *old_vma,
+		      struct vm_area_struct *new_vma);
 	/*
 	 * Called by mprotect() to make driver-specific permission
 	 * checks before mprotect() is finalised.   The VMA must not
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e9c5f2051f08..49ad34410132 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -497,6 +497,16 @@ struct mm_struct {
 
 		/* Architecture-specific MM context */
 		mm_context_t context;
+#ifdef CONFIG_ARCH_HAS_VDSO_BASE
+		/*
+		 * Address of special mapping VMA to land after processing
+		 * a signal. Reads are unprotected: if a thread unmaps or
+		 * mremaps the mapping while another thread is processing
+		 * a signal, it can segfault while landing.
+		 */
+		void __user *vdso_base;
+#endif
+#define UNMAPPED_VDSO_BASE TASK_SIZE_MAX
 
 		unsigned long flags; /* Must use atomic bitops to access */
 
@@ -598,6 +608,13 @@ static inline void init_tlb_flush_pending(struct mm_struct *mm)
 	atomic_set(&mm->tlb_flush_pending, 0);
 }
 
+static inline void init_vdso_base(struct mm_struct *mm)
+{
+#ifdef CONFIG_ARCH_HAS_VDSO_BASE
+	mm->vdso_base = (void __user *)UNMAPPED_VDSO_BASE;
+#endif
+}
+
 static inline void inc_tlb_flush_pending(struct mm_struct *mm)
 {
 	atomic_inc(&mm->tlb_flush_pending);
diff --git a/kernel/fork.c b/kernel/fork.c
index dc06afd725cb..eb4ad74d042e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1082,6 +1082,7 @@ struct mm_struct *mm_alloc(void)
 		return NULL;
 
 	memset(mm, 0, sizeof(*mm));
+	init_vdso_base(mm);
 	return mm_init(mm, current, current_user_ns());
 }
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 4f0d62409b1c..5d1ffce51119 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3381,11 +3381,25 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
 
 static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
 
+static void update_vdso_base(struct vm_area_struct *old_vma,
+				unsigned long new_addr)
+{
+#ifdef CONFIG_ARCH_HAS_VDSO_BASE
+	struct mm_struct *mm = old_vma->vm_mm;
+
+	if (WARN_ON_ONCE(!mm))
+		return;
+	if (old_vma->vm_start == (unsigned long)mm->vdso_base)
+		mm->vdso_base = (void __user *)new_addr;
+#endif
+}
+
 /*
  * Having a close hook prevents vma merging regardless of flags.
  */
 static void special_mapping_close(struct vm_area_struct *vma)
 {
+	update_vdso_base(vma, UNMAPPED_VDSO_BASE);
 }
 
 static const char *special_mapping_name(struct vm_area_struct *vma)
@@ -3393,7 +3407,8 @@ static const char *special_mapping_name(struct vm_area_struct *vma)
 	return ((struct vm_special_mapping *)vma->vm_private_data)->name;
 }
 
-static int special_mapping_mremap(struct vm_area_struct *new_vma)
+static int special_mapping_mremap(struct vm_area_struct *old_vma,
+				  struct vm_area_struct *new_vma)
 {
 	struct vm_special_mapping *sm = new_vma->vm_private_data;
 
@@ -3403,6 +3418,8 @@ static int special_mapping_mremap(struct vm_area_struct *new_vma)
 	if (sm->mremap)
 		sm->mremap(sm, new_vma);
 
+	update_vdso_base(old_vma, new_vma->vm_start);
+
 	return 0;
 }
 
diff --git a/mm/mremap.c b/mm/mremap.c
index 47c255b60150..d28ba49d607c 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -545,7 +545,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 	if (moved_len < old_len) {
 		err = -ENOMEM;
 	} else if (vma->vm_ops && vma->vm_ops->mremap) {
-		err = vma->vm_ops->mremap(new_vma);
+		err = vma->vm_ops->mremap(vma, new_vma);
 	}
 
 	if (unlikely(err)) {
-- 
2.31.1

