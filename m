Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D84A4D5682
	for <lists+linux-mips@lfdr.de>; Fri, 11 Mar 2022 01:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241073AbiCKA0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 19:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345072AbiCKA0g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 19:26:36 -0500
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB711A1C69
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:34 -0800 (PST)
Received: by mail-pj1-x1049.google.com with SMTP id s12-20020a17090a13cc00b001bee1e1677fso4260260pjf.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 16:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0eAfKiOxcQy9JlkrjXNpoHqYHtmPuiAwbCjCtsBF1gU=;
        b=Ds65Duv71Sj++gu858kzQzfx4qj+n74AY3f3En/PZmXyzUO8L6iQ55bITs/kJzLy7E
         1jAfwm8/sK5JqfrHLJDw8N2+qOoDaqdIgsikIF90Gdja6qFOkEyH/1V+THlFIGsLKAUI
         NrzcYy53Cwxzug9SUZA/22KspdbY3akV2eXvpVmmP8/088xMO6De1aJppaQIBk6f513S
         D/KDc7JzburUmP0xkKQTMIcZS0hk68J7NNa+iw2WZ6/Q3TfdAEBsREKoblTyIGSfh6K2
         k54muP2tXq0Pjriu0Esl1G3PuZQVW3OvY79X+cSH57wTuUftGGbDJIGQSSTasJuF1s2x
         vb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0eAfKiOxcQy9JlkrjXNpoHqYHtmPuiAwbCjCtsBF1gU=;
        b=ugbFnBdIj1MfJ/h6dZrh3jAV0aFaj+YLICRb+rZ2RbRzdpnMkcs10lGdLn1lG2Ie3j
         ZoRTCYcEom3xZqirz229aBRu4xGLKO79h7tCQnQhr80HAyR4/OZZlsaxZmTnUeoGZroQ
         vaghgEUw9h77fajUNH/x0TQyqENsq/XnNjAtHt0TjYKBVQGYJNxkHqb/xmF2U93+bxE3
         10n5z+r7XbKDpJDlomUvvk24hNX69hQmZDBZJYLnBsjDS197RCZJOo61XCvvNZlFYHWi
         y7LrKD55RTNUmKDmS6X0nBJYBCuRJULx8zIkF3IG/QwPFo/s2F6n8YxwldcFdoDE4qln
         oMxA==
X-Gm-Message-State: AOAM532LhzGKAM+b5Bb1mQxsAaSo+rfXloVqY+JAjsLa27rKUtzEXZuP
        b2imc8k/VoOolSW8UeKTwHpJRDA2PswfFA==
X-Google-Smtp-Source: ABdhPJx2ihth+Lyp0jx20NkW4UoRmNnE2WoUi5zOLMEZXktLr7faLnrpgu/8QE08DLH0Spz2A92OMKfVSAfiBg==
X-Received: from dmatlack-heavy.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:19cd])
 (user=dmatlack job=sendgmr) by 2002:a17:902:e5cd:b0:151:da9a:2b5d with SMTP
 id u13-20020a170902e5cd00b00151da9a2b5dmr7419566plf.67.1646958334306; Thu, 10
 Mar 2022 16:25:34 -0800 (PST)
Date:   Fri, 11 Mar 2022 00:25:04 +0000
In-Reply-To: <20220311002528.2230172-1-dmatlack@google.com>
Message-Id: <20220311002528.2230172-3-dmatlack@google.com>
Mime-Version: 1.0
References: <20220311002528.2230172-1-dmatlack@google.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH v2 02/26] KVM: x86/mmu: Use a bool for direct
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The parameter "direct" can either be true or false, and all of the
callers pass in a bool variable or true/false literal, so just use the
type bool.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3ad67f70e51c..146df73a982e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1706,7 +1706,7 @@ static void drop_parent_pte(struct kvm_mmu_page *sp,
 	mmu_spte_clear_no_track(parent_pte);
 }
 
-static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, int direct)
+static struct kvm_mmu_page *kvm_mmu_alloc_page(struct kvm_vcpu *vcpu, bool direct)
 {
 	struct kvm_mmu_page *sp;
 
@@ -2031,7 +2031,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
 					     gfn_t gfn,
 					     gva_t gaddr,
 					     unsigned level,
-					     int direct,
+					     bool direct,
 					     unsigned int access)
 {
 	union kvm_mmu_page_role role;
-- 
2.35.1.723.g4982287a31-goog

