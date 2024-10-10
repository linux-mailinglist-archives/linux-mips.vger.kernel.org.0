Return-Path: <linux-mips+bounces-5903-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EBB999022
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF751F22E5F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694231E907F;
	Thu, 10 Oct 2024 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w5tvPSoS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98231E9060
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584715; cv=none; b=UqGSwTBVFRzfDifi8UpkDck4NCbVCoAqvcO97buE2Esjaj/jRKYAWeBh/+V7gsas+7GT8YEjlZe+Gv/EEX/vBQrLhqA946cfwtWS+YbPX+41fzTwKZ+MSrU7U3YqS+xVUGc07bPA4Jw0Nl18m5XPvBp8uZZRCoF1sOdqbbE2BeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584715; c=relaxed/simple;
	bh=FKY/uzFyW8/uk7MX2MD3fh26WMEEPHDBpnIM2/GXcs8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i7b2Ii3kgWz1+TdqGvBRHJGQSShkg2yEiZk9Bj3sQkEkruNYhcnkl+abc/ezSfajA2xNhPrzYN4Jyo24XgX4VltUsdV/YtfKtvuW2EO+S2uLjRxd4PvKo4Ny7wmxe3Viy0Tl8MWqL5EIV9FIDaQUkTrYTakcWNlT2QczPTShhe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w5tvPSoS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e2a29fa586so1347700a91.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584713; x=1729189513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=w5tvPSoSWJn+x5q8Oi0ZuA+6nHh716+OIuMRO32iJPXf1iRYDrVPRgGrl1ZJENQvwc
         mz1HBZPp97M1QM9TizwsEctlYX2RZjDkJzAVpK2ZQIgTitnr1b7IytQF678iRdMz5tHh
         FUUvh1DdiXPRS4vweuQEsdZZ3uyd14jwGvFphrv6qIvKpgPgKpu0kl1URoW7+fcvcr81
         nju8c/yF+vmfJpUJVd3TRkyahxIySMZEM0QnjUZq6q+VDmv8lr9b9PnwJtV3Y0LsQFCN
         Kh43SB85epl5iaJqPu/GSek9p6Db9/pYBgGQeM4RcUQbVYdV2ebPlFBqlLfYqVf3l6HF
         sB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584713; x=1729189513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=r4vzzEUYljoCBozWCH6VEqtS6mM0ZhFnSa00ziST+43O/G1za/68xBon4ns/h+g3hr
         /lz89YahNiaQCXyI7g6wvecmA0ZeiN9wx+IpNm2QPy3OhI+tDGjw7ikKAt2sGddqA5WD
         ixzhDnfA3hamup1zxtoa5xEmZNX477XcgKSiFTyxL4fobt/JtQ7br8w/aCVEltF3bjLM
         JPC59hF51fcx+dv2iX+SskJ9jKqXEndPrUIL7KmeXanvNN26exKdGx22nvFDseioUnfG
         jzCfzReY9ZerC+Z9Km5z7+yhS896NXSePXWTtlXviGtFH0/oev7a29C+ykvDk1+YxW0k
         QJzw==
X-Forwarded-Encrypted: i=1; AJvYcCVC+2HnPM/y5u9rNUbDgxtnyuVGTZa7gIr9XwuI1g1PZ59vuxafuIhjIzK4Kwu2UEq+eJyLSoXFcf+k@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNmKAevpVTE0iiBygZwBAMCQXA6995JOSUSsMirAf9WisavjU
	jxk6nw6zRC5nes3fH4K69v6EsxGMKAkWDgOuoPrMH5iNzqYxLvisFYNtoFGN6xXotP8wJXUxqJV
	Y1g==
X-Google-Smtp-Source: AGHT+IEzZdX7U43FtBqfYwOSCvhQrFRs7MoNj08p1am6l1FbD4QaVhgMc/3KfB78OlyTOzXtpjGPG3KIosU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0e:b0:2e2:d843:4880 with SMTP id
 98e67ed59e1d1-2e2f0c82a2fmr30a91.5.1728584713017; Thu, 10 Oct 2024 11:25:13
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:12 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-11-seanjc@google.com>
Subject: [PATCH v13 10/85] KVM: x86/mmu: Use gfn_to_page_many_atomic() when
 prefetching indirect PTEs
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Use gfn_to_page_many_atomic() instead of gfn_to_pfn_memslot_atomic() when
prefetching indirect PTEs (direct_pte_prefetch_many() already uses the
"to page" APIS).  Functionally, the two are subtly equivalent, as the "to
pfn" API short-circuits hva_to_pfn() if hva_to_pfn_fast() fails, i.e. is
just a wrapper for get_user_page_fast_only()/get_user_pages_fast_only().

Switching to the "to page" API will allow dropping the @atomic parameter
from the entire hva_to_pfn() callchain.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index fbaae040218b..36b2607280f0 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -535,8 +535,8 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_=
mmu_page *sp,
 {
 	struct kvm_memory_slot *slot;
 	unsigned pte_access;
+	struct page *page;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
=20
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
 		return false;
@@ -549,12 +549,11 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kv=
m_mmu_page *sp,
 	if (!slot)
 		return false;
=20
-	pfn =3D gfn_to_pfn_memslot_atomic(slot, gfn);
-	if (is_error_pfn(pfn))
+	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) !=3D 1)
 		return false;
=20
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, pfn, NULL);
-	kvm_release_pfn_clean(pfn);
+	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
+	kvm_release_page_clean(page);
 	return true;
 }
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


