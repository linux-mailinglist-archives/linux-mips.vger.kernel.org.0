Return-Path: <linux-mips+bounces-5915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AD999075
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A07284483
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EAB1F8EE7;
	Thu, 10 Oct 2024 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CjJawX0g"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA191F8909
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584742; cv=none; b=XzKHnEr28zCxCaJR6rnyOeqsPI7tPavzXK776sjwhwA4FpB/6ip5ZtsIgeSydz587YGryQfsc/JOAueFHPkSCYo2ljVHzbA6b4YcKy+iMeq6qjWGTZQ95ZAQINxBblCY1e+LEwcWiESamSUeYglpqkUChpLZ3fm9nLseBzAP868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584742; c=relaxed/simple;
	bh=ZlT2BBZrHMf0x3c0Y2iKgnaJviq4ilGlr1zNhk4Vq/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CwO3PPyP2G1oqqZP1M9Z9x28JAXs+zotxiMg2/tSTmVKjWxi4HdvzzSWJrzLDMRnbVxCRfqGVEct6+wEwSf2iAj4WjchY5kxpnF2Wr6xXOwcq2ji/IHBomtAc1kG3kfc6rwj22kyTTpoGRNx6cYRSEZmMcHn0IMIRPsDLHobyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CjJawX0g; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e284982a31so22432707b3.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584739; x=1729189539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=CjJawX0gL3DlpHXrFl3UettsKvgKZhWv4SqQA90BYqhykfLcxkE6Wu1vh/woj9cKRe
         WBeA5xaSPtiO2n25gFk5BFhGTdTAIXI9+cKopSHheHDsvMSXgv9GRVTZNsFw8UHjUIyO
         bgz5EqJfA36MxGkk/wKO81Pr6UfjRrL4/iYWSOGDvEZr2PKMKXa9vGQ9qv7HktdxPuOA
         rYvrX4Mva7y9IcOyZ2keW7/rxD4tkbLD7VQOI/NAXhIe4EeyM29lHpbclTyhvbd6iFmV
         yktNhWnPAFFG1WSt+zWdIjGhy2UW8v7gJwCEuCC8hBDIry/zGPL/EdBbYHZWYL9FX1C3
         sl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584739; x=1729189539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=eWmzjXk11sEdKo4dRxN+NsNg1QeNbX6Yn0RYl+WUatHTiXc/l5DB2zUssz57bJiKai
         fxhZf8lWwIRCcvWoZdlN75Ijv3gaUXi95EZux5Wwma9MdD+tFOZMSNmCi+DZKgK6jyXU
         ruii1pNSq5c2+Ubjw4l7UNhPaWsLUxuE/x6q38IS6xQ/u172h08aLFU5l/mj755mMTH3
         zSgM2iizI/K0CQmGs6/w0XNCzaRE1GxdeY0ijghCk1i+DctpB66hhIugZN4I+tsreShM
         NYdHJM28Ljl0IDn/Yafpu7MRxy3kqnyFVOcmb7SAzvbDXbzTfWnclWaEK/0exNRab/P8
         FYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWkF/R/rHvtD+IzVvYIQptfTfXqltuLsoIXtSm+1m/9gxaq8QoAbxVfxD5OrcsjXryf8i/w7XH5zBsp@vger.kernel.org
X-Gm-Message-State: AOJu0YxbEnL8/62OIQZRt0wIXTE4TM4N7iiFA5llDo/w3TaDZiCy+g8O
	2AL4XI0W0xkoERaSCx1bjRv9i8+huRcOYYCnigCtnwMkB7v3D9SRj8tp/fD5Zqj493RSkREPmyc
	Gqg==
X-Google-Smtp-Source: AGHT+IGZ+3mddEgfwOZrB7Mg/yEB+clUKORcl3gwcx/GeFypDRI64NMuGnBtjzJ0gTzObJ64BsofGpKHxtA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ab6d:0:b0:e28:f8e6:f4c6 with SMTP id
 3f1490d57ef6-e28fe465652mr58758276.2.1728584738891; Thu, 10 Oct 2024 11:25:38
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:24 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-23-seanjc@google.com>
Subject: [PATCH v13 22/85] KVM: Use NULL for struct page pointer to indicate
 mremapped memory
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

Drop yet another unnecessary magic page value from KVM, as there's zero
reason to use a poisoned pointer to indicate "no page".  If KVM uses a
NULL page pointer, the kernel will explode just as quickly as if KVM uses
a poisoned pointer.  Never mind the fact that such usage would be a
blatant and egregious KVM bug.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 4 ----
 virt/kvm/kvm_main.c      | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cbc7b9c04c14..e3c01cbbc41a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -273,16 +273,12 @@ enum {
 	READING_SHADOW_PAGE_TABLES,
 };
=20
-#define KVM_UNMAPPED_PAGE	((void *) 0x500 + POISON_POINTER_DELTA)
-
 struct kvm_host_map {
 	/*
 	 * Only valid if the 'pfn' is managed by the host kernel (i.e. There is
 	 * a 'struct page' for it. When using mem=3D kernel parameter some memory
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
-	 * If 'pfn' is not managed by the host kernel, this field is
-	 * initialized to KVM_UNMAPPED_PAGE.
 	 */
 	struct page *page;
 	void *hva;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1c9a781315c..7acb1a8af2e4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3067,7 +3067,7 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
=20
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
 {
-	map->page =3D KVM_UNMAPPED_PAGE;
+	map->page =3D NULL;
 	map->hva =3D NULL;
 	map->gfn =3D gfn;
=20
@@ -3093,7 +3093,7 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm=
_host_map *map, bool dirty)
 	if (!map->hva)
 		return;
=20
-	if (map->page !=3D KVM_UNMAPPED_PAGE)
+	if (map->page)
 		kunmap(map->page);
 #ifdef CONFIG_HAS_IOMEM
 	else
--=20
2.47.0.rc1.288.g06298d1525-goog


