Return-Path: <linux-mips+bounces-4526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597093DC01
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01AB9280F47
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0A6187342;
	Fri, 26 Jul 2024 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1IUbQ259"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2CF187334
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038076; cv=none; b=fFsCV+HqqkEUqJXSSZ52hCJP4fGnM1S4TNws6AnsSd4dAT8j8pVFZpniOQac4KmnSo4/pVxFA7NHOe7xGc5NGIjWWm1G02wJ8w3yanVsKD8izwCuRTdseNpl6gUag9AXN4w8hoheEroHsZUzZnLFU1wemOyMnYh+1UbcsOrKBJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038076; c=relaxed/simple;
	bh=ZzVpAxjr1daPEmxzWMhozlSzguFi8sPCSDoFWGHBH/s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OluKqLW0lPG/R2Iia505QirmoQ1TRXboBG5/DNguQ9rDy6IZYbZEegmW8+IBdX1Z1qw6rqsP6yQTNFQaR1PNlHBZoHIOOS0irrMBRdxqWRE7GtnWOMuElxznVZWXFFr2PrHAvDXroel7kqAiMIb+HC/gQ/cEqzgBvCC2+1n98C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1IUbQ259; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7a2a04c79b6so1243730a12.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038074; x=1722642874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=1IUbQ2590lBkKDIMrUE72/4/QrD2gtK4G7LqSwbXtf7nN1kGCeezBiWMAvbJQjcA5V
         FVTHr2gDDgj62Qk59YHk/Sv4nV97eiZzlF72+WGfvKBtV1LEzeIYd+HbQtLquX2MHNzc
         5dMvOajXb5YYLHpeMLW92DU7mq1fQs/g/pyws9mO2GHtVureshhkb2qwZS2vX7pGsAbW
         YLHGi95xH65eB939kEBmpdpGtvAJkCVil2QvpiR4nnxJ8BfE1COmkgoij4igZUBOuQ79
         eBNTsiBJhYmN2XzZBIMo8YXqODCVZq09XfjIbJp2HmSZsgFj6pR4kPKAx95tr/IWt41a
         YvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038074; x=1722642874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=jz1Q7eVJ09DZZwPolzNCdcvvabme6DKSqlW+W+giwodS7rQKJwZTq4H0XzZCiT5aPk
         dHVWZZT3pwSb6+H7P3ZySUG2aPr27DAxknGBd/q+bagBBPewaq+jKH0cqoQMeGJM8wUt
         89y7StnXpwtO7fefC+x22VSueicYw+QlAdm9J2uvFbIzfey7f1nnYt+A6H59DKkFKh2M
         VFrHoyLch1ftVahrWIpGqi/lEYEwpVOYSWjmv4I6FRyMLs1yebtqapj7/jAU6WquAnjB
         FgB0n7VseRtdrwdFlmkj4yfOs7KHvhGUdH8tzVlX418nPqcEO1pMOGNV+WLQgWWCuFqE
         U4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVovdCrPcMZGx8k+OixINI/fBGQTnJ6ZErr8TSv6Dkfz8gfhkNMHbDD4e+wSByVabRkfm74d2fwLf5KZHxd4RgQbvShM11El0tCdA==
X-Gm-Message-State: AOJu0Ywl8VMaC5HEXV2Pb3Wt+SH+ikc6VGU+4sQjmKju/aSNLpBgIPvF
	G6F+FID5KG6RNVAXqY236WR5nyDgXWD02jHYOtJidRj2rOsHsLU+qpSCFfGH9rpyPtrRtkI2YoR
	gsg==
X-Google-Smtp-Source: AGHT+IG4DskQJpICSO/7ZhzoCwUBvTBXkkJhFyAvydTVcsfBboV7ccXE3z2KESMy5r+D4xCglFGTF0FLhYg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:470e:b0:2c8:632:7efe with SMTP id
 98e67ed59e1d1-2cf7d1673aamr10630a91.4.1722038073062; Fri, 26 Jul 2024
 16:54:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:05 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-57-seanjc@google.com>
Subject: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
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

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog


