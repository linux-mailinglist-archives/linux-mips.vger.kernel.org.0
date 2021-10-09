Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7906442763F
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 04:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244315AbhJICRn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 22:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244455AbhJICRX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 22:17:23 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62ADC061787
        for <linux-mips@vger.kernel.org>; Fri,  8 Oct 2021 19:13:56 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 81-20020a251254000000b005b6220d81efso14972128ybs.12
        for <linux-mips@vger.kernel.org>; Fri, 08 Oct 2021 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=BSxRZmRXQvTOhREE9VGZ+Ow0Eb/sKeyruI9O693O544=;
        b=Nq6mAzMn8lDyB3Y76plThgBUM5+lzQFzvcnH6nf4492bBrVyn9ck7GKbYqiO0fPX1k
         RtO6Tbh+fVA8kKKB5dfSn40puADaw1AZTWHfUhXRqDCPxkpaLN/jW7P8wDCNf5O+ZN2W
         o20t3D7+BvjahIP2EWoNGDpuq75LRMnoeyo+2e07rHfheQBVKmrV3GR1iNU5W+dWkxdx
         q3sbYxMcvibv82b/Gn150GZhBkJ6/ximka4nAWWizGZ/RcYQl+xqLlKkBDXDFmHazy20
         mn7+XEIvuuwdQeI+uMO7ytk/Gxh9aFkTHmGL9NUGs5Tnak8RvnSPI5FeOcxYuto9C6rq
         7/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=BSxRZmRXQvTOhREE9VGZ+Ow0Eb/sKeyruI9O693O544=;
        b=otaQuVy3kim97gJ/T18Nn8mGzkhK+8u29cown+l3tvyScu4sZLh2k3/MnHU5AQkTcK
         dBp0PiynWIWKFhSBH/zMWhQKBLZvBSq8nBE02tcy8fCwNLRpaJ4372ejNAqGdd8GR1rm
         FRB5PMi8IUiVM1wKqzqfFlEzRoXNvQDr9fAS3K159RHPN1EA+V2ggOy4jOxu3w9SeXGR
         X5ZVjdo2OZxCbyzuTAdQIOD/pETXgV3Kbd2ufAJEWPslCckic77Jldf7wCfW0aZ53a7m
         b4f9WZ2MMx0Y/exHeDA/05+JpeLL5TPGpA4SXneVs6IY1BGGAzv4GDKYH3fJF6zE61ZM
         CI4A==
X-Gm-Message-State: AOAM532F687KyP1RA5AyclOtPcRPXygGEY0HUx8kd4qka3aYaoVfGjha
        GvrBkGRf4OMXnkYQVaKapv7PiM43X18=
X-Google-Smtp-Source: ABdhPJwWmIgGATZaEFLCpRZX3pSkHkB9RK0xc5KzmBhnfa/imJ82wP/Pf1l0pMZYT2dHdA6zyBMoRuy25Io=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:5402:: with SMTP id i2mr7429080ybb.312.1633745635912;
 Fri, 08 Oct 2021 19:13:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri,  8 Oct 2021 19:12:23 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-31-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 30/43] KVM: Drop unused kvm_vcpu.pre_pcpu field
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

Remove kvm_vcpu.pre_pcpu as it no longer has any users.  No functional
change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 1 -
 virt/kvm/kvm_main.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1fa38dc00b87..87996b22e681 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -304,7 +304,6 @@ struct kvm_vcpu {
 	u64 requests;
 	unsigned long guest_debug;
 
-	int pre_pcpu;
 	struct list_head blocked_vcpu_list;
 
 	struct mutex mutex;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c870cae7e776..2bbf5c9d410f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -426,7 +426,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 #endif
 	kvm_async_pf_vcpu_init(vcpu);
 
-	vcpu->pre_pcpu = -1;
 	INIT_LIST_HEAD(&vcpu->blocked_vcpu_list);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
-- 
2.33.0.882.g93a45727a2-goog

