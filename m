Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AED7444C2B
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbhKDA35 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbhKDA2v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:28:51 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD909C061714
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:14 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id b23-20020a170902d89700b001415444f5a6so1946704plz.7
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=8x8y6LCkLptxfKHX5+pDaTNp73wBECOiN1YdxqMK+rA=;
        b=Kwf8l4ALLidbOCnsA8IZb7EGVbQY2I/GyIc70v/xPgAN2uNZmJzzLzZJfwAX2uOOCO
         bOK9U8USa/+T5EGJ5WM+xo1wGM21VgQud3S9i76kNITLTzwA0wNdnUr/fJDAgqhSvhap
         Yw0ASqeY//wjIN0mhEQ3qwyRthBADSpw3C4ZFZ4+KorPOGjjv9GHHalj2Z0JVLcN7rKX
         1aJXnhddEMDTeyAz0wqrWJZzkxWK24hOVug2NjMIF6/CfNf9YTCoQnGyCXWnO5Qwes4j
         g5HbrauvOLkXEcvWsWbG0nodw7IIljy/H4UiUpBEQUah5lbLSlwy7/6wMiTLEuWxciTS
         tAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=8x8y6LCkLptxfKHX5+pDaTNp73wBECOiN1YdxqMK+rA=;
        b=rPV7o1ooOTKY3avXgNkpNfsIPHalYG8CTVVdUsAG/2JTeWzgy39v8GpW/xDrUKumNa
         bwiaW73iJW+Go7sWypnxxIdyORWagDBis6tKWZysvL546kM2pmhs4dLGYZ9l8FG81WsQ
         Sh4WkUOHy4ib8Kj6mkYGcygzh7X9BcNf4JAg8ZONYC+iveA5jvIlZTjeK0/luLCptt64
         cIskedVUegE127eTEOeKkoTuoDRYPQDfCmh2RjWyE7i3m4V30aWh9/lB0YRK3ekR5uDL
         pgK9WQN0w5x8p6NE+wWQ9JC4k40AEFa6f8utnF7kW6vp1If3wifwsIompnZWtG9ypBlS
         Jnyw==
X-Gm-Message-State: AOAM5332g2RKpLz5fmT/KFXPJiKSJ23JU0kafY8wmoivf+Y035TtreFk
        NPvhe7KZvswsFLlUtnwheZK/7AkZgno=
X-Google-Smtp-Source: ABdhPJxsJ29Wj32AtuAm6joDY8iQebT4Rnu7/phTa+MfeSdX22KfADwkK1eYIPGppvLFyQSyOgzQ6GfE4Fg=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr261308pjh.1.1635985573544; Wed, 03 Nov 2021 17:26:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:10 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-10-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 09/30] KVM: MIPS: Drop pr_debug from memslot commit to
 avoid using "mem"
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

Remove an old (circa 2012) kvm_debug from kvm_arch_commit_memory_region()
to print basic information when committing a memslot change.  The primary
motivation for removing the kvm_debug is to avoid using @mem, the user
memory region, so that said param can be removed.

Alternatively, the debug message could be converted to use @new, but that
would require synthesizing select state to play nice with the DELETED
case, which will pass NULL for @new in the future.  And there's no
argument to be had for dumping generic information in an arch callback,
i.e. if there's a good reason for the debug message, then it belongs in
common KVM code where all architectures can benefit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 8c94cd4093af..b7aa8fa4a5fb 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -249,10 +249,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 {
 	int needs_flush;
 
-	kvm_debug("%s: kvm: %p slot: %d, GPA: %llx, size: %llx, QVA: %llx\n",
-		  __func__, kvm, mem->slot, mem->guest_phys_addr,
-		  mem->memory_size, mem->userspace_addr);
-
 	/*
 	 * If dirty page logging is enabled, write protect all pages in the slot
 	 * ready for dirty logging.
-- 
2.33.1.1089.g2158813163f-goog

