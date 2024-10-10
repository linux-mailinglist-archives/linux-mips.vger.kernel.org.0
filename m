Return-Path: <linux-mips+bounces-5977-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1B99914F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CAB4B2AA91
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B3921D160;
	Thu, 10 Oct 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1AdnNrnI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F4421C173
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584873; cv=none; b=TBrt5AHvqP0zmGuC1+E0Nhq8948xOlNhoIrN0szFyS1jMvnBGvLQhB7Qm3rMUMb3OCU9Lpm+9Khl5NScZzzzJ9qthUYdZzCRyswBPteev7toJOoFx3wpmhvKH83SrKfcRZy5IiLz487sNhrjBiwPXZpTyFN376dzupV1J2ym9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584873; c=relaxed/simple;
	bh=9yDh4yVl+Y5ECwKMlXFEDQ/uzUa/qYgKcVRj3mqEjek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qArDXe8TKiSIw3aOv+aZYsrpYq266yd7oU9qar32DXndmMcSUTuJpcdeQSVSxlTdyAk69pV277AgZ8aUYhGEICPlJVgQKR8FZ5s/eEq4mGHuQYWThF2wPGerdIjw5utIazVVMymqzfM9XQQOG3o3b2F6BBQZKPBA/l1EgyTuU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1AdnNrnI; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e2e4874925so21273767b3.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584870; x=1729189670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=1AdnNrnIXLgNymQtK7DilLGthF1JsfkTOKsD8zYlozlgDyVnSyLY6rQs1ch4aUN54v
         fTlIRF6YDP2svUdnyjp88hSQcfOn6wvrAuXYoJPHVBwm+zBiaq88Wsg3ie8JPbOZVm6v
         +FdIhr7f29Y4owHrhAD9S/zkPO3/FI5JCSjOek0MkvkxKw6zlH8yk7tESmKbM59fwOxY
         truIpSu4JHQroLJXqzMSmcI2c+TlvXrk0XyyyXlQcN9BQPbIRRXz6PSG0liD/fpQxsWp
         5Y2cwNpf+u5nZPuU2t9NEaeYfk9Jawe11Dvm4yVWD7vMf94BZ/9HtAVH1x+u2rygpxWQ
         2Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584870; x=1729189670;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=XkSWoiBLLwhgiZ6IRcjIOaS1LE9cvXBJoMzhaCIT/BZN85XTF0FBmkzOGIaFBRmmXk
         jWZcCNb1UN6FQ41urS6wyBCBtv+laCxRTTC7oxHaMLfThi2/P6eryhLgcThwylReqlHn
         kzuftVBQtS2oj+OFHaOqA4ovwzWjZcgKO6B2l5bORrbpeVziXP6jTULxLVgIdQgkWqt3
         P2QQDNZTdleDwomthMWpbU4BKF6B1k1XN93qpJKylH3hXBNHikolDDidR2BinMqX5Ha/
         WGPC22JsQGrtgXxrN2P/HaBgdvAHmgZqyIJZKt4hyHqvynyvYq3u4GczycGHysNO6KSf
         SVyg==
X-Forwarded-Encrypted: i=1; AJvYcCUGpSqtYlAvxagEF3XkhRkqLyyMYzoqS4yHhmYFwYX99Ju39sQHsj0erdRUQi9/ft0MluGzLIOI0hWX@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTr7X3gw4XY3BekES7axLWEKv1eLAyowXfrYPpbZIn0tyQrJQ
	M/VFTmhW2Tt1Ta5bl3DCx3wPjlSyVfci1X9WmG8F6985KV3N0WDZdO9Ogqz0qls0V7TwOAENH+1
	9ow==
X-Google-Smtp-Source: AGHT+IHhmEpfdjhYs/g96WpbaMl3fao5EtfU192MAf3yyGbJNoRiDL4cTPbNYR1fq37SA+x5liddjIzSKiU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2e86:b0:6dd:bcce:7cd4 with SMTP id
 00721157ae682-6e3221404ddmr516647b3.2.1728584870148; Thu, 10 Oct 2024
 11:27:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:26 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-85-seanjc@google.com>
Subject: [PATCH v13 84/85] KVM: Drop APIs that manipulate "struct page" via pfns
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

Remove all kvm_{release,set}_pfn_*() APIs now that all users are gone.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  5 ----
 virt/kvm/kvm_main.c      | 55 ----------------------------------------
 2 files changed, 60 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4a1eaa40a215..d045f8310a48 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1274,11 +1274,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_v=
cpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
=20
-void kvm_release_pfn_clean(kvm_pfn_t pfn);
-void kvm_release_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_accessed(kvm_pfn_t pfn);
-
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset=
,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long l=
en);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a483da96f4be..396ca14f18f3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3164,61 +3164,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kv=
m_host_map *map)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
-void kvm_release_pfn_clean(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
-
-void kvm_release_pfn_dirty(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_dirty(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_dirty);
-
-/*
- * Note, checking for an error/noslot pfn is the caller's responsibility w=
hen
- * directly marking a page dirty/accessed.  Unlike the "release" helpers, =
the
- * "set" helpers are not to be used when the pfn might point at garbage.
- */
-void kvm_set_pfn_dirty(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_dirty(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_dirty);
-
-void kvm_set_pfn_accessed(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_accessed(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
-
 static int next_segment(unsigned long len, int offset)
 {
 	if (len > PAGE_SIZE - offset)
--=20
2.47.0.rc1.288.g06298d1525-goog


