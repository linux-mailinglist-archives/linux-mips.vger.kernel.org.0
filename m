Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0E64D5680
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241006AbiCKA0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344904AbiCKA0f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:26:35 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636BC1A1C71
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:33 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id l14-20020a17090a660e00b001bf496be6d0so4234595pjj.7
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=j95pgE4Sx8peHA829tzkUc37bNityDTC3xUJdMO2UzA=;
        b=eY6emTpNoacvuiaoysnSFSYEGI+0B+krHa4P/Kh4D2MAjDRyvsIDsQzdiBWa0mReKe
         wLLIOmJC46PoM8Ve2y9iabrtTA3QVfRHxFm60wkR7QuQ3z3KjIr+FBV3ypD6+hqr/YlG
         oW2es0oK5N9Ctdp+T7UEZqjXrpgspiy/S7kJWnoT89pQXVGng1c0NPgbAZi4G2rX77Df
         GywIyvqUz+kS6x19Cro3q/w81nweCY468m7CiSYcFHlOvSXrGNZgMoAREj7DhcA1MQv+
         Usb8QAEJ//5umwpZGGeozCTn8uddNLyxyhaHsmzSCQQKz02S7oHN67gRirf+EMGfG7em
         pUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j95pgE4Sx8peHA829tzkUc37bNityDTC3xUJdMO2UzA=;
        b=VKutTmaOQ101o0NiuDr63WY4wG53IXcdx3+H5DkgSkPQQY0wSIlnC5oBGp3ZyEX4SY
         eaBmWMIq1TBOp4G1A/T9kOcbB9k61+mxelwUhcpew848t/omURygF0aBIRYRhT91GAb8
         h1Sf1Ux5Jini1tRrxeE2F3G3A0f3fpltYHwGskkZCTH1zpBrSss3wflUxv4Zhnb8P4J1
         WbLUIgu4xywPP4pEXE9YrDRznTJ1icT5bNwS0mz1w8tk3R+wOZ9a8PKdoTaTs/KNf4y+
         Y8Hsr4bSpdW9OLdXYLiHKFH781H6fafms0SIYssOie0EwLbjsGib0gvCcmEsXkI2mVgt
         kSBQ==
X-Gm-Message-State: AOAM5307vPNQErrVLm2eHiI5Rx9Rzec2zx0t1BHoGZyscziAw48OaMh9
        latIhVLMEq0DmUjYXNie9j2hXIDGjeoD5g==
X-Google-Smtp-Source: ABdhPJyr0Yxi/VkLVPG0JOeVLGZN1qgnMSwCFGFVa2lsMkBsD9BSYG73ywf0RhTzqzlrQfQDXUPJWYoLTcZWYQ==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:1a0b:b0:4cf:9a9:5c5f with SMTP
 id g11-20020a056a001a0b00b004cf09a95c5fmr7693681pfv.45.1646958332777; Thu, 10
 Mar 2022 16:25:32 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:03 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-2-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 01/26] KVM: x86/mmu: Optimize MMU page cache lookup for all
 direct SPs
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
fully direct MMUs") skipped the unsync checks and write flood clearing
for full direct MMUs. We can extend this further and skip the checks for
all direct shadow pages. Direct shadow pages are never marked unsynced
or have a non-zero write-flooding count.

Checking sp->role.direct alos generates better code than checking
direct_map because, due to register pressure, direct_map has to get
shoved onto the stack and then pulled back off.

No functional change intended.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3b8da8b0745e..3ad67f70e51c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2034,7 +2034,6 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     int direct,
 					     unsigned int access)
 {
-	bool direct_mmu = vcpu->arch.mmu->direct_map;
 	union kvm_mmu_page_role role;
 	struct hlist_head *sp_list;
 	unsigned quadrant;
@@ -2075,7 +2074,8 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 			continue;
 		}
 
-		if (direct_mmu)
+		/* unsync and write-flooding only apply to indirect SPs. */
+		if (sp->role.direct)
 			goto trace_get_page;
 
 		if (sp->unsync) {

base-commit: ce41d078aaa9cf15cbbb4a42878cc6160d76525e
-- 
2.35.1.723.g4982287a31-goog

