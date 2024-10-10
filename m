Return-Path: <linux-mips+bounces-5895-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E341998FE5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272371F21C18
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F591CF5FF;
	Thu, 10 Oct 2024 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LbsR3s+e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8871CEEA6
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584695; cv=none; b=WPliJmmDeCbNhFHEYN3NBTSweEi4HpNUVE+NtQs4rlRRZoWPvXMa2OqNkZCzyyfG9RU5UbIiaDIwQBXSmkGxuXsiCOu43LxGmJi8RnXkvRO1AnwbR/m3ukukpnhmbgpjlf60Z7MYIDFe5lGivg3RTi5Fxye19zUtYX45x1uRuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584695; c=relaxed/simple;
	bh=GKQ1+9zVatIXCwDEsM6DNkbKcmF2enzdpw2dYi1+r2s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=auVa3MOmcK593IE1U/A3HzVDtADJou73M0JSjDvHlKQ3OU7EFLCjJx7SxSI6RWzXl/qWKl2fqxByza5hBU1V9nsCEhhTTtD+jNeP0D/LRvLOfe3s0DMYNIHSfNUXTdz/wPLohgLokNt8ac468m6BDz2uMNrX3wNVTKpXqmaNhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LbsR3s+e; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-20b6144cc2aso12164455ad.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584693; x=1729189493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=LbsR3s+eI6WfEnRbM2uT3vT6R0rDFtwfUQWzpB0nPc/rlV2FAnol+zYCnI0BRzeuc9
         6dvAAbxGV4LpiWM+0lW7vLCrRS/LH1TIj9aZ6qsziigEi04cwRAF6RIz64LkI/oouB/x
         v8nk2+H9lL8+D3jP+Pb7CYde9KT6zgK6VQyFbvnUfqmJel6dqRVM0mYatQEmtKjpv3I7
         n6sf8oQlLqPt2heDQ2EePF2CK5+5jZiCSmRGtjwlxxgMXznVLy1FP6MirDNLNTbto9Ys
         ZOZtRZ1DreJkK526CJoZ1fyGnLu5fiFs1pj6y4ni5JpaLLTAkcgHbH+XaO5ny1q8AxUS
         Cliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584693; x=1729189493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=SvtMYghLjXS6te2r44ZzBOhW3ee+oS+BBjXa9k2L6pyJXp8HD3VDEf/CQtFneVSeo7
         Gl7Y/50Fm3LB2BbNHoGgby11SMDx5mlkI2n5TWnvYw99G/t9d/jwZx7WWk2cEYGhkQ2k
         8hcAAp+Wgd5f53RmBSY52BncTptFMEBnUWfu3/KGMUC/lDslcZlRBtqu4BOyCp16qrO5
         o75OECNCTEp+7x2hmuOmU3m1K61CLtJLCL5qua2u+ycxXURSXJQiSrof2V5CpjmK1GUe
         MmhwL6Tw+GMqOk5anFNaw8QkJFTy2MVMC9u8FKXUs8FXv5YbgoZet1EXV1I4ii+sIeiB
         LeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKVuKXsAfOuQ56UZ2y7Tjzwxa3W3KSLEO2AtbtXyULqeWx8RU0pWR5svjODwY8srYra/mi7AW1/TmT@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2kJSP3xnzYmQd305cDUkMcJTr8sQ5F+okGAa0H2p1Zs45bMs
	lGqW6cuY2tgI46Pu0pPE8/jVKofMHF+/CFOlHdSZOYZfxlMdkUBI8KTLtu/9lcIA+SkdTPgQWmE
	pDQ==
X-Google-Smtp-Source: AGHT+IHgBvu4/6UpOEaDnS659CK1Rn1/E5r8mTk00ZsUtMRUIXJafj8Ignnkw5WxXqtPYIrr50vXY4UIGHU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ff02:b0:205:58ee:1567 with SMTP id
 d9443c01a7336-20c80362278mr43175ad.0.1728584692824; Thu, 10 Oct 2024 11:24:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:04 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-3-seanjc@google.com>
Subject: [PATCH v13 02/85] KVM: Allow calling kvm_release_page_{clean,dirty}()
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4b659a649dfa..2032292df0b0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3179,7 +3179,7 @@ static void kvm_set_page_accessed(struct page *page)
=20
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_accessed(page);
@@ -3204,7 +3204,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_dirty(page);
--=20
2.47.0.rc1.288.g06298d1525-goog


