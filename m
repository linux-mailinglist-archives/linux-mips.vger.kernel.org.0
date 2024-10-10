Return-Path: <linux-mips+bounces-5927-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE19990AA
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D13D287590
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0821FEFDF;
	Thu, 10 Oct 2024 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwMYhkdO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABBF1CBEAB
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584765; cv=none; b=A5UucXGw9aaCzWg+6DRz6z/S2ptDa75bxxWfTrLvecGXnl/7Q7Lhn6DLUIqvFWcK7nuY+0L27eudLYEU8M4D+7oMLv8HiS7A+g50/QnWk1V6wPaYYIcESIizBLloHkch0THA9LYyW56o6V4Zn5QguX7CPDRDdeJ6zXsl2HN6fM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584765; c=relaxed/simple;
	bh=+qwur9UMvfPsT7xhW5+1hFXGI3F0T2CjnbFVAQFEZ9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kldnrMEKnFjoUMApShCLwQU7TjEipFWpODG7YUdSr98LAzTp4P+JLpsF7rVLfGTYLc3MRCLfLBqOi1XZZxoSkXXL2UiKPd0hO4dtsGsLztX7b8dcPMY0Dype9O084c+BkOxNNpcj48+hrvYgLxiA7nQKc3NlEValOVxAOSV+YNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwMYhkdO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71df051770aso1193822b3a.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584763; x=1729189563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3u38MFKj4Hgu0NiviVwRjtFpk/ioMNBGBDQlt4DAgY=;
        b=qwMYhkdO+k0O3GAu86CC0Oovaqx2YjaPKBv6LeLzcOh3PtNiOaQrcv5HBilI8icD9g
         y0Ltij7dFk7sin4usHA+6Wv1hFiwFPtq5Ajocz2SMLSw7EHhQ24kqq+Bt+H2kyBdKaty
         qPo1gORXTlpg4cwuwI2/Xd/UCp8kWbToIyady8yUqr5BbwLt+Kkm56JwyHrVdgysxAdq
         eCA0ipk6bTZMsprIdAiZDgjFHxpqT0t6hWRsy+Feo3csNnBxmMja133Zk9XVBeicQl/q
         2iXz1SFCo5UtodgUyE2QoPpXLNLLkpEupG73DPzHBSBkCdaePTQJNXxdK3uBHhhZG/wU
         Akeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584763; x=1729189563;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3u38MFKj4Hgu0NiviVwRjtFpk/ioMNBGBDQlt4DAgY=;
        b=oo3oDRlNfO40uAviWZ2Z2Dx9H0gqtTFGnvNm0RTqi59Mb6DUoYRZzSkjC0TYsCEqnD
         WpOv6Vs4L8nNEIntU6BDPNZYR2ZD/juljBSflVZ+ehBTFrv5Y2+hBmJ9FPA2WvpSptB6
         nZarbgJ5e0JNBbeC3SU8ccEFBZPGBe77mcqSQMMIdzVCno0FuBrPho5yFXhS6QDtXLGR
         3qgwDylTUDtxgdwF5Bzsrri29kjvItnDe9HNpCfWYME/rkBSnVCCBXv3Lq8DvMxCo97w
         l85dtPsq55wiHAyqhZIMuShYM1aQUScGHij2ccSVYa5ZNCLp3iXNIR/6h7CFbsQ8GNqF
         dw7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmUufDpuRdODP3iVUvqaxbph66CO0VK9OKuY5/77ICjq3cdh89L4ZWf7rYSexAA9yCNJvLxQ2paq5g@vger.kernel.org
X-Gm-Message-State: AOJu0YyngzV0hkZATJsz+at73AKaPbjiVuDyS0uRP13xjkhk666dV1EZ
	VelmI3s2+0FcsDEdfa137oPNi9Qplnq0ar/NlHfoXsAxSzdO0UfzeegWXMqMrOqHwnZgJ9i2WQh
	TDA==
X-Google-Smtp-Source: AGHT+IHthU1bxxWE76UmRU/cmSB/2b+tJYVulTyd1SGmZGLYBHQFEbukUNmDJAlwNs2CFth+SfvGFADhDCI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2f51:b0:71e:dd:8f9b with SMTP id
 d2e1a72fcca58-71e1dbe8750mr6976b3a.5.1728584762866; Thu, 10 Oct 2024 11:26:02
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:36 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-35-seanjc@google.com>
Subject: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
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

When creating a memory map for read, don't request a writable pfn from the
primary MMU.  While creating read-only mappings can be theoretically slower=
,
as they don't play nice with fast GUP due to the need to break CoW before
mapping the underlying PFN, practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 080740f65061..b845e9252633 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, =
struct kvm_host_map *map,
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
+		.flags =3D writable ? FOLL_WRITE : 0,
 		.refcounted_page =3D &map->pinned_page,
 		.pin =3D true,
 	};
--=20
2.47.0.rc1.288.g06298d1525-goog


