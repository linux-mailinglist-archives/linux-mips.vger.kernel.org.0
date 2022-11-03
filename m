Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29761723D
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiKBXYH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbiKBXWz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:22:55 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C427FB4A7
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:20:12 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id l1-20020a170902f68100b00187117d8e44so242994plg.2
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QZsBYUGDC2IkAwbx22iS+bX782/JjRlyYtWOGf9fm5w=;
        b=gOl3cNoBRYj8Qpc32NlIEZiSXsQpB/DCyQ/znrDYIZGa+s4IthUOkEHZQZ1ojKZDv7
         pTCluXhDLSbuLtIDsd06JUGzyqeVDBKsjduC6joRT5sGTNYRsVo9p/G6Hqiv2ugKa8LH
         rdr0QZPkDK278uG4dV/k1t11BIQxvRWGgZaRWsIg0DoysUSAp2Ijq63EEZdxc0KL4gix
         0HGUBH8kF/zweMHI/2v4mLjob8+u7zdHCmj600jDg7rYDwZddIyY/q/ZMJIgho4CGwiq
         Rf68OjR0Rg0ygAgFFNEea3lYykknrXRPiTB8JjAsW5m8iBtmAm27VPmRKJbUJVbPKnmY
         wuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZsBYUGDC2IkAwbx22iS+bX782/JjRlyYtWOGf9fm5w=;
        b=CT2py7Gu/WiirPTQscUoP52GrDCepvio7CxZwuw0hRlPFti0AJHEPDSZHSDuz6ZO6N
         46Irbru7DNXH7Scv+zXu9ITZZ86dPB3F6fydhqq1wnejhorj3dYtTCH5wKUr4AIyxi2f
         nHLrbI4o+0Nlxc/4a817zaBaiGsW4VCvLbKf+VMUKCNY92vqtecvMNLgvklWHCu1cYmJ
         Uwh2eP+XPFPiPgB8YaJyYB3EEg7v9KEsHgoMVYQWJ2/7w2dP1ehFT98Or55LzXEhfYOR
         u3e+mOrw8nwZEwkrAFV0c4YtE1Jg8dVRc+7BsRVq6Fzxnu8k6mmgsOvHfd/XWZcQqQF3
         Ke2A==
X-Gm-Message-State: ACrzQf2Zb/NGOBMMD0piKra7ZwcpBZkUya5KpdBv4Q5ZuZ/7DNA0YSpT
        InDSmInErMIt7pPMxM+wb06lD1IE5Ok=
X-Google-Smtp-Source: AMsMyM4F5G3DDnuJC2f+gpo6muVhVlP37u9Rx2CD7FgkZCjySGE+h3yA4RelKa6dFXDwgnEtjORGLCa20Ec=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:384a:b0:213:2907:a528 with SMTP id
 nl10-20020a17090b384a00b002132907a528mr27758885pjb.183.1667431193502; Wed, 02
 Nov 2022 16:19:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:50 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-24-seanjc@google.com>
Subject: [PATCH 23/44] KVM: RISC-V: Tag init functions and data with __init, __ro_after_init
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuan Yao <yuan.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that KVM setup is handled directly in riscv_kvm_init(), tag functions
and data that are used/set only during init with __init/__ro_after_init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  6 +++---
 arch/riscv/kvm/mmu.c              | 12 ++++++------
 arch/riscv/kvm/vmid.c             |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8c771fc4f5d2..778ff0f282b7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -295,11 +295,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_mode_detect(void);
-unsigned long kvm_riscv_gstage_mode(void);
+void __init kvm_riscv_gstage_mode_detect(void);
+unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
 
-void kvm_riscv_gstage_vmid_detect(void);
+void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..f42a34c7879a 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -20,12 +20,12 @@
 #include <asm/pgtable.h>
 
 #ifdef CONFIG_64BIT
-static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 3;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 3;
 #define gstage_index_bits	9
 #else
-static unsigned long gstage_mode = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 2;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 2;
 #define gstage_index_bits	10
 #endif
 
@@ -760,7 +760,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 		kvm_riscv_local_hfence_gvma_all();
 }
 
-void kvm_riscv_gstage_mode_detect(void)
+void __init kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
 	/* Try Sv57x4 G-stage mode */
@@ -784,7 +784,7 @@ void kvm_riscv_gstage_mode_detect(void)
 #endif
 }
 
-unsigned long kvm_riscv_gstage_mode(void)
+unsigned long __init kvm_riscv_gstage_mode(void)
 {
 	return gstage_mode >> HGATP_MODE_SHIFT;
 }
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 6cd93995fb65..5246da1c9167 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -17,10 +17,10 @@
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-static unsigned long vmid_bits;
+static unsigned long vmid_bits __ro_after_init;
 static DEFINE_SPINLOCK(vmid_lock);
 
-void kvm_riscv_gstage_vmid_detect(void)
+void __init kvm_riscv_gstage_vmid_detect(void)
 {
 	unsigned long old;
 
-- 
2.38.1.431.g37b22c650d-goog

