Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A282C1A05
	for <lists+linux-mips@lfdr.de>; Tue, 24 Nov 2020 01:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgKXAaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Nov 2020 19:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729837AbgKXA36 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Nov 2020 19:29:58 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C321C0613CF
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2020 16:29:57 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h21so1201350wmb.2
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2020 16:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jxAZls+WEUtHXpD0UKtrhiDIolPVWAm7Euh3LwwdpWY=;
        b=O+QC0fgqTt42fxJ35YTMSq5Sw3kp5tRJc5zZT5xsZSL8I/w9NDgFj6nDM1ZB1sYBM+
         uHJCrCBygfCSlglAAoV0AlHJX5kxyi1OqKPeQ1mXR52i5nAXDUxl2rEfZKrlGECA+m3J
         CfC2fe3UNx7/skFJrbGPCuhUBwgj+TAl5Mfqem1JR9rz4ad+Ve1JCwGzCwZmoOBbrkpH
         OVzBuzwNtLP0W5GQ2D4NJJDpfmLBoBnp0cTPLI/vCKm9LH9zB4L2YuTfnoiV0j4XdsUT
         WlF4cZ3WMHlQljzw9Q7WIbrp1pUljHCBw+OJB8DDCNC8yvvSmIZZgrHtLg/QwbShLqq/
         M11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jxAZls+WEUtHXpD0UKtrhiDIolPVWAm7Euh3LwwdpWY=;
        b=Mss+GYLQK0IOm3aMe6n5QBW7i193cAkGp2zA6G+fVzDNEAubB2omVaY+UDR23wkEL4
         o/hLCGL8JmsTMW0GOVUPu0EE1yBgAjnaqDcgcsE9Qk12jKuOm8U12xrs5mQKxGOt+dJn
         huf16fH3ahtv835OaX1aP2WxMld5v52vAwvREsinWjygo2kwUQm3kn1e+mJEO7o8nARV
         EOjQFAQP+/VNKgNPGLfFp5/BxkPadxFYofJYLjBYLe9yC+GkwbxDsqKv30NxcH5O7wUl
         Zuyk21PPvYrkZvGT6GmXT4rKb23iyTyguMq8P8suajesIZQZAfyOjU4hh+YEt7OXCVMF
         ANnA==
X-Gm-Message-State: AOAM531FdZqqyyv9a15CwzpHguwqz/kvPRFcmMzUiejWnd/NTarJ8S57
        QMYrUo8FY1XoAqMdIKFRYGZ9ig==
X-Google-Smtp-Source: ABdhPJx3Rnn4ZCBnIokXGMO/DvdttKDu8Be01BvN6y9Yw2n16NFBHvHTm+1LG3nhL+cpq8cemkPuSw==
X-Received: by 2002:a1c:a986:: with SMTP id s128mr1413531wme.94.1606177796064;
        Mon, 23 Nov 2020 16:29:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id c6sm25047360wrh.74.2020.11.23.16.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:29:55 -0800 (PST)
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
Subject: [PATCH v2 14/19] mm: Add vdso_base in mm_struct
Date:   Tue, 24 Nov 2020 00:29:27 +0000
Message-Id: <20201124002932.1220517-15-dima@arista.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124002932.1220517-1-dima@arista.com>
References: <20201124002932.1220517-1-dima@arista.com>
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
index d213be7b8a7e..9b205ebf17e8 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -323,7 +323,8 @@ static void aio_free_ring(struct kioctx *ctx)
 	}
 }
 
-static int aio_ring_mremap(struct vm_area_struct *vma, unsigned long flags)
+static int aio_ring_mremap(struct vm_area_struct *old_vma,
+			   struct vm_area_struct *vma, unsigned long flags)
 {
 	struct file *file = vma->vm_file;
 	struct mm_struct *mm = vma->vm_mm;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a1c25da94663..dbda1b91f971 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -559,7 +559,8 @@ struct vm_operations_struct {
 	void (*close)(struct vm_area_struct * area);
 	/* Called any time before splitting to check if it's allowed */
 	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area, unsigned long flags);
+	int (*mremap)(struct vm_area_struct *old_vma,
+			struct vm_area_struct *new_vma, unsigned long flags);
 	/*
 	 * Called by mprotect() to make driver-specific permission
 	 * checks before mprotect() is finalised.   The VMA must not
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 95a257927dae..e1ca750874af 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -496,6 +496,16 @@ struct mm_struct {
 
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
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 29904dc16bfc..941ae0597734 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -893,4 +893,7 @@ config SECRETMEM
 	select GENERIC_ALLOCATOR
 	select CMA
 
+config ARCH_HAS_VDSO_BASE
+	bool
+
 endmenu
diff --git a/mm/mmap.c b/mm/mmap.c
index 17fe59a9780b..561afc3f1744 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3409,11 +3409,25 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
 
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
@@ -3421,7 +3435,8 @@ static const char *special_mapping_name(struct vm_area_struct *vma)
 	return ((struct vm_special_mapping *)vma->vm_private_data)->name;
 }
 
-static int special_mapping_mremap(struct vm_area_struct *new_vma,
+static int special_mapping_mremap(struct vm_area_struct *old_vma,
+				  struct vm_area_struct *new_vma,
 				  unsigned long flags)
 {
 	struct vm_special_mapping *sm = new_vma->vm_private_data;
@@ -3435,6 +3450,8 @@ static int special_mapping_mremap(struct vm_area_struct *new_vma,
 	if (sm->mremap)
 		sm->mremap(sm, new_vma);
 
+	update_vdso_base(old_vma, new_vma->vm_start);
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
2.29.2

