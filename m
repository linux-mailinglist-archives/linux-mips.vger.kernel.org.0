Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2BE427604
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244465AbhJICQB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244469AbhJICPg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:15:36 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1BEC0617A6
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:24 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id gi5-20020a056214248500b00382f7a7c7e6so10251238qvb.21
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=w/H4oIWp6aPNo76SoohcXjeRifcTKNkaEcXswmTfvS8=;
        b=Awo1FqukPn/eCDkoZYrOLJ78QMIWErLo3T1JPAM+azHfyRwj0C0I0SMNEn5GIB2txU
         M8xcuGBE4Pj+vf0eSl8CB+c5E5sQbuIMe89aP9EQE621aganA5V6HDgjMAcaBpBwJFVX
         C3SGKwbSwf16LR8Vkae/cgYp5NG8CH1ijTNN50Rr4HoNERkD2EJxcY2vp85daVtbnuQv
         ioYQxPegF+Cfcf+3bUPz5AVa6rlii3Hi3Y38Qqp1tDmmH+PsFzX9zPNBKfVsQyV5sVUN
         4rGOba9XFbRiNbe1iaNvpJun8hhwygJEEzJPw9IjWbImWyRqKAUCmWW3EdcHL3Zmyd05
         +drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=w/H4oIWp6aPNo76SoohcXjeRifcTKNkaEcXswmTfvS8=;
        b=tXEDurWrTPdiErbQJrhv/k5DBRFkHvJOZGaNPT8eDGUoxTGPPsib2AHhVF6S+sDqIS
         t7yvVOxU8YFugujTcH/8RGklAlfRrKFDZn0QqHI6e2ePOXNcu848OWxszvu96KgcqmXj
         VD/0AWUl04QwRw6B+XVKx0R9ZjylYxZIK9eewNLcHOEoY68g+mMVt384+PIKut9NgYan
         2RJpLKqq3bFqsLcE55FQDfxUTHFiGe1XfQ5lCWmSOBZZwaU7Gojz0jbqRziuKqrXQoc+
         476HkpW+1yp+ONA3LGsAcbz7oNuOHTTrGngnI54G8HW7DRLSEI54ODqaQH2eA1EnhKDM
         I/Bw==
X-Gm-Message-State: AOAM530QU/VNMohIdtnOmJpOPOgeXdM/ilORP1zwOgMCY8RbrEnr4M6/
        SPUS9tpjwm1MPiu07Z15igSq8qzoWIw=
X-Google-Smtp-Source: ABdhPJxfQ527bwjQfHI3Ui/hfU27INsXtrHgzCKRUD4Jie98v/tpcQf1vSHG80RTY51lGOqh4HTdLuZNSsA=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:4b57:: with SMTP id e23mr1849346qts.328.1633745603486;
 Fri, 08 Oct 2021 19:13:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:10 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-18-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 17/43] KVM: x86: Directly block (instead of "halting")
 UNINITIALIZED vCPUs
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

Go directly to kvm_vcpu_block() when handling the case where userspace
attempts to run an UNINITIALIZED vCPU.  The vCPU is not halted, nor is it
likely that halt-polling will be successful in this case.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e6c17bbed25c..cd51f100e906 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10133,7 +10133,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			r = -EINTR;
 			goto out;
 		}
-		kvm_vcpu_halt(vcpu);
+		kvm_vcpu_block(vcpu);
 		if (kvm_apic_accept_events(vcpu) < 0) {
 			r = 0;
 			goto out;
-- 
2.33.0.882.g93a45727a2-goog

