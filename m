Return-Path: <linux-mips+bounces-5896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003E998FEC
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E194728131B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CDF1CDFD1;
	Thu, 10 Oct 2024 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YefjeM7N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2DB1CF7C3
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584697; cv=none; b=dKCTxD+WnxTlm/gEaaDPd84RaflOjngcMwhEFCWg4/LH11Ga5Etp68qo863+imQ7mWWPNdRBeYF5pJfZliyYZzd1x1c/uQxS8GvzBlXwRECHzgDBFA5xq6mH7ILpqi2OYLusmKKfVkX9yUGk1be1t34YLOlZAvqzhdAh0Jt1QbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584697; c=relaxed/simple;
	bh=iBKdL35kBHi2YuWkjigWDtnk5mPkldKXaU7GHff52mQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uonubBpkXoXIME0P0qlY+O8o75NWNYdLPCAS7MFLAhrXPympCleMrgjulSKWBNlNw9IFUJRp/Ye54OY6CPGua5hn92ozFW4IMJOv5G3jbdwrHjIII08qq9FmzhE5Mxucmq2F2CeribrWgWwigvPc3tXV3EBiB+FfqxapEHE5GYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YefjeM7N; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e284982a31so22414817b3.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584695; x=1729189495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=YefjeM7NlL5WJTyheSu3K4yw2vp2CkS7uAx7Z40RaC/a/T9mf5Ut339LIWtkQ2XuXQ
         17CbefMXqiqBMTUljRvZMHgszGwbaPFU/tkQky5Clu/5W9+/PGYR9hUCa+QIZ1madUv6
         GhU3c/TE8J0FNncSSvv8YuqrNrxaNbhW9YiVKnl29law8WUX4fWW35jK/IILY2eu6SQ7
         snOZPsHIyng5WefoSyBjOo1ogSwiFFA5eg3ef7Npa6sKnfD/cEcNQbDShB+D61sKl22R
         AeIaMhHY8Bfyfnv2ZxOyGX3QoGGAPDZXoT3sLgxyIdmnWJQG6fwCEFa2beItHdM20glS
         GA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584695; x=1729189495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=t6tTgifZUu6UfzFlMP7A0hae9LPGiHmFrdl/XvBDlREgEfSVGUCal77Fvim3R3eN+3
         5k/FuFW8MxIWKnXdz8vC7+IBMyZS/EE2thcPpPiIyH1/6dWbMsroKeL7pFJ/kwNbQYw6
         kuHiH2xfIhbXFWn+KSFObuNYGNEee0KLCC/+58UzX0lAIuHdUJVbaCFdxTbhSP7VCkbI
         HXtANwWbuvOUFlC0Tn56EiVwRMW01g5Zn8Y2EW5k3cVUinFRbNllIzgsy/0C6POQBAKY
         l84plzxatKA5Xt7s0Hk6hOCjmiD5+7VN3Jjofv4W4sqIxT8SWCJM3gFnuq9vFUMyXqin
         1oQA==
X-Forwarded-Encrypted: i=1; AJvYcCVCtXTyLsahC3jHe28UEPaOdyoQYl1CMQ57oAS6mRJy22aRNmEHkx53aikPeBs1Pn8MFY9Osxrln7zv@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2AAo4OhhWjgHslmcxzlvVIY9/1O803PfM6yId5iKd4wW+yha
	9OEp5cFS8Q8PVlbfmW2zwM/jrBKLXeNWTI6IB4H/fjiFSHEOxRGcpvL4mtOy7sAN4VDP6/vV5za
	XqQ==
X-Google-Smtp-Source: AGHT+IGz6mODxZTH5agCMYiGZey+8PwFJu50se4JqpXBNG0SwyKrN9TWGGQJqqmZYCdc2Fnc7eka1IGyLLE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a81:ad16:0:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e3224662ffmr1632867b3.5.1728584694780; Thu, 10 Oct 2024
 11:24:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:05 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-4-seanjc@google.com>
Subject: [PATCH v13 03/85] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ee186a1fbaad..ab4485b2bddc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t=
 gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t =
gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


