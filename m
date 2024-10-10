Return-Path: <linux-mips+bounces-5962-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CABF999123
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B89A0281711
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B2210C10;
	Thu, 10 Oct 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WEliYGH/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C121018B
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584840; cv=none; b=kI3+ftIsIbsHNerWQaINeopYvZj09UI3+F3040ASKuovdrz21Py60gZyukT+3No11H2guOdElPo/Hq+W/BanGh4O1fIXrgF0hn0SoHb0y7P7pIDFSZmPpBsD7CveRfZm9WT9bnzUR2VBhhTIqxhB7qrrou8AR4avsiK/X4wLqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584840; c=relaxed/simple;
	bh=qdVWvBqKE29lnYElhxBDh75UWFXRti117FkDAjCdYI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e9QPt+HrgCSC6Hm5gZd4aBHkzjfvxeqicotGxrC8l17VQ8i8i60y8Mgi46hqH4P3y+/NpiGlCZjJpCvQQthHIDtyLGY9CGFsJiUptLLLQYng20ct+Sy7P1brmigak3H0GScK4ooR2QLU6l4LJiMAgxiJVUsoMmqY2hK/HLHig/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WEliYGH/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e31e5d1739so25060167b3.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584837; x=1729189637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Sag0fj8OwucY2qRogRu5ELvjWktNcy71jZ/+qgEdHaE=;
        b=WEliYGH/EkhyOCm54H+/wesyw/aZ7v+0pWnBeiqQzyPlQ2Yj0TH4WvG+UvuO5i/tJP
         qqFT63mFFsNK8nCKRd2rdRSnBi6xiWs4I9YPkwQ/ORC/XHuM6kP3lGibolilYQnn8KkG
         04jph3IKCWStNMMrOeDQO9d+9jis+VCzO92vxkbcdm50eGUrzmGw34nU9RjiIPyyw0Uh
         euFYKjXV0mCOLJBqh+xh9tHaXM4uh2RwdSp6qf7nlg/wQlMv1OOpW1BTqmQYcv2QbZgI
         qpCY90RHVgLxl5134r1g7+kqZbPFrbMCMGJiJssp7lQN4g6nR6yUrSuWdNXtIvq6MagM
         3JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584837; x=1729189637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sag0fj8OwucY2qRogRu5ELvjWktNcy71jZ/+qgEdHaE=;
        b=s+Sl0C+dWq7sVgKfJO2QhwjMImBbFZvn+/aVoijXCH6QJAn7VuOBUDHW4lv/2y2JL4
         uj8gdP8dMsqNUPmeEZfWB6CXYqXgJOZE6TTyX71tdjH3HrMW706cx+XkQ0UzU47tIDxg
         NZRoaYF4lTDUu9HN/J0fB+NVeBEO6t/vz5OJOudMKq6BpsjAGIL6XmwdEuncOdJW8Xgi
         DKyTSokbxiBXL6J6+LZhVdX9ZSy75ylS7U1c1QdGt+vAcZ2n4/dd6Y+i7gxbfTOKeeoz
         RtZav40inRHeYbdiEJqPSLrGQwnFctnvlpb2AjVZ5GysSDvMMmRZbAuxEkTtf63U43nh
         ZsFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5bKlEBRxS6Ru/XIULsxjb/uQKHfg0L3IZwdipkkBYbmgatk8MJk8FEVuJ7Hi2zXgPQBMbY5fiKkfu@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1N2GK6MafvLaA8fmc0WRtf5IiIRjieDubqzI9wRiJSqOXW5t
	cFrVF5nVmuY0Q4vaTWIxrcqTlNfpe3W7T49ObbXlNqOlQzeiW5wMB1l3a4ZcFaJ0v3/YcKLlKn8
	//A==
X-Google-Smtp-Source: AGHT+IEjJriLMGICq9yty21Fx3Z3FQyTG0XCg9lS5qhc+MvTVoRASG8drmw0OxSoWZyAtrQmM3pJDo8jQYk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:a4c:0:b0:e28:f454:7de5 with SMTP id
 3f1490d57ef6-e28fe52740fmr75826276.6.1728584837458; Thu, 10 Oct 2024 11:27:17
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:11 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-70-seanjc@google.com>
Subject: [PATCH v13 69/85] KVM: MIPS: Mark "struct page" pfns dirty only in
 "slow" page fault path
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..4da9ce4eb54d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -514,7 +514,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 		set_pte(ptep, pte_mkdirty(*ptep));
 		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
 	}
 
 	if (out_entry)
@@ -628,7 +627,6 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		if (write_fault) {
 			prot_bits |= __WRITEABLE;
 			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
 		}
 	}
 	entry = pfn_pte(pfn, __pgprot(prot_bits));
@@ -642,6 +640,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
+	if (writeable)
+		kvm_set_pfn_dirty(pfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
 	kvm_set_pfn_accessed(pfn);
-- 
2.47.0.rc1.288.g06298d1525-goog


