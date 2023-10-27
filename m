Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87EB7DA022
	for <lists+linux-mips@lfdr.de>; Fri, 27 Oct 2023 20:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjJ0SYR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Oct 2023 14:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346556AbjJ0SXr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Oct 2023 14:23:47 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3971FD7A
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:01 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cc23f2226bso7020095ad.2
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430979; x=1699035779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MVLj5FN4ghSPcx7W6m0P6aKU6EoKDZB5qQvPMI5sLXI=;
        b=u+CSrskQPclW4y4R0sY5cq1wt2uZ/PS0jDx133zcNoKBPUUpJoIPNr3V0t/tKrOARP
         8Spr9quFnZumx+ty953xTQxKI8/5zTvE8gZJHrIB9uqNBdI6K6V8reSmMFUJ5mw4EDVg
         rHi8jqaoMH6EVDouJ0iQ0lKeR7lP5hoPY5MMs2LOMbV3aNlsV5ktBpieuS0C30zxslHd
         0KR7fJM5JjWDw+6Rm4sDaB6mbYbbhlC6T1SVgPut6ioh4VgcMId9LasE+olpLnJYOs+Z
         4AWlI7m8YpVmtZROqKVwIBAWWQ1hymYyuXuGDVgMf2L3zfiDLc7pKZ6k1ydHBA5InSkj
         tMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430979; x=1699035779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVLj5FN4ghSPcx7W6m0P6aKU6EoKDZB5qQvPMI5sLXI=;
        b=LXqNik+5296VLZTVaUuPu1kK3Lr1KNl9Yo/hM8uP0E1ESC06pStG5jIE/R7GaL0m3Z
         ctbBkCBbPQIJuN7lBB30xg9qFZrbBFGSfy4UH4an1DzCqTaQTOOhbKB86wJZ7vNuhOfi
         aVHW2Ykm74eD2lVPLCtF/ACydqfZqidj5k0ybLO5E/yR1/1Wj6+9F6aCV6JBWv53ie6g
         3ZVjVdv+8tJbEzXfnSuQ4/gYspevHhGHaz4xqzQ99wbigBm6VeT1qyH4MQpBxwlY6yPk
         /+4bqstZLkjRZ+QbwieWRWhHkT2ygZLOY6YosEVSwMJpHsMOr0VVzn+N8cZITpjV3W7T
         51vQ==
X-Gm-Message-State: AOJu0YyUGIPuW3QnlQ2iyk1OLOgXjMK66A2EehtrScyrIGuyWxb8U/S5
        GbjwBRUlGxZhkjuLKwOjSWenjXZdrTg=
X-Google-Smtp-Source: AGHT+IEKkHZ5OGZS170UfQmbvrYiPXoVQsZfMjyX59FOqET9I4K7HFcSw9HcrHh9Pco2N8IBe4E5ffgBki8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7b8f:b0:1c9:f356:b7d5 with SMTP id
 w15-20020a1709027b8f00b001c9f356b7d5mr60396pll.7.1698430979282; Fri, 27 Oct
 2023 11:22:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 27 Oct 2023 11:21:59 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-18-seanjc@google.com>
Subject: [PATCH v13 17/35] KVM: Add transparent hugepage support for dedicated
 guest memory
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extended guest_memfd to allow backing guest memory with transparent
hugepages.  Require userspace to opt-in via a flag even though there's no
known/anticipated use case for forcing small pages as THP is optional,
i.e. to avoid ending up in a situation where userspace is unaware that
KVM can't provide hugepages.

For simplicity, require the guest_memfd size to be a multiple of the
hugepage size, e.g. so that KVM doesn't need to do bounds checking when
deciding whether or not to allocate a huge folio.

When reporting the max order when KVM gets a pfn from guest_memfd, force
order-0 pages if the hugepage is not fully contained by the memslot
binding, e.g. if userspace requested hugepages but punches a hole in the
memslot bindings in order to emulate x86's VGA hole.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst |  7 ++++
 include/uapi/linux/kvm.h       |  2 +
 virt/kvm/guest_memfd.c         | 73 ++++++++++++++++++++++++++++++----
 3 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e82c69d5e755..7f00c310c24a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6176,6 +6176,8 @@ and cannot be resized  (guest_memfd files do however support PUNCH_HOLE).
 	__u64 reserved[6];
   };
 
+  #define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE         (1ULL << 0)
+
 Conceptually, the inode backing a guest_memfd file represents physical memory,
 i.e. is coupled to the virtual machine as a thing, not to a "struct kvm".  The
 file itself, which is bound to a "struct kvm", is that instance's view of the
@@ -6192,6 +6194,11 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+If KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set in flags, KVM will attempt to allocate
+and map hugepages for the guest_memfd file.  This is currently best effort.  If
+KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is set, the size must be aligned to the maximum
+transparent hugepage size supported by the kernel
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 5. The kvm_run structure
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 25caee8d1a80..33d542de0a61 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2303,4 +2303,6 @@ struct kvm_create_guest_memfd {
 	__u64 reserved[6];
 };
 
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 #endif /* __LINUX_KVM_H */
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 98a12da80214..94bc478c26f3 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -13,14 +13,47 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_t index)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	unsigned long huge_index = round_down(index, HPAGE_PMD_NR);
+	unsigned long flags = (unsigned long)inode->i_private;
+	struct address_space *mapping  = inode->i_mapping;
+	gfp_t gfp = mapping_gfp_mask(mapping);
+	struct folio *folio;
+
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
+		return NULL;
+
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + HPAGE_PMD_NR - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio = filemap_alloc_folio(gfp, HPAGE_PMD_ORDER);
+	if (!folio)
+		return NULL;
+
+	if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
+		folio_put(folio);
+		return NULL;
+	}
+
+	return folio;
+#else
+	return NULL;
+#endif
+}
+
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 {
 	struct folio *folio;
 
-	/* TODO: Support huge pages. */
-	folio = filemap_grab_folio(inode->i_mapping, index);
-	if (IS_ERR_OR_NULL(folio))
-		return NULL;
+	folio = kvm_gmem_get_huge_folio(inode, index);
+	if (!folio) {
+		folio = filemap_grab_folio(inode->i_mapping, index);
+		if (IS_ERR_OR_NULL(folio))
+			return NULL;
+	}
 
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
@@ -373,6 +406,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
@@ -398,12 +432,21 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
 	if (size < 0 || !PAGE_ALIGNED(size))
 		return -EINVAL;
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
+		return -EINVAL;
+#endif
+
 	return __kvm_gmem_create(kvm, size, flags);
 }
 
@@ -501,7 +544,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
-	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
+	pgoff_t index, huge_index;
 	struct kvm_gmem *gmem;
 	struct folio *folio;
 	struct page *page;
@@ -514,6 +557,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 
 	gmem = file->private_data;
 
+	index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
 		r = -EIO;
 		goto out_fput;
@@ -533,9 +577,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	page = folio_file_page(folio, index);
 
 	*pfn = page_to_pfn(page);
-	if (max_order)
+	if (!max_order)
+		goto success;
+
+	*max_order = compound_order(compound_head(page));
+	if (!*max_order)
+		goto success;
+
+	/*
+	 * The folio can be mapped with a hugepage if and only if the folio is
+	 * fully contained by the range the memslot is bound to.  Note, the
+	 * caller is responsible for handling gfn alignment, this only deals
+	 * with the file binding.
+	 */
+	huge_index = ALIGN(index, 1ull << *max_order);
+	if (huge_index < ALIGN(slot->gmem.pgoff, 1ull << *max_order) ||
+	    huge_index + (1ull << *max_order) > slot->gmem.pgoff + slot->npages)
 		*max_order = 0;
-
+success:
 	r = 0;
 
 out_unlock:
-- 
2.42.0.820.g83a721a137-goog

