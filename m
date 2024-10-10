Return-Path: <linux-mips+bounces-5943-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044E9990E9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8649BB21BDB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5B9206E7A;
	Thu, 10 Oct 2024 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n7BtqPXO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6E206E65
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584801; cv=none; b=j7e06PoDQVovmuaJUmjA4aEVXDsSVB4SgxEBXO1BverB29fdNO/X9woBoEMFRG/zrjteo0LFzg7btQLPgfh8frUWVk3NZsg+r+7EGwbDGvqSHBKP3SAyX1pIiYuL1ccm/6vpuH6ZcDE0Gi3q+OaoHoRwjvdlFnycPguKcxI7g7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584801; c=relaxed/simple;
	bh=saU0+rag3xXF2/z4L9d0pyohkblMwsyLsKfPnspMwVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aDpVRWd31IrG9cLUMqdZNu62Qdq3s8ClxiELrO0TN/z+o3mQZEFmBLowsF2X/dwKNFM9WBejWF2AxCeWrjKcg6BsQ2Cn8AARp7vPJmWITsNvq/T+6p/chddbTS06Z4MqNn/G5cydIVY8CGzy6yuoSc+psm3uASw++ZBpCG5Cjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n7BtqPXO; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e1346983c8so1278268a91.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584800; x=1729189600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=n7BtqPXOYdiWJ3X9kD0iG4C8w4FjCr57M/d0x7tEi5ZIPg/i+rqFcqjVa9Iu7dhTRm
         nS6nozj5Gx6r6aaboU/1PQ32h7s+9ziIKF4h+h1LWCrLRiUwW8rZY+NEeX29VkUMajfa
         kPp4Uu0Z6uHkKNXYVdvtCr+F14kxdarXnJ+OFvhdU/rGA6+vEjLsWSXDQnUXI1V6EUWB
         g/1qV+76T6dKYhGWKC3Y8+mwi7W/PFdRqfEjjmH1UO824LRmq6fMUl3qRoUJPp2+avqD
         GaAVk4tv/PFte/ebRcd7xjinGzyNHBzovubXDRuPTUDZ/OKUAHrM6Pk0WgOK4dH0HDWj
         0krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584800; x=1729189600;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iay4RI/uPKTQE0By5qqA//dP+sG5w7++36T/RHxbCNM=;
        b=p5WaG2FYHmG+LtuGJJun2s49hlgThEDBNo6V6THJoNaS+SLhGUwF6QTXQWts2QM2dJ
         6dCE4jvVJbToIWdjI99JL1QkqTIWlsk/1GP+ztj+tlgfjd2vpv4XootvM8aFIxFMwdrr
         /owEIT4e8krGeQlxnN7ff9tei5VwsijQCxKaGTqFa/3I+qDklUHLFs3pjd6V00Dv6wJq
         5AFKl5zdz/D7A7C+aG2CYSLdYlNaDuvJuUEWCgD/3OkJ33VzBt3jsTPE/NxcfTUEE0Po
         PUm8A/qpuY7B9r4MZua0hDgf6NaEsikHPb1IEdjkrTJDV1ML0lo8EYN/BC8ST9tV5rid
         ttRA==
X-Forwarded-Encrypted: i=1; AJvYcCUjUsWTnkNevsdttlN0aObOLw+7TEt7zjCUOz8hypE9RwHy3VOwKKOVF5Rk57+QvGTptp6lamXlvyBm@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtmR3x0ndbM1TMptJaMoARmLUVInovimzKWd2Xtk1ipnOEY9f
	PNXOWMef5Q5CaM/d1ga8/W28SuNOnNJwDFL3DUP2XZhRb57Owoe/BfsdWG2hYI90PQ1bhLooAnV
	+Ng==
X-Google-Smtp-Source: AGHT+IEd4uxjZrUyEQQM0MU+jkiJqh3LQboji5/ZXtrCgOTVgrRv0yMO5ln1NKE0y5PwnoqkXxjnsp8xFDc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fe86:b0:2da:872e:9ea4 with SMTP id
 98e67ed59e1d1-2e2f0d7e9d7mr54a91.3.1728584798284; Thu, 10 Oct 2024 11:26:38
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:52 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-51-seanjc@google.com>
Subject: [PATCH v13 50/85] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
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

Hold mmu_lock across kvm_release_pfn_clean() when refreshing the APIC
access page address to ensure that KVM doesn't mark a page/folio as
accessed after it has been unmapped.  Practically speaking marking a folio
accesses is benign in this scenario, as KVM does hold a reference (it's
really just marking folios dirty that is problematic), but there's no
reason not to be paranoid (moving the APIC access page isn't a hot path),
and no reason to be different from other mmu_notifier-protected flows in
KVM.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1a4438358c5e..851be0820e04 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6832,25 +6832,22 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu =
*vcpu)
 		return;
=20
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
-		read_unlock(&vcpu->kvm->mmu_lock);
-		goto out;
-	}
+	else
+		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
=20
-	vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
-	read_unlock(&vcpu->kvm->mmu_lock);
-
-	/*
-	 * No need for a manual TLB flush at this point, KVM has already done a
-	 * flush if there were SPTEs pointing at the previous page.
-	 */
-out:
 	/*
 	 * Do not pin apic access page in memory, the MMU notifier
 	 * will call us again if it is migrated or swapped out.
 	 */
 	kvm_release_pfn_clean(pfn);
+
+	/*
+	 * No need for a manual TLB flush at this point, KVM has already done a
+	 * flush if there were SPTEs pointing at the previous page.
+	 */
+	read_unlock(&vcpu->kvm->mmu_lock);
 }
=20
 void vmx_hwapic_isr_update(int max_isr)
--=20
2.47.0.rc1.288.g06298d1525-goog


