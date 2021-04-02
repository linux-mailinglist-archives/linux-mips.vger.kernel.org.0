Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505653524DD
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 02:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhDBA5x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 20:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234361AbhDBA5a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Apr 2021 20:57:30 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128EFC0613A9
        for <linux-mips@vger.kernel.org>; Thu,  1 Apr 2021 17:57:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id a19so7716373ybg.10
        for <linux-mips@vger.kernel.org>; Thu, 01 Apr 2021 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=FTDHlh7r2o77AAwrA0E9qeoNYgpcbLuRaDEVNkBVwHg=;
        b=PRhdN0c+oVeC84FkNtK2OfzN4+x6lsMyI2b4OVZY6LEzjuMMZ4+EfdsvsDxWmIs9Nq
         zAmlFPOUqakGcwtEzlGlIW87jbHzydFRrCawVR4WJj9ElDeMOXggR/xUf8WnMbUKoAh3
         lEpJ//3eALC8qqX6jN5ZPFveFaoAcp0W8wTiEBs2aObLKZCHeuoH095sVwHNZJ/PswMS
         FVyxeb81nksnb4YTup/Ov7PJ2+WqfzrIlxJ8okqoIMrlmmVrp7U8IQ90sZ+PuN+Ped4m
         oTDFOV8oL/hOxYcLRJggJQ+r9Hb1KLnULxlCGV+FPKgt3oJpOweN7336d7VL5zPVquco
         5veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=FTDHlh7r2o77AAwrA0E9qeoNYgpcbLuRaDEVNkBVwHg=;
        b=O9WMJUtiJ4K9XzcQKIrpeYN42wFr1HrR5Orv5FkKQfyzjY/uyNFbj5Il6b1A/Fajy7
         i0WnLWUW88kLdwnzeYoMl5rj/vGddMccrV9ozJZ1HrUBu+fAn0NsARkR0gcs5sfYWJXB
         mdEVjTsxYgXzB+tfsiOgan4iCnA57LVl95RieTBSWudPMuxiIONAZlDtRYwygV8+a9IK
         RIdxbqv//+uFcy22Z15ODflRheldJFWOH5WXEhQ7Ad3prLF1Mo5GwNOELgqJb61BlqkY
         n2Jd796FhsPlKE0N2MaT8sQbVajjL3lS/bikSH2gM5B+an1zY25p6SrluUWZOEFtt9bV
         HsTw==
X-Gm-Message-State: AOAM530P9tPYlseheZZWEUarNVDeuizNXlQ/ghWG92XA0N7LWOfh+k2S
        G8t+yTYkFohD3d2Q+oYLbSSRBhZFPT4=
X-Google-Smtp-Source: ABdhPJwqaRwScDcukbswHxcp5MoAwCeA4G6inLsOkqCP5OYhV3sDapC/0YKNmrNh7+I1S9Rwld4HhjfDqxk=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:f:10:c0b4:8b8:bb34:6a56])
 (user=seanjc job=sendgmr) by 2002:a25:cc81:: with SMTP id l123mr8448930ybf.272.1617325043283;
 Thu, 01 Apr 2021 17:57:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  1 Apr 2021 17:56:58 -0700
In-Reply-To: <20210402005658.3024832-1-seanjc@google.com>
Message-Id: <20210402005658.3024832-11-seanjc@google.com>
Mime-Version: 1.0
References: <20210402005658.3024832-1-seanjc@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v2 10/10] KVM: x86/mmu: Allow yielding during MMU notifier
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
index 7797d24f0937..dd17d9673ff2 100644
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
2.31.0.208.g409f899ff0-goog

