Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC5B3B3D8A
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 09:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhFYHjq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 03:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhFYHjp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 03:39:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B802C061756
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:24 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so7460289pjy.3
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LzgP6h2D/QFeac1VzX61noEzAJ/USmwi4gQaHInAahw=;
        b=LXB8g40vStNBwD+4feBv7G1sswWg7tKXE2UuAUSDoyq52hfi4irDQ/yiXu8Ug+ZDws
         xIzft/b25MjWvtHFPnJ6SklO93ihyo0nBxWHm/9AZX/s3potEvqVSuo/FGmincAfc25Y
         X1yk5o0729qjIfPuIaA+V96KO60J3W+vXFDLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LzgP6h2D/QFeac1VzX61noEzAJ/USmwi4gQaHInAahw=;
        b=Sh9W6EH2fTTnv5pa1Av1T61NEosfUbaG3J2XttnEB/E4Ip/BD8N+vaF2fXHwo9PTGr
         odfkeyqAELQpyJqdXJ28AP65ZhNr/8au8hn1nAqA9MUOar9qVr8sYSqK/7B0Wqmx+16Z
         XfsA3SLzYLW0lMLhzDy4+v74Z4Y70Qt0mXmVryeGnW9MCK3czIf9ErbW6xgAJfxnoCHc
         psGxSBK8KNFFCmVDptdRP3euyhGPNX0mykoP5K3rTK2i3eJF/59WoZV7DcjYFrd41miE
         HS+opT7MVuquKgPelo+Sjl8Da77wP8453ZLoKQD4ZFP2ci2lMNgohaQ1WmF3AD4W4FLo
         z0VA==
X-Gm-Message-State: AOAM532pHI9QBOcvgz4P978zkUfidJo8GMNEauVCiVyi35geBK08LJRB
        xKbDQfbyv51AdfRr+DWSPEqo3Q==
X-Google-Smtp-Source: ABdhPJzquQUc1a7oAEf0YGdzW5/tdcjfbVYUNDDWR+jVqhrRl2C1S/KaYW68U6E8tZbflFTo+iOEfA==
X-Received: by 2002:a17:902:e843:b029:109:4dbc:d4ed with SMTP id t3-20020a170902e843b02901094dbcd4edmr7948926plg.74.1624606643957;
        Fri, 25 Jun 2021 00:37:23 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:1492:9d4f:19fa:df61])
        by smtp.gmail.com with UTF8SMTPSA id r4sm4766830pja.41.2021.06.25.00.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 00:37:23 -0700 (PDT)
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
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted pages
Date:   Fri, 25 Jun 2021 16:36:12 +0900
Message-Id: <20210625073616.2184426-2-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210625073616.2184426-1-stevensd@google.com>
References: <20210625073616.2184426-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Nicholas Piggin <npiggin@gmail.com>

It's possible to create a region which maps valid but non-refcounted
pages (e.g., tail pages of non-compound higher order allocations). These
host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
of APIs, which take a reference to the page, which takes it from 0 to 1.
When the reference is dropped, this will free the page incorrectly.

Fix this by only taking a reference on the page if it was non-zero,
which indicates it is participating in normal refcounting (and can be
released with put_page).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 virt/kvm/kvm_main.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3dcc2abbfc60..f7445c3bcd90 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2175,6 +2175,13 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
+static int kvm_try_get_pfn(kvm_pfn_t pfn)
+{
+	if (kvm_is_reserved_pfn(pfn))
+		return 1;
+	return get_page_unless_zero(pfn_to_page(pfn));
+}
+
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       unsigned long addr, bool *async,
 			       bool write_fault, bool *writable,
@@ -2224,13 +2231,21 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 	 * Whoever called remap_pfn_range is also going to call e.g.
 	 * unmap_mapping_range before the underlying pages are freed,
 	 * causing a call to our MMU notifier.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
 	 */ 
-	kvm_get_pfn(pfn);
+	if (!kvm_try_get_pfn(pfn))
+		r = -EFAULT;
 
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn = pfn;
-	return 0;
+
+	return r;
 }
 
 /*
-- 
2.32.0.93.g670b81a890-goog

