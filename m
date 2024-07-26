Return-Path: <linux-mips+bounces-4527-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C993DC05
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0CB1C211F6
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F5018755D;
	Fri, 26 Jul 2024 23:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qzSz+eiy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C49187352
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038078; cv=none; b=tEkyfCzZ6plvUmQzQodapDuaDQJLSzKVI1vukoavwX+35T78WjE8EXTssM6vFtSdPKIKqqzlu3ky1VGu4ddxvqqOILq0aqD51+isMXcLCbMrPEyK11yFXe/qIxBfqF4fGFy8NJgTxG/xaIb+zjycdr4YrB0yfn3sHcPu/JgOSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038078; c=relaxed/simple;
	bh=xUjZCVI6Pn1FEhfDqaMS78eNTpmQssm1VgccWbaB3YU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mvajaH+C8ZpAxsJQJcF+TVy4M7NVfLRkXTPc6yxSj88VjMaqmod3Tr3B/bUKSZQWaLlCmpEhG/Ya621GU3ss9jbAyYRqJPrqKHb8vuCBHqqve/DNJnQ3QckEIVba0TLgBH0PRM0aNevWhYwkGMVeXsSap8N2gKaJDDXdM/9u4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qzSz+eiy; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-70d14d11f42so1334368b3a.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038077; x=1722642877; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=qzSz+eiy51sE136ltcrx3c05MDtPwdpTXtK/OxPx/ZqpeqXQUatNO/3ilT4X+Bg6pY
         U4MffWjrgYt1qnYkrERvyZfWIo6Vu/aU1gEVvq/IGFJk/w9YyvrrZinzsHJdmzXL7DHP
         hYjVan3DoE/LpgsOClo8KWhM3wP0UZSAFYTFU5iG5UAAaHidkH3vtwOuKeGFnGkoX1Nn
         FqCdqiQVEfQqlxoBOH2WyJtrVjkCSTTAAQmPCpDSas7b/tNs8S+ek/ys8p9RCOK6csdr
         /+rBmQvH8jE1+5B9BskkLoUaDryHEsTpDmdh4wv8YhJjSbtL9Y8lgGpaxYUoljNuCVqu
         mT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038077; x=1722642877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=dr9QvF275WtaFyF1NTK/0+KmV3iTkLhi0C/E4dQFXxZlspmsYYp1hPhQXnDebjF9gM
         PCr6axbRe617rBcSLEeLRGqJHRdphC4SsnzuzCViQ0DaZu1yE7quJ+tUZtAbpXDyrRlM
         OajgZDmyyHQbtTmtkieclKDq7I1Mk5Oht9FsIZeg3abcHizHAeQM0t4seVXv6gW62Q4O
         9UfTD6ckfJRRgi0e4U49mJG2S8IHqDVTNOCdKFFRLrkCANZG8oCo4dLaENj3aWmQwWc7
         wB3YQRk9DGsGoNXxWkieqt9QZFL9ECn330bTdoKBqwXCCiV+mMhbbtV1j/UCyCP06sfx
         1dLw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3C7eI+7otG/Gl2nJgw8kgCLpEsbMBel1fjmCAut+Iu+z7/qWnvzjXW/8XtbVCE5VpRyQSaKh+1R3xPpvt9qS5G4HDs0LFYhURQ==
X-Gm-Message-State: AOJu0YyLLCrfVbmfi+pVhWauOoPqnlxh3ukZNdbBM6hbU1g9d7OHDAen
	ZdOcxY9vk4ndMJhMJlbbOQLWY/gPYgaa02do/kFlMFNpLtlHYCHA1xniIpIfKq9xY1uEqMz2JaU
	Sww==
X-Google-Smtp-Source: AGHT+IFil497nfsH36PcPgD5gbB02jEmsX2CuGy2fe2s5ytKElT5nFsSQdr9eHlR2IIEavfJT4DgKyMZ3iM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:1e28:1c33 with SMTP id
 d2e1a72fcca58-70ece9ecd04mr10022b3a.1.1722038076443; Fri, 26 Jul 2024
 16:54:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:06 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-58-seanjc@google.com>
Subject: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..806f68e70642 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -683,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
 		kvm_set_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


