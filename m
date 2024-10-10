Return-Path: <linux-mips+bounces-5897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D7998FF2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E582812B4
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9011E00BB;
	Thu, 10 Oct 2024 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+oxcvBw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94AA1D0DCA
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584699; cv=none; b=J0SA1GQ4MPFjhUGXpN04GvwLekriZYc06iWNTaH6kf5Zlj1JaJqxVyAlDl93oRZuwCXrgpgz/hhNEMrgFkBXYv8VJmosdQOQ+01oEOeqBOFmppasHTuzO0LWMVDsyhvcz1cc9/ZNLRyyVonQF5ZdM3iR02GNj4VFzPsKBX2VymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584699; c=relaxed/simple;
	bh=/+UXWBjoqTQ+9Qx4e881Uho0Hr1R01lQsdRPnyHLl9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qlu/VQHnx+cINKpJrZg/JMUtqkwpJaXChuzMPohdU6av0cSmEdShrC8chyXSsoFOHlNA7vOL4RJgljdtF5bb4QyTvXrsFCpZf+rlpwOZnSeBXiLr9huIliFrrVxQndL9LDL1/PglcY1V2EGG86D5ta9iXzhlL3x7a0wUobRbvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+oxcvBw; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e26ba37314so24841907b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584697; x=1729189497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=f+oxcvBwyIf0CPK4Z3H2v2Mp1oKcg8M4xtBPnL3mEbTKwPFddA2gYnQvOwqwhMPqcs
         6tTJPsf3R4LXc1m3EABExF2dXv+LHXuszre/1aFscEjO6qmtW3xxqqIATZx3rvdG8rsT
         1J3bs69TevQpiRIDsRnNKqiW/W7gMd1WhJDESUTWDMC5TzfnghveyjVNiiFf2Y1HjFiQ
         vPehYSYcIUDZNDcFnYRqNJsZTdr7XltICzxxbDvDzqP29NLHv3HJTa/ykSCOdCs7Xdvo
         siw+q8s3hy1UsZky6mk+tSYSCcSAXsDzMU8KrWmL1toG+e2nbzaxdcSmAXg/WDWx5nyc
         3r6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584697; x=1729189497;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=kDeVhipCsRm+yedvj0jhg7sVvK061Zw7W0Os4jxCKFPOgVicmbKm2HOUTsBCQNf/AR
         YKx/rijaOzPLTaemsDmeFOIf37QV+SE67Ls+nNRVFv8avtkft68kz3xpJMgu3FkxrJ7X
         LA0NtpyycSUdxI04iPA6egbKIWe1eUtdPijIITRaeRxOzsLaIMLu5yzm2DVnTtCgJXHY
         Yxqt3cueeDl3R4SauTk/OgTK3wOOfVHAszy9G/ak8dcFS8XMuL+gbn+Rwhi12UKM4d9L
         dXE1r2aVygrrs549kZNE/OQqD+Tqfp2/S0bITmS9W2ZPWgkah0jP0eH229uLg/SRaj/j
         038w==
X-Forwarded-Encrypted: i=1; AJvYcCVyEXxZqWuaMNTGFSnAgnMnfohvtenBjxTgf0tD48vcpgWkBZHgghxGVoVZeOqRMyrRZ1Wf9n5a/BOU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/NrOOzw8FndNjIEp4DdPg5+0QoWKVf9+wWgG8B2y8rBexvHq
	Rmn+6trRQeCzHYkQc5Hd3MMtOIOCrDNR9yEnY6Cr0vltTfmPPo9qzHj7hkskQT6cCBcBQpiwJHT
	C6Q==
X-Google-Smtp-Source: AGHT+IGrULPD5dT5NWC9dFAfgTsoL9JIWGzHU9t8+6e7flVyO5QHPCRlr/jDUZCu+nhXBHYl+WGzejB3KuQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:e486:0:b0:6e2:371f:4aef with SMTP id
 00721157ae682-6e322168931mr204147b3.3.1728584696651; Thu, 10 Oct 2024
 11:24:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:06 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-5-seanjc@google.com>
Subject: [PATCH v13 04/85] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable@vger.kernel.org
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 8f7eb3ad88fc..5521608077ec 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_=
page *sp,
 		spte |=3D PT_WRITABLE_MASK | shadow_mmu_writable_mask;
=20
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
=20
 		/*
--=20
2.47.0.rc1.288.g06298d1525-goog


