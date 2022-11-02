Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B7B617218
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 00:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiKBXV5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 19:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiKBXUb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 19:20:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF6F6456
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 16:19:52 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id q62-20020a25d941000000b006cac1a4000cso351019ybg.14
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=jpZ4+tq6rgM4hZWXweQJqfxuirRlrRpN+o4JwlpzpCNTf2A1sJCTA6DFTlQxCFhgbt
         sLPS4JguQacCAQKGId9cUa8Po003/wEsvkFZ2dOMw9iNk7lA7jWRoh5OFZzRfWNs6e3X
         DneEijHQrn4rLICnTKWJFk513kvZJ3K123XsKZ8FoBZdWOMtOvWDKENXD0/AJPQsCKjG
         rrWvKtMA58cnJHMchHTeytkk5Oc3RF3YtWKf69zqcXqxFh7WlsD0FI+Jf5mEVKngU/vv
         wyh2CqSaqQR9rkwiquK7nfr1sE2Ot7UFYqlBaM19WPnwV+Bbr0Tz+aWWsDk+unGGDNDW
         oUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=vwS0zQBNKOtuocIEvA6GClNBakzyv510vdk92wDlmUpNqKE52DfgLztVOo2HQgR1y/
         G9da2+SZC5qtOLqOTPvjSw2BouDd/FuLvhZDQz0WpBhhmq8mMPbn8booXSPJrJNyZQJw
         v6itUeTjTOePVFvwuApXPMmFLzAZtfxZQb5NItEgxJewJgQm9Jn7DKfBqp/CIyixcUMM
         a3qCC2BoN7TBYLUmT84HHGYbbY+AwQEwDEAlaVqPt7OrRfDzxGK4jD3fAQhUZAj42K/w
         dcp0A+AcVXkm1pdO72zPhFS0jPbh45RJkLHs9hXNwxtAMYtjJ72o9NrlNc34VMeHTy7D
         oWhg==
X-Gm-Message-State: ACrzQf1ya1mL1F+K+kTL1Elp/TmcAyNh8OvKPUmvc385RYcx4wQM8Oeb
        PMZQLHZTQ2qprEwZvr5TxSKkv4dp9/M=
X-Google-Smtp-Source: AMsMyM7jpwGuIU1urFbOZ+g44WVeQ15lWGU4IrnR1FfXK34lSVgumwGfDAw7vRfyWzKVx0s/7WxU/xcerg8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e694:0:b0:6ca:2610:76fd with SMTP id
 d142-20020a25e694000000b006ca261076fdmr171916ybh.607.1667431191239; Wed, 02
 Nov 2022 16:19:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed,  2 Nov 2022 23:18:49 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-23-seanjc@google.com>
Subject: [PATCH 22/44] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
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

Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Moving setup to riscv_kvm_init(), which is tagged __init, will allow
tagging more functions and data with __init and __ro_after_init.  And
emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a146fa0ce4d2..cb063b8a9a0f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
 }
 
 int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+}
+
+static int __init riscv_kvm_init(void)
 {
 	const char *str;
 
@@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
-static int __init riscv_kvm_init(void)
-{
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
-- 
2.38.1.431.g37b22c650d-goog

