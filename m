Return-Path: <linux-mips+bounces-5938-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA19990CC
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADB71F21AAB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5A9204958;
	Thu, 10 Oct 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzGkvQXL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69F1E1A1F
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584789; cv=none; b=jmgtgDwDOHhWRwfY72wfTIRN5e7zwLbV+fTVSnCLXPkJTZZsGYD/qJJYoo2t6kP122t30Hh61fvctCulZ6ZeGiEoEJkFlaidhlN5G/p26U/rbDNzc14he7nZFbjYpQ4lj6lIUvxfOHWM5nVi5GtnkueTE+rS1rorcu65693Nxjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584789; c=relaxed/simple;
	bh=YHJlLBVBXana8wfsUYax0JzdySoal3WoOfu+2A9pl0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qUI4vIQM46wtqJwT/Ru+CiCpjrbVjv1ivtpzkTWztkoYgIucQa8duWHwn4+VzPaV82Ctqu7oL6MlOZ5zjGvveghDM/tjS0HD7mJNMDjy7HInMM3NHzKLL2ezWfvi2sQx6YuBVWteUA0SnCGRnlmYFx5GltmvnPA3QheEqjnItxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzGkvQXL; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e123d3d22so1429052b3a.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584787; x=1729189587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=dzGkvQXLwKnQ8kV49+00tqUsM+pb+EFzb+lv8vwXDt79FPnTmt4s8Md8nPZ0C2odAg
         BR9Oj/cN5OU7Z34cg4SiflaOOJ5uSAxjPR2L8QNFBM0aMzMUmmkaHfupKWrtFiM8kejf
         VixuAbaQpGtr0YhglX051laUICzExDICU+fAYRcbxNncGOKDgEvabPI3E8c8OvZZimsV
         3a5isk8DF+25PgKctldAVdBofKibWUxqq0QyK7kk7WWlPWAEs6Px7f46IOU1Tcdum/We
         /OMbeEr7lpmmWWpGWaNU3NyZrQEJEuyYs8E+PUOurydDDM/bBLcqQeYJuELStICgdxYN
         kUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584787; x=1729189587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=ffZDSPvMj2ITpgMJnS8op5KzCIqsDP4BVLsnRy3LW7kyKcCAqm95ZEkJ+ipiKXV/bW
         INrkzDOGpSPGAHuwhbo2GHFFBlXDoAliegQk5bjA6EKrXQ2q3QmCNasxQeZ5f08mdAvX
         c5QgazN+8Z4jT+aVaV9stogSrIf7vMb9s0MfHjp1Dt/uypvDNdfmcjcqm/kxARHMDgJa
         qmKIB4Zezp8oYKotI/GyBtBQmn2tUbsA1A/j2O6nHkJw0do+SQsyWmKNf1al+U6kXMed
         Uw/qXvtPAmDY8ZObTj1wcCuCFs6/LhMbHq5O/RCiPLBqYMJI1vwHmRU9QNSvvYyAc7TW
         RG/g==
X-Forwarded-Encrypted: i=1; AJvYcCWCaH9SxLUwD8K3eGcSFDIjfVnVU5s9B5g9UFT34gRXavBbSV74SQZFvuKAk5EZLS4IU+yM1kM/6s49@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPOe7HmbTLCmgmcUqace/QHtLSwIFV0nbk2lJtu8yV6aDcGeB
	O0anmw1ot1X222IOHKmWw6T5daymPgFYhGfyJ0COhGv79GOFK4VFh9rt9GTQQin8ZXeshijwhHt
	GxQ==
X-Google-Smtp-Source: AGHT+IHljZntO7iRsDkdAW1llbbIMc26iesy/7PCA9rtG6130gQpp6naB/6JGeYrnZXaXdo41CPgD6F3FKs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7795b3a.5.1728584785442; Thu, 10 Oct 2024 11:26:25
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:47 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-46-seanjc@google.com>
Subject: [PATCH v13 45/85] KVM: guest_memfd: Pass index, not gfn, to __kvm_gmem_get_pfn()
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

Refactor guest_memfd usage of __kvm_gmem_get_pfn() to pass the index into
the guest_memfd file instead of the gfn, i.e. resolve the index based on
the slot+gfn in the caller instead of in __kvm_gmem_get_pfn().  This will
allow kvm_gmem_get_pfn() to retrieve and return the specific "struct page",
which requires the index into the folio, without a redoing the index
calculation multiple times (which isn't costly, just hard to follow).

Opportunistically add a kvm_gmem_get_index() helper to make the copy+pasted
code easier to understand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8f079a61a56d..8a878e57c5d4 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -302,6 +302,11 @@ static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 	return get_file_active(&slot->gmem.file);
 }
 
+static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return gfn - slot->base_gfn + slot->gmem.pgoff;
+}
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
@@ -551,12 +556,11 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 
 /* Returns a locked folio on success.  */
-static struct folio *
-__kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		   gfn_t gfn, kvm_pfn_t *pfn, bool *is_prepared,
-		   int *max_order)
+static struct folio *__kvm_gmem_get_pfn(struct file *file,
+					struct kvm_memory_slot *slot,
+					pgoff_t index, kvm_pfn_t *pfn,
+					bool *is_prepared, int *max_order)
 {
-	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
 	struct folio *folio;
 
@@ -592,6 +596,7 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
+	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct file *file = kvm_gmem_get_file(slot);
 	struct folio *folio;
 	bool is_prepared = false;
@@ -600,7 +605,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	folio = __kvm_gmem_get_pfn(file, slot, gfn, pfn, &is_prepared, max_order);
+	folio = __kvm_gmem_get_pfn(file, slot, index, pfn, &is_prepared, max_order);
 	if (IS_ERR(folio)) {
 		r = PTR_ERR(folio);
 		goto out;
@@ -648,6 +653,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 	for (i = 0; i < npages; i += (1 << max_order)) {
 		struct folio *folio;
 		gfn_t gfn = start_gfn + i;
+		pgoff_t index = kvm_gmem_get_index(slot, gfn);
 		bool is_prepared = false;
 		kvm_pfn_t pfn;
 
@@ -656,7 +662,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		folio = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &is_prepared, &max_order);
+		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, &is_prepared, &max_order);
 		if (IS_ERR(folio)) {
 			ret = PTR_ERR(folio);
 			break;
-- 
2.47.0.rc1.288.g06298d1525-goog


