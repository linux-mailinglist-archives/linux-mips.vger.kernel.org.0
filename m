Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999486171E6
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiKBXUR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiKBXUA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:20:00 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2F626DA
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:19:31 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id mh8-20020a17090b4ac800b0021348e084a0so2477000pjb.8
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4c2zoa+pA6B5dVM5IIaZmnVQdrF+CmLigOtVMLLIYD8=;
        b=ECpjGJtbjyyvm3Zkn97le29FJrvdukE8ffHVj2dNk9FAwC++NI0lCVrbf3Opd4TWBf
         7ONE7EX0w7ttmK3YMIoyE2Vh0FaG9SkGVZLCFbXid7ImD6yTFbtqmq7Vw0x0n0YWc1qr
         UvPnlqsBKgTOUZmLDWND50zLAkoG2FqWh124NRVJwySYvacHzZnlXGsktrezCTNW/gFJ
         apDpep1BU4A8VIiFKZFnkDLw7l8sDdIIv36URgpIHyxEBEvEU09NfxgFq/1iQFi4+zri
         llBfs0X8HKEdffCS4sfZ+5suanib1tg9fTY0dlx5A7HaJ0XDgPt9qN3X7bOUhQWSSKhm
         Q5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c2zoa+pA6B5dVM5IIaZmnVQdrF+CmLigOtVMLLIYD8=;
        b=jrXZKyv3QHBvuWtzgwBX7h1gDYBkhXm3CYojt03y5qGo8mVUFEyuEZuV1iUg/DqNv1
         LrUvQFJJLkKmEU0rYuc0jgV58to4Igyw2yTDhg8iMUUzHePMdhbFXw0//59xsbrQY/6z
         7zaNBSckzaUNnaEGe/ZMuD4NBm2FK6L47eKPLc50dslPlRp6ps6RMOudRaQFHgcyKiO3
         U3Nwj/WpciXWxRNk8kuo5MaX+oeUa1hAm9JEB1jeuq243CX4rtqC/WGIW93E3FaTktgy
         JwHvY5PHHo1XcA7YyfB8Rqvs7KakuDhxoiMsrQKmlfR1IYfomgEO6/Pc5hXGauGDZVpv
         AreA==
X-Gm-Message-State: ACrzQf0n2Zmn4QZ8TWkyuFlIWe1ZQY/Nc5RcFArH7bDhy0Gb7qYGi7ww
        1sPjLFJmC3HZGnwOHjub0i9bTqYxR10=
X-Google-Smtp-Source: AMsMyM7u9h/dkayT+hLSeOHW3eyFIXztD8JIQO3WHKnzA+a8+f1OvWCBCQrfKTAJAPpphlP/kzg5suewz9I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f602:b0:178:9818:48a4 with SMTP id
 n2-20020a170902f60200b00178981848a4mr27063044plg.148.1667431170921; Wed, 02
 Nov 2022 16:19:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:37 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-11-seanjc@google.com>
Subject: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM initialization fails
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To make it obvious that KVM doesn't have a lurking bug, cleanup eVMCS
enabling if kvm_init() fails even though the enabling doesn't strictly
need to be unwound.  eVMCS enabling only toggles values that are fully
contained in the VMX module, i.e. it's technically ok to leave the values
as-is since they'll disappear entirely when the module is unloaded, but
doing proper cleanup is relatively simple, and having a chunk of code
that isn't unwound is confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 137 +++++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 59 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 05a747c9a9ff..b3fd4049de01 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -524,6 +524,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
 static unsigned long host_idt_base;
 
 #if IS_ENABLED(CONFIG_HYPERV)
+static struct kvm_x86_ops vmx_x86_ops __initdata;
+
 static bool __read_mostly enlightened_vmcs = true;
 module_param(enlightened_vmcs, bool, 0444);
 
@@ -552,6 +554,71 @@ static int hv_enable_direct_tlbflush(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static __init void hv_setup_evmcs(void)
+{
+	int cpu;
+
+	if (!enlightened_vmcs)
+		return;
+
+	/*
+	 * Enlightened VMCS usage should be recommended and the host needs
+	 * to support eVMCS v1 or above.
+	 */
+	if (ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
+	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
+	     KVM_EVMCS_VERSION) {
+
+		/* Check that we have assist pages on all online CPUs */
+		for_each_online_cpu(cpu) {
+			if (!hv_get_vp_assist_page(cpu)) {
+				enlightened_vmcs = false;
+				break;
+			}
+		}
+
+		if (enlightened_vmcs) {
+			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
+			static_branch_enable(&enable_evmcs);
+		}
+
+		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
+			vmx_x86_ops.enable_direct_tlbflush
+				= hv_enable_direct_tlbflush;
+
+	} else {
+		enlightened_vmcs = false;
+	}
+}
+static void hv_cleanup_evmcs(void)
+{
+	struct hv_vp_assist_page *vp_ap;
+	int cpu;
+
+	if (!static_branch_unlikely(&enable_evmcs))
+		return;
+
+	/*
+	 * Reset everything to support using non-enlightened VMCS access later
+	 * (e.g. when we reload the module with enlightened_vmcs=0)
+	 */
+	for_each_online_cpu(cpu) {
+		vp_ap =	hv_get_vp_assist_page(cpu);
+
+		if (!vp_ap)
+			continue;
+
+		vp_ap->nested_control.features.directhypercall = 0;
+		vp_ap->current_nested_vmcs = 0;
+		vp_ap->enlighten_vmentry = 0;
+	}
+
+	static_branch_disable(&enable_evmcs);
+}
+
+#else /* IS_ENABLED(CONFIG_HYPERV) */
+static void hv_setup_evmcs(void) {}
+static void hv_cleanup_evmcs(void) {}
 #endif /* IS_ENABLED(CONFIG_HYPERV) */
 
 /*
@@ -8435,29 +8502,8 @@ static void vmx_exit(void)
 
 	kvm_exit();
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs)) {
-		int cpu;
-		struct hv_vp_assist_page *vp_ap;
-		/*
-		 * Reset everything to support using non-enlightened VMCS
-		 * access later (e.g. when we reload the module with
-		 * enlightened_vmcs=0)
-		 */
-		for_each_online_cpu(cpu) {
-			vp_ap =	hv_get_vp_assist_page(cpu);
+	hv_cleanup_evmcs();
 
-			if (!vp_ap)
-				continue;
-
-			vp_ap->nested_control.features.directhypercall = 0;
-			vp_ap->current_nested_vmcs = 0;
-			vp_ap->enlighten_vmentry = 0;
-		}
-
-		static_branch_disable(&enable_evmcs);
-	}
-#endif
 	vmx_cleanup_l1d_flush();
 
 	allow_smaller_maxphyaddr = false;
@@ -8468,43 +8514,12 @@ static int __init vmx_init(void)
 {
 	int r, cpu;
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	/*
-	 * Enlightened VMCS usage should be recommended and the host needs
-	 * to support eVMCS v1 or above. We can also disable eVMCS support
-	 * with module parameter.
-	 */
-	if (enlightened_vmcs &&
-	    ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
-	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
-	    KVM_EVMCS_VERSION) {
-
-		/* Check that we have assist pages on all online CPUs */
-		for_each_online_cpu(cpu) {
-			if (!hv_get_vp_assist_page(cpu)) {
-				enlightened_vmcs = false;
-				break;
-			}
-		}
-
-		if (enlightened_vmcs) {
-			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
-			static_branch_enable(&enable_evmcs);
-		}
-
-		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
-			vmx_x86_ops.enable_direct_tlbflush
-				= hv_enable_direct_tlbflush;
-
-	} else {
-		enlightened_vmcs = false;
-	}
-#endif
+	hv_setup_evmcs();
 
 	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
-		return r;
+		goto err_kvm_init;
 
 	/*
 	 * Must be called after kvm_init() so enable_ept is properly set
@@ -8514,10 +8529,8 @@ static int __init vmx_init(void)
 	 * mitigation mode.
 	 */
 	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
-	if (r) {
-		vmx_exit();
-		return r;
-	}
+	if (r)
+		goto err_l1d_flush;
 
 	vmx_setup_fb_clear_ctrl();
 
@@ -8542,5 +8555,11 @@ static int __init vmx_init(void)
 		allow_smaller_maxphyaddr = true;
 
 	return 0;
+
+err_l1d_flush:
+	vmx_exit();
+err_kvm_init:
+	hv_cleanup_evmcs();
+	return r;
 }
 module_init(vmx_init);
-- 
2.38.1.431.g37b22c650d-goog

