Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93DF96171D8
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiKBXUL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiKBXT1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:19:27 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9007825C1
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:19:20 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id i8-20020a170902c94800b0018712ccd6bbso244078pla.1
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm9EI+cM+5edeoncgirJOK1OjdMfit/iE/V7h68jiBA=;
        b=bL+6TpNkM7xunyoG+gMR3bDhbv+lOJER+h6vrXBg2jRt79YqAlbOV3s6/VQkeIpj52
         Ky1J7zaHaUxciHs2i3/MW5CLnr8pffu2zrCWdSsWEvN6vkqzU4pIQp/Uj0gPLK6GDxI3
         GXoAw0QLp0yQS3/DSHQFoQOG98RSEwY0diep14lnnAfxj0vljm9xePUY2AEeRFGvmBXm
         tRsmblxsjx3f7i/4+Y9GUkzbutc8U0tSPE9xz/PT80Ld6mJSu9LlyVnSoU2uILnp4M37
         3H0YxDU1PZnTyFdDu6Y+lDm6+PExiZVQW1JgbUHVisjW0UqEwp57euCcN8FduUynf2n5
         u4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm9EI+cM+5edeoncgirJOK1OjdMfit/iE/V7h68jiBA=;
        b=h4Op70+iSiR4UBhf6kRMyX++bDNk0sOuhN1ThR9b2Ai66dn5zsHIJYzNkvuBc46zRD
         BizqkhoeKYwtXYgKNxtBhkAFv8Q24aLZ2gBtRBD2w8n+0rzL1MPVjroOHJzaiozzH+jm
         9SlVaGFmcFo7TMlAJ1ry0YHKqTNWubNRpHfXhYGb75bcsayakoxN9KXK17tXOljDAuv7
         M1Z2gvsCE0NzL3lq2ysKV8hXcnYx18bPl5fGCWkktMELmPMqhnaE7nT2IbJya5o+My7V
         UeYYe5RYgFdYPj5p1C9yqbrAGITCzVpKuHIXMjEhuUJT2JwUzvxE6x0hkaehAIUXdGcD
         192Q==
X-Gm-Message-State: ACrzQf3oS20kYmVgQJ2firfS91i0GbE0jtDnooSIX5I+yHYFiCX4WJjR
        nTLL5sAKTp1tRQZ5ovQwD4n1J8OF81E=
X-Google-Smtp-Source: AMsMyM6cjV/OPOyVIfIANSlI60mryZ5mbwTKQzkf0thAVt8NDrReB3H6IytQCpI+wrkAP6TPRUKjJyN3TqA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3281:0:b0:56d:385:149b with SMTP id
 y123-20020a623281000000b0056d0385149bmr27381564pfy.29.1667431159662; Wed, 02
 Nov 2022 16:19:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:30 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-4-seanjc@google.com>
Subject: [PATCH 03/44] KVM: Allocate cpus_hardware_enabled after arch hardware setup
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

Allocate cpus_hardware_enabled after arch hardware setup so that arch
"init" and "hardware setup" are called back-to-back and thus can be
combined in a future patch.  cpus_hardware_enabled is never used before
kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
only needs to be allocated before /dev/kvm is exposed to userspace.

Free the object before the arch hooks are invoked to maintain symmetry,
and so that arch code can move away from the hooks without having to
worry about ordering changes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e0424af52acc..8b7534cc953b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5843,15 +5843,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
+	r = kvm_arch_hardware_setup(opaque);
+	if (r < 0)
+		goto err_hw_setup;
+
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
 	}
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto out_free_1;
-
 	c.ret = &r;
 	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
@@ -5937,10 +5937,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
-	kvm_arch_hardware_unsetup();
-out_free_1:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
+	kvm_arch_hardware_unsetup();
+err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5967,9 +5967,9 @@ void kvm_exit(void)
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
+	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.431.g37b22c650d-goog

