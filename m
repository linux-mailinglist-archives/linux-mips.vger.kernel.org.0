Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3217E14E8
	for <lists+linux-mips@lfdr.de>; Sun,  5 Nov 2023 17:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjKEQfg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Nov 2023 11:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjKEQe4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Nov 2023 11:34:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8B2D71
        for <linux-mips@vger.kernel.org>; Sun,  5 Nov 2023 08:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699202042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B1ldUB6ou+0P1E1drMyZOUxJwq+BJM9HrE783LsQMzo=;
        b=bQKl2xT4yj80IBi0viMjhjc76O3Vu7Ac0f7QurR6HFOTrguZlwtI1Mfb1eesHLKNlTcYbW
        FbDwT8Hk5IYMy+CRHh1czrT1+4asVDaFHVE5CVd+kKQ2oSU4Cc2U0xarxr16h/LlM2xe8u
        jGchfpoiMXQskMcNE82EFqsucmkziw4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-P_yDh12lOQqky4BeDxYozQ-1; Sun,
 05 Nov 2023 11:33:59 -0500
X-MC-Unique: P_yDh12lOQqky4BeDxYozQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC5E29ABA21;
        Sun,  5 Nov 2023 16:33:57 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BC2CA2166B26;
        Sun,  5 Nov 2023 16:33:50 +0000 (UTC)
From:   Paolo Bonzini <pbonzini@redhat.com>
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
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
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
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH 24/34] KVM: selftests: Add support for creating private memslots
Date:   Sun,  5 Nov 2023 17:30:27 +0100
Message-ID: <20231105163040.14904-25-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sean Christopherson <seanjc@google.com>

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
Message-Id: <20231027182217.3615211-27-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 23 ++++++
 .../testing/selftests/kvm/include/test_util.h |  5 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 76 +++++++++++--------
 3 files changed, 73 insertions(+), 31 deletions(-)

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
index 3676b37bea38..b63500fca627 100644
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
@@ -999,14 +980,38 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
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
+	if (flags & KVM_MEM_GUEST_MEMFD) {
+		if (guest_memfd < 0) {
+			uint32_t guest_memfd_flags = 0;
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
@@ -1019,9 +1024,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
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
@@ -1042,6 +1048,14 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
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
2.39.1


