Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FF7774F08
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 01:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjHHXNk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 19:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjHHXNi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 19:13:38 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D363E19A0
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 16:13:37 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d4e1be2dd10so4149093276.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536417; x=1692141217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fF9z3Q1T3iKa1+NaqgmsAKQ9ZnVImh9YcGmD8OzK9j4=;
        b=Ld1x0UAAPCU2iNVMHuMjG6B0mRqC01G5XmrR49OD5ekBM+hQ47Lz1vPTQOE9Tr5Br5
         BX4nU2fyQoGGqakeZ7MocsuWSlLwxNgdhGBwiNTVlmTbC+b+hhEmvF5KQzcDGXQHniHf
         dyBlM/h1HcV1T3N3V+nLOLW7Ezrkt/Pno3Kgysbh2Q6+afbzKckk0AnL00fLjdc2sRnT
         VlzSKBNqhrU3kXNgERrGdXMA6yHTAQeK1SKxpS4/hFwjbsJV3fXh7O3sMLhqgXSqH2/5
         7bx3QZPwlmmukhHDNyNKKv+4o0fEeYSAzOCOzLhRc8WynuLwSpq0v0AjFElLDtSI3e7L
         E4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536417; x=1692141217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fF9z3Q1T3iKa1+NaqgmsAKQ9ZnVImh9YcGmD8OzK9j4=;
        b=WRHn/l0d9tf4Wk31+4vxBWtn2YmrFH6WRLA7myDpV5M1WQuatt0turjBRUY5dcic9u
         2dZgvU2oxb9uWbySlZiBj/jt39KGEm0vYBunoX7kA9evs/NsjLmr0s7bkXytdT6mCjCz
         /UkNYycQ0yrm0ztf0HR+Lx3SN6ejO8sLbyqSH65SDoouXdEvjvw8vmU73gwj8gYO21hu
         fWrDdffB49dh6FBDcF+B1hMSeaA9pZVosTARymOfbtDv/JvnDiRfjaA0dRjunFSusr1a
         QkC9j+HIBA5orAG+P32gNGFZKLSAc4CMJK5HfTHGL01e2I/dPqdz43Rl2VDKg/fHf3Yf
         bRgA==
X-Gm-Message-State: AOJu0Yy2orI+f5XmEnfOoBzbgwRXr/9n2zxyOwTl7g6ud6eyZbWNjYey
        6B5up0WTLJ7CP86oboaHHVtwX6Q7UZdZ
X-Google-Smtp-Source: AGHT+IEkNRtlsA4ms3b9+CUTzSiCBd52BXOcAxUcg/jLLvdvbtpcQ/Jup7ZubXa24xkvWpmhph0yYPJIU1oJ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:3288:0:b0:d44:585f:dfa8 with SMTP id
 y130-20020a253288000000b00d44585fdfa8mr21095yby.0.1691536417147; Tue, 08 Aug
 2023 16:13:37 -0700 (PDT)
Date:   Tue,  8 Aug 2023 23:13:18 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-3-rananta@google.com>
Subject: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
From:   Raghavendra Rao Ananta <rananta@google.com>
To:     Oliver Upton <oliver.upton@linux.dev>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Jing Zhang <jingzhangos@google.com>,
        Reiji Watanabe <reijiw@google.com>,
        Colton Lewis <coltonlewis@google.com>,
        Raghavendra Rao Anata <rananta@google.com>,
        David Matlack <dmatlack@google.com>,
        Fuad Tabba <tabba@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
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

There's no reason for the architectures to declare
kvm_arch_flush_remote_tlbs() in their own headers. Hence to
avoid this duplication, make the declaration global, leaving
the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
as needed.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/mips/include/asm/kvm_host.h | 1 -
 include/linux/kvm_host.h         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 9b0ad8f3bf327..54a85f1d4f2c8 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
-int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
 #endif /* __MIPS_KVM_HOST_H__ */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3f968b38ae97..ade5d4500c2ce 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	return -ENOTSUPP;
 }
+#else
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
-- 
2.41.0.640.ga95def55d0-goog

