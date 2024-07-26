Return-Path: <linux-mips+bounces-4516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818393DBDF
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C6F91F21060
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D161836D8;
	Fri, 26 Jul 2024 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qG7lmeAW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6218309A
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038055; cv=none; b=aJsKcW7jch5GHGLxuKqUonTcBD/Br+0XQVZuQ9FaeCaWaQoYGiBa19IP+KzT+J7Uv4Y7hkH8RWNc8ZLtBIIw3wqeDMym79OayOikMIb2OkLl8vXc70W754iGsikD7j0rivfLaeRbbJ/YCKS2CWV10mOgDz73yy2S0WpIvGU5Iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038055; c=relaxed/simple;
	bh=PYmFTsup/AEmfy/4jq9PM2uJzzhDaOGf5jqGf3bldb4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=POxjiU+akX7DHHHFZoiOt84OFR55ORrHHN47ICH8BAS5fCkFXZ4e2eafMzflKC3uwajW2Qv04lWV0T/w3nmyrsnrDqJqP0JFfpwr+9THwtLnlXG6Rfj7NboLIgQchiUV5d7KBj1bDyAJtJmxzVRhdtspqD+PZT+SBwU0xmAuhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qG7lmeAW; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fd5fe96cfeso11127485ad.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038053; x=1722642853; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=qG7lmeAWjCmRFPGjSdtFWnVF5e8lzWK6C1pA4O4yqJYKVqbeW/XxPr9BF1EsoWCNx3
         nZXAhwOLGE14OsGoOoASVkjOct5HX7VAgUOvZYUZsfI+wiu/LTHsSMQ0QlOGUx0u+K4t
         5d7wv9u+gzCxcGFynRlRTvqXTdzIv8Oi7Qa1sVFlYJvEdVkjltEmPNnSuaJ720AbYW4j
         AHfLc5kA1XsJ5+zLhnKBzhlGYUInpLqBjZwJQs3rllyeqf6gGjZXRf7DovuwQRxOHRMr
         BnElQcAGdyePpfgBajZF3tMjQIdnOgmIuCXMqbue6N6p2EKzKcRetpNAffxJDk2/fI2O
         m/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038053; x=1722642853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=SgUNi58HSmWkCOpxPd7D/mXLL0P3V8fG/KkmT2eQnNs7LWvn7VzflWp/fuVICvBWNw
         75n3X4FXUtZRAuObiwgBtK9bgaFEzdXBEGIl1ZHOiMVBbmHd71kFEBEaZd871Ceg6U9O
         MMEIMS2Xj32ICq5azP+AWOmLUDapklCUnSinP0rsFEKuwA2+Fmsih/9nh0u+i4+ZMtL5
         b/gxCZpGjhO7dV01Te0JwulRS16T60a1VwyEDV8wEIRffUbQGXGW/PdxL2OGg70W7zMy
         DZLs8AdNHsyGXlUI4BcUIIfh0fqJaQuZJ/cyCrqOPPdDXJepqFffcAqxfaMO6y1taG6j
         TGbw==
X-Forwarded-Encrypted: i=1; AJvYcCXLlSrHNa3jiVOe33NCAcO6irvt24ulHFbIb5Y3yQ2E/7GPH3CbFxxV/5vUCMzIGWfTP/2uOCm1tp6ErDXZZhwGiRGluQpVyR7AUA==
X-Gm-Message-State: AOJu0YwOGvmqJ7dsVmehLqL970eL3KGVawV7qM/G6CzUeWpmpw2nlwET
	UoDWqNChH4x/AQRHYJkjKeI7njY2NBr9a4DlyCPhNLBWjJO5uUZnHnEAEl03VC8o6gr1sNLMo2F
	bQA==
X-Google-Smtp-Source: AGHT+IF1WA3mVZXk9S93pEq2eXLardKUPi+yfLeicmT6epShCKMtCcCE54tvymeWkFnvdj0Qbejb/rqSUKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41cc:b0:1fd:87a7:1445 with SMTP id
 d9443c01a7336-1ff0489344bmr935735ad.9.1722038053119; Fri, 26 Jul 2024
 16:54:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:55 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-47-seanjc@google.com>
Subject: [PATCH v12 46/84] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
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

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 146e57c9c86d..3cdb1bd80823 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4326,6 +4326,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r == RET_PF_RETRY);
 
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4337,9 +4340,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r == RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog


