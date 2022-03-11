Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F314D56AB
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345216AbiCKA1S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345221AbiCKA1S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:27:18 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9EA1A2766
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:09 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id e7-20020a170902ef4700b00151de30039bso3547789plx.17
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Xxlsl5gMjKmF9SCaiAavzpq6LPoScWsJHzRFSDHyFso=;
        b=cMEUZuguiW6pmIHu9LU3eoo1FDRnKfP07X6qrVJz+feSqP00edJurvJ6fZVCoGCvaJ
         5svA21y657lW0vnnvcB8DrJj0Wif0psmeyY8i7OHoLX//aZidsK2Kwctp17DBZkm6zks
         bNqQTe153ijee74TbEx9ka/WwLu8NnHNmhJ3rzu0hVNv/X65IxxIaEZsKTVXiz3k0pq/
         PXKVNpYhcW10Mo0GvokzU2pQFbCQGCYnnW5ERLDk3Bglg0cMtbS8FePSpbkv3zkxP4/+
         HypkhlHZXg2YdqZQ+p9wkqmsfUp8Sg4/Y0BzNMC+ciXTAMJksdrkfNpcGpiny8WuXLFB
         rq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Xxlsl5gMjKmF9SCaiAavzpq6LPoScWsJHzRFSDHyFso=;
        b=NV39LK80JXoNnYqdK8P+HRyAm5Y2pHEOadY51vCG9v7lnhBUcsHwjAxlGnF2/M7JgT
         tjUi1BxJVY/vzuAJSlpp09b52BHgiA8JXEDwftb87maDMVqRv2J6LvQzkkSOyj7qB1gn
         6KFeok6tl4Im+cmyGmUiEu700+UVC6F40K7V1mgLKHyfeAusOh1IQGnh1vt2bKCUfRV2
         CoXtAFM4mNjFoh6PPLMEgcP3s4KpXyv+mj19tMOXZFU3S3oL9NT1uYv1M5AcIBzTz/ZY
         bAO/7ZS3iF/388kO/6d+ofa/a+5wJdD5Y4xN2sK/oEo7QSgaCYZRtTa/xFoLIYjcK95A
         A6uQ==
X-Gm-Message-State: AOAM531MpaKcRvD5oWiuBQj3VV+dwPtgwjoODXUqoxfiDt2fj67y/QWT
        iANNyQrcOcV+zJFAXYw9mx1dfHnYS/qeUA==
X-Google-Smtp-Source: ABdhPJywweZjzvrfhg7epKsXyYUluoBQw2WEtYQ9qKQxDvH8uHrVK9h/VGrnh31BcpoNycSVrImYh5be0PAtHQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:17ca:b0:1bf:6188:cc00 with SMTP
 id me10-20020a17090b17ca00b001bf6188cc00mr19161970pjb.2.1646958368553; Thu,
 10 Mar 2022 16:26:08 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:24 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-23-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 22/26] KVM: Allow GFP flags to be passed when topping up
 MMU caches
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

This will be used in a subsequent commit to top-up MMU caches under the
MMU lock with GFP_NOWAIT as part of eager page splitting.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 252ee4a61b58..7d3a1f28beb2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1335,6 +1335,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
+int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min, gfp_t gfp);
 int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc);
 void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
 void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1d849ba9529f..7861874af1c8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -367,7 +367,7 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
 		return (void *)__get_free_page(gfp_flags);
 }
 
-int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
+int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min, gfp_t gfp)
 {
 	void *obj;
 
@@ -382,7 +382,7 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 	if (mc->nobjs >= min)
 		return 0;
 	while (mc->nobjs < mc->capacity) {
-		obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
+		obj = mmu_memory_cache_alloc_obj(mc, gfp);
 		if (!obj)
 			return mc->nobjs >= min ? 0 : -ENOMEM;
 		mc->objects[mc->nobjs++] = obj;
@@ -390,6 +390,11 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 	return 0;
 }
 
+int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
+{
+	return __kvm_mmu_topup_memory_cache(mc, min, GFP_KERNEL_ACCOUNT);
+}
+
 int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc)
 {
 	return mc->nobjs;
-- 
2.35.1.723.g4982287a31-goog

