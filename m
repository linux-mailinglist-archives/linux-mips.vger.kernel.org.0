Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB68E444C19
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhKDA3v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhKDA2j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:28:39 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192C1C061714
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:02 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id u22-20020a170902a61600b00141ab5dd25dso1949827plq.5
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=YU3JQHoEXhNYeqTaFGElIxIrX+lTdkV7tmvn1pNhx20=;
        b=nzIiCi8a3FdUTPNh7ytN/z1OZHuDUfxPkVLwkX7a0tH3K3c1YU/GUrVbVsUKogWulg
         8TV0o+lCCtBLbDlyn4CdD1ZyDyGmDuKpEashuorjvvAytB9Fha6Xh4GdoRmbK2lCIj46
         yaw8bm9yIsgJfAeOZzVP5kZxJzf5HvyCshSjBFStaw+bzKBcK6bPZX6ZcbGAXqRyq2X0
         r24cJ2J/KvfMuDyi9skDCmfAMeR4jILYlAAhpoLRq8XhdUkbVLo1pJ78Onj43zLqECqm
         BUFjMpHQOpmAXdYIVQtZSEVPXFkfrUmNQanymXLbwXrV/MiRmrChRqGkV2fOUirqVkRC
         KbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=YU3JQHoEXhNYeqTaFGElIxIrX+lTdkV7tmvn1pNhx20=;
        b=CFtUphQCW4cZ4kP/aimKrPdGZHA5Mt5wR60MWTIn0OOdZR/W5RKZu63ZfTmmbDDbYD
         kHV4D88S5yoYV4WKsypfM4k2BEUBRw8B8dgcM6g5ZMXhJ1WM1hCfbhnlj2jzw5tTwU6l
         znzVA+QYbOW0ewviqpfFAVgKMMD51ZKODJmBBSDbZawCjV008s7x/OVQcxLzA5fAZEYP
         68aCdcgKlvZs5252wvRyvyww1999eihuVBHS5Ebo6q3nQS5JD2KqwxtxwkWkFtvXOzYw
         bWLv1QtBohIdO7/ZbJQFwM+MfEJl0f4Duz3qPNiwHK2PYWjJgtqFuMREyaptj1fpmo+Z
         VJkg==
X-Gm-Message-State: AOAM531qBgHHDYl24mDidRYOT0OGELk/ZAnQ9oJBp+nZFYVzQVPEz6NK
        73HMve4giPa5ds4vCLa9ZEmslHtdI/4=
X-Google-Smtp-Source: ABdhPJweDq2zn2AkOEc4n/Ejh97liBXXjVYy6U4pABPdgYlHkkJl2at3TcV1J/XikSLWHiPxtEuWDooqyFQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP
 id l6-20020a056a0016c6b029032de1909dd0mr48630576pfc.70.1635985561569; Wed, 03
 Nov 2021 17:26:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:03 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 02/30] KVM: Disallow user memslot with size that exceeds
 "unsigned long"
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
        Ben Gardon <bgardon@google.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reject userspace memslots whose size exceeds the storage capacity of an
"unsigned long".  KVM's uAPI takes the size as u64 to support large slots
on 64-bit hosts, but does not account for the size being truncated on
32-bit hosts in various flows.  The access_ok() check on the userspace
virtual address in particular casts the size to "unsigned long" and will
check the wrong number of bytes.

KVM doesn't actually support slots whose size doesn't fit in an "unsigned
long", e.g. KVM's internal kvm_memory_slot.npages is an "unsigned long",
not a "u64", and misc arch specific code follows that behavior.

Fixes: fa3d315a4ce2 ("KVM: Validate userspace_addr of memslot when registered")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 99e69375c4c9..83287730389f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1689,7 +1689,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	id = (u16)mem->slot;
 
 	/* General sanity checks */
-	if (mem->memory_size & (PAGE_SIZE - 1))
+	if ((mem->memory_size & (PAGE_SIZE - 1)) ||
+	    (mem->memory_size != (unsigned long)mem->memory_size))
 		return -EINVAL;
 	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
 		return -EINVAL;
-- 
2.33.1.1089.g2158813163f-goog

