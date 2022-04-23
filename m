Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A5150C37F
	for <lists+linux-mips@lfdr.de>; Sat, 23 Apr 2022 01:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiDVWPv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Apr 2022 18:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbiDVWP1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Apr 2022 18:15:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1442822405D
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:05:51 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id b6-20020a5b0b46000000b006457d921729so4320847ybr.23
        for <linux-mips@vger.kernel.org>; Fri, 22 Apr 2022 14:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ktDpzPoEdSrcrUnITrmIICEFHz35bcwHx2m+itC59DQ=;
        b=NuUyT27h7C++sSsmxph7YDVnlVq9JEo2qNd/NHlqu/pFwe1ZaK/DqFkIUFejxWDZ+L
         HCFTyNkmdUQQpAdlAE2EkZPO7+NrKCh3q/AAd7bXPDPhOya7e3i6fTvDCMG8t6hQE5Nd
         LlAD1nOHAruz6us2mg92VCm+qVkIiLQazVDQ+39JAk9pvNX4s290hmOx785CWQUF5t8l
         A5vwsOA/rpOEPfHSx7Z1ShpIwVYbjqEzdgZPGBXOf3vJFRbopVHdJd29zqqqJTdtpec3
         qba+yk3xoqB4ftlQhK5uXzW3eBe511TeE4WQjoUUhYWhQBZEwMZ0EgCcCM4XOXGcpVi/
         6mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ktDpzPoEdSrcrUnITrmIICEFHz35bcwHx2m+itC59DQ=;
        b=HB3dsX4vE/DLxH2aYENrXk34/z60fTNQtB/DI+eE9K0lMsxJeZLbwbeOKAbzy+7ToD
         6vcvIW6lZGJ6E3jlKSsaKT/Gc7KJxwhS/dymlX5xOBxLAvhiML8Zdw4/79g5JHrfGr/I
         CwEMOCB/6ABW9gBifFFw1/QCpHTVRqbDtDxEBwWDd8i7+2IX0tcWEAnRNiHVgpNyuXS6
         aqR6fw1394DSFiLJYutn5VmUv9ErXVT+6wlGeEYxQ6u/KkxLXhWCxioQYa6Z3mNmK6Lu
         G9UCpOmZ2SY7oZU7Vhy+2FeRiBl9b5naDg9oAah1BMzag4DGzOJC5RXhtkjv4fWti6qS
         UQXQ==
X-Gm-Message-State: AOAM532mWAwX55kURPSOdCVvC0FXxAHKQbWSF5eZDkx2c4GdgK0GDYTy
        Yv3obT3NuJ2jG6tFRH+UOfhyypzP4FpH2w==
X-Google-Smtp-Source: ABdhPJznlbTfpPgBcQWgSKtg2XkP7301qyrPyti3UXIeeQDW4BgY3Xl7oEU2Sfv4r0Q1kAkWzLGJ5G98i8gXew==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a25:bb4a:0:b0:633:92a6:c35 with SMTP id
 b10-20020a25bb4a000000b0063392a60c35mr6239899ybk.121.1650661550035; Fri, 22
 Apr 2022 14:05:50 -0700 (PDT)
Date:   Fri, 22 Apr 2022 21:05:27 +0000
In-Reply-To: <20220422210546.458943-1-dmatlack@google.com>
Message-Id: <20220422210546.458943-2-dmatlack@google.com>
Mime-Version: 1.0
References: <20220422210546.458943-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 01/20] KVM: x86/mmu: Optimize MMU page cache lookup for all
 direct SPs
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
fully direct MMUs") skipped the unsync checks and write flood clearing
for full direct MMUs. We can extend this further to skip the checks for
all direct shadow pages. Direct shadow pages in indirect MMUs (i.e.
shadow paging) are used when shadowing a guest huge page with smaller
pages. Such direct shadow pages, like their counterparts in fully direct
MMUs, are never marked unsynced or have a non-zero write-flooding count.

Checking sp->role.direct also generates better code than checking
direct_map because, due to register pressure, direct_map has to get
shoved onto the stack and then pulled back off.

No functional change intended.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 69a30d6d1e2b..3de4cce317e4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2028,7 +2028,6 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     int direct,
 					     unsigned int access)
 {
-	bool direct_mmu = vcpu->arch.mmu->root_role.direct;
 	union kvm_mmu_page_role role;
 	struct hlist_head *sp_list;
 	unsigned quadrant;
@@ -2070,7 +2069,8 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 			continue;
 		}
 
-		if (direct_mmu)
+		/* unsync and write-flooding only apply to indirect SPs. */
+		if (sp->role.direct)
 			goto trace_get_page;
 
 		if (sp->unsync) {

base-commit: 150866cd0ec871c765181d145aa0912628289c8a
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

