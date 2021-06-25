Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F9C3B3DA4
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 09:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFYHkQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 03:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhFYHkL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 03:40:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2EAC061756
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:50 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so7476822pjs.2
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=16WTMv4TM6XRqCXu1WqfhwXLGUuF1I5eSAZgF8nuzNU=;
        b=j1IBKqLi1jF1pVyyqujoaaEyDD956vhQFsW4IqQOy9pFHxew6pDCRuHqUYQPzXhgIV
         rZzKBOewFTMPizmmlwFMEzkUu3wwxGe2e89oLtXslKb8oDVXALVjACeulmB5NJhacKR6
         l2tBxaC35ppPnNjz4UkRwFuKRG263fy/OfW/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16WTMv4TM6XRqCXu1WqfhwXLGUuF1I5eSAZgF8nuzNU=;
        b=mJqN25BosTZwsBVaN1SV8eXVQ/kcvXhjZ3diLHEVboyugqnvm96ZyeLYssHyp5G74S
         bzONUDD4HB0ZnjQzangRD6moQlXsMVyzSJdD5stocotec6C+mLilReY0f1ajGbbSm8pF
         U3ynNoHK5lB3BPbryj47vOOjwz3CFOvSNHiSbJGZdvdvWD4IT+eBMOLfYnXHzWZAsVYH
         bUUgLPQTRNKjTpLOcZvyan5mZKeyTf/W+0D604ybfRUmXrQmPRg2Biw29lbbIkUMD61O
         s4QS61dOLzV0W1uPWNKxEmYj+Fd6StZyoVRK6CHbqc4kvepzU1C07DpZaPAxCnlCCovF
         p0JQ==
X-Gm-Message-State: AOAM532kDTYJUycxOPLCUTvcw7Z7VGkiFqcf9p7h/Cx13VobaD3Oml0b
        NV15JxL9Ib6HOOOQ08Uk3aqleQ==
X-Google-Smtp-Source: ABdhPJyNGzGIGPRke+4sy9vknoJlahbCbtDrQ1Pof1+x3qW6lrR+9qBg5laf4ZCLScq2FNWqiUDGlQ==
X-Received: by 2002:a17:90b:b18:: with SMTP id bf24mr9795691pjb.220.1624606670432;
        Fri, 25 Jun 2021 00:37:50 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
        by smtp.gmail.com with UTF8SMTPSA id j10sm4395324pjb.36.2021.06.25.00.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 00:37:50 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Nick Piggin <npiggin@gmail.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH v2 5/5] KVM: mmu: remove over-aggressive warnings
Date:   Fri, 25 Jun 2021 16:36:16 +0900
Message-Id: <20210625073616.2184426-6-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: David Stevens <stevensd@chromium.org>

Remove two warnings that require ref counts for pages to be non-zero, as
mapped pfns from follow_pfn may not have an initialized ref count.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/x86/kvm/mmu/mmu.c | 7 -------
 virt/kvm/kvm_main.c    | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index dd5cb6e33591..0c47245594c6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -607,13 +607,6 @@ static int mmu_spte_clear_track_bits(u64 *sptep)
 
 	pfn = spte_to_pfn(old_spte);
 
-	/*
-	 * KVM does not hold the refcount of the page used by
-	 * kvm mmu, before reclaiming the page, we should
-	 * unmap it from mmu first.
-	 */
-	WARN_ON(!kvm_is_reserved_pfn(pfn) && !page_count(pfn_to_page(pfn)));
-
 	if (is_accessed_spte(old_spte))
 		kvm_set_pfn_accessed(pfn);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1de8702845ac..ce7126bab4b0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -168,7 +168,7 @@ bool kvm_is_zone_device_pfn(kvm_pfn_t pfn)
 	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
 	 * page_count() is zero to help detect bad usage of this helper.
 	 */
-	if (!pfn_valid(pfn) || WARN_ON_ONCE(!page_count(pfn_to_page(pfn))))
+	if (!pfn_valid(pfn) || !page_count(pfn_to_page(pfn)))
 		return false;
 
 	return is_zone_device_page(pfn_to_page(pfn));
-- 
2.32.0.93.g670b81a890-goog

