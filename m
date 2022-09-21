Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FF15BF230
	for <lists+linux-mips@lfdr.de>; Wed, 21 Sep 2022 02:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbiIUAdq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 20:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiIUAdO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 20:33:14 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5FC760F1
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 17:33:07 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id h5-20020a636c05000000b00429fa12cb65so2538893pgc.21
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=RumQH9j9B8TemfcYt2a6b2x/yZUXUUkBbA8gdyrJEr38nDZ7RuvyLCRaRk5ZkufEy6
         p2NCHI5GbrqhMqhjM/+4WM5CnKN5bBsM+xcVusQQyjpPw3Ksepa4epiazoqa1DtUlznH
         D3jXrYZbhuvR8NS9oP9hxXzcyaKZyMMMzC8Q3AsRqni5HUkhRX+jDr6NPQVgVd+hQMGt
         1BKLvJS2NkApQBW4GGR8+r3gbwLtcfbqmtTVZArU0N3RAW9Bb+ckWgOW049H7NaAmkBn
         CgE9T8i2GbNr42RCENeJzZg+9RVQrzeyxaiopWDNfB1fyskDMaEA2WCUkePT/lJ5TLD+
         i91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=UANfeYtKOnb3FwSTGM++S5JXYSu56XOi/84JGTah4wdYx9S/7mhqiAYrSTewpIgAHF
         PhMGq2R8th+VSs+8Kb4e2zvQW+AThTJ3NPlpRsg+EKF31enOxW+UD38Ll5DuLW5x0bjJ
         4HaAR3vfgDFPSzg6rfUN/oo0OMHWD6cg9LMTLJpwfvju0zpJ5EVb92oEKIPnN9GbPVtS
         aESuSCJKbUxcxm/+7STaYHkOa7XB2ZzZ9FKdMRRqCiC/1H70nlpzewXK5cwGG0TI68yT
         y7B2zFzkibxcjaGgUkYYh5tYAo0wbf3rzKNoxfoLZBP9gTylrXUYI5ZG5G2qKH+7ayg6
         wc3w==
X-Gm-Message-State: ACrzQf2dVA+4D3cQZwSHs6o3crUboI4k6ibxpVYyW99h5hMf+d4Dig6P
        v3lxBKk2AWc28RIBipWgkMZMQgIe5Jo=
X-Google-Smtp-Source: AMsMyM7p74m7+dmjyK72nsLPYB9lNVLqfhypVno6piUFMo/NwEAnZPXgFzPrJP9ozDKFIC2/tvBZej6i8L4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:134d:b0:545:4d30:eebf with SMTP id
 k13-20020a056a00134d00b005454d30eebfmr26543768pfu.32.1663720386171; Tue, 20
 Sep 2022 17:33:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Wed, 21 Sep 2022 00:32:00 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-12-seanjc@google.com>
Subject: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
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
        Sean Christopherson <seanjc@google.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
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

From: Paolo Bonzini <pbonzini@redhat.com>

KVM_REQ_UNHALT is a weird request that simply reports the value of
kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
MIPS and x86 are looking at it, the others just clear it.  Check
the state of the vCPU directly so that the request is handled
as a nop on all architectures.

No functional change intended, except for corner cases where an
event arrive immediately after a signal become pending or after
another similar host-side event.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/emulate.c | 7 +++----
 arch/x86/kvm/x86.c      | 9 ++++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index b494d8d39290..1d7c56defe93 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -955,13 +955,12 @@ enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
 		kvm_vcpu_halt(vcpu);
 
 		/*
-		 * We we are runnable, then definitely go off to user space to
+		 * We are runnable, then definitely go off to user space to
 		 * check if any I/O interrupts are pending.
 		 */
-		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		if (kvm_arch_vcpu_runnable(vcpu))
 			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
-		}
 	}
 
 	return EMULATE_DONE;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8aeacbc2bff9..8b1ff7e91ecb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10811,7 +10811,14 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+		/*
+		 * If the vCPU is not runnable, a signal or another host event
+		 * of some kind is pending; service it without changing the
+		 * vCPU's activity state.
+		 */
+		if (!kvm_arch_vcpu_runnable(vcpu))
 			return 1;
 	}
 
-- 
2.37.3.968.ga6b4b080e4-goog

