Return-Path: <linux-mips+bounces-5922-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08899909B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A71C20D35
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71161FAC3A;
	Thu, 10 Oct 2024 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmIwJ/Iy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806C1FAC4C
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584757; cv=none; b=CXtfs9AoFlfWIsuM9pUiSstNCiyWpcaQakBQNscPs94UsKmGRqPf7VLsB+MJalnBQ3PRGSABNAWgni5YJDNZSuEZ72WiRuXadeNs0X81mPKSihNzeqn5BK8UJAz3//1ba0Rn7gveU3WKpPdc2oAUjZb21gvZ9WNZPP0KebnubMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584757; c=relaxed/simple;
	bh=DZ/5QhAqV/AFQ+a9ItmswBEEvilydxqWBCs3ItnJewM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SlKYsHjyTtCQDVoabZp6D5/JEjxK98er5ugNlB0eViccjM08DHD0FkaJdelWuj+RKKcXrNXDe3fbezQ0U1Y4BCdizAoMMv4cRULImMpw0TC6tISJjLY4VKDXxNqoPuGWAjUp+/C/u8zwzLdkxVksW544wD9d25wbzNHYHr4u+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmIwJ/Iy; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0353b731b8so1674283276.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584753; x=1729189553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=hmIwJ/IyhcXzHrpeXJmRadf+rJk2JLpf6qp/np19zFesdgrIj1iUPTmoJQNxJ6SI6X
         IHcMrrqOA4nE8IiNaHd2zwz6BvlPYPPf1ekepldTmgYUw+ak/bAI/v9hLzV0EYY6w0as
         Pd91JjhJ3PMfnyMtRXbJz4nddyfr9oLinVFCzp1mn4EqH4SlHOX9f3OICBNQavz6abuI
         pryFHHJbcxlbbdQzivVw5wyjGWIEhRw5l97zg8ZIES2+CB6VqneR/2wG6WO5fTubinUd
         HBmHOSTWDqWDcYOMtblw7eC8qj2WdaMLhZ9SkfWqev1nkC4dDfd9Onjs7JQevhMCO0rc
         5ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584753; x=1729189553;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=cQLigScQXpX/MNUjlpUnSz5lATBjdCxbZzm6iKlMd77gxPsD1u91GywmSdPIEsaQqw
         wHq9Bo70RJLhsAcoBA2sz6Z2qHg/f/dYhzjfThiFB92TNKaotVVuQimR8P5aCdCUacEB
         u9FRDxrqAhEf9G+4xBBmZtawFmy9JckCII4IeVLVl3LOi31zHdlTdlx1gsUi9GSyA1Mb
         o6FNAa+3C62cwq+YGqvigZuGCBy0xyTLn8p9bxlZaU/HP+IQxM1pdiCBeCyYU1Z+lXs1
         e3RjnorY84SnyQiBXRLIiAftNFt52EAk344Wz9YqXP4OKI+NwQQMvV+r6TMzN0km5/k6
         yFKw==
X-Forwarded-Encrypted: i=1; AJvYcCUDayiaZU8N6dHQbQ5li2laCMFTcK5BWfGGU8hcefduXIXP77mK8cMz0STu9xytA1bHxXSb/zSG38Qz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7h8rexabwMQeWMywksevJxzgE3k7Tao46wui2w2zCMnqO8IE
	tpy5TWhsLU7rNDBiF2Jlyb5UM8ve+hymIGCnPDmII5qnDBjhzdzImL5dOSxmnf5Gyq0Dvi1pVDf
	HlQ==
X-Google-Smtp-Source: AGHT+IFqzRS1xOg2oJDncuDOdOtR7gITdwbfvBFuJ4xWEWgDQEplutdiZUKmbH0mIVak18Oaak6LM032atM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b205:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e28fe43f3f5mr4095276.9.1728584753336; Thu, 10 Oct 2024 11:25:53
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:31 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-30-seanjc@google.com>
Subject: [PATCH v13 29/85] KVM: pfncache: Precisely track refcounted pages
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

Track refcounted struct page memory using kvm_follow_pfn.refcounted_page
instead of relying on kvm_release_pfn_clean() to correctly detect that the
pfn is associated with a struct page.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/pfncache.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 067daf9ad6ef..728d2c1b488a 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,11 +159,14 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_c=
ache *gpc)
 	kvm_pfn_t new_pfn =3D KVM_PFN_ERR_FAULT;
 	void *new_khva =3D NULL;
 	unsigned long mmu_seq;
+	struct page *page;
+
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gpc->memslot,
 		.gfn =3D gpa_to_gfn(gpc->gpa),
 		.flags =3D FOLL_WRITE,
 		.hva =3D gpc->uhva,
+		.refcounted_page =3D &page,
 	};
=20
 	lockdep_assert_held(&gpc->refresh_lock);
@@ -198,7 +201,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			if (new_khva !=3D old_khva)
 				gpc_unmap(new_pfn, new_khva);
=20
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
=20
 			cond_resched();
 		}
@@ -218,7 +221,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			new_khva =3D gpc_map(new_pfn);
=20
 		if (!new_khva) {
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 			goto out_error;
 		}
=20
@@ -236,11 +239,11 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_c=
ache *gpc)
 	gpc->khva =3D new_khva + offset_in_page(gpc->uhva);
=20
 	/*
-	 * Put the reference to the _new_ pfn.  The pfn is now tracked by the
+	 * Put the reference to the _new_ page.  The page is now tracked by the
 	 * cache and can be safely migrated, swapped, etc... as the cache will
 	 * invalidate any mappings in response to relevant mmu_notifier events.
 	 */
-	kvm_release_pfn_clean(new_pfn);
+	kvm_release_page_clean(page);
=20
 	return 0;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


