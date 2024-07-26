Return-Path: <linux-mips+bounces-4534-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8393DC1C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA93286003
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCF618C32F;
	Fri, 26 Jul 2024 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8fhxbzx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603B18A940
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038093; cv=none; b=b+yQuhMQRZaak/ggmcUHsBYlbpMG+Ihu9vSyDtI/dFU83qrIO9drJI+LK8CXWUzrAnF71o9ymBa+ikwkykRUeeeugAtvjc18p3cbax1AvnK6OwfSlWud9mdEvjXNLwCadfv+Ry9sITEdGpvOhvHHDbfwALVN07qtUagwHCNTBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038093; c=relaxed/simple;
	bh=+UZ8VYtUvtsljZmzMl/1tyQmxGJndr+FFAuTaMIEbgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ECkzB6gLsdxqi7R+A5Zg+w77vspWfbt8UXYlLuobOBlCD6gkOksM/AfTVH2uQb5NfPFCq5gfl5/9AbJIa1mqfb11q1AyYbEXbkrp1Rdy5OeHl3aEz4AyrRmT6k1KNBCKdkiQoKTkqOvilk6hOcyp/35N6E8N5qlj/VAAjb2BI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g8fhxbzx; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e05d72f044cso387048276.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038090; x=1722642890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=g8fhxbzxMjYe6ZLQfrHAHsBWxC6cxXhzdGPG8Zp+ckGWyAB/sw/M7MffrH4Pa1fopZ
         TrbHGVSARxRdxADLvNR5mhX1CjXn6oXTefVOfs91mZ1irT9OumbXjM/bkPjd6y11yThi
         hrXzuznv3R7cnWfQ1Pztd7B8LdjgW8eQ+CCcaVfB5ZTm92CpYeabX+vVMZG/dd0vbhJO
         ctgWNqa431V4kPr/axMdrwRPVdmagd0FDNtcf9rBoghwcaGo71nI6n3WvvVkEcwWdPAP
         D4VnkHZYn/VVZSYAfDnplg6cRFRuUVbmH8lJ93S5k4ijI/Rdyf5IXKqUkzZXPnMfWssI
         Py1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038090; x=1722642890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=MoL4M0u9dDfkM88SDU70E+5QWUa+yklfoj30lKDCYaNHdWEa/U5NmsJMMFiQidLlsf
         LBQiEgfKAa/vUWs3ydZk/+DO5msFPN/rP1oGCEpZ+PQLIkSzqo+q38sFfqZQvN9W1fUQ
         Z3aZ9Cx8qUD5A7bVcOtF3eGZTcqg0R2LzmEJczkIyVtRfcl5Y2x63ZoGuVxvhEBubV1P
         rcq30xoyypM/JIhtdH58bsIUmvIP03u8yu0vAC/K6a8qEKw47ZFShlnC2rKZPpYNXlh8
         fUkaTDzDB8/GoB2YdcskL4TnGtFc0OMwuKpPjWI/r4mzMwT4K3rNatdEuj1My7HWhvjC
         qZCg==
X-Forwarded-Encrypted: i=1; AJvYcCW9t1JhJ3SprhkiHvfoFKtTCphPFu5uNkIoP4/GwweLLxbTizwCFTrvPgrq6n/FGlnw9MPotMzgTvKmoiNxvd7MWbTymggAkNEOAg==
X-Gm-Message-State: AOJu0YzSeHQwi8SgnaGR12jFpsgJDwGDK2E335RE/oUDB5aBYzwtQyHX
	2bJVsf2h8HTWpO0qa+46OkkCIK/zg2rykI9lQ9aBb4cGFRhFVPF/WKYtSDlarOq4jUertOT3zuy
	odQ==
X-Google-Smtp-Source: AGHT+IEFsToK4Mtfkt/isyLtzSbxuiJaEYiedQjj5sFCo8o3/vbFtfyZ9L8therJfArRWUvkwGk/K/B8SPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1002:b0:e05:6961:6db3 with SMTP id
 3f1490d57ef6-e0b54503b59mr2236276.9.1722038090539; Fri, 26 Jul 2024 16:54:50
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-65-seanjc@google.com>
Subject: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty only
 in "slow" page fault path
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 2634a9e8d82c..364dd35e0557 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 		if (kvm_pte_young(changed))
 			kvm_set_pfn_accessed(pfn);
 
-		if (kvm_pte_dirty(changed)) {
-			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
-		}
 		if (page)
 			put_page(page);
 	}
+
+	if (kvm_pte_dirty(changed))
+		mark_page_dirty(kvm, gfn);
+
 	return ret;
 out:
 	spin_unlock(&kvm->mmu_lock);
@@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	else
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
-	spin_unlock(&kvm->mmu_lock);
 
-	if (prot_bits & _PAGE_DIRTY) {
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-	}
+
+	spin_unlock(&kvm->mmu_lock);
+
+	if (prot_bits & _PAGE_DIRTY)
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
 	kvm_release_pfn_clean(pfn);
 out:
-- 
2.46.0.rc1.232.g9752f9e123-goog


