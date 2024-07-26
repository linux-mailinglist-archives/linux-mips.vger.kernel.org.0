Return-Path: <linux-mips+bounces-4491-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856D93DB84
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9CC21C22B4E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE20B176AC9;
	Fri, 26 Jul 2024 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQnWLYoQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC817554E
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038003; cv=none; b=f1OuB/ydvaNaBFof49rm3QuRf+hp/IkwSRj0xPDQVi1aU4WoVFuX7UHZMdxI6uBLC468456tvn4bstFpfYyue7ax6s4LADYTPr2gPAHylp6eyrwoYcUob2MZ9t2IwkKcRSc+B5Pll9HsA6loibIGS67AH2EBzlZq2zF3EShUEu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038003; c=relaxed/simple;
	bh=btA5HWQO+KsQDU5pHR0Xwi+Zt3luZJSHGiywErewvig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CC4MXOYM8uk3o3Ear92uNsVCIgyYkpG9cJHn8SVGPHgIwwwsSrVGmF594bNYinMAqwnYxCyJNn3ZEwOX43SpOiKs+R0JCjLNYqNrY0bDmzItgPa3KEWyyLbOx5gPGK4WPNkPbFNnD3sJzCDQWcH9UHwQfHLkSvjw5bO60LVJMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQnWLYoQ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-65194ea3d4dso6504957b3.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038000; x=1722642800; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=uQnWLYoQsT8KY6zrZMLW8sL0go956kdtG4g/J8Nk5pWcFvk3ZG+rYhpXRYaweQfMSs
         RXqayQwBd7eJhIWcf1g1Vl1t59rEgDbIE96lJDyEXXGs9yQxat87okyZ7SANlqint4jv
         nirMTHJoPB7PzN2g38SDOPepcD1bTpCfTi7IfDr9GrunlxJGx5eHK7i4lSaeXE7PLfe/
         dR0kduTACRFDqPQBs+aB51umUUIR964hYvukuuJa/1v2FJ1OMAtHK6L83QtRxfE9xCND
         sSIIAmA455S0LJmqPtR1taMizZV7O5lOa2GDZbqUQlYg9thFgnfC4iuR3fw7YXPrEZuL
         yBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038000; x=1722642800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=QhWeSeCSmbILsquZQMHDEKqOkaj2BDVAx4X9j1W4TCwmfrIEw3C9Jl3z63b5c+V40q
         wSGEIjA1GzE2rxc+YsvjapZDYxcYRx5NOboMEowuNAknEl47aoOzympSKsezVSGmMEWb
         IS9YguzB1Od4rNKKtOqr4GKatNtaauisGP2mzC+6e8K1Nr6mDBg8XpPIv8UpbjaGfRgF
         hhCB6hDx1ZBe4n9XMbhTgvjreeOECtNzPfoZ75tYTv2brcH2D+98k17GOgKPMBEak+4Z
         iqXKwDa8UqiHxChUobS3CT7EhPCZpWhJ04OaGU+h88maSx6o6J94PgIWXt+JM+Jh7+q/
         mgMw==
X-Forwarded-Encrypted: i=1; AJvYcCVHfc3Nzadeky1j4+I8d9T6CUZZ4ssp0bJ7WuKE1b3Up9qrIdv71O5PLvkJP6Ne8w63HbGlhJDso8/dp5LG/Qt1/A+wG6zSmxeRcg==
X-Gm-Message-State: AOJu0YzhpXFguw8w4uOxnkyjbvM+IccMncZS2vAYvf3KZ5Uj3OZ8skpc
	SZS4QU5h4NfsscxzfUas7xxKbrDvPXByWmSMc7Ln9BUuynTeJB4V+eKD5FQD9m0alUvNiMFUYSu
	KdA==
X-Google-Smtp-Source: AGHT+IHn8ljNba0QNoBWKfaXu8Wx8VTGIoZ1RPeW8pDsltrF/Hl6Iy7/rU4VvDeHaG7eZvfgbbZBLlqPjFc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:806:b0:64a:8aec:617c with SMTP id
 00721157ae682-679fffd3e35mr362617b3.0.1722038000511; Fri, 26 Jul 2024
 16:53:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-22-seanjc@google.com>
Subject: [PATCH v12 21/84] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
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

Remove the explicit evmptr12 validity check when deciding whether or not
to unmap the eVMCS pointer, and instead rely on kvm_vcpu_unmap() to play
nice with a NULL map->hva, i.e. to do nothing if the map is invalid.

Note, vmx->nested.hv_evmcs_map is zero-allocated along with the rest of
vcpu_vmx, i.e. the map starts out invalid/NULL.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 2392a7ef254d..a34b49ea64b5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,11 +231,8 @@ static inline void nested_release_evmcs(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	if (nested_vmx_is_evmptr12_valid(vmx)) {
-		kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
-		vmx->nested.hv_evmcs = NULL;
-	}
-
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	vmx->nested.hv_evmcs = NULL;
 	vmx->nested.hv_evmcs_vmptr = EVMPTR_INVALID;
 
 	if (hv_vcpu) {
-- 
2.46.0.rc1.232.g9752f9e123-goog


