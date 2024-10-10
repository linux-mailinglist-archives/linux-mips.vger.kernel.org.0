Return-Path: <linux-mips+bounces-5928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A59990AE
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70218B283A3
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300E01FF7D2;
	Thu, 10 Oct 2024 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VfKoGAUz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F211FF7A7
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584767; cv=none; b=B7yoINxrgrPGgoSmLzm3bFuTsC1zqQDHZHvAQgaYIS+HSPmf7Wv+polk9uEY3QxsHiG6aaeZZ0QthPlsvN4rUWTTQTKVIClnYPmuuLxv0GY2LGgA2+/SBcbWwvw2iZY0PVsOpp2Hh3SrqlFG5kVF0Dvg+Fti4cdCP14eCYIFXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584767; c=relaxed/simple;
	bh=JluxJpntN2XzeRJ5Yz03kdoesvuYdAA2z8LW9UOaBnA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pr2BZivmeEMdSSGsDKK2NhYa13gGcZEaAAbJgP6XymxVVtlaestVDpd4VLkLnM+AUnKo/HT0T9DQQcngViHoV5AZq2biBnBF8yQn7wBmCbMbnuDhmXbhDgMC5g9roZCeNKoInwH0+dHMNaDtuS9xdn5oH21Etl6wAgRw/F9XWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VfKoGAUz; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7e9fb5352dfso1520880a12.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584765; x=1729189565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=VfKoGAUzy1tyfifoK0lzuC5EO6vmRc5H8EipIe+ZLEuWAXzAG8pU2LiyJzlZVu0hi0
         mOO9VygcpFe8zOSwUmfQQHakO15699SyqMVOWWSAiUH2fJJdgC8rguMny3tmzuNm6qma
         xqCi/swqvFmWY9n9yk/3JuaiFkFnRNBPBb225gAWzmoJNnJjRf6EzDz+lob/Swy2Zd8F
         5WPg5QuuVmEjsJhFvUHJUB4SSv4y2afPWrVKR+wB8gSLJdQ+AEm1DKIqe37EnkjyN8cB
         4U807FVw2rgqm/ygIdqMTxDCTj1f1B9aQDFvY0AHA0uFNQgR8DeiTSbrOcm3suHvH+5h
         7yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584765; x=1729189565;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=DK04qgf84CGZV3CkqwVqvRmTR3QgwrcP52xfsNITeCV3zSt0OfurebJ+uKTpqL3Ex8
         TnTYNXmC+fiHoOvC9bB3hUlxAAgoUappW0/1+xQ/M2pzefVxXzk2Neo5ImLjdZT/x2TY
         UVdxBfHJBO03DTShkiRKk/RZPFHndJU1v6ca7CdKOucLz8rBsp+Vf+w9+yQLUu9LWiKw
         xyydBjaQWQz+MdFghFU3w1Zx6jqH6OYkNAQ0sNjZFVUgq7inYigrK9pzMZqS02ASd9+v
         3Up/x9vy0MoNJ6RKWTK2U9TChV1DamptNUrwDgo/cttLp5KWVr7NHG/6VneC39UEGid+
         nclQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu09nHLQPdFvFPOKERYJafk6szW6qi/Xo6bPpPKnEPRFRRr5J0bh74NMNynDohkhe1tWzsdOXPe+in@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0rRBfvn0VW57rS5Z2KWURAHrKQbxGI6sJ0g4Q29sZtw09AlN
	lqDojR9S8RvAQM4DZdhOcht7V40ftJ4v09wOAK8XPcphcJ1cWoB0oC7tPfPwq9E9i42DVSUaOaY
	E6w==
X-Google-Smtp-Source: AGHT+IE23QkhjcWr/3QASJ/S9+dapZUNy7Z4CCepJKqapzuUx8eBu6OhWGfM5laLrlsw47tRhKuFSYugMsQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:ff61:0:b0:7cb:c8c3:3811 with SMTP id
 41be03b00d2f7-7ea5356a658mr52a12.5.1728584764791; Thu, 10 Oct 2024 11:26:04
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:37 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-36-seanjc@google.com>
Subject: [PATCH v13 35/85] KVM: Disallow direct access (w/o mmu_notifier) to
 unpinned pfn by default
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

Add an off-by-default module param to control whether or not KVM is allowed
to map memory that isn't pinned, i.e. that KVM can't guarantee won't be
freed while it is mapped into KVM and/or the guest.  Don't remove the
functionality entirely, as there are use cases where mapping unpinned
memory is safe (as defined by the platform owner), e.g. when memory is
hidden from the kernel and managed by userspace, in which case userspace
is already fully trusted to not muck with guest memory mappings.

But for more typical setups, mapping unpinned memory is wildly unsafe, and
unnecessary.  The APIs are used exclusively by x86's nested virtualization
support, and there is no known (or sane) use case for mapping PFN-mapped
memory a KVM guest _and_ letting the guest use it for virtualization
structures.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b845e9252633..6dcb4f0eed3e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -94,6 +94,13 @@ unsigned int halt_poll_ns_shrink =3D 2;
 module_param(halt_poll_ns_shrink, uint, 0644);
 EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
=20
+/*
+ * Allow direct access (from KVM or the CPU) without MMU notifier protecti=
on
+ * to unpinned pages.
+ */
+static bool allow_unsafe_mappings;
+module_param(allow_unsafe_mappings, bool, 0444);
+
 /*
  * Ordering of locks:
  *
@@ -2811,6 +2818,9 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pf=
n *kfp, struct page *page,
 	 * reference to such pages would cause KVM to prematurely free a page
 	 * it doesn't own (KVM gets and puts the one and only reference).
 	 * Don't allow those pages until the FIXME is resolved.
+	 *
+	 * Don't grab a reference for pins, callers that pin pages are required
+	 * to check refcounted_page, i.e. must not blindly release the pfn.
 	 */
 	if (map) {
 		pfn =3D map->pfn;
@@ -2929,6 +2939,14 @@ static int hva_to_pfn_remapped(struct vm_area_struct=
 *vma,
 	bool write_fault =3D kfp->flags & FOLL_WRITE;
 	int r;
=20
+	/*
+	 * Remapped memory cannot be pinned in any meaningful sense.  Bail if
+	 * the caller wants to pin the page, i.e. access the page outside of
+	 * MMU notifier protection, and unsafe umappings are disallowed.
+	 */
+	if (kfp->pin && !allow_unsafe_mappings)
+		return -EINVAL;
+
 	r =3D follow_pfnmap_start(&args);
 	if (r) {
 		/*
--=20
2.47.0.rc1.288.g06298d1525-goog


