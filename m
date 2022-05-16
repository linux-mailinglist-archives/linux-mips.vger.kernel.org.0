Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8D152953B
	for <lists+linux-mips@lfdr.de>; Tue, 17 May 2022 01:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350465AbiEPXWp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 May 2022 19:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350470AbiEPXWW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 May 2022 19:22:22 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2534706C
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:13 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id z16-20020a17090a015000b001dbc8da29a1so370811pje.7
        for <linux-mips@vger.kernel.org>; Mon, 16 May 2022 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pOEpw0U33jr850+hJHIZzPyg7hTIgQtXSLis/i9XW2k=;
        b=Xnun/wU2caTw/TxytZw8C9PSMZVLpb/VyRFu9noez6eaQwaXPIj0voai+u3SrfupAL
         tP5/68go2tx/JL6YYh00U0kUNwS4PgBrY+jFy91J+yf6yDzRikismgT8ytU+bWiZwOMD
         H82NvsF6117s1fVl5CE9EceBQAbMUpO4iBiKZlBlW6Q/ZqRi93hpNNBO0nyyyVFEjSz2
         vIcOaJ+EmqapsNP8M806ZHqZphJjZQk/lcJKZWO+f8o4XXFOWGFyjZGIDY3e6xqPI7Hs
         O72sKJDdIDLNTAI1//4vvfnI/CyvRfgOoG4K4GQjO2GKr68kjxK/vwA1xJirWnp9W+Ef
         VU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pOEpw0U33jr850+hJHIZzPyg7hTIgQtXSLis/i9XW2k=;
        b=t9K3OSDASblIHdmGhYeA8e6aefKeheQ97Jo8pYlItgMAaX5ARJ9A9sx05PP0ezXJ4k
         aV31l1x3z52u6nSZuJVjRZJNxudisf8vThri8g+gPN1jzLMYwnQ8Z8nFTU499t0B1BYe
         Xvi6lmlMjUTv9g3RzQbOcSvhmuFrJNxy9igvfbYv8/iRzZysIdnCffM846znObPByyK5
         fg9WP0C8u08wQWQ9q8+zR8nEfRlCEqoMyqxu0o5ZVH3nBAUXJBbOMaL5dZf62kOwLCn1
         6ogrmt5FJbMr9binjk3kMd9sVdWzGA/f5ZlHrFVrbUMJ4tVAQhJTJKHS5VEJKj7+2etj
         AWsQ==
X-Gm-Message-State: AOAM530awf9+sRKz2+hpAo8bcPXINXefbR61qNZEfFW5+lcXQ8hEi747
        YG+FIZ6JDA/plSwz/b/qlQg4BgxWCLgWAg==
X-Google-Smtp-Source: ABdhPJz0ymAkSZMwmu2LJ3LS8G7Tkc01yfF7lgaeQlHMPPCk+C7g1qkIdP9NE7LK1ED0+F/WsKGsJCum8ZRNqg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:e80d:b0:15e:b27b:931c with SMTP
 id u13-20020a170902e80d00b0015eb27b931cmr19808069plg.5.1652743333371; Mon, 16
 May 2022 16:22:13 -0700 (PDT)
Date:   Mon, 16 May 2022 23:21:36 +0000
In-Reply-To: <20220516232138.1783324-1-dmatlack@google.com>
Message-Id: <20220516232138.1783324-21-dmatlack@google.com>
Mime-Version: 1.0
References: <20220516232138.1783324-1-dmatlack@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v6 20/22] KVM: x86/mmu: Refactor drop_large_spte()
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
        Lai Jiangshan <jiangshanlai@gmail.com>,
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

drop_large_spte() drops a large SPTE if it exists and then flushes TLBs.
Its helper function, __drop_large_spte(), does the drop without the
flush.

In preparation for eager page splitting, which will need to sometimes
flush when dropping large SPTEs (and sometimes not), push the flushing
logic down into __drop_large_spte() and add a bool parameter to control
it.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a5d96d452f42..964a8fa63e1b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1161,26 +1161,26 @@ static void drop_spte(struct kvm *kvm, u64 *sptep)
 		rmap_remove(kvm, sptep);
 }
 
-
-static bool __drop_large_spte(struct kvm *kvm, u64 *sptep)
+static void __drop_large_spte(struct kvm *kvm, u64 *sptep, bool flush)
 {
-	if (is_large_pte(*sptep)) {
-		WARN_ON(sptep_to_sp(sptep)->role.level == PG_LEVEL_4K);
-		drop_spte(kvm, sptep);
-		return true;
-	}
+	struct kvm_mmu_page *sp;
 
-	return false;
+	if (!is_large_pte(*sptep))
+		return;
+
+	sp = sptep_to_sp(sptep);
+	WARN_ON(sp->role.level == PG_LEVEL_4K);
+
+	drop_spte(kvm, sptep);
+
+	if (flush)
+		kvm_flush_remote_tlbs_with_address(kvm, sp->gfn,
+			KVM_PAGES_PER_HPAGE(sp->role.level));
 }
 
 static void drop_large_spte(struct kvm_vcpu *vcpu, u64 *sptep)
 {
-	if (__drop_large_spte(vcpu->kvm, sptep)) {
-		struct kvm_mmu_page *sp = sptep_to_sp(sptep);
-
-		kvm_flush_remote_tlbs_with_address(vcpu->kvm, sp->gfn,
-			KVM_PAGES_PER_HPAGE(sp->role.level));
-	}
+	return __drop_large_spte(vcpu->kvm, sptep, true);
 }
 
 /*
-- 
2.36.0.550.gb090851708-goog

