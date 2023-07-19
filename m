Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922CA758983
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 01:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjGRXwQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 19:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjGRXv3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 19:51:29 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1548E1FC1
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 16:49:42 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b89e3715acso32243115ad.3
        for <linux-mips@vger.kernel.org>; Tue, 18 Jul 2023 16:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724148; x=1692316148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Op8HHmnUgwupsWBaRFuhvxYPW8xnNAPNdjQWsU6sjr4=;
        b=QGe2TDZHOQa4Dl//VYNCOYShcTza/1woeu2375n0rkVScAi+cbY/3o7kv0BRcH2AMJ
         +c/iqHZ3q4qoWQp2d3aei0T6E53l+ZqCNd2m04n3+R0wSNZlGOK1LSjxlHNXzCcomxJY
         E8j4TlQATKeS/E+fNB5tnRwv8C8AcACbuwNfJJ4GFsEgr7shqPyCnrSeiwO4qSSrmzt7
         efORpwkrylJDYPQpjxrM/NpVjNFpNVPE0Qd0lMQKpfpNX9QNZ2W1IrXiVTqmpPMaOQWI
         k1X5M4hUDGgW+QX9Vf1eWMvk3OJKrPnVnj02NJetvqw5q8wS599WGmVh+Grx/YjjjUXB
         v1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724148; x=1692316148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op8HHmnUgwupsWBaRFuhvxYPW8xnNAPNdjQWsU6sjr4=;
        b=NBGau1sIQrbGB7LHFeoTKZAFMNAIGNQ+hO9JGxbbYkCvC8J9CaLzBEw/eUKUxKoGgs
         pV5bQgyoVTnzk56WSPNE7+ts+GOm230Wt9L7JWvDJbIKyTvxjekoc34688FTg7VloxWh
         XVajY2VbFVUJJ8lYjZwCTeBEDQPHxETQaY/5eEXXlG3v84eRCuG2pwtt7Qh1sffQCdqM
         HvW44RfAfub8J4wHyR+vHeszh0iCXclhY5/Wh4m99Ztkqmn1GmD3vegOLc/aRDRUWKy7
         EZ8us7gXxm2KqgOm1ZFStiI46KNnKIB46pQGGYrUGD/bJGXJLBx24sNHocWIl1vmZLaa
         PoAw==
X-Gm-Message-State: ABy/qLbqUgeRO49yj/ibkD6CqPjpjVC5cOg1L3T58+R3Pf26EC1JJdq6
        qc1hCUkMOddEDHId+wH6ZdumyNJ+jw8=
X-Google-Smtp-Source: APBJJlGOkej0m8Idb/suY4iXY9qip/Dep68m1+USICpK/8IAat1dD7w7AsEo2fC/HRINs5tpOYMC/rDWeUE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec88:b0:1b9:df8f:888c with SMTP id
 x8-20020a170902ec8800b001b9df8f888cmr16357plg.8.1689724148112; Tue, 18 Jul
 2023 16:49:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Tue, 18 Jul 2023 16:45:02 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-20-seanjc@google.com>
Subject: [RFC PATCH v11 19/29] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
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
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h      |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c     | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 6aeb008dd668..d4a9925d6815 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -43,7 +43,7 @@ typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
 typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
 
 struct userspace_mem_region {
-	struct kvm_userspace_memory_region region;
+	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
 	int fd;
 	off_t offset;
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 45d21e052db0..c1e4de53d082 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -449,8 +449,8 @@ void kvm_vm_restart(struct kvm_vm *vmp)
 		vm_create_irqchip(vmp);
 
 	hash_for_each(vmp->regions.slot_hash, ctr, region, slot_node) {
-		int ret = ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION, &region->region);
-		TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+		int ret = ioctl(vmp->fd, KVM_SET_USER_MEMORY_REGION2, &region->region);
+		TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 			    "  rc: %i errno: %i\n"
 			    "  slot: %u flags: 0x%x\n"
 			    "  guest_phys_addr: 0x%llx size: 0x%llx",
@@ -653,7 +653,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
 	}
 
 	region->region.memory_size = 0;
-	vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
 	sparsebit_free(&region->unused_phy_pages);
 	ret = munmap(region->mmap_start, region->mmap_size);
@@ -1010,8 +1010,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	region->region.guest_phys_addr = guest_paddr;
 	region->region.memory_size = npages * vm->page_size;
 	region->region.userspace_addr = (uintptr_t) region->host_mem;
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
-	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
+	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i\n"
 		"  slot: %u flags: 0x%x\n"
 		"  guest_phys_addr: 0x%lx size: 0x%lx",
@@ -1093,9 +1093,9 @@ void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags)
 
 	region->region.flags = flags;
 
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
-	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION IOCTL failed,\n"
+	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i slot: %u flags: 0x%x",
 		ret, errno, slot, flags);
 }
@@ -1123,9 +1123,9 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa)
 
 	region->region.guest_phys_addr = new_gpa;
 
-	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION, &region->region);
+	ret = __vm_ioctl(vm, KVM_SET_USER_MEMORY_REGION2, &region->region);
 
-	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION failed\n"
+	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed\n"
 		    "ret: %i errno: %i slot: %u new_gpa: 0x%lx",
 		    ret, errno, slot, new_gpa);
 }
-- 
2.41.0.255.g8b1d071c50-goog

