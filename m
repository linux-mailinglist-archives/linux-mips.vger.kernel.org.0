Return-Path: <linux-mips+bounces-4497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6093DB9B
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E761B20A54
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AFF17DE3A;
	Fri, 26 Jul 2024 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2QyKeXOX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D60817CA08
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038015; cv=none; b=Gxd/7gcZ+jV4mMIBMKGjJoHphZlJL42lvH0D83sDymkAsGiX3xANywvptCieazhUP7BMs5lo+zsHZvT56Muv7tTOA75g7UAuOHEgZW44rejspDlAMcfCqvfCdFVc9tujVnU6Q02avTAOPXXJAFz7RF0E6gfHPxsW9rzWCNnQk/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038015; c=relaxed/simple;
	bh=fPqYasQ0wmQSuuDUgdf/AR1cBeWS8t9kkwoIJqSn1qM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=recYRnMNtIQx3qblTx0zxVGNILDEvyZvNzuTWZ2KTejYcEcCWBxTCHxJoCecBAYvSUULwehjalGLDa+ulCmv6D+IkhOvdQcMo+LU8T0oS6J+frpMAGL/QoORCaxRE4dZDCS/nLI3KnbkRXnyju2CqvjWc8m0k7XoDqX4OTQNF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2QyKeXOX; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fc47634e3dso10321645ad.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038014; x=1722642814; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=o1vHCUb6CZ680r+o/spGyfXDOmfamym0Nonz9UARGME=;
        b=2QyKeXOXnCh+XHJP9nYUGOKSgpiL6EQDNDgn1ih6ODQHap2B0dFOCTY3PJu39ip54k
         yrgC/K9iJFV0Xr2pKrigk0zzZwbjLwdfQbSTk3sLKKzmtk5Zqgh7QVkwz/rC1KxpLJP7
         zf+byVELC/tX9wdDuGuxjKEbp+ObmqcV+G/idvtIP7VegpAqCKlV8T52QMPgGPHdamwW
         D2DCzKmZq52fJbXUKo706ysQTlPN5vVARbj4PE4+DBGWgX7ROMUlyobwVPztGMkx9iU8
         LhuEOl5AZXpbC1SOHJcI0E4HTsIolNEw9YaKgTfvlWyeHQqTrr/nMhyySXEEEyf6Wu9E
         o3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038014; x=1722642814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1vHCUb6CZ680r+o/spGyfXDOmfamym0Nonz9UARGME=;
        b=C6U9KnO7mKZ02tq4vj+uqnSIi+l0f7ffwXpOVlEc1qPeJ+VDLnS/GSCFPNqgq8Y1yH
         pEpMENmzoBfE6ql6jPKslpwsk7me7ljDlxv8wdMeC3IMc9wgfUvbn0CYG14KuznRPdvt
         mt9ppU+etehiEE5W2Q/AreRLqlwsCzd6ndgIZT8BpE0cJDJYH6Fzm1xh/ARDhdLoe3ho
         I6UlsnFSkuOPOyQu9tqROBumBTnB+wRVP7LvwNgBWj/SMlxeK0cplWo77OaHW743cyWv
         OvzitsCDTq7KGyN+lnxcRyBLBjsxkQyWp0MZtPcBbdeTUwX7ryVQU+oIx0SVCcFNhQAJ
         SGxw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOZLbfJsZM9CqoIwvpb7Qx3wnpnHSAJHvLS6e1WhFzzikIyrmDa0Y3ZLEQzlF6zc2OG9AkEDuhY2FH2GD6q+iCGxR0H85wQKitg==
X-Gm-Message-State: AOJu0YxuUddQ3diZIogxMm24o/KD3sst69jR7BntT3a0yiMou323aUjY
	W1Dl57tp38bil/36NrmPuOKnVX6j4bOLM9w3wz72Ie7YRHEgKOR6hbIPTxF8dbe8GTuCzZfJXS0
	ZdQ==
X-Google-Smtp-Source: AGHT+IEBaNygerYKF4xG2tivsYC4I+4KiNqX7pDiMNbM1xexlfLGsv92ykpFMstIuclC7BO9j6NqEQXsK1A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2c5:b0:1f9:b35f:a2b6 with SMTP id
 d9443c01a7336-1ff047dce33mr22915ad.1.1722038013079; Fri, 26 Jul 2024 16:53:33
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:36 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-28-seanjc@google.com>
Subject: [PATCH v12 27/84] KVM: pfncache: Precisely track refcounted pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Track refcounted struct page memory using kvm_follow_pfn.refcounted_page
instead of relying on kvm_release_pfn_clean() to correctly detect that the
pfn is associated with a struct page.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/pfncache.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 067daf9ad6ef..728d2c1b488a 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,11 +159,14 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
 	void *new_khva = NULL;
 	unsigned long mmu_seq;
+	struct page *page;
+
 	struct kvm_follow_pfn kfp = {
 		.slot = gpc->memslot,
 		.gfn = gpa_to_gfn(gpc->gpa),
 		.flags = FOLL_WRITE,
 		.hva = gpc->uhva,
+		.refcounted_page = &page,
 	};
 
 	lockdep_assert_held(&gpc->refresh_lock);
@@ -198,7 +201,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			if (new_khva != old_khva)
 				gpc_unmap(new_pfn, new_khva);
 
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 
 			cond_resched();
 		}
@@ -218,7 +221,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			new_khva = gpc_map(new_pfn);
 
 		if (!new_khva) {
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 			goto out_error;
 		}
 
@@ -236,11 +239,11 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 	gpc->khva = new_khva + offset_in_page(gpc->uhva);
 
 	/*
-	 * Put the reference to the _new_ pfn.  The pfn is now tracked by the
+	 * Put the reference to the _new_ page.  The page is now tracked by the
 	 * cache and can be safely migrated, swapped, etc... as the cache will
 	 * invalidate any mappings in response to relevant mmu_notifier events.
 	 */
-	kvm_release_pfn_clean(new_pfn);
+	kvm_release_page_clean(page);
 
 	return 0;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


