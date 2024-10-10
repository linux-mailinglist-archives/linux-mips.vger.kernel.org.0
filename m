Return-Path: <linux-mips+bounces-5973-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3E999140
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42001F22ABA
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE7021A706;
	Thu, 10 Oct 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TC4r7pK0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5721A6E1
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584864; cv=none; b=s6WwC5AXfnusGaD3kxhbsYazzMxWO44vbZfEkNe3yiC7UE+031M1mEgd6nd4A1QhU3NGUyNKSBIXKL2QkluRUTdUUim8q8mdd/g2pGa2h4Tu7jq02PtVVjCWZXVFT7jeuVMkRmANccW6Vf/Axqu84y/4K/2VKpROHJDYLdCjXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584864; c=relaxed/simple;
	bh=Xp30Q5aCXuVbCuroW5D/p68jGCOUTPuU5mMuuixoyAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=puIlmGdGz8TejKviMl8c/ZAlzHZhOZ/dFXaf8XeQZOaHf/KbY8v10wXbWTW/1iMsyRk1PXWcnwzV6VlRg/x/slbt8p4NhsEDjFqIhPg4Iuxw2OqtRPH3bdR9YAyNrHhdJIazuDZFQFWVBRRgD+XAz6Fusfwb+enzvH30tA7+Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TC4r7pK0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71dfeda9ac0so1340110b3a.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584862; x=1729189662; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=TC4r7pK0g3B0mqcPz8ZXxRS8Rw8BfJUEjGW4S/zxeQ0UkyLNagAVzGBjTNdiDb2SpF
         nBffEhUIrykBpiBbRrDSiRgwT5seeVZBDRzQyYetSIdUzr6J3plmmVwFPQ6RY8jHlo2a
         /bzTNyfYCg7FOcuV8L8aRSCfF0OxPZH0J98kU8yMIJP4RIJQCk+K5i6C+TXRFdGZ6eYI
         vpEeOfusRR2SHfTSTJqQIXxoxJLlil/pU/N0igi2UlS4qu3p4+hgRBxyMsiC7c3vwh79
         jWUX53zTsO2dJgzKEQNNHmt+hOKbbgUbybt44zCMmnLOdc8l2Lu5JrNAilAaQXl0kghC
         1L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584862; x=1729189662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6YyPrl/aVt4zvDZFXUjzF/Zy9evtaTkH7tjbHPMI5E=;
        b=JM9IWVzA6dub2vP984qk/drm4Vspx3P0K52NoLVb6PtSBRe1QaMU3uD/VeSFiClWhl
         ECjC/h6F5FxDQM10EJz3+BVR3xGmHFEqwLBwV9XexZLe7iAhN1DCJL6CSgzWuyVaMGVn
         qYFEcx1TKft2LbhM3Jl+/xfevEyYBde39T9s/iovhThwkMbdtNcu+YHkkg69qsyQKwzJ
         SEwjQAXDtRp/pHZj/XS2HSnzZ1XLdiimiowKSFxrTxSqnWOGZjLYZAZnkJ1JFX/RpJqS
         vYykuXQf3BNmntda9dbFHfJd4jeu38m2RgvYOAOKzax6mj7mlhjl3RVNhESRJvvI6qht
         hnfA==
X-Forwarded-Encrypted: i=1; AJvYcCWMhhgYZZEnDmhnCDiiiMyogbFSud5dEG+dYO9Wg72RD7jFDpkWX/J+c5H/dxlfwJS2mTPcXDEsMZDW@vger.kernel.org
X-Gm-Message-State: AOJu0YytIkjYJDa/RaEq93/EJW/tCjlEp64VJd3vKb1ptbXc47CYTxiw
	0UiDU4iTEkEPQbt0HDf/eGL1t2j9FskoC8ZV63N4QAohZINkXwxfJz9yaWbrWqDL63h1hRI/gPt
	PmQ==
X-Google-Smtp-Source: AGHT+IFRVsKTyvnlBUrQtNNg8zvYT0OU1qw5Av8a7Gq/P6vdrCxit4uLl8sEcLrSKXXTWA/vla3myJTtPpY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9443:b0:71d:ff10:7c4 with SMTP id
 d2e1a72fcca58-71e1dbd1d0fmr15196b3a.4.1728584861919; Thu, 10 Oct 2024
 11:27:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:22 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-81-seanjc@google.com>
Subject: [PATCH v13 80/85] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
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

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 763a070f5955..e1fdf83879cf 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


