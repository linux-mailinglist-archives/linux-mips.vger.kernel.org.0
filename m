Return-Path: <linux-mips+bounces-4498-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B109E93DBA0
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A431287A4E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFFD17E8E4;
	Fri, 26 Jul 2024 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4X361lc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0C1553A0
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038018; cv=none; b=D+cbfUU3LvCnjAek/srk5+/5Hwsk6162a+PL6NA6y8e+AS2XLgLVxgHfkIqwZsIwiNGawLISp2xTB3LhTIdAj2jxe2ZyHAxPxzjV9KGdPjgrB35vsLv5GtxcLjTCH4JiPH61oicNCmzRHaRF3xzqxv19TtytuCfWo0HqBUfOpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038018; c=relaxed/simple;
	bh=ky85fUImU01pEWQgS+oW28QcwsVXcoLV2IyUFHjUgXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=evEQ0ousZgNgPf/dG+NdPiMu+Vi+Q9+BBvffgOrLKnY6BSMbEBnYrZdxBuwhVd2wU2rLdvQwWZe/oVbCYSirD5Th5dm95RJH2HwRgEAv7LXnZHgJTkqiAp/51XpREFAaK/ZGhhvsyx2/D2TBlkBNrM9zrVm8aH18w2GcPtFIwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4X361lc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fee7c9e4a4so10495575ad.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038016; x=1722642816; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=J4X361lcv5omjYSXGjZ0fssgEhP2g3QChtpX63p3YTCh1tEcBOdpZNXI4FFULBvR3S
         VYgb253yj4SZVjbqi8SF8MfdBuLW/R0HBssZHFe/n2c870P3MUbVanInnAhBpPimmK6a
         dimoqNXKjqZpQKj3xjHHvKkTXxUbdZf7RWq60mHXbo2R0nBgINL6gArL9befHiD/kmQI
         xHkuAlEj+O/ohlPrnY0uRW0FkMW65211oxaUpRCZUYydnuVbDI9rFmevXyfjgiDr1EBs
         nWHRNI9+yM/gBxLmgi71OlUrHgdkity0Evi4dCf7DCRf5oQA149HkdxIrDM2mncfAvwS
         9Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038016; x=1722642816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=fnjFsF/ZwSGqlNpP2kul+6wREExzprJgnWK83kxN7cwLjrTsaAws92vD5S+DoTLFko
         ILkmJ1wiXTbzRAxUBR0vIFaT0jwAHgoBepRYdlwPk7g/MRObea6FJN81kqfHF69xAUCV
         FN3p09R82RW4kflmauT+Vj+jDARXPWpY4f3P5z5kOutA5WwpivIQ9tarl+LyBAzdniUb
         3S7/NOxk1JzAiMqZa7l075vVPX1KdI+wVmL7lQAWbfRKhK60JarTwSAHLu9H5Q0mNGdY
         VV9r0MG0KwwkU4l3Q9+NcuFREn5ECtx5Mtcj+k7QneAfaomMEd2m7/qEbVBBu/N/Qjus
         DRag==
X-Forwarded-Encrypted: i=1; AJvYcCUjWRdTDhQS6gVKl8k+vT3mPw5YQ5Tu/6b+ZZSJdGVNB8lWjb7E/JeIiiOKr4iUGC6OCsG3caFjn2mEoNWl2rKqUAnaHo/lpJOnwg==
X-Gm-Message-State: AOJu0YwCCqcMbvv7bT1PtskEWSCeYaL+zK1L2U6C/01lU+Tmu1I7MvWV
	oNtNbJVkgeUPIEOFhlTeOAGXFvjMRDJ1v65vvqnP3Ij7bOY3mneGr2DK3+fKtVYYAgKv7Ocx3HE
	vpg==
X-Google-Smtp-Source: AGHT+IEYmoKPicLFNTjAfXc3rW7QIOSCWQtpI+t2ZFjfSCVkTMXBL3j4sNtxlzg5xGSYJWPU8sNID0rjz8Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d481:b0:1fb:5f82:6a61 with SMTP id
 d9443c01a7336-1ff047b8ea6mr1156745ad.5.1722038015496; Fri, 26 Jul 2024
 16:53:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:37 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-29-seanjc@google.com>
Subject: [PATCH v12 28/84] KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()
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

From: David Stevens <stevensd@chromium.org>

Migrate kvm_vcpu_map() to kvm_follow_pfn(), and have it track whether or
not the map holds a refcounted struct page.  Precisely tracking struct
page references will eventually allow removing kvm_pfn_to_refcounted_page()
and its various wrappers.

Signed-off-by: David Stevens <stevensd@chromium.org>
[sean: use a pointer instead of a boolean]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a5dcb72bab00..8b5ac3305b05 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -280,6 +280,7 @@ struct kvm_host_map {
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
 	 */
+	struct page *refcounted_page;
 	struct page *page;
 	void *hva;
 	kvm_pfn_t pfn;
@@ -1223,7 +1224,6 @@ void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_accessed(kvm_pfn_t pfn);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty);
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 48b626f1b5f3..255cbed83b40 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3113,21 +3113,21 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
-{
-	if (dirty)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-}
-
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(vcpu->kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &map->refcounted_page,
+	};
+
+	map->refcounted_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
 
-	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	map->pfn = kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
 		return -EINVAL;
 
@@ -3159,10 +3159,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
-	kvm_release_pfn(map->pfn, dirty);
+	if (map->refcounted_page) {
+		if (dirty)
+			kvm_release_page_dirty(map->refcounted_page);
+		else
+			kvm_release_page_clean(map->refcounted_page);
+	}
 
 	map->hva = NULL;
 	map->page = NULL;
+	map->refcounted_page = NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


