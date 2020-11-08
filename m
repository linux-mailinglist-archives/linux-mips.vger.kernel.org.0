Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4445F2AA932
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 06:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgKHFSA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 00:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgKHFRx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Nov 2020 00:17:53 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F249C0613D3
        for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2020 21:17:53 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so1420241wrw.1
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2020 21:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bBSLG96RY89J3ujrhGgmzBNVXUqDuHuFKvFuenf1I0s=;
        b=n5irH7IUe5CSOCE4vSCUf3Gk8fJJ7/ZUNzRbvwqx/yu6Ey9GJP3Rz8hL+fN6cfVvgu
         qrMPwvmjk9JPaZDklQmduYtdlsCii66SfW8wxBFGeb+IFHxcA4Hx0M1K9IGe+Fhtv999
         ZDe+F9U6a41PmANlcjPFM2P3v5MVwQGXRxZYj409meZzfh1Fv+yt6Y+f0zPjKKXdyYwB
         pV0BZh3KA2iUCv3hOZX1udHLi5XN/9QHYkr8Q7UC7atRIQhuDTU2LBM7AUelFIZ4ErdG
         Ajl9nCDjZJPmWQC0GRzDT/HXlmPk4BIqRfI7pKwnZSZx6l+c066zQdTAW5iBHDIcSSPi
         1Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bBSLG96RY89J3ujrhGgmzBNVXUqDuHuFKvFuenf1I0s=;
        b=B7g3wU61BqjVq9CU0bOhONo79LqUwipiwj366ViWELloYLVuuXk9/L7MFezLD/SoLM
         RVx1SSWRBD4A4K0Nrv9w7Nak+P1/yytMvzqjzjwDQnrachUv6OvANRCPDS1KdUPcoY1x
         cYDi58O5Z7Yd+D5IRgTnm+s8z2Ru6q+59u6tmE2VBamRbUQr9ehPUgoHH9nwIczA/CU4
         zUOg/EBvaiRO7Yk1sIw5bO+LiH/VOZPdBflroyixnIpiBzJiruHLDb0cZ34qFWuA10Pb
         JrXFOL6Jed7GloFQnCilGYT12c8t0b1vKBCc4q397rZFd/DNkuMq6VGdsDr9ttJ4bl2I
         az9w==
X-Gm-Message-State: AOAM533qYpb5J6SCxCRTZ0MUEAIucXPaaqmESjxuC0wvcbBCwjiJwWFl
        2cUNMhtIb66ZF0GtxRwqCJjvfA==
X-Google-Smtp-Source: ABdhPJwMKoZ2qZwrNhTPEuxyBG3/OuhmyUM+ZW0mJ7H4tiP35FAN4BJieZNjLFt6LfZaR5C/iGpRrQ==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr11084921wro.393.1604812671838;
        Sat, 07 Nov 2020 21:17:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id r10sm8378462wmg.16.2020.11.07.21.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 21:17:51 -0800 (PST)
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
Subject: [PATCH 14/19] mm: Add user_landing in mm_struct
Date:   Sun,  8 Nov 2020 05:17:24 +0000
Message-Id: <20201108051730.2042693-15-dima@arista.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108051730.2042693-1-dima@arista.com>
References: <20201108051730.2042693-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of having every architecture to define vdso_base/vdso_addr etc,
provide a generic mechanism to track landing in userspace.
It'll minimize per-architecture difference, the number of callbacks to
provide.

Originally, it started from thread [1] where the need for .close()
callback on vm_special_mapping was pointed, this generic code besides
removing duplicated .mremap() callbacks provides a cheaper way to
support munmap() on vdso mappings without introducing .close() callbacks
for every architecture (with would bring even more code duplication).

[1]: https://lore.kernel.org/linux-arch/CAJwJo6ZANqYkSHbQ+3b+Fi_VT80MtrzEV5yreQAWx-L8j8x2zA@mail.gmail.com/
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  3 ++-
 fs/aio.c                                  |  3 ++-
 include/linux/mm.h                        |  3 ++-
 include/linux/mm_types.h                  | 10 ++++++++++
 mm/Kconfig                                |  3 +++
 mm/mmap.c                                 | 19 ++++++++++++++++++-
 mm/mremap.c                               |  2 +-
 7 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index e916646adc69..786c97203bf6 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -1458,7 +1458,8 @@ static int pseudo_lock_dev_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static int pseudo_lock_dev_mremap(struct vm_area_struct *area, unsigned long flags)
+static int pseudo_lock_dev_mremap(struct vm_area_struct *old_vma,
+		struct vm_area_struct *new_vma, unsigned long flags)
 {
 	/* Not supported */
 	return -EINVAL;
diff --git a/fs/aio.c b/fs/aio.c
index d1dad4cd860f..2695dc9ed46f 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -324,7 +324,8 @@ static void aio_free_ring(struct kioctx *ctx)
 	}
 }
 
-static int aio_ring_mremap(struct vm_area_struct *vma, unsigned long flags)
+static int aio_ring_mremap(struct vm_area_struct *old_vma,
+			   struct vm_area_struct *vma, unsigned long flags)
 {
 	struct file *file = vma->vm_file;
 	struct mm_struct *mm = vma->vm_mm;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 427911d2c83e..4b0f97a289b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -559,7 +559,8 @@ struct vm_operations_struct {
 	void (*close)(struct vm_area_struct * area);
 	/* Called any time before splitting to check if it's allowed */
 	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area, unsigned long flags);
+	int (*mremap)(struct vm_area_struct *old_vma,
+			struct vm_area_struct *new_vma, unsigned long flags);
 	vm_fault_t (*fault)(struct vm_fault *vmf);
 	vm_fault_t (*huge_fault)(struct vm_fault *vmf,
 			enum page_entry_size pe_size);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index b035caff6abe..f888257e973a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -488,6 +488,16 @@ struct mm_struct {
 
 		/* Architecture-specific MM context */
 		mm_context_t context;
+#ifdef CONFIG_ARCH_HAS_USER_LANDING
+		/*
+		 * Address of special mapping VMA to land after processing
+		 * a signal. Reads are unprotected: if a thread unmaps or
+		 * mremaps the mapping while another thread is processing
+		 * a signal, it can segfault while landing.
+		 */
+		void __user *user_landing;
+#endif
+#define UNMAPPED_USER_LANDING TASK_SIZE_MAX
 
 		unsigned long flags; /* Must use atomic bitops to access */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 01b0ae0cd9d3..d43b61a21be8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -883,4 +883,7 @@ config ARCH_HAS_HUGEPD
 config MAPPING_DIRTY_HELPERS
         bool
 
+config ARCH_HAS_USER_LANDING
+	bool
+
 endmenu
diff --git a/mm/mmap.c b/mm/mmap.c
index 2376f3972f13..8a17ffdedacb 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3410,11 +3410,25 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
 
 static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
 
+static void update_user_landing(struct vm_area_struct *old_vma,
+				unsigned long new_addr)
+{
+#ifdef CONFIG_ARCH_HAS_USER_LANDING
+	struct mm_struct *mm = old_vma->vm_mm;
+
+	if (WARN_ON_ONCE(!mm))
+		return;
+	if (old_vma->vm_start == (unsigned long)mm->user_landing)
+		mm->user_landing = (void __user *)new_addr;
+#endif
+}
+
 /*
  * Having a close hook prevents vma merging regardless of flags.
  */
 static void special_mapping_close(struct vm_area_struct *vma)
 {
+	update_user_landing(vma, UNMAPPED_USER_LANDING);
 }
 
 static const char *special_mapping_name(struct vm_area_struct *vma)
@@ -3422,7 +3436,8 @@ static const char *special_mapping_name(struct vm_area_struct *vma)
 	return ((struct vm_special_mapping *)vma->vm_private_data)->name;
 }
 
-static int special_mapping_mremap(struct vm_area_struct *new_vma,
+static int special_mapping_mremap(struct vm_area_struct *old_vma,
+				  struct vm_area_struct *new_vma,
 				  unsigned long flags)
 {
 	struct vm_special_mapping *sm = new_vma->vm_private_data;
@@ -3436,6 +3451,8 @@ static int special_mapping_mremap(struct vm_area_struct *new_vma,
 	if (sm->mremap)
 		sm->mremap(sm, new_vma);
 
+	update_user_landing(old_vma, new_vma->vm_start);
+
 	return 0;
 }
 
diff --git a/mm/mremap.c b/mm/mremap.c
index c5590afe7165..9595f6b72101 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -543,7 +543,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 	if (moved_len < old_len) {
 		err = -ENOMEM;
 	} else if (vma->vm_ops && vma->vm_ops->mremap) {
-		err = vma->vm_ops->mremap(new_vma, flags);
+		err = vma->vm_ops->mremap(vma, new_vma, flags);
 	}
 
 	if (unlikely(err)) {
-- 
2.28.0

