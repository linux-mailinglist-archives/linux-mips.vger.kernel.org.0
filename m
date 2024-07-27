Return-Path: <linux-mips+bounces-4474-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394093DB42
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F881C23357
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D19B155CB3;
	Fri, 26 Jul 2024 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVWrM2d5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8B155A24
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037968; cv=none; b=qZGkW+7CbFUpqm/96DkmDh8xlREsFiBda0x9sv9V15R7RLSmcjfwUsyOFQtgpyu/MN/k+hIV1ku5AGfPsRnU+F9gGnDJfdWlki37pV67cjhdWnnHNB+pE/2zrRZ+D70CbqQeQb0vQR2yq9FOgyAvXba4hbD6Jd/pz8RnuREj5Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037968; c=relaxed/simple;
	bh=nMIA0IB61sSIVDFSpMoIESja3SRG4qTvpXk7E9I+g3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AYUvriWhLLP32KFUBphkHDXGcPEbp63fU73Equ+KRSQoUPSwpzLT1+Pjv0jRSz/ysCOIXAkh6ECOxrtko25kqdd4K5BhcJwJQ/F6GrdK+kILeiVGVCytjVbQHtisHPXdWvcW/UHif9VSKqDageViA3Y1QRSu7d8L2WCBB7h9rvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVWrM2d5; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d188c9cabso1355986b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037966; x=1722642766; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=NVWrM2d5HBvTFTVK/mG2yUHHBhXvbaRVd6bsqLsAjy/Dzv/5nZ9jfReR2DLhxZ9mWa
         Vptcbyn9cN5j57tjPl2N8b464v80ye5/vPc8x+G48dhnNB8rXZAkKbqa5sbKcgYVPR4X
         S4R4IlzRIzEVGxqr18jnOewMhepYT1/tq8tDxsexJ/AfL+z0nXjSIZaZdOehhbpQ/8Tw
         NW6Y22j39ElmP53HjDKP6Ms1LEpTrgKjAEa4a+cYnxkE69QDwqeuoVqBAae0wFvlQizM
         P8S6dqqHjdZSU0EXFAOkvuhq7Yh/i7InykJeRWEzcliTaeVCYjtjyQQ5bJLnEEyD36oH
         xAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037966; x=1722642766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=iaIDB9SEID432d6O+CbYSAkqf01aJnbxRqZO7EnxP4cmAO7YkEJqRmf+AbnDTjb9Up
         cPXZ24hB0ZQtDBTOrUiRVeRrUjFrK36A1+ZdjeQX2BU11KV6LNbTpfRn0kPf/L/pZqVV
         sdO/H8aLm0ewkJWgDLCozzxOQTd8yaIEEm82HBCl9gZX/WUbOj3aeo2zve3hW0BEfGDZ
         tZfPhqVAj4V1TFPLH5aTLgxM9rQKqMTzbVA2Tz0rJPFSiL408mYKJ4BPsEIZKPONz1Gv
         2Bir0lYQjiN1n1Feq8InVEQERjaOZkUUP+itZi6U2VJdw3wq8L3pwq9i5ujNF4nAb/7i
         q+ig==
X-Forwarded-Encrypted: i=1; AJvYcCVlb1koKf02sQ2eBG9yTCcuhVlZ+py8F1NEiTB1O3HuUlmBUI1U0Cf2woDJMJArIncjL+Xc32Q9DqSRp0ooSGrz5mkgieqyWsrA/Q==
X-Gm-Message-State: AOJu0YweU/Iqz3ts+24ov/hp6oFfuTxeslrGtuMJUy7OXZ3m8LgBHlV9
	k8I0DnDrYm4xRgShHXvmQuaU8xGbsMl6EyQ8ecRUDZ5D7Ah4mZ3VTzu7s74fEdQN3cuYzXHdrWY
	Y1Q==
X-Google-Smtp-Source: AGHT+IFeDzTSYc0yloJqv412y/9OHddQLGngXAZq8SjSSTQr+cl72qk3J3BVbl3XjHWFKDqTN/CvEh64V1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8703:b0:70d:1285:bbcf with SMTP id
 d2e1a72fcca58-70ece93a09amr3050b3a.0.1722037965825; Fri, 26 Jul 2024 16:52:45
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-5-seanjc@google.com>
Subject: [PATCH v12 04/84] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
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

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd8c212b8de7..656e931ac39e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3186,7 +3186,7 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_accessed(page);
@@ -3211,7 +3211,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_dirty(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


