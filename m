Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02427E14C9
	for <lists+linux-mips@lfdr.de>; Sun,  5 Nov 2023 17:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjKEQeG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Nov 2023 11:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjKEQdr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Nov 2023 11:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DE010C0
        for <linux-mips@vger.kernel.org>; Sun,  5 Nov 2023 08:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699201971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XHACJ7RpBjrhZ0SlrYeKzjEbi6XAqn0eXX0PT9UuI7U=;
        b=W1Va4yFeNsXaV+jLq9EbTFz04uxYRRwerJc58oY1teMRJtdP7VIcbKpFlvMBzQw1nqtuXi
        pJx74Og49aDgWpS+tTbVAUK7LBJbEz7ZN6QmyFj9DX3+Fea4NaMCt/REeeCLK6NELjMl7e
        87sTWtr8nvVZqXAHjTBzmrGTaf7GCVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-E19P8MKAP5-sd8tLUVwEFA-1; Sun, 05 Nov 2023 11:32:49 -0500
X-MC-Unique: E19P8MKAP5-sd8tLUVwEFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15D7C101A529;
        Sun,  5 Nov 2023 16:32:47 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA89C2166B26;
        Sun,  5 Nov 2023 16:32:37 +0000 (UTC)
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
Subject: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory
Date:   Sun,  5 Nov 2023 17:30:18 +0100
Message-ID: <20231105163040.14904-16-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sean Christopherson <seanjc@google.com>

Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
memory that is tied to a specific KVM virtual machine and whose primary
purpose is to serve guest memory.

A guest-first memory subsystem allows for optimizations and enhancements
that are kludgy or outright infeasible to implement/support in a generic
memory subsystem.  With guest_memfd, guest protections and mapping sizes
are fully decoupled from host userspace mappings.   E.g. KVM currently
doesn't support mapping memory as writable in the guest without it also
being writable in host userspace, as KVM's ABI uses VMA protections to
define the allow guest protection.  Userspace can fudge this by
establishing two mappings, a writable mapping for the guest and readable
one for itself, but that’s suboptimal on multiple fronts.

Similarly, KVM currently requires the guest mapping size to be a strict
subset of the host userspace mapping size, e.g. KVM doesn’t support
creating a 1GiB guest mapping unless userspace also has a 1GiB guest
mapping.  Decoupling the mappings sizes would allow userspace to precisely
map only what is needed without impacting guest performance, e.g. to
harden against unintentional accesses to guest memory.

Decoupling guest and userspace mappings may also allow for a cleaner
alternative to high-granularity mappings for HugeTLB, which has reached a
bit of an impasse and is unlikely to ever be merged.

A guest-first memory subsystem also provides clearer line of sight to
things like a dedicated memory pool (for slice-of-hardware VMs) and
elimination of "struct page" (for offload setups where userspace _never_
needs to mmap() guest memory).

More immediately, being able to map memory into KVM guests without mapping
said memory into the host is critical for Confidential VMs (CoCo VMs), the
initial use case for guest_memfd.  While AMD's SEV and Intel's TDX prevent
untrusted software from reading guest private data by encrypting guest
memory with a key that isn't usable by the untrusted host, projects such
as Protected KVM (pKVM) provide confidentiality and integrity *without*
relying on memory encryption.  And with SEV-SNP and TDX, accessing guest
private memory can be fatal to the host, i.e. KVM must be prevent host
userspace from accessing guest memory irrespective of hardware behavior.

Attempt #1 to support CoCo VMs was to add a VMA flag to mark memory as
being mappable only by KVM (or a similarly enlightened kernel subsystem).
That approach was abandoned largely due to it needing to play games with
PROT_NONE to prevent userspace from accessing guest memory.

Attempt #2 to was to usurp PG_hwpoison to prevent the host from mapping
guest private memory into userspace, but that approach failed to meet
several requirements for software-based CoCo VMs, e.g. pKVM, as the kernel
wouldn't easily be able to enforce a 1:1 page:guest association, let alone
a 1:1 pfn:gfn mapping.  And using PG_hwpoison does not work for memory
that isn't backed by 'struct page', e.g. if devices gain support for
exposing encrypted memory regions to guests.

Attempt #3 was to extend the memfd() syscall and wrap shmem to provide
dedicated file-based guest memory.  That approach made it as far as v10
before feedback from Hugh Dickins and Christian Brauner (and others) led
to it demise.

Hugh's objection was that piggybacking shmem made no sense for KVM's use
case as KVM didn't actually *want* the features provided by shmem.  I.e.
KVM was using memfd() and shmem to avoid having to manage memory directly,
not because memfd() and shmem were the optimal solution, e.g. things like
read/write/mmap in shmem were dead weight.

Christian pointed out flaws with implementing a partial overlay (wrapping
only _some_ of shmem), e.g. poking at inode_operations or super_operations
would show shmem stuff, but address_space_operations and file_operations
would show KVM's overlay.  Paraphrashing heavily, Christian suggested KVM
stop being lazy and create a proper API.

Link: https://lore.kernel.org/all/20201020061859.18385-1-kirill.shutemov@linux.intel.com
Link: https://lore.kernel.org/all/20210416154106.23721-1-kirill.shutemov@linux.intel.com
Link: https://lore.kernel.org/all/20210824005248.200037-1-seanjc@google.com
Link: https://lore.kernel.org/all/20211111141352.26311-1-chao.p.peng@linux.intel.com
Link: https://lore.kernel.org/all/20221202061347.1070246-1-chao.p.peng@linux.intel.com
Link: https://lore.kernel.org/all/ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com
Link: https://lore.kernel.org/all/20230418-anfallen-irdisch-6993a61be10b@brauner
Link: https://lore.kernel.org/all/ZEM5Zq8oo+xnApW9@google.com
Link: https://lore.kernel.org/linux-mm/20230306191944.GA15773@monkey
Link: https://lore.kernel.org/linux-mm/ZII1p8ZHlHaQ3dDl@casper.infradead.org
Cc: Fuad Tabba <tabba@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Maciej Szmigiero <mail@maciej.szmigiero.name>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>
Cc: Quentin Perret <qperret@google.com>
Cc: Michael Roth <michael.roth@amd.com>
Cc: Wang <wei.w.wang@intel.com>
Cc: Liam Merwick <liam.merwick@oracle.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>
Co-developed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Co-developed-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-Id: <20231027182217.3615211-17-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst |  69 ++++-
 fs/anon_inodes.c               |   1 +
 include/linux/kvm_host.h       |  48 +++
 include/uapi/linux/kvm.h       |  15 +-
 virt/kvm/Kconfig               |   4 +
 virt/kvm/Makefile.kvm          |   1 +
 virt/kvm/guest_memfd.c         | 538 +++++++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c            |  59 +++-
 virt/kvm/kvm_mm.h              |  26 ++
 9 files changed, 754 insertions(+), 7 deletions(-)
 create mode 100644 virt/kvm/guest_memfd.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 083ed507e200..6d681f45969e 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6202,6 +6202,15 @@ superset of the features supported by the system.
 :Parameters: struct kvm_userspace_memory_region2 (in)
 :Returns: 0 on success, -1 on error
 
+KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
+allows mapping guest_memfd memory into a guest.  All fields shared with
+KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_GUEST_MEMFD
+in flags to have KVM bind the memory region to a given guest_memfd range of
+[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
+must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
+the target range must not be bound to any other memory region.  All standard
+bounds checks apply (use common sense).
+
 ::
 
   struct kvm_userspace_memory_region2 {
@@ -6210,9 +6219,24 @@ superset of the features supported by the system.
 	__u64 guest_phys_addr;
 	__u64 memory_size; /* bytes */
 	__u64 userspace_addr; /* start of the userspace allocated memory */
+	__u64 guest_memfd_offset;
+	__u32 guest_memfd;
+	__u32 pad1;
+	__u64 pad2[14];
   };
 
-See KVM_SET_USER_MEMORY_REGION.
+A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) and
+userspace_addr (shared memory).  However, "valid" for userspace_addr simply
+means that the address itself must be a legal userspace address.  The backing
+mapping for userspace_addr is not required to be valid/populated at the time of
+KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
+on-demand.
+
+When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
+userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
+state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
+is '0' for all gfns.  Userspace can control whether memory is shared/private by
+toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
 4.141 KVM_SET_MEMORY_ATTRIBUTES
 -------------------------------
@@ -6250,6 +6274,49 @@ the state of a gfn/page as needed.
 
 The "flags" field is reserved for future extensions and must be '0'.
 
+4.142 KVM_CREATE_GUEST_MEMFD
+----------------------------
+
+:Capability: KVM_CAP_GUEST_MEMFD
+:Architectures: none
+:Type: vm ioctl
+:Parameters: struct kvm_create_guest_memfd(in)
+:Returns: 0 on success, <0 on error
+
+KVM_CREATE_GUEST_MEMFD creates an anonymous file and returns a file descriptor
+that refers to it.  guest_memfd files are roughly analogous to files created
+via memfd_create(), e.g. guest_memfd files live in RAM, have volatile storage,
+and are automatically released when the last reference is dropped.  Unlike
+"regular" memfd_create() files, guest_memfd files are bound to their owning
+virtual machine (see below), cannot be mapped, read, or written by userspace,
+and cannot be resized  (guest_memfd files do however support PUNCH_HOLE).
+
+::
+
+  struct kvm_create_guest_memfd {
+	__u64 size;
+	__u64 flags;
+	__u64 reserved[6];
+  };
+
+Conceptually, the inode backing a guest_memfd file represents physical memory,
+i.e. is coupled to the virtual machine as a thing, not to a "struct kvm".  The
+file itself, which is bound to a "struct kvm", is that instance's view of the
+underlying memory, e.g. effectively provides the translation of guest addresses
+to host memory.  This allows for use cases where multiple KVM structures are
+used to manage a single virtual machine, e.g. when performing intrahost
+migration of a virtual machine.
+
+KVM currently only supports mapping guest_memfd via KVM_SET_USER_MEMORY_REGION2,
+and more specifically via the guest_memfd and guest_memfd_offset fields in
+"struct kvm_userspace_memory_region2", where guest_memfd_offset is the offset
+into the guest_memfd instance.  For a given guest_memfd file, there can be at
+most one mapping per page, i.e. binding multiple memory regions to a single
+guest_memfd range is not allowed (any number of memory regions can be bound to
+a single guest_memfd file, but the bound ranges must not overlap).
+
+See KVM_SET_USER_MEMORY_REGION2 for additional details.
+
 5. The kvm_run structure
 ========================
 
diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 3d4a27f8b4fe..6f3d31b4d1e3 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -181,6 +181,7 @@ struct file *anon_inode_create_getfile(const char *name,
 	return __anon_inode_getfile(name, fops, priv, flags,
 				    context_inode, true);
 }
+EXPORT_SYMBOL_GPL(anon_inode_create_getfile);
 
 static int __anon_inode_getfd(const char *name,
 			      const struct file_operations *fops,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 68a144cb7dbc..a6de526c0426 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -589,8 +589,20 @@ struct kvm_memory_slot {
 	u32 flags;
 	short id;
 	u16 as_id;
+
+#ifdef CONFIG_KVM_PRIVATE_MEM
+	struct {
+		struct file __rcu *file;
+		pgoff_t pgoff;
+	} gmem;
+#endif
 };
 
+static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
+{
+	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
+}
+
 static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
 {
 	return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
@@ -685,6 +697,17 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 }
 #endif
 
+/*
+ * Arch code must define kvm_arch_has_private_mem if support for private memory
+ * is enabled.
+ */
+#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
+{
+	return false;
+}
+#endif
+
 struct kvm_memslots {
 	u64 generation;
 	atomic_long_t last_used_slot;
@@ -1400,6 +1423,7 @@ void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void kvm_mmu_invalidate_begin(struct kvm *kvm);
 void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end);
 void kvm_mmu_invalidate_end(struct kvm *kvm);
+bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg);
@@ -2355,6 +2379,30 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 					struct kvm_gfn_range *range);
 bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 					 struct kvm_gfn_range *range);
+
+static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
+{
+	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
+	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
+}
+#else
+static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
+{
+	return false;
+}
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+#else
+static inline int kvm_gmem_get_pfn(struct kvm *kvm,
+				   struct kvm_memory_slot *slot, gfn_t gfn,
+				   kvm_pfn_t *pfn, int *max_order)
+{
+	KVM_BUG_ON(1, kvm);
+	return -EIO;
+}
+#endif /* CONFIG_KVM_PRIVATE_MEM */
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e8d167e54980..2802d10aa88c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -102,7 +102,10 @@ struct kvm_userspace_memory_region2 {
 	__u64 guest_phys_addr;
 	__u64 memory_size;
 	__u64 userspace_addr;
-	__u64 pad[16];
+	__u64 guest_memfd_offset;
+	__u32 guest_memfd;
+	__u32 pad1;
+	__u64 pad2[14];
 };
 
 /*
@@ -112,6 +115,7 @@ struct kvm_userspace_memory_region2 {
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
+#define KVM_MEM_GUEST_MEMFD	(1UL << 2)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
@@ -1221,6 +1225,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_USER_MEMORY2 231
 #define KVM_CAP_MEMORY_FAULT_INFO 232
 #define KVM_CAP_MEMORY_ATTRIBUTES 233
+#define KVM_CAP_GUEST_MEMFD 234
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2301,4 +2306,12 @@ struct kvm_memory_attributes {
 
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
+#define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+
+struct kvm_create_guest_memfd {
+	__u64 size;
+	__u64 flags;
+	__u64 reserved[6];
+};
+
 #endif /* __LINUX_KVM_H */
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 5bd7fcaf9089..08afef022db9 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -100,3 +100,7 @@ config KVM_GENERIC_MMU_NOTIFIER
 config KVM_GENERIC_MEMORY_ATTRIBUTES
        select KVM_GENERIC_MMU_NOTIFIER
        bool
+
+config KVM_PRIVATE_MEM
+       select XARRAY_MULTI
+       bool
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 2c27d5d0c367..724c89af78af 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,3 +12,4 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
+kvm-$(CONFIG_KVM_PRIVATE_MEM) += $(KVM)/guest_memfd.o
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
new file mode 100644
index 000000000000..e65f4170425c
--- /dev/null
+++ b/virt/kvm/guest_memfd.c
@@ -0,0 +1,538 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/backing-dev.h>
+#include <linux/falloc.h>
+#include <linux/kvm_host.h>
+#include <linux/pagemap.h>
+#include <linux/anon_inodes.h>
+
+#include "kvm_mm.h"
+
+struct kvm_gmem {
+	struct kvm *kvm;
+	struct xarray bindings;
+	struct list_head entry;
+};
+
+static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
+{
+	struct folio *folio;
+
+	/* TODO: Support huge pages. */
+	folio = filemap_grab_folio(inode->i_mapping, index);
+	if (IS_ERR_OR_NULL(folio))
+		return NULL;
+
+	/*
+	 * Use the up-to-date flag to track whether or not the memory has been
+	 * zeroed before being handed off to the guest.  There is no backing
+	 * storage for the memory, so the folio will remain up-to-date until
+	 * it's removed.
+	 *
+	 * TODO: Skip clearing pages when trusted firmware will do it when
+	 * assigning memory to the guest.
+	 */
+	if (!folio_test_uptodate(folio)) {
+		unsigned long nr_pages = folio_nr_pages(folio);
+		unsigned long i;
+
+		for (i = 0; i < nr_pages; i++)
+			clear_highpage(folio_page(folio, i));
+
+		folio_mark_uptodate(folio);
+	}
+
+	/*
+	 * Ignore accessed, referenced, and dirty flags.  The memory is
+	 * unevictable and there is no storage to write back to.
+	 */
+	return folio;
+}
+
+static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
+				      pgoff_t end)
+{
+	bool flush = false, found_memslot = false;
+	struct kvm_memory_slot *slot;
+	struct kvm *kvm = gmem->kvm;
+	unsigned long index;
+
+	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
+		pgoff_t pgoff = slot->gmem.pgoff;
+
+		struct kvm_gfn_range gfn_range = {
+			.start = slot->base_gfn + max(pgoff, start) - pgoff,
+			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
+			.slot = slot,
+			.may_block = true,
+		};
+
+		if (!found_memslot) {
+			found_memslot = true;
+
+			KVM_MMU_LOCK(kvm);
+			kvm_mmu_invalidate_begin(kvm);
+		}
+
+		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
+	}
+
+	if (flush)
+		kvm_flush_remote_tlbs(kvm);
+
+	if (found_memslot)
+		KVM_MMU_UNLOCK(kvm);
+}
+
+static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
+				    pgoff_t end)
+{
+	struct kvm *kvm = gmem->kvm;
+
+	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
+		KVM_MMU_LOCK(kvm);
+		kvm_mmu_invalidate_end(kvm);
+		KVM_MMU_UNLOCK(kvm);
+	}
+}
+
+static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
+{
+	struct list_head *gmem_list = &inode->i_mapping->private_list;
+	pgoff_t start = offset >> PAGE_SHIFT;
+	pgoff_t end = (offset + len) >> PAGE_SHIFT;
+	struct kvm_gmem *gmem;
+
+	/*
+	 * Bindings must be stable across invalidation to ensure the start+end
+	 * are balanced.
+	 */
+	filemap_invalidate_lock(inode->i_mapping);
+
+	list_for_each_entry(gmem, gmem_list, entry)
+		kvm_gmem_invalidate_begin(gmem, start, end);
+
+	truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
+
+	list_for_each_entry(gmem, gmem_list, entry)
+		kvm_gmem_invalidate_end(gmem, start, end);
+
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	return 0;
+}
+
+static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
+{
+	struct address_space *mapping = inode->i_mapping;
+	pgoff_t start, index, end;
+	int r;
+
+	/* Dedicated guest is immutable by default. */
+	if (offset + len > i_size_read(inode))
+		return -EINVAL;
+
+	filemap_invalidate_lock_shared(mapping);
+
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len) >> PAGE_SHIFT;
+
+	r = 0;
+	for (index = start; index < end; ) {
+		struct folio *folio;
+
+		if (signal_pending(current)) {
+			r = -EINTR;
+			break;
+		}
+
+		folio = kvm_gmem_get_folio(inode, index);
+		if (!folio) {
+			r = -ENOMEM;
+			break;
+		}
+
+		index = folio_next_index(folio);
+
+		folio_unlock(folio);
+		folio_put(folio);
+
+		/* 64-bit only, wrapping the index should be impossible. */
+		if (WARN_ON_ONCE(!index))
+			break;
+
+		cond_resched();
+	}
+
+	filemap_invalidate_unlock_shared(mapping);
+
+	return r;
+}
+
+static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
+			       loff_t len)
+{
+	int ret;
+
+	if (!(mode & FALLOC_FL_KEEP_SIZE))
+		return -EOPNOTSUPP;
+
+	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
+		return -EOPNOTSUPP;
+
+	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
+		return -EINVAL;
+
+	if (mode & FALLOC_FL_PUNCH_HOLE)
+		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
+	else
+		ret = kvm_gmem_allocate(file_inode(file), offset, len);
+
+	if (!ret)
+		file_modified(file);
+	return ret;
+}
+
+static int kvm_gmem_release(struct inode *inode, struct file *file)
+{
+	struct kvm_gmem *gmem = file->private_data;
+	struct kvm_memory_slot *slot;
+	struct kvm *kvm = gmem->kvm;
+	unsigned long index;
+
+	/*
+	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
+	 * reference to the file and thus no new bindings can be created, but
+	 * dereferencing the slot for existing bindings needs to be protected
+	 * against memslot updates, specifically so that unbind doesn't race
+	 * and free the memslot (kvm_gmem_get_file() will return NULL).
+	 */
+	mutex_lock(&kvm->slots_lock);
+
+	filemap_invalidate_lock(inode->i_mapping);
+
+	xa_for_each(&gmem->bindings, index, slot)
+		rcu_assign_pointer(slot->gmem.file, NULL);
+
+	synchronize_rcu();
+
+	/*
+	 * All in-flight operations are gone and new bindings can be created.
+	 * Zap all SPTEs pointed at by this file.  Do not free the backing
+	 * memory, as its lifetime is associated with the inode, not the file.
+	 */
+	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
+	kvm_gmem_invalidate_end(gmem, 0, -1ul);
+
+	list_del(&gmem->entry);
+
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	mutex_unlock(&kvm->slots_lock);
+
+	xa_destroy(&gmem->bindings);
+	kfree(gmem);
+
+	kvm_put_kvm(kvm);
+
+	return 0;
+}
+
+static struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
+{
+	struct file *file;
+
+	rcu_read_lock();
+
+	file = rcu_dereference(slot->gmem.file);
+	if (file && !get_file_rcu(file))
+		file = NULL;
+
+	rcu_read_unlock();
+
+	return file;
+}
+
+static struct file_operations kvm_gmem_fops = {
+	.open		= generic_file_open,
+	.release	= kvm_gmem_release,
+	.fallocate	= kvm_gmem_fallocate,
+};
+
+void kvm_gmem_init(struct module *module)
+{
+	kvm_gmem_fops.owner = module;
+}
+
+static int kvm_gmem_migrate_folio(struct address_space *mapping,
+				  struct folio *dst, struct folio *src,
+				  enum migrate_mode mode)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+
+static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
+{
+	struct list_head *gmem_list = &mapping->private_list;
+	struct kvm_gmem *gmem;
+	pgoff_t start, end;
+
+	filemap_invalidate_lock_shared(mapping);
+
+	start = page->index;
+	end = start + thp_nr_pages(page);
+
+	list_for_each_entry(gmem, gmem_list, entry)
+		kvm_gmem_invalidate_begin(gmem, start, end);
+
+	/*
+	 * Do not truncate the range, what action is taken in response to the
+	 * error is userspace's decision (assuming the architecture supports
+	 * gracefully handling memory errors).  If/when the guest attempts to
+	 * access a poisoned page, kvm_gmem_get_pfn() will return -EHWPOISON,
+	 * at which point KVM can either terminate the VM or propagate the
+	 * error to userspace.
+	 */
+
+	list_for_each_entry(gmem, gmem_list, entry)
+		kvm_gmem_invalidate_end(gmem, start, end);
+
+	filemap_invalidate_unlock_shared(mapping);
+
+	return MF_DELAYED;
+}
+
+static const struct address_space_operations kvm_gmem_aops = {
+	.dirty_folio = noop_dirty_folio,
+#ifdef CONFIG_MIGRATION
+	.migrate_folio	= kvm_gmem_migrate_folio,
+#endif
+	.error_remove_page = kvm_gmem_error_page,
+};
+
+static int kvm_gmem_getattr(struct mnt_idmap *idmap, const struct path *path,
+			    struct kstat *stat, u32 request_mask,
+			    unsigned int query_flags)
+{
+	struct inode *inode = path->dentry->d_inode;
+
+	generic_fillattr(idmap, request_mask, inode, stat);
+	return 0;
+}
+
+static int kvm_gmem_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
+			    struct iattr *attr)
+{
+	return -EINVAL;
+}
+static const struct inode_operations kvm_gmem_iops = {
+	.getattr	= kvm_gmem_getattr,
+	.setattr	= kvm_gmem_setattr,
+};
+
+static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
+{
+	const char *anon_name = "[kvm-gmem]";
+	struct kvm_gmem *gmem;
+	struct inode *inode;
+	struct file *file;
+	int fd, err;
+
+	fd = get_unused_fd_flags(0);
+	if (fd < 0)
+		return fd;
+
+	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
+	if (!gmem) {
+		err = -ENOMEM;
+		goto err_fd;
+	}
+
+	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
+					 O_RDWR, NULL);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_gmem;
+	}
+
+	file->f_flags |= O_LARGEFILE;
+
+	inode = file->f_inode;
+	WARN_ON(file->f_mapping != inode->i_mapping);
+
+	inode->i_private = (void *)(unsigned long)flags;
+	inode->i_op = &kvm_gmem_iops;
+	inode->i_mapping->a_ops = &kvm_gmem_aops;
+	inode->i_mode |= S_IFREG;
+	inode->i_size = size;
+	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_unmovable(inode->i_mapping);
+	/* Unmovable mappings are supposed to be marked unevictable as well. */
+	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
+
+	kvm_get_kvm(kvm);
+	gmem->kvm = kvm;
+	xa_init(&gmem->bindings);
+	list_add(&gmem->entry, &inode->i_mapping->private_list);
+
+	fd_install(fd, file);
+	return fd;
+
+err_gmem:
+	kfree(gmem);
+err_fd:
+	put_unused_fd(fd);
+	return err;
+}
+
+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
+{
+	loff_t size = args->size;
+	u64 flags = args->flags;
+	u64 valid_flags = 0;
+
+	if (flags & ~valid_flags)
+		return -EINVAL;
+
+	if (size <= 0 || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	return __kvm_gmem_create(kvm, size, flags);
+}
+
+int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
+		  unsigned int fd, loff_t offset)
+{
+	loff_t size = slot->npages << PAGE_SHIFT;
+	unsigned long start, end;
+	struct kvm_gmem *gmem;
+	struct inode *inode;
+	struct file *file;
+	int r = -EINVAL;
+
+	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
+
+	file = fget(fd);
+	if (!file)
+		return -EBADF;
+
+	if (file->f_op != &kvm_gmem_fops)
+		goto err;
+
+	gmem = file->private_data;
+	if (gmem->kvm != kvm)
+		goto err;
+
+	inode = file_inode(file);
+
+	if (offset < 0 || !PAGE_ALIGNED(offset) ||
+	    offset + size > i_size_read(inode))
+		goto err;
+
+	filemap_invalidate_lock(inode->i_mapping);
+
+	start = offset >> PAGE_SHIFT;
+	end = start + slot->npages;
+
+	if (!xa_empty(&gmem->bindings) &&
+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
+		filemap_invalidate_unlock(inode->i_mapping);
+		goto err;
+	}
+
+	/*
+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
+	 * be see either a NULL file or this new file, no need for them to go
+	 * away.
+	 */
+	rcu_assign_pointer(slot->gmem.file, file);
+	slot->gmem.pgoff = start;
+
+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
+	filemap_invalidate_unlock(inode->i_mapping);
+
+	/*
+	 * Drop the reference to the file, even on success.  The file pins KVM,
+	 * not the other way 'round.  Active bindings are invalidated if the
+	 * file is closed before memslots are destroyed.
+	 */
+	r = 0;
+err:
+	fput(file);
+	return r;
+}
+
+void kvm_gmem_unbind(struct kvm_memory_slot *slot)
+{
+	unsigned long start = slot->gmem.pgoff;
+	unsigned long end = start + slot->npages;
+	struct kvm_gmem *gmem;
+	struct file *file;
+
+	/*
+	 * Nothing to do if the underlying file was already closed (or is being
+	 * closed right now), kvm_gmem_release() invalidates all bindings.
+	 */
+	file = kvm_gmem_get_file(slot);
+	if (!file)
+		return;
+
+	gmem = file->private_data;
+
+	filemap_invalidate_lock(file->f_mapping);
+	xa_store_range(&gmem->bindings, start, end - 1, NULL, GFP_KERNEL);
+	rcu_assign_pointer(slot->gmem.file, NULL);
+	synchronize_rcu();
+	filemap_invalidate_unlock(file->f_mapping);
+
+	fput(file);
+}
+
+int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+{
+	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
+	struct kvm_gmem *gmem;
+	struct folio *folio;
+	struct page *page;
+	struct file *file;
+	int r;
+
+	file = kvm_gmem_get_file(slot);
+	if (!file)
+		return -EFAULT;
+
+	gmem = file->private_data;
+
+	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
+		r = -EIO;
+		goto out_fput;
+	}
+
+	folio = kvm_gmem_get_folio(file_inode(file), index);
+	if (!folio) {
+		r = -ENOMEM;
+		goto out_fput;
+	}
+
+	if (folio_test_hwpoison(folio)) {
+		r = -EHWPOISON;
+		goto out_unlock;
+	}
+
+	page = folio_file_page(folio, index);
+
+	*pfn = page_to_pfn(page);
+	if (max_order)
+		*max_order = 0;
+
+	r = 0;
+
+out_unlock:
+	folio_unlock(folio);
+out_fput:
+	fput(file);
+
+	return r;
+}
+EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1a575d39b3b..8f46d757a2c5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -791,7 +791,7 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
 	}
 }
 
-static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
+bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
 	return kvm_unmap_gfn_range(kvm, range);
@@ -1027,6 +1027,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 /* This does not remove the slot from struct kvm_memslots data structures */
 static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
+	if (slot->flags & KVM_MEM_GUEST_MEMFD)
+		kvm_gmem_unbind(slot);
+
 	kvm_destroy_dirty_bitmap(slot);
 
 	kvm_arch_free_memslot(kvm, slot);
@@ -1606,10 +1609,18 @@ static void kvm_replace_memslot(struct kvm *kvm,
 #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
 	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
 
-static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
+static int check_memory_region_flags(struct kvm *kvm,
+				     const struct kvm_userspace_memory_region2 *mem)
 {
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+	if (kvm_arch_has_private_mem(kvm))
+		valid_flags |= KVM_MEM_GUEST_MEMFD;
+
+	/* Dirty logging private memory is not currently supported. */
+	if (mem->flags & KVM_MEM_GUEST_MEMFD)
+		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
+
 #ifdef __KVM_HAVE_READONLY_MEM
 	valid_flags |= KVM_MEM_READONLY;
 #endif
@@ -2018,7 +2029,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	int as_id, id;
 	int r;
 
-	r = check_memory_region_flags(mem);
+	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
 
@@ -2037,6 +2048,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
 			mem->memory_size))
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_GUEST_MEMFD &&
+	    (mem->guest_memfd_offset & (PAGE_SIZE - 1) ||
+	     mem->guest_memfd_offset + mem->memory_size < mem->guest_memfd_offset))
+		return -EINVAL;
 	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
@@ -2075,6 +2090,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
+		/* Private memslots are immutable, they can only be deleted. */
+		if (mem->flags & KVM_MEM_GUEST_MEMFD)
+			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
@@ -2103,10 +2121,23 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
+	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
+		if (r)
+			goto out;
+	}
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
-		kfree(new);
+		goto out_unbind;
+
+	return 0;
+
+out_unbind:
+	if (mem->flags & KVM_MEM_GUEST_MEMFD)
+		kvm_gmem_unbind(new);
+out:
+	kfree(new);
 	return r;
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
@@ -2442,7 +2473,7 @@ bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 
 static u64 kvm_supported_mem_attributes(struct kvm *kvm)
 {
-	if (!kvm)
+	if (!kvm || kvm_arch_has_private_mem(kvm))
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
 
 	return 0;
@@ -4844,6 +4875,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	case KVM_CAP_MEMORY_ATTRIBUTES:
 		return kvm_supported_mem_attributes(kvm);
+#endif
+#ifdef CONFIG_KVM_PRIVATE_MEM
+	case KVM_CAP_GUEST_MEMFD:
+		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
 	default:
 		break;
@@ -5277,6 +5312,18 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_GET_STATS_FD:
 		r = kvm_vm_ioctl_get_stats_fd(kvm);
 		break;
+#ifdef CONFIG_KVM_PRIVATE_MEM
+	case KVM_CREATE_GUEST_MEMFD: {
+		struct kvm_create_guest_memfd guest_memfd;
+
+		r = -EFAULT;
+		if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
+			goto out;
+
+		r = kvm_gmem_create(kvm, &guest_memfd);
+		break;
+	}
+#endif
 	default:
 		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
 	}
@@ -6409,6 +6456,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (WARN_ON_ONCE(r))
 		goto err_vfio;
 
+	kvm_gmem_init(module);
+
 	/*
 	 * Registration _must_ be the very last thing done, as this exposes
 	 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index 180f1a09e6ba..ecefc7ec51af 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -37,4 +37,30 @@ static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
 }
 #endif /* HAVE_KVM_PFNCACHE */
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+void kvm_gmem_init(struct module *module);
+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
+int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
+		  unsigned int fd, loff_t offset);
+void kvm_gmem_unbind(struct kvm_memory_slot *slot);
+#else
+static inline void kvm_gmem_init(struct module *module)
+{
+
+}
+
+static inline int kvm_gmem_bind(struct kvm *kvm,
+					 struct kvm_memory_slot *slot,
+					 unsigned int fd, loff_t offset)
+{
+	WARN_ON_ONCE(1);
+	return -EIO;
+}
+
+static inline void kvm_gmem_unbind(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+}
+#endif /* CONFIG_KVM_PRIVATE_MEM */
+
 #endif /* __KVM_MM_H__ */
-- 
2.39.1


