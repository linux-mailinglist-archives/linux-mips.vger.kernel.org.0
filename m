Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BC97A2C70
	for <lists+linux-mips@lfdr.de>; Sat, 16 Sep 2023 02:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238391AbjIPAdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 20:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238537AbjIPAcu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 20:32:50 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B724D2717
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:32:09 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c0327b75dso22057257b3.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824329; x=1695429129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=4AI9NYwOs7Qxw+F4NZFoKEvkF/ZhJhsoOqPm3pP+SBcEGD4pphMfgvr2oo2Sdm3PGX
         JfCT6509S/I71oH8ban7uIF5Td8ynYv4sED2o/8WRpjFyyJkWaj14lYJRPq+LiB0L/hv
         PJkh+NgRmVQME5EKzrxILu5YSGUY8j9n2/yjotBC6TLm7nXXUuL7ZE+vPdBE7KvfuMUR
         8Kz2aXpwhnjFkqDktr4zIpXAVG+YentMA68hD+Kk/flY5i4QXqwc360B3xdG3OY8Q60z
         wnOrzJWg7kW8JHZLv4A2zNYDQxxYdoKzYA4qQWREXcEWHnXvb1aQqABFI5LPbgTy1ypd
         thSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824329; x=1695429129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=Gb+CMFFRG7NUpUZtlthnYP0K8ImnEBg/bvR28L2Umnq/dx7m6nRSvk6qEPPhsjFM3D
         V6XasaFH3n5aFscF1yLvrDtRDKk+nb5CH74+ffY6LnUaK/ymF9FlORzc7vWuRSn6elEo
         Xw8j7/1uc3gTz+cFq7cWfgGXKmljZhuqLL+OTZO2dss2f0s8TM/jVq+6JXa9JI6ghFN6
         gxuixeKg2fSf7z9BvnOKqFqGmJVmv+DjaW9mbTk4IpmlNOE912cL3r7vzyoWcA2oNZuq
         j+7/HZge3TaJfvVYP1BA3iyNfB15a4RLhaa2AqtwP66mtO0IbKlvXfbf0ZNSHqhIxLSt
         0D3w==
X-Gm-Message-State: AOJu0Yy6mRQ1SGbkldx836aOzQ/98a7E1SbNaRDd1uiIA74RbyWXalAU
        frebgg6Pc/9JvQgERXj+OpfNj0cZ+lg=
X-Google-Smtp-Source: AGHT+IGS7sQUeRqIzboGgj+JmfOv6SrnKFoWg2KC/khh+vzWzgZdEe9LRtHGjdK8tkWZSSHoGr6LIc8WFow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b620:0:b0:58c:a9b4:a64c with SMTP id
 u32-20020a81b620000000b0058ca9b4a64cmr86672ywh.1.1694824328926; Fri, 15 Sep
 2023 17:32:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 15 Sep 2023 17:31:16 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-25-seanjc@google.com>
Subject: [PATCH 24/26] powerpc/xics: Move declaration of xics_wake_cpu() out
 of kvm_ppc.h
From:   Sean Christopherson <seanjc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

xics_wake_cpu() is provided by core PPC code, not by KVM.  Move its
declaration out of kvm_ppc.h and into xics.h.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 2 --
 arch/powerpc/include/asm/xics.h    | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b4da8514af43..72fee202d3ec 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -1072,6 +1072,4 @@ static inline ulong kvmppc_get_ea_indexed(struct kvm_vcpu *vcpu, int ra, int rb)
 	return ea;
 }
 
-extern void xics_wake_cpu(int cpu);
-
 #endif /* __POWERPC_KVM_PPC_H__ */
diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 89090485bec1..17a45c022bd9 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -32,6 +32,9 @@
 extern int icp_native_init(void);
 extern void icp_native_flush_interrupt(void);
 extern void icp_native_cause_ipi_rm(int cpu);
+#ifdef CONFIG_SMP
+extern void xics_wake_cpu(int cpu);
+#endif
 #else
 static inline int icp_native_init(void) { return -ENODEV; }
 #endif
-- 
2.42.0.459.ge4e396fd5e-goog

