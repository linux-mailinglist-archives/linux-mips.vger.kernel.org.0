Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BA2427669
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244421AbhJICTJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244678AbhJICSi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:18:38 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F51C061764
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:14:20 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v203-20020a25c5d4000000b005bb21580411so2359980ybe.19
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=aUX8Y2YLswKDqX/BLpfoyrV2JucXQRAbXeQDlXSPSss=;
        b=G5MbwU8BdaMQMjcxHC7wzAGcbCLg0J9TahLf26928bNhrSUGxee3WK+qIWNauLjJc2
         4Xwq4k9z0Bcozkgdo9UuN8pYL/McLuokdYERF6AjYJpP9DVrzz7LcHr5xQ7YSRGHDf83
         C4d2MTdybZ7qs6+Hvzz4omoXgx38bBowhcmbmBEmcHJcWdglD0Yhc1MiEuFt9Fw1KjYf
         IU8Si/NujuJeGl73mPfUyvTbrfWHQuWcYsMeCz7hSroDRTTwybjhxVWqi9JvGgqv6GdE
         c2z6JfVm7zV7RLMtNOh0ttQMOfVO1eAL7gbGkhhf3GzhLAQDASqkrGGTf6PyZKaDC4wn
         ItTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=aUX8Y2YLswKDqX/BLpfoyrV2JucXQRAbXeQDlXSPSss=;
        b=gMBHOA+vjUFGru/X3WJPcnBVLLGq85GlQijT9ehKW+S5tLnxDPr9dCMPw6My1H08Pb
         Kc1l/QxZz6D+SGdmQnpb+2fw6+PrCcAB7zGtv2+Fkw1e6xHRhGnEyHFEiS4YHU1RYYJc
         QfRmVk/VNkpyYrlFtr5rrEoOkBj4qT0wDpmG9sCxD3VfklYA6Wx/RYZKpZwC86XapO6f
         knXvj15hKx6cjP8SAUHsvwOGedlc5lbwtUoqWJoEJiP3ETCnGDodL2CO9UjnkJicG0Dq
         xn0bhJisE6GxGZJmw8zH4bwDxgGdg7utKrogabH1O3mSpox3DNOIb3NAdoktA1NZaenf
         zvrw==
X-Gm-Message-State: AOAM532zTMjh+oHLGvdqSfmaQcQq2aaHuOZjKKwwmSau29f6p7078Ird
        I3lKZMwm8TqdS4eYIA4YZIGZFVSp5Gc=
X-Google-Smtp-Source: ABdhPJy/0bkpOZiIEUh7mp5zb57qYvZdonB+LQ1epmXddUZkHwIyS3cnCQFog4XmODRYh0Rav6GUeBBi44w=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:2209:: with SMTP id i9mr7632692ybi.52.1633745659766;
 Fri, 08 Oct 2021 19:14:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:33 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-41-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 40/43] KVM: VMX: Wake vCPU when delivering posted IRQ even
 if vCPU == this vCPU
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
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop a check that guards triggering a posted interrupt on the currently
running vCPU, and more importantly guards waking the target vCPU if
triggering a posted interrupt fails because the vCPU isn't IN_GUEST_MODE.
The "do nothing" logic when "vcpu == running_vcpu" works only because KVM
doesn't have a path to ->deliver_posted_interrupt() from asynchronous
context, e.g. if apic_timer_expired() were changed to always go down the
posted interrupt path for APICv, or if the IN_GUEST_MODE check in
kvm_use_posted_timer_interrupt() were dropped, and the hrtimer fired in
kvm_vcpu_block() after the final kvm_vcpu_check_block() check, the vCPU
would be scheduled() out without being awakened, i.e. would "miss" the
timer interrupt.

One could argue that invoking kvm_apic_local_deliver() from (soft) IRQ
context for the current running vCPU should be illegal, but nothing in
KVM actually enforces that rules.  There's also no strong obvious benefit
to making such behavior illegal, e.g. checking IN_GUEST_MODE and calling
kvm_vcpu_wake_up() is at worst marginally more costly than querying the
current running vCPU.

Lastly, this aligns the non-nested and nested usage of triggering posted
interrupts, and will allow for additional cleanups.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 44d760dde0f9..78c8bc7f1b3b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4024,8 +4024,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (vcpu != kvm_get_running_vcpu() &&
-	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
+	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, false))
 		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
-- 
2.33.0.882.g93a45727a2-goog

