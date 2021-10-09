Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B68427630
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244516AbhJICRX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244587AbhJICQp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:16:45 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA122C0617BE
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:46 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i83-20020a252256000000b005b67a878f56so15033188ybi.17
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=va765MwNV8lkPK+fPa+/nQPV7Q6ICFe76wXLuhKBR7k=;
        b=B5oLyIOK5DCmxdgNe+Nl5/eUZ+1dZvr28zFbfb0yUmRDrQAn6gFu0meDWGbooWcwf+
         l+waGmWoLOHDfWujUlJgTIfXQBGxvJYpWrTevNrJNk5M8uz1livq3G0CbLqGnwGl0JPm
         sNTwBIZ8vWCCI3dUoTv7AkcFha93KYIamIUHSTRqHBmzceqRPtYmNYOCGYVyZvVn3Np/
         TL6ymtR5bZm6u0h37kbtwh2/3um/F6VSleLNBRjXkJxQwQ6Tl5usknG2mBtpFmrzjKYA
         RfxJYCWymoaofgRtrejK3tfUhsfLqLitFSkmp9z1zLeMTRzswrj10R8lRDFv/A07PTzr
         ihYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=va765MwNV8lkPK+fPa+/nQPV7Q6ICFe76wXLuhKBR7k=;
        b=KtamVc/7R4QY/ewVIW7bjvBp1dTj7nARHFRJG2l9GJxVnApOixuOR1igvYtJsnFozI
         SIgGXg8hXhg0Ph8YYEAQwHPwiwGAoi6r9StxTtJfk5pN10ob/J2iaAF8/mYnxJPeiW5Y
         4pvLjQrNnLwiiadjP7DgAzf2bN/l7RNmlx8fAiOcX5nBVPRkAfSUc9xspLfV2V4B6mcY
         Tou5BRNikMhDALC6yQDVE1JbaLGuGGsMfR7efneO8CTFXEf053FerGJc06/KC0nfZ3pX
         xUFz16uCojMJHKKCartM2qGutfTB3QhAPUCdfu4VQ84cqOmunXyLLrjJGdRAwkjBQbcA
         zQgw==
X-Gm-Message-State: AOAM531qRbOcEYsLtqUwuo9Nffvlh1KIAQDQVBigHB0qiYBqiZZoH16E
        iBhASaJVbzByFK7gwbsuYdxq+z/Qa5c=
X-Google-Smtp-Source: ABdhPJxNwqY1vJaMvOgnvL3+QcSM5HrN4+PYEJxKTsdN858kzlppD8XZ0WLvzzYX6ErETJg0fQvQs2GFQ5w=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:69c7:: with SMTP id e190mr6678164ybc.334.1633745625928;
 Fri, 08 Oct 2021 19:13:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:19 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-27-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control" exactly
 once per loop iteration
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

Use READ_ONCE() when loading the posted interrupt descriptor control
field to ensure "old" and "new" have the same base value.  If the
compiler emits separate loads, and loads into "new" before "old", KVM
could theoretically drop the ON bit if it were set between the loads.

Fixes: 28b835d60fcc ("KVM: Update Posted-Interrupts Descriptor when vCPU is preempted")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 414ea6972b5c..fea343dcc011 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -53,7 +53,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 
 	/* The full case.  */
 	do {
-		old.control = new.control = pi_desc->control;
+		old.control = new.control = READ_ONCE(pi_desc->control);
 
 		dest = cpu_physical_id(cpu);
 
@@ -104,7 +104,7 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
 	     "Wakeup handler not enabled while the vCPU was blocking");
 
 	do {
-		old.control = new.control = pi_desc->control;
+		old.control = new.control = READ_ONCE(pi_desc->control);
 
 		dest = cpu_physical_id(vcpu->cpu);
 
@@ -160,7 +160,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	     "Posted Interrupt Suppress Notification set before blocking");
 
 	do {
-		old.control = new.control = pi_desc->control;
+		old.control = new.control = READ_ONCE(pi_desc->control);
 
 		/* set 'NV' to 'wakeup vector' */
 		new.nv = POSTED_INTR_WAKEUP_VECTOR;
-- 
2.33.0.882.g93a45727a2-goog

