Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2233B25E7
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 05:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFXECO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 00:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhFXECJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Jun 2021 00:02:09 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824ABC061766
        for <linux-mips@vger.kernel.org>; Wed, 23 Jun 2021 20:59:50 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id u190so3608149pgd.8
        for <linux-mips@vger.kernel.org>; Wed, 23 Jun 2021 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cmGok1KP9mkQUahLNaNswnkRk+BZZNd8A6VDpCy6mq0=;
        b=Puw+zuEB547BUNk23be4KLF8wOVKHFDwynxb4lruaPyNnXdjflBU2IzSDSn7Mmy/gI
         GmMEkygbtUT0U9MSVI1A6lkcjDvFwvTTnQG/iiZY4thta8fK1I/CMV1Jn3JYfI6nzDB9
         oH6xXVSDsNDRtnT8PT8KZIDcpOdIdD4cCiLRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cmGok1KP9mkQUahLNaNswnkRk+BZZNd8A6VDpCy6mq0=;
        b=K1ZQ34U1aCoyngh4S16BbKrlxvBL+VQLbPSMgCzzhzQtDL+6V1UfPxW/SYPMzC8dZe
         TN8ItLLzDghmoMKE2tnvAMjoUG5WxjOPr4Uw90P58ljGsLHMoDoj34zOxscKWmcP6Ywu
         8qEVctz/1wFte+ijht/i0gE0KTK8Y1UQCbUYgEnTDreVu45WKxdZkihptH6Km9EbuJsX
         usgKTWhaKYaNnrSctPCRHYo0F1a6UiwnnNbZJZq57KB4vJPIDKLj2G5YXlNpPduSFhC7
         j5T0O+HrGblyvJAPAXKVkxuGmLFsHnw8bs5WYBB9IZG4FKWm7GXZsmN34rOB5IzSfvn5
         rOKg==
X-Gm-Message-State: AOAM532bvcwo/f6kSCPjIV79E03OY95BGJkoBFvuiXK+ld1fpDqSFShy
        FH6YpBL8H0fDzPzqg68X6fCa1Q==
X-Google-Smtp-Source: ABdhPJwdqYHO15pKuqB3WHvaFPDIGe3ZMDHFKd80sEGqz3qF8TpcI89MlzrarjtQsVeWDyea1kRTqQ==
X-Received: by 2002:a63:d0d:: with SMTP id c13mr2893248pgl.384.1624507190102;
        Wed, 23 Jun 2021 20:59:50 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
        by smtp.gmail.com with UTF8SMTPSA id a6sm1134854pfo.212.2021.06.23.20.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 20:59:49 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH 5/6] KVM: mmu: remove over-aggressive warnings
Date:   Thu, 24 Jun 2021 12:57:48 +0900
Message-Id: <20210624035749.4054934-6-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
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
index 8fa4a4a411ba..19249ad4b5b8 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -546,13 +546,6 @@ static int mmu_spte_clear_track_bits(u64 *sptep)
 
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
index 898e90be4d0e..671361f30476 100644
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

