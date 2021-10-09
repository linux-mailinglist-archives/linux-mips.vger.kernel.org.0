Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FF14275AB
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244150AbhJICOo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244162AbhJICOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:14:43 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65006C061755
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:12:47 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id q193-20020a252aca000000b005ba63482993so6519515ybq.0
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=79LIBqpnbdhRmfT7kSoV1WyIctghtEtxlcdZEfLixOI=;
        b=td6Jp/Qoz+WOt+cvb/jSNSqRd38PBqxXjUOlkCeRRmF+Xq32DT9663UFIERzbBP+7k
         sIaPHTm4Vgj+KHKuAZRxJtlQiFNwnW7Gr6Np/g8/gHiZEP/vq1b8eXJehgPH0k67g74g
         Eejc31bexmjXOP0iVOhiJxMHqh3sykybQ5VDUN0mBT1X+xmhe4U8/hRuzrlGW28cUSb9
         g22fsln1P8HNH27yLN8eZT01CH6+UAgE5LZNQQheC1aFigNp8cVDpq7HbECp3WAvt9tG
         GqRirzTAEB5G45ET1seL/TOuwe+ZOUYFxzi+NEQTSlGInnVjBGl4BhooEPA1Uoist32O
         48qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=79LIBqpnbdhRmfT7kSoV1WyIctghtEtxlcdZEfLixOI=;
        b=HzlUhs/e/rfkA5EiSCj0DKUKSlJhyWmx98dixZelPqmOlgGTLq3LqEo0goS5BeJ6aL
         ls3bGfwOpgcIxdYBjEu53xM2UguVdGDAsAtJMO1UHuYUrlxjerluRwV8uDs6FeRrOo49
         PMtei7gZAGFknVPAWkzmPFliILs59ArI/j7wZgJT0Cpl8GFEhzLPZ5I44z1XubjJGX7Q
         zuVqR6BfgMR3yJPUbc/H+5Ic4fEXAtvZpTi4Qip1zX5BxqwE7FV6d2TYdf3nxWu1XxkC
         BvrvYfx4dXHlRpFLetdU8SYqAzSi4ZUYBeaoqEwvi8RV69Q3A3SvW5IrGSpBpb3CwJ9N
         BdUw==
X-Gm-Message-State: AOAM533XwVfWZfWE4fnCU+iFTWhw+grut008sV4KSzaMWvNBliMlEatH
        rVUq6DRUugjgkqOOikPMub6Z8bZoEqE=
X-Google-Smtp-Source: ABdhPJzWtheYwqmb2qGHXjL3MjJXvhFbgclB9eUF2EsS3ZM9JxohPV47rYshPv06U56fIG/ADzd4Ho8ZjF4=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bd03:: with SMTP id f3mr6935305ybk.412.1633745566669;
 Fri, 08 Oct 2021 19:12:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:11:55 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
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

Ensure vcpu->cpu is read once when signalling the AVIC doorbell.  If the
compiler rereads the field and the vCPU is migrated between the check and
writing the doorbell, KVM would signal the wrong physical CPU.

Functionally, signalling the wrong CPU in this case is not an issue as
task migration means the vCPU has exited and will pick up any pending
interrupts on the next VMRUN.  Add the READ_ONCE() purely to clean up the
code.

Opportunistically add a comment explaining the task migration behavior,
and rename cpuid=>cpu to avoid conflating the CPU number with KVM's more
common usage of CPUID.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 8052d92069e0..208c5c71e827 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -675,10 +675,17 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
 	smp_mb__after_atomic();
 
 	if (avic_vcpu_is_running(vcpu)) {
-		int cpuid = vcpu->cpu;
+		int cpu = READ_ONCE(vcpu->cpu);
 
-		if (cpuid != get_cpu())
-			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpuid));
+		/*
+		 * Note, the vCPU could get migrated to a different pCPU at any
+		 * point, which could result in signalling the wrong/previous
+		 * pCPU.  But if that happens the vCPU is guaranteed to do a
+		 * VMRUN (after being migrated) and thus will process pending
+		 * interrupts, i.e. a doorbell is not needed (and the spurious)
+		 */
+		if (cpu != get_cpu())
+			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
 		put_cpu();
 	} else
 		kvm_vcpu_wake_up(vcpu);
-- 
2.33.0.882.g93a45727a2-goog

