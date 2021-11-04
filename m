Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070BC444C2E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhKDA36 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbhKDA2y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:28:54 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A613AC061203
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:17 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 76-20020a63054f000000b002c9284978aaso2389529pgf.10
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=kLLbpYUiVrBCCmy9Sc82r5ow03dVDTpEgLuIVlNMoOU=;
        b=Ay0YG9JEBW9+oY2nHageNG1AdA4t7yDgBUGJkYSFHo5eFkEi8vzfRBn5r41f1wSxFg
         HSgICUcsH+f+lzWZSrC/1+mz5xqRXkD91mzBnDo3BZYbwFr6hDST1vZCD3wSaINgurlO
         zbuvwIYYwfswIpEP9r8XZUjhOUbrj1e1JEJE4CWqzQQsYzwNhKAy5PlY8BJTrIckkqFw
         /WBxV8tmpZLjaeDHV2KmyUmRuJtIFaWLMoliidYs9v4yCfTtKY1d7jZJDCgZUJEa5xF2
         wIsTmffaYibM2+7wr3G9ycxcN4Z/J+2gaNLg0QQl0/oDgNaLZZgfBR++RADooAplNPs9
         dtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=kLLbpYUiVrBCCmy9Sc82r5ow03dVDTpEgLuIVlNMoOU=;
        b=nycWJBb+LIOLhrMDuAhpoaCeojNSajf2aFl/L1UsFaNjxrZrwomiSDeuKKR1MW9/vg
         SgHmK4pKpCAt7Q6xy9HDSI3PQTEx/pg/Axdw7wItH7jedAvRo4J53t9yGY/gfDn6S6Y5
         s+Ng3jTQwAa25zsHPaCELt15nT5b2qvFxMPH65hcKzEPbmNzaaY5FP4VcFaDivTOpnfc
         YV5qNYGO+o5kuqA0wqweKoRpRA5A5Y8AMOG6xPTXT1fEdPMDhv8o7MnbO2fXXY/RvYGJ
         EWVSG4TJiA+052XG76Xq8iRcJLc2CMUXSGnvhw9YNAEf5KgeS3UT4EEk3LDGd+4+WhZ9
         X1Rw==
X-Gm-Message-State: AOAM533gqplQF/oX1eu3el3d/ln6VRgC+a2qSV8csAVKFFoog4x67BFM
        rnnTljpoNcWrrgTt5tV0a46jukk13Cw=
X-Google-Smtp-Source: ABdhPJw5JY2aPJBBFAL7b1zmagPoeo9Jl9Nl1wm8mOZYtI4MVm1cgFWi1nr5hcey34/naZNPnAO1I6HTWwg=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8cd:b0:47b:b9e8:7c2e with SMTP id
 s13-20020a056a0008cd00b0047bb9e87c2emr47505781pfu.61.1635985577071; Wed, 03
 Nov 2021 17:26:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:12 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-12-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 11/30] KVM: s390: Use "new" memslot instead of userspace
 memory region
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Get the gfn, size, and hva from the new memslot instead of the userspace
memory region when preparing/committing memory region changes.  This will
allow a future commit to drop the @mem param.

Note, this has a subtle functional change as KVM would previously reject
DELETE if userspace provided a garbage userspace_addr or guest_phys_addr,
whereas KVM zeros those fields in the "new" memslot when deleting an
existing memslot.  Arguably the old behavior is more correct, but there's
zero benefit into requiring userspace to provide sane values for hva and
gfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

If we want to keep the checks for DELETE, my vote would be to add an
arch hook that is dedicated to validated the userspace memory region
so that the prepare/commit hooks operate only on KVM-generate objects.

 arch/s390/kvm/kvm-s390.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index d766d764d24c..e69ad13612d9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5021,18 +5021,20 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
+	gpa_t size = new->npages * PAGE_SIZE;
+
 	/* A few sanity checks. We can have memory slots which have to be
 	   located/ended at a segment boundary (1MB). The memory in userland is
 	   ok to be fragmented into various different vmas. It is okay to mmap()
 	   and munmap() stuff in this slot after doing this call at any time */
 
-	if (mem->userspace_addr & 0xffffful)
+	if (new->userspace_addr & 0xffffful)
 		return -EINVAL;
 
-	if (mem->memory_size & 0xffffful)
+	if (size & 0xffffful)
 		return -EINVAL;
 
-	if (mem->guest_phys_addr + mem->memory_size > kvm->arch.mem_limit)
+	if ((new->base_gfn * PAGE_SIZE) + size > kvm->arch.mem_limit)
 		return -EINVAL;
 
 	/* When we are protected, we should not change the memory slots */
@@ -5061,8 +5063,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 			break;
 		fallthrough;
 	case KVM_MR_CREATE:
-		rc = gmap_map_segment(kvm->arch.gmap, mem->userspace_addr,
-				      mem->guest_phys_addr, mem->memory_size);
+		rc = gmap_map_segment(kvm->arch.gmap, new->userspace_addr,
+				      new->base_gfn * PAGE_SIZE,
+				      new->npages * PAGE_SIZE);
 		break;
 	case KVM_MR_FLAGS_ONLY:
 		break;
-- 
2.33.1.1089.g2158813163f-goog

