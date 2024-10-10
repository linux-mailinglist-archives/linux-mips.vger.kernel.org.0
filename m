Return-Path: <linux-mips+bounces-5951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961D999101
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC040B241C8
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D020967D;
	Thu, 10 Oct 2024 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+oxKjMU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E2208995
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584818; cv=none; b=jMg2VkkZm1QO0zi0EJnY9fGfAfyMN30To6DjmHJpnHF9Wftohg+DZM72blYhY+BARnf+IqR0dsi7x496O8MFwRUkEIxiV/IzjX3BaEmfQoZhixR+VLZShBG95v2taJToIbDusfSnnXeoC8OBDtz9dR/aQau7COf3H38pwzcWrhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584818; c=relaxed/simple;
	bh=XU8sCtvYc/Uw+Iuw1o18evVVUc/CvxyvropaE1RipJE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LZIEbUQ1KYh4r0a11nHpZHWrjGkgZsIdVBxSb36/E9mJnx9XKpPuOo1OnPA/yf77lVdTDKLqy4t0toXPhBiQG1nG//H/8eRpSjZGUvIGS/apSsZe/HI1VJBshhomeM2FbiVjegFSKqJCGlB2sktct9pACBXwEv2RTAkGk4ZJt50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+oxKjMU; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso1676936276.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584816; x=1729189616; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=W+oxKjMUfyh+EqY/9j8uTawVGS+361nMyI2WTh0heIuHPPflaTW6hcERh//ZIPGINt
         hlypNXBr6qobPwsVdXmHX6BEqbZGa3FbwKmQ5Sd8OPggbYFVJFGhHU7MM+e8FbNNd40V
         2sP5QAjfViExYotUYGsZOg6HLHcp9O01YQvah7hUFc9sAA6kvJYFAZeN1//luN4wfFDx
         PzSOdMsfcFKPsHiAosOR5+PBT3aMMCz3e61LQPme5dH6VbZADVeqVvCgX4TieT8OQL0u
         n2O7FIS+uh6/HFTeEZYPKIRdCh/EQxAPOAwyFhbsAZf74548oWBqEZcLrf0aGcNxzTXf
         6CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584816; x=1729189616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=u6HxkxMokFmzStpo/VjJAS1c+JrRhVGBJs8biQAaNOdVapIG8YCcR4NaPRQ9vbfFPK
         KheE5cLaodE8ZuMBqE42DA844H+a1S38ksMKkzw6wJMoK5YK/xnvGV9SAzDjtHdz+np8
         Ji5ohZZoT5DuPoQwfAcCax+Y1uY4/4n+lEbUXxzcg+fJ//QNQLpHy8nW7G5CwMZi6rqp
         Dx95/zz1HLY1E+cQ8bupuSRAV7zFQeICSgVlf4TCwxkh61YgJsg2GpVjS7sswrdJkcry
         t1MoJEBWpor7BTgAqr+0b82XNyXc7oEAyyKvldFBCsmolv3Mz3o1Yb0wQonbfwfqH5hJ
         yR4g==
X-Forwarded-Encrypted: i=1; AJvYcCXoI2sNyRLZu0WGknFmmM2DgRmgmd19W7y/ozYYRof9n6h8udEW4q4C+5E9ZrTpCDlt1oKkQE0joZ44@vger.kernel.org
X-Gm-Message-State: AOJu0YyVo5nPaowmKdcAP041z7A6TdJeFPwTqnnSrL7mUjUfmCsyPbUb
	wxXlXs1qHmNvqfxUWvSzXWOxhMFtCBd/qvZSYmtP4JN1sZWOgMpJ3N+32dMy0geHqtcgEOkQ291
	4og==
X-Google-Smtp-Source: AGHT+IER2ThMFqRrPlrH2YqE2Mm6yZZ3YtFM0VnOojG5BgkcM2HHrRnMjpl0ZvMfhTqewlD6nF2BR0rNKwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:c45:0:b0:e0b:f69b:da30 with SMTP id
 3f1490d57ef6-e28fe41d0e6mr89144276.9.1728584816073; Thu, 10 Oct 2024 11:26:56
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:00 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-59-seanjc@google.com>
Subject: [PATCH v13 58/85] KVM: RISC-V: Mark "struct page" pfns accessed
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy (see the link below).
Do both under mmu_lock to minimize the chances of doing the wrong thing in
the future.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..2e9aee518142 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -682,11 +682,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
-		kvm_set_pfn_dirty(hfn);
+		kvm_release_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


