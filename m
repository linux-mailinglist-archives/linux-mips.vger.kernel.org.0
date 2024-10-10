Return-Path: <linux-mips+bounces-5974-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D043999145
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F90281754
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7794E21B45A;
	Thu, 10 Oct 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4fg+oFS9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671321A715
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584867; cv=none; b=CaYoQnzDMB7lBdJIdeJMkXkm5F0jPIDRRigNzOQACvqojLa4h85diSoakAu3TSWc6r/ZonTkLETG9KKHi7nghYniAaZNF5QIjUCmMzX6W48TcKDkA/PAH44hAhNzwozLvhzZSJULr2F+BM83iuv6TfQmlGeYOtLXfJ5TRVadIu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584867; c=relaxed/simple;
	bh=Ioj1P42KohQLhw3WPnqB6EBTWlPlGqFgp6J41ckJwc0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LVWEEe16N6qm/EJ3ZXm9r3BhS3MfSgBo5jWcKtoFIYzN5/qpcJqbUsnjj120zgmcOBsXwBxpwK2lpqXkiIcSNJwallKB0jWiJC5Pbps6zvbDfYmFrm+7H+7GabKQYbUJRt1WrqaOIymG9EmKaIgdQY1I6xD/6wr4n+7GyTelt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4fg+oFS9; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02b5792baaso1678028276.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584864; x=1729189664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=4fg+oFS9HQ6bkDg2/cCK4u+yUaY2HdLlUAKKyU3XiR5S4aFSzAjEWkOGXTGjmr5ePX
         vGkI99yd3NqFEQL5q+JkKGytg2VixnQYq4PGFlA34nG7QkyPIj6PJ0ZlrIWRk8AoR/X0
         dosEXhI0H3WZr2UmtQAb75cyDhtq3eS64wMYjKmvudbvRsnzH7xd9K0hwQjEJYZEEdS5
         S5ioD1i4hPY0tOXwvT+EQOL0urSQ1tchIC5V6FTIv7IWcFTlAadalixlcVZHj01gXoru
         OYG5pbvbDCYSnXyeBnRIHws5VAd7XO3tCVjhRsUtK87ywGe0CzqKMCGctDzPKDvNGGTs
         7TYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584864; x=1729189664;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=P5uTeV0PscWqXOlJCsLbqzJLZ5ShfGgOZdCMP4m4Vdf7lEx0Bdww6/vwaqIcmQOv76
         r73PmcdgKlOb2B9jTr4QoHPNZ/k1BZETAPky/DUigRwipY7MJHOo120NqcfvO0QbR5sa
         5ExtHcVcQ/u63ZovV1tHyxsJgD888vg668HIFnoVRlE2sqK662SYp8TZDPZ6toEqxlEf
         GKy5rJg4FgddjnzTh/txAtGdh05xEd8+u/4TiAGHuN1GFSodA58u3t+S4KR0V/GS7FKg
         hcFLLqWEnkefJyYCx2Xy6nFXrAJxq5OJX/IbkiGxcPV6hudOF+wIx13VVxzvqPFJlCam
         fr5A==
X-Forwarded-Encrypted: i=1; AJvYcCV8j+lqZbqO2UKOhMIvfC6bV9xtKf6f34mnGczFgcwXg/6oiMl+yYMEuyYT7Afbophs3sHx0hqu0Mkq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75EZNbJDxfDXRKIqelKN+qxvIqhpjA5Sb4KLaIKukg88xZaKf
	2I7jrOGt1MImP0Kf411j62lZgF/aZiE4doLlb2QOOwhYNJ17fwQu8WmgYFGF06U5Rk8ySLkVduV
	9Qw==
X-Google-Smtp-Source: AGHT+IEHmTL+CF0lwT1L0/srW8AumAgUZ3z+xXpT6s6F1mY7sAC4x3PdYh5uuuYsI/CKxaNz7ipzx99kqDg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ed0b:0:b0:e17:8e73:866c with SMTP id
 3f1490d57ef6-e28fe421ddfmr136730276.10.1728584863963; Thu, 10 Oct 2024
 11:27:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-82-seanjc@google.com>
Subject: [PATCH v13 81/85] KVM: Make kvm_follow_pfn.refcounted_page a required field
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

Now that the legacy gfn_to_pfn() APIs are gone, and all callers of
hva_to_pfn() pass in a refcounted_page pointer, make it a required field
to ensure all future usage in KVM plays nice.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b2c8d429442d..a483da96f4be 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2834,8 +2834,7 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pf=
n *kfp, struct page *page,
 		pfn =3D page_to_pfn(page);
 	}
=20
-	if (kfp->refcounted_page)
-		*kfp->refcounted_page =3D page;
+	*kfp->refcounted_page =3D page;
=20
 	return pfn;
 }
@@ -2986,6 +2985,9 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
=20
 	might_sleep();
=20
+	if (WARN_ON_ONCE(!kfp->refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
 	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


