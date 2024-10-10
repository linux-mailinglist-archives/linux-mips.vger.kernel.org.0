Return-Path: <linux-mips+bounces-5960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5399911D
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 243DDB25FE4
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC0A20FA89;
	Thu, 10 Oct 2024 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNF92OQx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151620C490
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584836; cv=none; b=WOsw/thOYEHeh4eRfwNqSjV1Nc4BvDjyAYEAwYdT/4lwXTrQRb0i5PLdA+9GuACaAZZCs6GM/0aIIGhR9OhKemgVifeVvGYw1T5qTKnVEvufi7JcbcV9Q2tX+Jtt6BpS3aIFjCqRxmCCzzyndUFH5Zz3TBf2ihQAIWTr4UGG/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584836; c=relaxed/simple;
	bh=+TpPAbVVI1obWW7OdvHKpXsCMwy9+BV5v8TfW2u9vbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HbZda94MjBlmb7PRTXTjg3CDNy7XcJ+9KBZ0Dxmv4X7SP+ed8Fv6Ea33bg38KIfKzlG+H5mKyTL49kCeqX3+Vh9MH5wjA8KH9UNwOQABCUJs070SvCD+rB0R+NLkAOu8ypboTkH5/4yG/z+tskcf6Z1EWVHq0SaawytfF1yuvfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNF92OQx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e2ca4fb175so1249366a91.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584833; x=1729189633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=GNF92OQxF0tq2Sy3NXgpLFxQxC22Wl9tw03n7HzL4JrVAJCkh+Hov4DvKeVAkbLbz6
         guCgfWZA8nqZBp6XZ9pJ4Hawa9uVtgV3UErDEF6u0+OBm51ovt6v1pRCPWJe2lNSocFb
         9IG5h2poJKL8NVnbhGa7Q5llq0RI6iyjaleF9SNYfF/o/fNFc2aKi+UykoVstbZ8OxwU
         d1wLhivyUM4mbES9K28ITC9CcdOVPnfsFw6ARgKHJiVEHnES4HjeBBPrQzXn/hChp5jb
         ncyckAUOmfR9C543A9BJWxeDUS9424yzgfnC3W2p+8MxlZym6ly+BGplBaNU9k30CJj/
         w62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584833; x=1729189633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=IikyDk2GpcIZaOfmrfmbD3aggWMDUkUymk9pb4qKeucRUwnSLTH/tR6DV0LEZv8RbX
         LI36o4HzXJXMBX2cAmRrcWFuTKipTaogSynkbr90q5nBY2En9p68iaUOo45Ih6VBo/Jn
         DS4plHYHxVyjCL2s5S7lzE0IlmiZjnk8uuasFMDA3JTX/khXGxRSCQeDgJtdtDzoZRoD
         1xGymGeDUDalOru2aO+pPWboi3uSMmH4H9CmhBTacepFZ2GiYB5mrj8G5M2iSQeKzwi+
         8L10XLX+7N9ScQiaTWFaTZXowG4wOS5677RwBv9HBU2kKzbrl07nrMH7gMAtzbYAPW88
         ZGYg==
X-Forwarded-Encrypted: i=1; AJvYcCUdTNrBVPXzHcbU4DjHgItCVQ3VkkH9cZMkZ7YgL8miNItiM6G0Fm0FK90sMFJ+TpjCQyy36Wo37iFw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OzsrnbLN9y22c1O4fH0PtY16pGOBs8/bPANvxR66l8D7lBme
	S7QZyIp8oTmYOAEcXoAEMWBy7TelYFD762HdYchuojbldgcuG/Fjn7zM4VYoAMoWq50+tQ8HZGo
	Ijg==
X-Google-Smtp-Source: AGHT+IFpwqxWKAWfrUvKF1EatvnBv5g5CrzcpgT/ZTuiTODJnzoCoYK053S1MFwF0WyL9wI3LVhDYDAiv74=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:46d4:b0:2e2:e148:3d37 with SMTP id
 98e67ed59e1d1-2e2f09f1a56mr94a91.2.1728584833102; Thu, 10 Oct 2024 11:27:13
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:09 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-68-seanjc@google.com>
Subject: [PATCH v13 67/85] KVM: LoongArch: Mark "struct page" pfn accessed
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
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index ed43504c5c7e..7066cafcce64 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog


