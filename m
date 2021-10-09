Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3198C4275BA
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244251AbhJICOy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244242AbhJICOx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:14:53 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF68EC061762
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:12:57 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id r5-20020a05620a298500b0045dac5fb940so9782718qkp.17
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=duVCxds/Xk54aU09i5UIkyaIUq0yJMQJZI9wZA2YDlA=;
        b=Wv/kcG4ULQxV2PKupeA3o9viF1KOUTbF8+9gkKByWbWPMHCHTm+TZZg7F5whB1kJEv
         00RE4Q8btFY4lrjbmtjP6hVSSAYJJdql8WRFW8k/FQZNMBqfykiFr2BiQA+wfe28C543
         SWlusb4mpYdymW6ZMpaM7mrIbRvVwIrPb/jvum8yisSKEvO7UFeRbl7H6trZAhauAzQD
         a1bpHkCHoYH6NJt8GSDU7cMPxIgXQRKLxIkS2NtUm9+Lov6n2e8PGJQvej1YmfsKCffW
         TihOARLN4ummUTvbvoWa2j+nguD9Os55BuiemMJ8jed6VNGgNVOfE7xoH5rBJNb4aOyN
         lvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=duVCxds/Xk54aU09i5UIkyaIUq0yJMQJZI9wZA2YDlA=;
        b=VRnrrp1Xt+J2/H7XfFP2uNKX/esCGbgFg3KuvNKik32tm8zldDPBbgM1O4qbP/gtK9
         FYefdkzCG8ijud1q9CtlOd/2njts1webkVYPxGlMLY4HMBW+hjQWhgDTZFZ03viH2C8r
         oS4Ly2y5kweHFaTZHbGhU88v1F+I+HEHMYp/JL8eDQkxCZZqJNtL0ENO2GdGtL1egUiX
         KcEhv8co+iWFpmtJclig1jkK0syKe1M5xdmbLuQ8vQurEVeIrC3+zlbUWuZwW6+FIJ1B
         k4QvOuizt87/eNoMkoizH0whOYI7IuA1I9RaHXgf+vK9RYBZ1p9eHrhxzSLwYA/rlDHl
         hf8w==
X-Gm-Message-State: AOAM5338rGQrHFCtSkSlToLpKdpmJEGuYhtajhSioj7v3wUfijceptVz
        A8107jWLPwF0BvaP7bXlJP6l9/9un5c=
X-Google-Smtp-Source: ABdhPJzReckbemypX4PIoTmT2KiRT9pVyd7dG9YNXxxpVcLBpBPcyP9Rkq3/2bNbj++4tivC2JpyLGM9nrE=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:622a:1055:: with SMTP id
 f21mr1892047qte.24.1633745576813; Fri, 08 Oct 2021 19:12:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:11:59 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-7-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 06/43] KVM: Refactor and document halt-polling stats update helper
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

Add a comment to document that halt-polling is considered successful even
if the polling loop itself didn't detect a wake event, i.e. if a wake
event was detect in the final kvm_vcpu_check_block().  Invert the param
to update helper so that the helper is a dumb function that is "told"
whether or not polling was successful, as opposed to determining success
based on blocking behavior.

Opportunistically tweak the params to the update helper to reduce the
line length for the call site so that it fits on a single line, and so
that the prototype conforms to the more traditional kernel style.

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6156719bcbbc..4dfcd736b274 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3201,13 +3201,15 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static inline void
-update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
+static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
+					  ktime_t end, bool success)
 {
-	if (waited)
-		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
-	else
+	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
+
+	if (success)
 		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
+	else
+		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
 }
 
 /*
@@ -3277,9 +3279,13 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_unblocking(vcpu);
 	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
 
+	/*
+	 * Note, halt-polling is considered successful so long as the vCPU was
+	 * never actually scheduled out, i.e. even if the wake event arrived
+	 * after of the halt-polling loop itself, but before the full wait.
+	 */
 	if (do_halt_poll)
-		update_halt_poll_stats(
-			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
+		update_halt_poll_stats(vcpu, start, poll_end, !waited);
 
 	if (halt_poll_allowed) {
 		if (!vcpu_valid_wakeup(vcpu)) {
-- 
2.33.0.882.g93a45727a2-goog

