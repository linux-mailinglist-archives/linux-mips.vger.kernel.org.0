Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3696D444C32
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhKDAaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbhKDA24 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:28:56 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51515C061205
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:19 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id r7-20020a63ce47000000b002a5cadd2f25so2390448pgi.9
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=A6RNuBqUgsG4d2AkEOuVD6njvyuDvF4HW/gggxH+5XA=;
        b=OEQtzcgzg8iUsXNKyYwVPMo1zK+4Kr5qoKxGqBuItQV2mlefdBnexzTvsQV8x7tFLB
         DJ7N1H9zaKUjIJM9lgUrmNBtCvPaEhJRmE75YYyGNfGHftU+r7zpZ5tAJxYDGkRZ5UaN
         eCFKKjVPfyvAv1MPQ+W3cG8F1U785VZ2TB/bCNeburay+vZTg802nta3hX92M+l5e/kY
         v9PkejhG6TTnKgDhaZRjUpks89CX+RjAuwRAYXLN4sVhejbhHruqwLuHdy9a63l08zeG
         UQHlhHNETrOYUd9aJ76VJnvg16EQRO47SPl2LKCIPj/pp3bTuMRIyoksJkM8yu5B2mRm
         sSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=A6RNuBqUgsG4d2AkEOuVD6njvyuDvF4HW/gggxH+5XA=;
        b=7TLNIIlkD6bBswCFp/v+P3ZlUJfC4m3eaSEoq0ARf6BSdrheWk5aUF+RkqKUkNjwdk
         5DKWq4ALyfdl+wmy0x8/1dueLY9VZHuXNRHzjBYkArBlVyk3Pv8XqFt6lB2I03wNT2/J
         dwdXSY+ILcM+26sz7eSWyEQ70OAQtYiRqK7AP0eEkDuX4Rd0Dc9rb24OAmv1ee8dtcNk
         2pn/FEP3/FOH5rC7AThUJhLbzyi3FrXdnQl+A1RsNYDo9fKFynm3zCAfp2DlJp4Q+txm
         QPYKNIaWbq+PKSc/8D00ldje7Rs13cfC4mF0bOxNmxoQ0liVi5aEB3/WjE7s8oKaSfMO
         +YKw==
X-Gm-Message-State: AOAM531OymghKF76iBiVFVg/XPtBTZ64HqQws3ydFhiyEk6CU7Gxcrx1
        0yzHOlP615Tbj7yh9t8QlO1u4vTxFEw=
X-Google-Smtp-Source: ABdhPJwlGR9LbkwslcTVo23oQzDGM/4MShAybN51snLAMyuOhBW32wf0LbVvAKT8z91bQYBzxg51jn3JWKY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2181:b0:44c:f4bc:2f74 with SMTP id
 h1-20020a056a00218100b0044cf4bc2f74mr47624205pfi.68.1635985578784; Wed, 03
 Nov 2021 17:26:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:13 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-13-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 12/30] KVM: x86: Use "new" memslot instead of userspace
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

Get the number of pages directly from the new memslot instead of
computing the same from the userspace memory region when allocating
memslot metadata.  This will allow a future patch to drop @mem.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index aa2abca47af0..c68e7de9f116 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11646,9 +11646,9 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages)
 }
 
 static int kvm_alloc_memslot_metadata(struct kvm *kvm,
-				      struct kvm_memory_slot *slot,
-				      unsigned long npages)
+				      struct kvm_memory_slot *slot)
 {
+	unsigned long npages = slot->npages;
 	int i, r;
 
 	/*
@@ -11733,8 +11733,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE)
-		return kvm_alloc_memslot_metadata(kvm, new,
-						  mem->memory_size >> PAGE_SHIFT);
+		return kvm_alloc_memslot_metadata(kvm, new);
 
 	if (change == KVM_MR_FLAGS_ONLY)
 		memcpy(&new->arch, &old->arch, sizeof(old->arch));
-- 
2.33.1.1089.g2158813163f-goog

