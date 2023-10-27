Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE42A7DA0D7
	for <lists+linux-mips@lfdr.de>; Fri, 27 Oct 2023 20:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346405AbjJ0SqX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Oct 2023 14:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235083AbjJ0SqV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Oct 2023 14:46:21 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AEC1FFA
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:17 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da0ccfc4fc8so1131213276.2
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430997; x=1699035797; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RLaDQqSQ3lzZ0t/3jaQVA6mY285XfPpfvSiTXdbQLio=;
        b=E1Gjgb/o3kCtRLvYTwKnooWmkmz0QvtISCmAc8DRuzlm07dZZs+jjIffdigmNro9CU
         oX6AvI451J+23NKaK6X9GCOKzLwYlx/NhW+m1MBtunC616TKdquxDlICXIZLl+80IXfG
         l0et9LDCco6wYEc8e1O+RcM/hYS5foeO18b4pQiK+LIB+DqD4Q+as/v1pbzOYoNy1hg9
         6TEpEdB9mPQz4bhfdYDEzMvJKUQC6MxSI8LZy3wmvzss+fPeJSsOOJtsNDucEMj1c9R4
         6M+37ey7EZtL1HUIJhhI1r1gV35WwRxBzbYs5A68gE2pVlpyLskDUD3r+idIpBdQ3Bvf
         Z8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430997; x=1699035797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLaDQqSQ3lzZ0t/3jaQVA6mY285XfPpfvSiTXdbQLio=;
        b=VRloy7qXJjlgl2bOOMw4C9GpEsCdwSrampcUEqadJbhw+YrV80PQq6SzhBDmcAqTWO
         ut7YcnO9HqFgLL6n9caF1wUa+EL9YqBI96lmGcV+eVzXFLq61EXqxgzA6h+/PeIc/jlo
         d1Et2g6/Coh3hvQu5DH9mj7zUtKwrwTLmQ9LxGv4Ga5oghBNQZFQqN5KPS97Yv272n/w
         IjisGaBlTuo7F8+fHeM5KNLDhm4PS7beJTevynca4Y4utWoRQS6IjJVGJRKafs8p00J3
         dOeN6SsBnuMgdMVfoo1/E6gmbbx22NTkkQ8yJDPaoq6ZdwGCwdsCZLfFzs0tAZOhWsup
         HwuA==
X-Gm-Message-State: AOJu0YzCfcJh/rn+FEcQkjV01fPiJlw6z7idc9//5gkm4+tswBjYfYIA
        DEcN6T7kpA8rqvY5n+Nbpy3f8baX4V4=
X-Google-Smtp-Source: AGHT+IFVwKsM7vhHHbindB36SAJ//dsM5jy6/DD1JTv8kubZidgUJZpq/2shomqVAZOPrnOCRBDGbJqIEWs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1782:b0:d81:582b:4661 with SMTP id
 ca2-20020a056902178200b00d81582b4661mr65203ybb.8.1698430996901; Fri, 27 Oct
 2023 11:23:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 27 Oct 2023 11:22:08 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-27-seanjc@google.com>
Subject: [PATCH v13 26/35] KVM: selftests: Add support for creating private memslots
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for creating "private" memslots via KVM_CREATE_GUEST_MEMFD and
KVM_SET_USER_MEMORY_REGION2.  Make vm_userspace_mem_region_add() a wrapper
to its effective replacement, vm_mem_add(), so that private memslots are
fully opt-in, i.e. don't require update all tests that add memory regions.

Pivot on the KVM_MEM_PRIVATE flag instead of the validity of the "gmem"
file descriptor so that simple tests can let vm_mem_add() do the heavy
lifting of creating the guest memfd, but also allow the caller to pass in
an explicit fd+offset so that fancier tests can do things like back
multiple memslots with a single file.  If the caller passes in a fd, dup()
the fd so that (a) __vm_mem_region_delete() can close the fd associated
with the memory region without needing yet another flag, and (b) so that
the caller can safely close its copy of the fd without having to first
destroy memslots.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 23 +++++
 .../testing/selftests/kvm/include/test_util.h |  5 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 85 ++++++++++++-------
 3 files changed, 82 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 9f144841c2ee..9f861182c02a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -431,6 +431,26 @@ static inline uint64_t vm_get_stat(struct kvm_vm *vm, const char *stat_name)
 
 void vm_create_irqchip(struct kvm_vm *vm);
 
+static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
+					uint64_t flags)
+{
+	struct kvm_create_guest_memfd guest_memfd = {
+		.size = size,
+		.flags = flags,
+	};
+
+	return __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &guest_memfd);
+}
+
+static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
+					uint64_t flags)
+{
+	int fd = __vm_create_guest_memfd(vm, size, flags);
+
+	TEST_ASSERT(fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd));
+	return fd;
+}
+
 void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 			       uint64_t gpa, uint64_t size, void *hva);
 int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
@@ -439,6 +459,9 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 	uint32_t flags);
+void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
+		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+		uint32_t flags, int guest_memfd_fd, uint64_t guest_memfd_offset);
 
 void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 7e614adc6cf4..7257f2243ab9 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -142,6 +142,11 @@ static inline bool backing_src_is_shared(enum vm_mem_backing_src_type t)
 	return vm_mem_backing_src_alias(t)->flag & MAP_SHARED;
 }
 
+static inline bool backing_src_can_be_huge(enum vm_mem_backing_src_type t)
+{
+	return t != VM_MEM_SRC_ANONYMOUS && t != VM_MEM_SRC_SHMEM;
+}
+
 /* Aligns x up to the next multiple of size. Size must be a power of 2. */
 static inline uint64_t align_up(uint64_t x, uint64_t size)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 3676b37bea38..45050f54701a 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -669,6 +669,8 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
 		TEST_ASSERT(!ret, __KVM_SYSCALL_ERROR("munmap()", ret));
 		close(region->fd);
 	}
+	if (region->region.guest_memfd >= 0)
+		close(region->region.guest_memfd);
 
 	free(region);
 }
@@ -870,36 +872,15 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 		    errno, strerror(errno));
 }
 
-/*
- * VM Userspace Memory Region Add
- *
- * Input Args:
- *   vm - Virtual Machine
- *   src_type - Storage source for this region.
- *              NULL to use anonymous memory.
- *   guest_paddr - Starting guest physical address
- *   slot - KVM region slot
- *   npages - Number of physical pages
- *   flags - KVM memory region flags (e.g. KVM_MEM_LOG_DIRTY_PAGES)
- *
- * Output Args: None
- *
- * Return: None
- *
- * Allocates a memory area of the number of pages specified by npages
- * and maps it to the VM specified by vm, at a starting physical address
- * given by guest_paddr.  The region is created with a KVM region slot
- * given by slot, which must be unique and < KVM_MEM_SLOTS_NUM.  The
- * region is created with the flags given by flags.
- */
-void vm_userspace_mem_region_add(struct kvm_vm *vm,
-	enum vm_mem_backing_src_type src_type,
-	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
-	uint32_t flags)
+/* FIXME: This thing needs to be ripped apart and rewritten. */
+void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
+		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+		uint32_t flags, int guest_memfd, uint64_t guest_memfd_offset)
 {
 	int ret;
 	struct userspace_mem_region *region;
 	size_t backing_src_pagesz = get_backing_src_pagesz(src_type);
+	size_t mem_size = npages * vm->page_size;
 	size_t alignment;
 
 	TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
@@ -952,7 +933,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	/* Allocate and initialize new mem region structure. */
 	region = calloc(1, sizeof(*region));
 	TEST_ASSERT(region != NULL, "Insufficient Memory");
-	region->mmap_size = npages * vm->page_size;
+	region->mmap_size = mem_size;
 
 #ifdef __s390x__
 	/* On s390x, the host address must be aligned to 1M (due to PGSTEs) */
@@ -999,14 +980,47 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	/* As needed perform madvise */
 	if ((src_type == VM_MEM_SRC_ANONYMOUS ||
 	     src_type == VM_MEM_SRC_ANONYMOUS_THP) && thp_configured()) {
-		ret = madvise(region->host_mem, npages * vm->page_size,
+		ret = madvise(region->host_mem, mem_size,
 			      src_type == VM_MEM_SRC_ANONYMOUS ? MADV_NOHUGEPAGE : MADV_HUGEPAGE);
 		TEST_ASSERT(ret == 0, "madvise failed, addr: %p length: 0x%lx src_type: %s",
-			    region->host_mem, npages * vm->page_size,
+			    region->host_mem, mem_size,
 			    vm_mem_backing_src_alias(src_type)->name);
 	}
 
 	region->backing_src_type = src_type;
+
+	if (flags & KVM_MEM_PRIVATE) {
+		if (guest_memfd < 0) {
+			uint32_t guest_memfd_flags = 0;
+
+			/*
+			 * Allow hugepages for the guest memfd backing if the
+			 * "normal" backing is allowed/required to be huge.
+			 */
+			if (src_type != VM_MEM_SRC_ANONYMOUS &&
+			    src_type != VM_MEM_SRC_SHMEM)
+				guest_memfd_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
+			TEST_ASSERT(!guest_memfd_offset,
+				    "Offset must be zero when creating new guest_memfd");
+			guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
+		} else {
+			/*
+			 * Install a unique fd for each memslot so that the fd
+			 * can be closed when the region is deleted without
+			 * needing to track if the fd is owned by the framework
+			 * or by the caller.
+			 */
+			guest_memfd = dup(guest_memfd);
+			TEST_ASSERT(guest_memfd >= 0, __KVM_SYSCALL_ERROR("dup()", guest_memfd));
+		}
+
+		region->region.guest_memfd = guest_memfd;
+		region->region.guest_memfd_offset = guest_memfd_offset;
+	} else {
+		region->region.guest_memfd = -1;
+	}
+
 	region->unused_phy_pages = sparsebit_alloc();
 	sparsebit_set_num(region->unused_phy_pages,
 		guest_paddr >> vm->page_shift, npages);
@@ -1019,9 +1033,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i\n"
 		"  slot: %u flags: 0x%x\n"
-		"  guest_phys_addr: 0x%lx size: 0x%lx",
+		"  guest_phys_addr: 0x%lx size: 0x%lx guest_memfd: %d\n",
 		ret, errno, slot, flags,
-		guest_paddr, (uint64_t) region->region.memory_size);
+		guest_paddr, (uint64_t) region->region.memory_size,
+		region->region.guest_memfd);
 
 	/* Add to quick lookup data structures */
 	vm_userspace_mem_region_gpa_insert(&vm->regions.gpa_tree, region);
@@ -1042,6 +1057,14 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	}
 }
 
+void vm_userspace_mem_region_add(struct kvm_vm *vm,
+				 enum vm_mem_backing_src_type src_type,
+				 uint64_t guest_paddr, uint32_t slot,
+				 uint64_t npages, uint32_t flags)
+{
+	vm_mem_add(vm, src_type, guest_paddr, slot, npages, flags, -1, 0);
+}
+
 /*
  * Memslot to region
  *
-- 
2.42.0.820.g83a721a137-goog

