Return-Path: <linux-mips+bounces-5967-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1899912F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02CBB286CBC
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF12178EA;
	Thu, 10 Oct 2024 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TYCOxp1c"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8C1E571E
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584852; cv=none; b=crTmmNqJM0i+Lqw2cU209EtJXE0E5S+9KbXdZgWNjG69nivm8rKBzuc62/qE9Wc7IjF+4Z/Okd2Mh0R9639tz7cH/8Kdk9ki10Fyyujw/kg6aU5gngY0Kl7XxCr/uOo+y1Tg0Aof1MueyRDX7ZHdCHD0jbCQYS2nG5FZeqasiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584852; c=relaxed/simple;
	bh=69Upu5+wnipQK1zG8Arq0ad1gowf7mjUzNjaillb+fY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iS6DicRl8CkE2NsrcSeA5QpTV82/0cKeUwV8zpMIXwtr/HJHN5CRCdo1QYSPk5llUtPZW/14F7+pSKFjHLUH302tYlqKkyU04XtkahEzHhBWuDS+yzc+c5BPS3ijunEpo0nuxPjqaIh/Ms7fQH80gR68tMnzAzYC2KUpptBbkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TYCOxp1c; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e2270a147aso21797347b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584850; x=1729189650; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=TYCOxp1cKgcq2S0piBT9YJkDFLpkMk1shhIozeymloTyKk4ZTR+gIawk/AuNbFbDQ4
         J8TeUkJfKYxbM2AtDWZ02S3f2cAN7kjr7P+ogU4gcZwc5SJ2dw7hcKjGSiKZnDuWFVXD
         0yacIImKBYGg/kOVQBDjgOI19vyelBez+dQ9CKKVnqCCN8KpSEniZAa2O+TAIbBYuk/8
         u/EdPzuUpUAPgVZP64a88b75lAGbcbHuAV/J8cWjiNeHeXpsNY+rv2VipBNaNvpPRk0N
         02Tdr0mvAbTRtwDHZcGpoGEUwZ3USAPeQZ3Kyha9LYFJVBqjMm+LcYDMRXO6L/g2oyJe
         dDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584850; x=1729189650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=UKLwtd/A30FU01ewZWPRmTuNAt1lQgpt95kgRp2lClyf4v1aSfMx5rXE7LrLUPdbbF
         V9HQMgSiirCT90srnEJJTji/i//qvKitK1hHBKzm87/haC93O3vSmPRbEeS23P0neMZW
         ZcwnsrSUb7GR7GF93Ce+UZiyByJEdk2GpzjN5feq5oJ8kmd+65cr2uTG/mv5Oywla7R5
         gkbOtm1xwfiLRlMowQxvV6YeLQ2CxpfznodDMEhR4FSxvCGPfoA6WXAEsfddj4kkeIsd
         cTHEM0lvic/ElFt2vke7wqs5Cfqtpx6gnbFUbZmHvSzD4zjt9TFlbS1RxgQ8MCPCa1Hq
         cJaw==
X-Forwarded-Encrypted: i=1; AJvYcCVqbakb3TyCCjLFYKJssbGf0WazlgSovOZQUZOfI1nFPn3QqEAUKLnoCBK6912WR3W7QTBwit5gMaO5@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJU/MpehJbDlQKZkY8/6e74N6wSYf0oKiwphjwnKnIu/7mBl+
	XCjKJFvk/gLNlvytAOFiRwFyu4yudtVPhitnSdhaH0UvJJEbk//MCObAgTFkATT+m90jWU0YE0F
	jPg==
X-Google-Smtp-Source: AGHT+IFYivPtvbNeJBK5QJ/MFgPKbd4XQ4GDAEMeTnfD7MuZnOh5ZwxKPEpX2RNQ0xKTZSwXcPzTQuagswA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:f043:0:b0:6db:c6eb:bae9 with SMTP id
 00721157ae682-6e3220dbc31mr798327b3.2.1728584849896; Thu, 10 Oct 2024
 11:27:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:16 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-75-seanjc@google.com>
Subject: [PATCH v13 74/85] KVM: PPC: Use kvm_vcpu_map() to map guest memory to
 patch dcbz instructions
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

Use kvm_vcpu_map() when patching dcbz in guest memory, as a regular GUP
isn't technically sufficient when writing to data in the target pages.
As per Documentation/core-api/pin_user_pages.rst:

      Correct (uses FOLL_PIN calls):
          pin_user_pages()
          write to the data within the pages
          unpin_user_pages()

      INCORRECT (uses FOLL_GET calls):
          get_user_pages()
          write to the data within the pages
          put_page()

As a happy bonus, using kvm_vcpu_{,un}map() takes care of creating a
mapping and marking the page dirty.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index cd7ab6d85090..83bcdc80ce51 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -639,28 +639,27 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
  */
 static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 {
-	struct page *hpage;
+	struct kvm_host_map map;
 	u64 hpage_offset;
 	u32 *page;
-	int i;
+	int i, r;
 
-	hpage = gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (!hpage)
+	r = kvm_vcpu_map(vcpu, pte->raddr >> PAGE_SHIFT, &map);
+	if (r)
 		return;
 
 	hpage_offset = pte->raddr & ~PAGE_MASK;
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	page = kmap_atomic(hpage);
+	page = map.hva;
 
 	/* patch dcbz into reserved instruction, so we trap */
 	for (i=hpage_offset; i < hpage_offset + (HW_PAGE_SIZE / 4); i++)
 		if ((be32_to_cpu(page[i]) & 0xff0007ff) == INS_DCBZ)
 			page[i] &= cpu_to_be32(0xfffffff7);
 
-	kunmap_atomic(page);
-	put_page(hpage);
+	kvm_vcpu_unmap(vcpu, &map);
 }
 
 static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
-- 
2.47.0.rc1.288.g06298d1525-goog


