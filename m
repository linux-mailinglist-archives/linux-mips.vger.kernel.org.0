Return-Path: <linux-mips+bounces-5978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3B99914D
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58A8281E82
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4C321D17F;
	Thu, 10 Oct 2024 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xyu1Nn/r"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF721D166
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584875; cv=none; b=AeCF5P4/CyyVSWvf/WUs+3WVewSckdkaNTdXQ3K/jMNZNW3UMhGgj3wdlBeONl7+R7feGa1iXMXEvKST3sE/9XFEegGtrvzLnqh17YwH+ejhFAzH1BIvt4qiyb8+rHbwGXa1mUj1GP0s1mGvZnh1xrGaE+UxVduJOfk+2yFxFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584875; c=relaxed/simple;
	bh=aNI4I+LkKsxzC1YKs2vCoD7b+5doZynW6Blg4vQwwvc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dALTs2r53hC50+rZA5mcKfNJq6WtN4ApU7rv/sibouZhFYPoUtCXsO5iJ2Up6V1g/FObuPq5+qSXVVTHKuzfJH+CcUBhgHg3LUwZcY8XAD7k3SbxfjDA4PJZcZSvnL+a6Fd02WTKcaReEMb+a54uYuIWTkf4JcHm+TwrPjVygbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xyu1Nn/r; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7d4f9974c64so900243a12.1
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584873; x=1729189673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=xyu1Nn/rp+FyjGRlvaySHpdLv16ogLwofUZlPSL88LrsPtUsdHxPdI4aMAZWpZ+LCb
         G47QycBP2achTmuGd1EXNbbjK4pjlf7ihMkj5vlGqDxw6OCVDaNJvwxpCB4vy6cQt+eC
         bPNyYrqL1IWM+djQgloaSwHlTl/m9PsGRY+UQiNbQLuX8csAdsfFUDyRbBcmemNyquwH
         u56PAc5JRwdiVO7tt7yODdJN/pEha8mrjjtisATQgI2/uYcwTl1QzP6LKGp+KqXDTb7X
         W3csPJXsIxIBK/YbHvH2KWvDbUJR0U0jHjWARSRlv5XaOYevRMa1tcC3LSfpUG2LIezf
         k0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584873; x=1729189673;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=PwDflMX1QoQbLkvlGotQiVPSnS3jBwHeenOFUvPGCQjaRI3zIZAe7XLhHXQTrNvgr+
         BNpA0A1UWNuERmTqssKbZC/cJBYSkU+JVd7FowSVG2cDD+XACh83tXZUjWqETBzVeLL4
         GXqPLqhCQXkfp0rf3C65ti0CPbeQq95j6ECjlpswtsuSyKwV6zbhz8KG/MXvGFRazGbZ
         d8COrdizGJu0JovkXnb4FKYIaehuozmUTvN7dzV2/drW9ugZHaZvUwVbMs8gxM04LS/3
         zFLdxq7wCp9Az78pdK39PXOcP7fdT8sa5f3DFK5tI77GQ4k6bCWCk3ssqccf5lQbXNnG
         NBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXJEmDG1L+57doDxW4WuB0htW/TUnq4bPhfMHRyl7oVifwOAhz7z+52ZD90lv9+bKY/TPapO7t6pBMF@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZ6+n167A9uht0MV9SMDSHP2MICm4cOlanM1wkl0j7mignaYd
	4kE+8iEnjuc6yU2zjJP5XRqRQLAvSvk9fGFby1wDuLrim5gkpOQnPTlrm546EGJRz9q/Cy+JfN5
	fQg==
X-Google-Smtp-Source: AGHT+IHZp/jcJ6VF/U4r8Ds8cBqCm7oOG+WyWj8b167iLxGpwwfpynwEnbVm0Ou2T4AqluEw0PW/YyS/yKE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:e715:0:b0:7d5:d088:57d4 with SMTP id
 41be03b00d2f7-7ea535b6b4fmr26a12.9.1728584872016; Thu, 10 Oct 2024 11:27:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:27 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-86-seanjc@google.com>
Subject: [PATCH v13 85/85] KVM: Don't grab reference on VM_MIXEDMAP pfns that
 have a "struct page"
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

Now that KVM no longer relies on an ugly heuristic to find its struct page
references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
pfns, remove KVM's hack to elevate the refcount for pfns that happen to
have a valid struct page.  In addition to removing a long-standing wart
in KVM, this allows KVM to map non-refcounted struct page memory into the
guest, e.g. for exposing GPU TTM buffers to KVM guests.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  3 --
 virt/kvm/kvm_main.c      | 75 ++--------------------------------------
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d045f8310a48..02f0206fd2dc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1730,9 +1730,6 @@ void kvm_arch_sync_events(struct kvm *kvm);
=20
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
=20
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn);
-bool kvm_is_zone_device_page(struct page *page);
-
 struct kvm_irq_ack_notifier {
 	struct hlist_node link;
 	unsigned gsi;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 396ca14f18f3..b1b10dc408a0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -160,52 +160,6 @@ __weak void kvm_arch_guest_memory_reclaimed(struct kvm=
 *kvm)
 {
 }
=20
-bool kvm_is_zone_device_page(struct page *page)
-{
-	/*
-	 * The metadata used by is_zone_device_page() to determine whether or
-	 * not a page is ZONE_DEVICE is guaranteed to be valid if and only if
-	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
-	 * page_count() is zero to help detect bad usage of this helper.
-	 */
-	if (WARN_ON_ONCE(!page_count(page)))
-		return false;
-
-	return is_zone_device_page(page);
-}
-
-/*
- * Returns a 'struct page' if the pfn is "valid" and backed by a refcounte=
d
- * page, NULL otherwise.  Note, the list of refcounted PG_reserved page ty=
pes
- * is likely incomplete, it has been compiled purely through people wantin=
g to
- * back guest with a certain type of memory and encountering issues.
- */
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (!pfn_valid(pfn))
-		return NULL;
-
-	page =3D pfn_to_page(pfn);
-	if (!PageReserved(page))
-		return page;
-
-	/* The ZERO_PAGE(s) is marked PG_reserved, but is refcounted. */
-	if (is_zero_pfn(pfn))
-		return page;
-
-	/*
-	 * ZONE_DEVICE pages currently set PG_reserved, but from a refcounting
-	 * perspective they are "normal" pages, albeit with slightly different
-	 * usage rules.
-	 */
-	if (kvm_is_zone_device_page(page))
-		return page;
-
-	return NULL;
-}
-
 /*
  * Switches to specified vcpu, until a matching vcpu_put()
  */
@@ -2804,35 +2758,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_=
pfn *kfp, struct page *page,
 	if (kfp->map_writable)
 		*kfp->map_writable =3D writable;
=20
-	/*
-	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
-	 *	  every pfn that points at a struct page.
-	 *
-	 * Get a reference for follow_pte() pfns if they happen to point at a
-	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
-	 * the returned pfn, i.e. KVM expects to have a reference.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
-	 * but be allocated without refcounting, e.g. tail pages of
-	 * non-compound higher order allocations.  Grabbing and putting a
-	 * reference to such pages would cause KVM to prematurely free a page
-	 * it doesn't own (KVM gets and puts the one and only reference).
-	 * Don't allow those pages until the FIXME is resolved.
-	 *
-	 * Don't grab a reference for pins, callers that pin pages are required
-	 * to check refcounted_page, i.e. must not blindly release the pfn.
-	 */
-	if (map) {
+	if (map)
 		pfn =3D map->pfn;
-
-		if (!kfp->pin) {
-			page =3D kvm_pfn_to_refcounted_page(pfn);
-			if (page && !get_page_unless_zero(page))
-				return KVM_PFN_ERR_FAULT;
-		}
-	} else {
+	else
 		pfn =3D page_to_pfn(page);
-	}
=20
 	*kfp->refcounted_page =3D page;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


