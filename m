Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61F14EF938
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 19:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234901AbiDAR56 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 13:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350608AbiDAR5w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 13:57:52 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB391D7612
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 10:56:02 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id l6-20020a17090a150600b001c95a6ab60cso4352580pja.5
        for <linux-mips@vger.kernel.org>; Fri, 01 Apr 2022 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IZRim+LrWsbKLhWGtCJAPIUqsiasbKStOmO5lLjRFP8=;
        b=OZ/CKz/kS7tsC+5ET9TAryRE1kCwgOMM6JGu+otu2+fefVt4XEH8bXii6Cm3AUtLCN
         Gw9osJsofH3J6mv+Pa2qF4AgPyuVpqfC38Nn1tKiG+M3EKrlbdGH2QPh3j9eewzu59lx
         ICuKCxkiGaO+YeoyVNcW7Nro8EgWUt56TC8bmJ6E3nLjN6WPFH2wT9SX/X9xZP2ZiF17
         FJmRQTr/BPkOe9FVzGO8FNFlXg4UfuMC8jzLYVLEELEQwUE4jThW/O/paupXC7lWuxy1
         jJcoNEaCMLN9riLuRhRPnUtblhKer7FLcbWvKt2OPcW3oc7aFw2S1ONaKDFn48FfppNp
         IR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IZRim+LrWsbKLhWGtCJAPIUqsiasbKStOmO5lLjRFP8=;
        b=Ldfci9PXGURGc1kSX2HcoZzsMbu6h41mfcC2hNId13JVWQtoYTs13Ev+Vo60L0ocvO
         vIGVbPalADa7sC0vHXc3fbDK8g73G7pBZJVQWfF0O9hUO3JFAs2iVyg+AvPA0AagKYVP
         KC0kmGWaqPTBZ9+s7WZIur2JfriYa4CSN1EPzsgNyUJeud2Ifvo21DvMxtG+VV2YZTrd
         zPaig3LOz2rKPsW+wAsIDlh8i/h9rj3ArXqyErZCPMoOJaoev5LGPb9qR+7QQ8Gg0swH
         Uw91eOJnhxWrWvzVjiHUiekNKCQuBsoEKQl4P/Ocl3oGR2lC0m2XFG5o9Pg69ozR3ax+
         lwHg==
X-Gm-Message-State: AOAM530lsf7ykZupnuUl6zqlusLyvJrB5BL6HwS8v/G7MVQ/0GsKRVKo
        H8YmYC9RSLyIMxiwF9wOqtzMuxoC4FjAMA==
X-Google-Smtp-Source: ABdhPJw5vwbBPjHYSVeggYwsZsRSNlx5RqVJMTrxoIjsNKWoBtog3ECYJyqS377WsBTJdAeMsxOsjt/Joc7/Ug==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a62:6403:0:b0:4fa:c74c:83c5 with SMTP id
 y3-20020a626403000000b004fac74c83c5mr11997208pfb.30.1648835762419; Fri, 01
 Apr 2022 10:56:02 -0700 (PDT)
Date:   Fri,  1 Apr 2022 17:55:32 +0000
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
Message-Id: <20220401175554.1931568-2-dmatlack@google.com>
Mime-Version: 1.0
References: <20220401175554.1931568-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v3 01/23] KVM: x86/mmu: Optimize MMU page cache lookup for all
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
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
index 1361eb4599b4..dbfda133adbe 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2034,7 +2034,6 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     int direct,
 					     unsigned int access)
 {
-	bool direct_mmu = vcpu->arch.mmu->direct_map;
 	union kvm_mmu_page_role role;
 	struct hlist_head *sp_list;
 	unsigned quadrant;
@@ -2075,7 +2074,8 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 			continue;
 		}
 
-		if (direct_mmu)
+		/* unsync and write-flooding only apply to indirect SPs. */
+		if (sp->role.direct)
 			goto trace_get_page;
 
 		if (sp->unsync) {
-- 
2.35.1.1094.g7c7d902a7c-goog

