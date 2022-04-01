Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8038E4EF95D
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 19:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350749AbiDAR6a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 13:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350817AbiDAR6Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 13:58:25 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E69D24B5F2
        for <linux-mips@vger.kernel.org>; Fri,  1 Apr 2022 10:56:35 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id s5-20020a170902b18500b00155d6fbf4d4so1792801plr.18
        for <linux-mips@vger.kernel.org>; Fri, 01 Apr 2022 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rk47OwLDTUZoPp3sSFPqcpIfMojh6XvvX1htIIdRD8M=;
        b=s72V80y7tDOh1F0V57dD8TPMVDGZRFJLVeRypa2j6NOIeyK6OdhN/vMWnCocaWrr7k
         CTCwsrxCAl4hj3azp9KbFVRgymRC6cGX41YRf3bKbcz4hip3E1y1CUleOkW/mRUjOv72
         4q0juwIAEhigFEFYWcTUd2u5Yv+XnqXVD6a3pn/Ui+K8aArSkJYYBVjZFCZK1SOZsjC5
         7Yesg542/Fq0ocOM9rn7tyOyRxQKZ3AxCieAlZZBYn/IE9/hjt2QS80Tz+PLFcorlflQ
         sdxYZkSU8ub5I6xHkzMHujo97FILxUXUQ+MHykloWi+evJGsQ9HO/j+9n0zxGqN3fxiy
         QTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rk47OwLDTUZoPp3sSFPqcpIfMojh6XvvX1htIIdRD8M=;
        b=2Ly/76//AMZuedPPkMZ5vOZxjtDhFeTLp0Q0ozCvwiqU9DaKoe2m1JHjhSaMeZmJwA
         4UmayIYCTYDOtadg55eUknVwMIp1Er9yZsGth/oebabC9BjZxMBYpGLm112b/Jeg/ld/
         I+oPpwzEEFkpnnVfyo/bCmHkMLmC5zhDHC9CMLDUe5Hwg2dqnewr8p+ZrlVqklrIyx4k
         oQDUu87rzaM6spzwSfwM3Dy89ceKz92Zbq5t0W1sQsFI0+9yXFrmeYwa2XFoGwe8SbJl
         AP7PUE/f60WkVCiUrGXU+BbBwcb1NKoDUv93ida515ExsZoD/yYjjQWT0kORY5wLbdFT
         m06A==
X-Gm-Message-State: AOAM532+YPVOE9b5hl+oSVpaIbpDzipnqBJ425pPuJqlo9gcH9e2Be7H
        aaEL/kE+Tjv9xfVnnRHueaws+P5jm/ziPQ==
X-Google-Smtp-Source: ABdhPJybrRr8dD4aYv/cbz/erk9I24s3Xk9K694qQkW/0pJU9JMwG7vQGFtAvLaRQheDfdF0TPnn3iF2T50Fnw==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:ce0f:b0:156:5a4:926c with SMTP id
 k15-20020a170902ce0f00b0015605a4926cmr11415497plg.3.1648835794980; Fri, 01
 Apr 2022 10:56:34 -0700 (PDT)
Date:   Fri,  1 Apr 2022 17:55:52 +0000
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
Message-Id: <20220401175554.1931568-22-dmatlack@google.com>
Mime-Version: 1.0
References: <20220401175554.1931568-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v3 21/23] KVM: Allow GFP flags to be passed when topping up
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
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index c4cac4195f4a..554148ea0c30 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -369,7 +369,7 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
 		return (void *)__get_free_page(gfp_flags);
 }
 
-int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
+int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min, gfp_t gfp)
 {
 	void *obj;
 
@@ -384,7 +384,7 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 	if (mc->nobjs >= min)
 		return 0;
 	while (mc->nobjs < mc->capacity) {
-		obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
+		obj = mmu_memory_cache_alloc_obj(mc, gfp);
 		if (!obj)
 			return mc->nobjs >= min ? 0 : -ENOMEM;
 		mc->objects[mc->nobjs++] = obj;
@@ -392,6 +392,11 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
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
2.35.1.1094.g7c7d902a7c-goog

