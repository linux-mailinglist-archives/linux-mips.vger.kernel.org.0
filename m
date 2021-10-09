Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A711C42761C
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244549AbhJICQa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244222AbhJICP5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:15:57 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F82EC061779
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:34 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j193-20020a2523ca000000b005b789d71d9aso14935257ybj.21
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=pLGnZNeCj1eofs1Tna8HvgfHGGH+OqNXhSkcDhwkBIw=;
        b=VRo08TCu54WXCeWvaUHt/sk2e0vGE+t23O2jGFtKJrC8szlW29PyUVg9qa1gFeA7l/
         xEskdCWXRSlglDPxzwJpI+hnS34D4TzLDKLZZJDH+vXneZUjJrJ2p6jMQ4+6yNusBF7P
         6CJ8/rSwneH/NW0dEbzJkjR/ZnaiFW04wA6ydEJsYBVq9hwfsxkAk8UtewwAEpUXkOH2
         gElF5Vx854/uDHSVGxe/9WkMnKTFMH6pK6EPC77dq53/WUYVeZkuMvVYcngIplHzpqzD
         mk15NWKmGwkAbgPYO3UA0b2d7qx8J738ZHLocYz+9s5CV0wLJv0e5T4wx+Q9y63P5xIW
         pwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=pLGnZNeCj1eofs1Tna8HvgfHGGH+OqNXhSkcDhwkBIw=;
        b=yVsSIH5Fc87OJGy89gOrWzcE2kuFDrlwI8fTK3Gz/bj98VeHFL6rqBIB8KdPdtPgb5
         CpTgybX/Qk6lpo1GDBbsY6Uz8RUdTNHutbCbWyppLOaE3Co6FrGzKNLWVz97D9OxBcx5
         V2GUHoaaC7E4dpoUNnVdSokvIDKm1INBBHm4l6uzdITkyPIhXyAvpW3EprT4qLkJxZc5
         B1Q2OKIccNIaIsb3BWusCuyMDvE+EExsJontedrKPHs2OM/9jQxrgoaGLTc1iVjDlQ5W
         FvHV+Iklkzym1D4TXl+87SSMeALnVBk1jdz5m64tqVW5LhM2cmjMmyZhDXfIK3mhvtbe
         NlXw==
X-Gm-Message-State: AOAM533IeBls5jwjVZM6qQS7M31Zrfa+1jeIBs2hhU688k2xQ7e86zXh
        ls2KfLTWACDNz7oUNyB0udkis2TmW1w=
X-Google-Smtp-Source: ABdhPJz4iSAfPQRljp1PNlRsP2+bvwjiNJU4qxRXVZchtwSA9sdFFYFZ7ZvHA8l7ONDMJR0uzV+kR3cYKVg=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:1b86:: with SMTP id b128mr7765690ybb.20.1633745613685;
 Fri, 08 Oct 2021 19:13:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:14 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-22-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 21/43] KVM: VMX: Clean up PI pre/post-block WARNs
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

Move the WARN sanity checks out of the PI descriptor update loop so as
not to spam the kernel log if the condition is violated and the update
takes multiple attempts due to another writer.  This also eliminates a
few extra uops from the retry path.

Technically not checking every attempt could mean KVM will now fail to
WARN in a scenario that would have failed before, but any such failure
would be inherently racy as some other agent (CPU or device) would have
to concurrent modify the PI descriptor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 351666c41bbc..67cbe6ab8f66 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -100,10 +100,11 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
 	struct pi_desc old, new;
 	unsigned int dest;
 
+	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
+	     "Wakeup handler not enabled while the vCPU was blocking");
+
 	do {
 		old.control = new.control = pi_desc->control;
-		WARN(old.nv != POSTED_INTR_WAKEUP_VECTOR,
-		     "Wakeup handler not enabled while the VCPU is blocked\n");
 
 		dest = cpu_physical_id(vcpu->cpu);
 
@@ -161,13 +162,12 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
 	}
 
+	WARN(pi_desc->sn == 1,
+	     "Posted Interrupt Suppress Notification set before blocking");
+
 	do {
 		old.control = new.control = pi_desc->control;
 
-		WARN((pi_desc->sn == 1),
-		     "Warning: SN field of posted-interrupts "
-		     "is set before blocking\n");
-
 		/*
 		 * Since vCPU can be preempted during this process,
 		 * vcpu->cpu could be different with pre_pcpu, we
-- 
2.33.0.882.g93a45727a2-goog

