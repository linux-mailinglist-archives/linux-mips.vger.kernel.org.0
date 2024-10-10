Return-Path: <linux-mips+bounces-5921-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD370999094
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676FF1F25258
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0461FAC36;
	Thu, 10 Oct 2024 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXMkCkX5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123AE1FA27A
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584753; cv=none; b=vE2oi2jQakWW9P3w44Rq7ahkkWLbXQ+s46jisK9vfyGWzMK7Anr7BDJ9WSZHV17QYkTg9TOwfRZHLqcMAtDeY4vsj8eM4x7TRkKS4zZMpbcWuySkuvhkjY1h7MEfl+cGNQKhQjpt054+rzIWqR8PTWwotNigr1dg9jVTwe4M5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584753; c=relaxed/simple;
	bh=CmHVeWZ83J0EQfDqM5RvAa04rCEwL0d1DQJqfJodvCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g1tpmmO6DCucNtnSwdJJiWBKZPNFunZ6T3Nm1noOhd52aYmA3tXkWWW44TLwnJPLwdjkP3wDenCHMjUdO/EmcYZZwcGGVUVEarTz3HpJYUbPZ9oYBu+8EV4CvWRP7wiH8kuBAQQG3hyqcvV85PNagqtk9wxOhXEzg5S/z/AObnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXMkCkX5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e1346983c8so1277787a91.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584751; x=1729189551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=FXMkCkX57wh+XHLq6n+XdE6kGmp0hkZZ6UA+5owP77BOfoNtvC7ytMt+Xm91GK2Ptt
         Z/XHN/Hk1/ZsHTw8wUK6ItSDN1PZ/Fd39gXJ0/20Uus/oeHrpT4bHO1ml/gJ2PjphReY
         RrNOOnUdwahhvvYNSbZQ/1IpMiASQC2EYHaf0+95rIjmy89mPbWSyHnf4XImQefy6klx
         RNtpXcGLTqbVqH6LtcwuGjG4TL0uJhOqs7pHAce0CgWIm6XbodXJ/ME1WZd0CQ9+NL1R
         U+EB7wNh59mYw7+giGo4f0SmCXTtVP1ct2vdXaUQ41Qoz11pFqCyoPvQon1ikHXhiajl
         4aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584751; x=1729189551;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=aZCD8kKnuS/g7SZ3ZEecqai6y8dSGcjAjI4pndPV1xNUUD4vfu4ZymT9QiEblrCea6
         nEIK3YXMpq8D8RIf2SOE4dnOeJ3oGFC687SfLEId3Cd/tpfp5rDjMjPbdZyptbAnhrWe
         J+EPqbWHSkTARHV2MuRkaxw/1M5JwCOBqajE3/5MF8M33rnKICZO2Q/92PnISqN/31D0
         tWIHywrAE/uWv/fWxWpOS+pjdF5gG4LNyB/txrMOdzgvgW82HpDFOKeBFwhhgpQGvUY2
         77sAskDDDVkwtwQN5cW91p3Efs6XaLOwpyWfZktZr9WToVDFpxWAPdwqI8gSPVOYPDx1
         b3dA==
X-Forwarded-Encrypted: i=1; AJvYcCXjsTN9q8c71L82T4lHW8JeYgfdzC9HNDipYsY//Ox7sZbXQjiXRxQjV2mjlFlHc11cHqozfgFc4Dr6@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8U3HrFFBEREZddXELyEbhA90VqP2hj/uXd4NXceVORi8qx8k
	O9ff3pCYpJDylnVrwWUA6Jq0nk0E6Qg1gsr9gIxL8Pg8Cg7qBCe3Ke8nqKdEZybYTRFgntzgplH
	EDg==
X-Google-Smtp-Source: AGHT+IHahb+vMbBUybe9JXpaiwYyoag4sz2flsLCX6vY5d7t+wo3V9TaPVQYV32tHeuijXZHqATezWyezMk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d913:b0:2e2:a810:c3e4 with SMTP id
 98e67ed59e1d1-2e2c81d4d19mr7321a91.4.1728584751203; Thu, 10 Oct 2024 11:25:51
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:30 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-29-seanjc@google.com>
Subject: [PATCH v13 28/85] KVM: Move kvm_{set,release}_page_{clean,dirty}()
 helpers up in kvm_main.c
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

Hoist the kvm_{set,release}_page_{clean,dirty}() APIs further up in
kvm_main.c so that they can be used by the kvm_follow_pfn family of APIs.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e29f78ed6f48..6cdbd0516d58 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2746,6 +2746,47 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vc=
pu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
=20
+static bool kvm_is_ad_tracked_page(struct page *page)
+{
+	/*
+	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
+	 * touched (e.g. set dirty) except by its owner".
+	 */
+	return !PageReserved(page);
+}
+
+static void kvm_set_page_dirty(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		SetPageDirty(page);
+}
+
+static void kvm_set_page_accessed(struct page *page)
+{
+	if (kvm_is_ad_tracked_page(page))
+		mark_page_accessed(page);
+}
+
+void kvm_release_page_clean(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_accessed(page);
+	put_page(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_clean);
+
+void kvm_release_page_dirty(struct page *page)
+{
+	if (!page)
+		return;
+
+	kvm_set_page_dirty(page);
+	kvm_release_page_clean(page);
+}
+EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
+
 static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *=
page,
 				 struct follow_pfnmap_args *map, bool writable)
 {
@@ -3105,37 +3146,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kv=
m_host_map *map, bool dirty)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
-static bool kvm_is_ad_tracked_page(struct page *page)
-{
-	/*
-	 * Per page-flags.h, pages tagged PG_reserved "should in general not be
-	 * touched (e.g. set dirty) except by its owner".
-	 */
-	return !PageReserved(page);
-}
-
-static void kvm_set_page_dirty(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		SetPageDirty(page);
-}
-
-static void kvm_set_page_accessed(struct page *page)
-{
-	if (kvm_is_ad_tracked_page(page))
-		mark_page_accessed(page);
-}
-
-void kvm_release_page_clean(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_accessed(page);
-	put_page(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_clean);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn)
 {
 	struct page *page;
@@ -3151,16 +3161,6 @@ void kvm_release_pfn_clean(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
-void kvm_release_page_dirty(struct page *page)
-{
-	if (!page)
-		return;
-
-	kvm_set_page_dirty(page);
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_page_dirty);
-
 void kvm_release_pfn_dirty(kvm_pfn_t pfn)
 {
 	struct page *page;
--=20
2.47.0.rc1.288.g06298d1525-goog


