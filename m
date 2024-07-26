Return-Path: <linux-mips+bounces-4494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850793DB8E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C9A1F2200E
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93F17D35D;
	Fri, 26 Jul 2024 23:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a9LYv9ah"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86617CA06
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038009; cv=none; b=N8882pTkHXQ8aRI6z/RqI+eJX7+DK7WwYzddXphTW9GPHQe8h1J/Fcvx4QBTLyM2v9IL4X9SACqQaB0K8RgzNo9snfB+P6nyw4DnYdCsRJNUAyYJs8+dOTXJHfMJjl38wd8/hSprxHoJWy5tq961SOF5+iTKqCjmFm7fojoMH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038009; c=relaxed/simple;
	bh=9OmPm/sXETts377Es3w8PthSdVQhTvxkXBBvmqGH6tM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jIjD8LmVYsTHIg6XJuPK7ldQeO1+0iLKBTgPryW0cwtslMX1nxz72ZaUZlC801SgiasgUxIKySBnliLOSCnYYesioZI5WUbWgTpzV/Syc8EV8EQa0D5G8itBgjtgMb3sRGDh96Gt4GfIj4RuWlCLuopACrua5mPc6pgW6vGTR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a9LYv9ah; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fc6db23c74so11322355ad.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038007; x=1722642807; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=a9LYv9ahUKNguAIrLC+P9UGnfpNradvP7gE7mDVQGSIaN6mjWghn8/6jZVmlvnfTz0
         VnDgKUOGIBBRlGJtzSRYkO/lrCe7duHbM8jP3axHe9E5Lx4CqIAHND0lsu3aqeBvcMy9
         GE79k4XChY+pk5afhZlbSlOYKufhLkP26NVLaVM261WGihZpDbr8VfeI1pSLyT3gmhJS
         cw1yf4f41muqIuOuvtTqfkIERmnYsWBKBShnKcLaPBDHOmdI4rZ7tJvqg7q6UDOKMDCD
         CGOxMFvYkAadoTeXWT9SYRd+8I2n/j3zD1vF0MrCxgjcvTThg1Evoqq0YCUVF3oBf+YB
         vd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038007; x=1722642807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=X0gTLvP6gsB6znfkMVazvkGYIxU3p/glvjRFHp1aY+t/KLA564rmEGFNEIBwBEvGKl
         xSLWQ6Fh0qtUFTzyPLablsF3a7UZJNobRNF33bkRkMu1UFpVo8jYZ6zO05c8k5BD4Q2u
         T72PwgcJ3R8ad8uWqR9xaldJXj8iEKCxQ2J4VtE6aCxpJ0nfkp4Lx9aTix4cwVzpCU46
         Ag2dhELhgD9qPiZoBCwz4RnetyJENUInCbzF4yhviwetKt8JUDooLpN7VuOHW1+0q+og
         OojBDG4eJGqy5gwAMIsHX1Xg35t9dq3p+IdaNJ+ij2nU5MlRYsRMUcjaeFC10DAaUueR
         UROA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNCYLDcKeuvUOT0a99rp8me5VnVOkQ7RA4j4ZfzU+L6VtJc6yYQrsGBsOeMKq4+RnOHKn9SbcJ9PJKkMmK2nLG+gTp8sC0k7kJQ==
X-Gm-Message-State: AOJu0YzVm9e1cFcnTx5z6S/pyRILlV2P2sVABcNgviavZtnulAS9LnMH
	EBRaHLjUrzrjrb6nHzWZbLxmxxs9xePOuhAdFKALGFVg/1ewgSGDMp9PPHPe7h7GMHBABII2e4U
	wDQ==
X-Google-Smtp-Source: AGHT+IFyTmAdCKGjl4Efd/ur3Lgpr5WGUo8BVtVPeI74QsMUPNsZhPnU9qRmgrxg08u1lYU5BCnREsvFCzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41ce:b0:1fa:acf0:72d6 with SMTP id
 d9443c01a7336-1ff0483372emr764645ad.3.1722038007284; Fri, 26 Jul 2024
 16:53:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-25-seanjc@google.com>
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead of
 single-entry array
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3d717a131906..8e83d3f043f1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2763,7 +2763,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2773,8 +2773,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn = page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable = true;
 		return true;
-- 
2.46.0.rc1.232.g9752f9e123-goog


