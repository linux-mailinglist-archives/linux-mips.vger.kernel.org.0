Return-Path: <linux-mips+bounces-5969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA616999136
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180732883B9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75663218D8F;
	Thu, 10 Oct 2024 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpMT9mNV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E64218D63
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584856; cv=none; b=m5iiOgtYTGPjgvos6Xj3ccr2oUjHvJsLiIspoHUi3yYVHD5QTmwxTrU6eWS1mbYi3p36Opc5dJ54mvSVQCCiwPnLsFGh4i7wZz/nIt5AJNtyNge/mAdYi4m497M+1Ly+ph1W7Bmo3sdzVAD1eMJiCXrpGvot4fNciw3o+ougSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584856; c=relaxed/simple;
	bh=h3dpe04J9rq+dGEj5vV4pEUoAEcWlYwK7aXFrp+Hc5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WmGbVW7yfDeQEUoxkhvINypdTO5nxZdmwkzofJ6M5BXZtp39bRFQkJ6zuEYsNL0KV0bZuu1cQBPb4/XfP8VUTe51BDqUlTaa/IQQs3cDTONWVqIjIzRTtEZ3qhWmBmGZAeCFP3hRGBQVskY4TEGiVOejpNOQGOaiVLY5wSfArEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpMT9mNV; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e28d223794so23915707b3.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584854; x=1729189654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=qpMT9mNVMlM3JYWe1f9UU6REj2+oc4kj/yK50HSO4pjHutnOBh7JNWul7tfhz3o4gh
         +vruI0VZ+Fq6kyfhQqfEBqSUimUY7mr4tcemk0pyokvcHPV3ClhMsBLLWdPlziIY/gZr
         qbn/UhT5Hr+z4AUeczlu7097wCvqY9n+PJbB4r96PtwCFdRgaEAiAjYU0lZuAW3qFAjq
         oJfimXxrRFyYcyH8hc0hpxmWiRZ23C/Pk0qrQf5Tx+NbiOGiHhn+vpApay6F/DbuQk85
         z2HtIRTfoM/9gXAmhP050j35DEG0wsNyQRzI2Y5vZAgVPQ0yrJEQ+eN7pVysywTjL1vy
         1DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584854; x=1729189654;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=JMHWti5jJY9jj/2VrqtfYG6HjGzMbNTD/Ea77mVKNBvAeqUfc2SnFvSCDgkTKbw7gk
         DjfK8amf5JLT9P7S+LkIL2/ErLgHvoNumVEEgKpFgNdV4OrfUxEaStz7664TTKScC1WH
         jVuHT71l9SCkOkaxFyGNX3TZqgt0Xegk4EPbyvZWFlcHedYZkD9HphOIoigfrXvyvwhV
         YBF1eetFco5anS2z2+OsgLc8c/r7KG/fXJj54+9SHOjEJy+2/O7XDedM/03cnaqraD8I
         sZV098LCfFLKcLNdcZTl+ybRwuVjnDc84WfeZQTbrDSdtfg09qJCbbaOrkj+lUBrWg2c
         pcOg==
X-Forwarded-Encrypted: i=1; AJvYcCVHNcF10T1xX2OG6/wF9ih2X4IYyAjlmfFH9ukzNWlarx6ohHvjvD7XkHbBtSNhf9PgjYqKW5rvyg3S@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hV/JV6D13GY767D5V43VbuBMBG/+hx0Y0qQgKGeEULs+UoFk
	b4vQVpilpheX8krdv8x/ZiYCdCnBTcNw01D18VjI7rUCdQS5+EjXWzzypDZ/HeilcD6HXPPyWBS
	2Sw==
X-Google-Smtp-Source: AGHT+IGkMjnJcd2oWHVLgC5xfQJb4mHLQjnUvb6XgW9ZV8VH9lzrMuhcRfl3e0TBTVqXdJBO9V/Z2ttoh2Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4091:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-6e32213fbacmr192077b3.1.1728584853563; Thu, 10 Oct 2024
 11:27:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:18 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-77-seanjc@google.com>
Subject: [PATCH v13 76/85] KVM: Add support for read-only usage of gfn_to_page()
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

Rework gfn_to_page() to support read-only accesses so that it can be used
by arm64 to get MTE tags out of guest memory.

Opportunistically rewrite the comment to be even more stern about using
gfn_to_page(), as there are very few scenarios where requiring a struct
page is actually the right thing to do (though there are such scenarios).
Add a FIXME to call out that KVM probably should be pinning pages, not
just getting pages.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  7 ++++++-
 virt/kvm/kvm_main.c      | 15 ++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9f7682ece4a1..af928b59b2ab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1213,7 +1213,12 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
=20
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write);
+static inline struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+{
+	return __gfn_to_page(kvm, gfn, true);
+}
+
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1782242a4800..8f8b2cd01189 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3138,25 +3138,26 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot=
, gfn_t gfn,
 EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
=20
 /*
- * Do not use this helper unless you are absolutely certain the gfn _must_=
 be
- * backed by 'struct page'.  A valid example is if the backing memslot is
- * controlled by KVM.  Note, if the returned page is valid, it's refcount =
has
- * been elevated by gfn_to_pfn().
+ * Don't use this API unless you are absolutely, positively certain that K=
VM
+ * needs to get a struct page, e.g. to pin the page for firmware DMA.
+ *
+ * FIXME: Users of this API likely need to FOLL_PIN the page, not just ele=
vate
+ *	  its refcount.
  */
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write)
 {
 	struct page *refcounted_page =3D NULL;
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gfn_to_memslot(kvm, gfn),
 		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
+		.flags =3D write ? FOLL_WRITE : 0,
 		.refcounted_page =3D &refcounted_page,
 	};
=20
 	(void)kvm_follow_pfn(&kfp);
 	return refcounted_page;
 }
-EXPORT_SYMBOL_GPL(gfn_to_page);
+EXPORT_SYMBOL_GPL(__gfn_to_page);
=20
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *=
map,
 		   bool writable)
--=20
2.47.0.rc1.288.g06298d1525-goog


