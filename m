Return-Path: <linux-mips+bounces-4551-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE593DC56
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F081C23300
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ED7191F7F;
	Fri, 26 Jul 2024 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZoJFHj0w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD989191F85
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038128; cv=none; b=m705bbgWVxfenVMWTLPsJfwCec49ZhdZobWIAs/4ynbbDhe0PzWpluMPYwRlheHRRvjK+MXe0GyFJB00yav+EcJFfuC9d+jXXshQCmmM3Y9bxQlh5mG7HWTq57dtb2hB9q+HqvrHPUzP295bqNJIV18StZ+0roEFktuVsCDjlDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038128; c=relaxed/simple;
	bh=KB6xn4OZUICEWZrxSAqwnEMQRTZa0ja3Fgai7TvLTDQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rk34DrZnD5pcqnM/xh1F64wWeD4SeXi/I/m840O2P2ikhNxkA0fZmbxhJj8nHTi0fKVmV/7uyrnclyZuKE0Im8QF9YpGtoJJuh1uXhkw0I9cGpD/59uT0egFhotb0XC5IcpZIQ2MFqoMnKbp6rwu5xLvSClfwvEBReF4+78ulfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZoJFHj0w; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b35859345so399039276.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038126; x=1722642926; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=ZoJFHj0w7FsYYJx3bhxdk34ldYyiP0vqIANyKmizKcnmj/uT7k4sNz7hi4gq5zY48I
         em+Rs6DFvn9dxe0L7is1CoHmRK63z7HZAoJ4dv5N9O8KgQ+iZteRxi6oKsOekdI123xS
         2PV66b398wMEnj/ZhmbfMbuFNRdpY4C1dOtiqSfqcxUOd1jHj4M6irSUKpRE0oxQB1ph
         a+RmLpSSpNq907+2yRyDgYTYouDBGGetKaDOp6vf5A/ZKXKyDhqwkB1t3jbZzO7zDgb0
         ILu/FNas9dbFrk9mR0igqZGSLP6WvESlOFwnhSdNCwuDf6/mLaaRwqyt1OsOpKEByxZB
         Tmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038126; x=1722642926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=M/LWDk5LyNTbcyQNTfXu4/kiaR3HSM7Ggf+oW0PsdtuE65Ds7BHRBhstrHXI06RV+N
         zeYk7bwIiaVBln+Qge0NP6U04TWrxeZPOdkI9ILoQPnshGQMEZF00CkZMwcUIZMXYSvh
         zQ0dlZl/VMyOEOhdUztuJEPJRCNKYoV8OYGex32KDcAkJR9b6wKsZwjtosFukxRbtvJk
         PoCfrNv+PY37ety0HsEYzS0QcGvFzVOJimtMZH/RlAllJSOkJjSx1dGnRPfw/d+1bLVm
         KNyYXrAX2dXp6anFoPi7QEOJNGrIZEBv8DcMg6C/14MwRn5uYXMenlFyU8H039eavUmd
         ltug==
X-Forwarded-Encrypted: i=1; AJvYcCWztghn874ao70y8eWEwfYo7cjwL8pefNDuemXc6FTWI5ISwUT4d0ZRbJuOtG+OSboKe6dRkEgVawlhfPi2lgDEXn4I3yPH3Wp2Xg==
X-Gm-Message-State: AOJu0YzQvZAYZwO8tUSrzHJH1I5aeYvzVuvUE/CPm2hslU82qKo2I6wx
	moa94AnHWks7KtzNusH490XNX0a4TEVfrU7WSXNe9p7sAUUFVX50SOIked9olOq/ePzjQ4G+lqx
	dBQ==
X-Google-Smtp-Source: AGHT+IGgyahrOCg0Ix+MrKo8QCm20LiC8Zd9dP6asKSX3o/8So/b0NT46HfwZKTclpC/RfFjW09NkNDMj3A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1029:b0:e0b:9b5:8647 with SMTP id
 3f1490d57ef6-e0b544ec4ddmr2334276.8.1722038125883; Fri, 26 Jul 2024 16:55:25
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-82-seanjc@google.com>
Subject: [PATCH v12 81/84] KVM: x86/mmu: Don't mark "struct page" accessed
 when zapping SPTEs
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

Don't mark pages/folios as accessed in the primary MMU when zapping SPTEs,
as doing so relies on kvm_pfn_to_refcounted_page(), and generally speaking
is unnecessary and wasteful.  KVM participates in page aging via
mmu_notifiers, so there's no need to push "accessed" updates to the
primary MMU.

And if KVM zaps a SPTe in response to an mmu_notifier, marking it accessed
_after_ the primary MMU has decided to zap the page is likely to go
unnoticed, i.e. odds are good that, if the page is being zapped for
reclaim, the page will be swapped out regardless of whether or not KVM
marks the page accessed.

Dropping x86's use of kvm_set_pfn_accessed() also paves the way for
removing kvm_pfn_to_refcounted_page() and all its users.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 17 -----------------
 arch/x86/kvm/mmu/tdp_mmu.c |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2a0cfa225c8d..5979eeb916cd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -546,10 +546,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
  */
 static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 {
-	kvm_pfn_t pfn;
 	u64 old_spte = *sptep;
 	int level = sptep_to_sp(sptep)->role.level;
-	struct page *page;
 
 	if (!is_shadow_present_pte(old_spte) ||
 	    !spte_has_volatile_bits(old_spte))
@@ -561,21 +559,6 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 		return old_spte;
 
 	kvm_update_page_stats(kvm, level, -1);
-
-	pfn = spte_to_pfn(old_spte);
-
-	/*
-	 * KVM doesn't hold a reference to any pages mapped into the guest, and
-	 * instead uses the mmu_notifier to ensure that KVM unmaps any pages
-	 * before they are reclaimed.  Sanity check that, if the pfn is backed
-	 * by a refcounted page, the refcount is elevated.
-	 */
-	page = kvm_pfn_to_refcounted_page(pfn);
-	WARN_ON_ONCE(page && !page_count(page));
-
-	if (is_accessed_spte(old_spte))
-		kvm_set_pfn_accessed(pfn);
-
 	return old_spte;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index d1de5f28c445..dc153cf92a40 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -861,9 +861,6 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
 
-		if (is_accessed_spte(iter.old_spte))
-			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
-
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
-- 
2.46.0.rc1.232.g9752f9e123-goog


