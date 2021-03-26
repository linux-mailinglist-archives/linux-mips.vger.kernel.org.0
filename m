Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB5B349FB1
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 03:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhCZCVX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 22:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhCZCUu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Mar 2021 22:20:50 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CD9C0613E2
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:50 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a63so8343901yba.2
        for <linux-mips@vger.kernel.org>; Thu, 25 Mar 2021 19:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=0E8BZ2STvuQIfso3dI+9aBVCstinNIkBYfQ3J4yTTGQ=;
        b=Sztl/h9sZx/7ZaVx5hMPtB6lSzMSX4Gb28dHAMSquYqz7s8WUCP4uEoziz/kmtJK81
         nfHzKFWV1WxfgApX8gx58e7JjhfWPaIW2HaXmQD7uuslC9BLVCHh4zkCoObl+QZ1dwPn
         M+RVORS2wr6AeKLyKhtXnmkQmsacfxPFnoUqFW8APJAZRs8ZHxHOdTP5b/rKvbWd8T08
         yeKRG0ZDrzCkkFO0+/kQKjyEP3OG8uUow+HKiNA9869LBY07Rkk4cdhbCro3XK38sXPM
         CCkn5lXwZLRr5xUwqO5ob7s5/KEANR2XTByUOGreIF+7GYhUmFMMjzPbXWIu1eQORSa3
         d2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=0E8BZ2STvuQIfso3dI+9aBVCstinNIkBYfQ3J4yTTGQ=;
        b=cPRphjEJH2S/IxI9wOVR9r1YClP8gmAcQFy2cx5cHW4Tgkn1dmnCowvR1Z4M0pMjsD
         q8kIULlb8ML9nVIhvzmuMOZMx8eMQLz4usJtxSskTxg/3PP97woW8SvHlapmhh2TVJya
         VQ5w0Be1QLqmQxQaydZxA1PfvWtdICcM0kCBHjzDlmxXX3tv4aFXlIQhabpq8bfiS2nm
         UtHR1ABa0m+UyZ6R9WFisT5vf3yvrtj3FTey21Asc9lHViFzrTheyIXovyeplPkijIZ0
         pe3jPQwWI5LSFvSFtkQVl8qEbxYfWH369ik+QgEgbnqiRdlgWiLkihkg50TEaYYMY0J0
         Ua5w==
X-Gm-Message-State: AOAM5331AJfkKPg63o4jMhbwWfn4h8YBnpiMFItgcC670F/8Vz4PdIFz
        N6X6xxMvi3nfdfwphsbFiWVHJYQd3Tg=
X-Google-Smtp-Source: ABdhPJzjEvSTUhG+uwIMtVfAPxRaQx8jIsDxAh63UurjJl6mHiAwbP0z55eNCAdH4rIDehEW/UWXRCNq+K0=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:f:10:b1bb:fab2:7ef5:fc7d])
 (user=seanjc job=sendgmr) by 2002:a25:be8d:: with SMTP id i13mr16186788ybk.320.1616725249585;
 Thu, 25 Mar 2021 19:20:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu, 25 Mar 2021 19:19:56 -0700
In-Reply-To: <20210326021957.1424875-1-seanjc@google.com>
Message-Id: <20210326021957.1424875-18-seanjc@google.com>
Mime-Version: 1.0
References: <20210326021957.1424875-1-seanjc@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH 17/18] KVM: x86/mmu: Allow yielding during MMU notifier
 unmap/zap, if possible
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Let the TDP MMU yield when unmapping a range in response to a MMU
notification, if yielding is allowed by said notification.  There is no
reason to disallow yielding in this case, and in theory the range being
invalidated could be quite large.

Cc: Ben Gardon <bgardon@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index f6a82230baa5..21bb8b68a553 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -885,7 +885,7 @@ bool kvm_tdp_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
 
 	for_each_tdp_mmu_root(kvm, root, range->slot->as_id)
 		flush |= zap_gfn_range(kvm, root, range->start, range->end,
-				       false, flush);
+				       range->may_block, flush);
 
 	return flush;
 }
@@ -903,6 +903,10 @@ static __always_inline bool kvm_tdp_mmu_handle_gfn(struct kvm *kvm,
 
 	rcu_read_lock();
 
+	/*
+	 * Don't support rescheduling, none of the MMU notifiers that funnel
+	 * into this helper allow blocking; it'd be dead, wasteful code.
+	 */
 	for_each_tdp_mmu_root(kvm, root, range->slot->as_id) {
 		tdp_root_for_each_leaf_pte(iter, root, range->start, range->end)
 			ret |= handler(kvm, &iter, range);
-- 
2.31.0.291.g576ba9dcdaf-goog

