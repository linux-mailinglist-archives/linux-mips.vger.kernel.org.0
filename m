Return-Path: <linux-mips+bounces-5916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A6999078
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573291F2469E
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2851A1F8F00;
	Thu, 10 Oct 2024 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qoM+EiSr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6951F8938
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584743; cv=none; b=bHPu+AuVRAaOhOU1arvuNFtesZ0vhon1vxZClgmEVZ5RfZuz1dB8EJdYUgetzdc12Byu1Hufs0Zo9nZHtY9xZ2/AMvvvCb4xWWNqcJ8towjBSvfqzFTcePa/0HMRkab+9maSeFp0ToOIKeHLk0RxsCpmh0mz/3azi5xbrI8DMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584743; c=relaxed/simple;
	bh=Z6RyJQ8NNQkeYyg1tN/wL4j+YrBUDlf6269dIZP90as=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tnrhrVgK4PTm358XA32p3uarhE3UFhOhnsfbx9AslYrYgwyouk9hb/C75fv/ZfIL6zP5+FBTNwJO86Sr2ADL+DnPggarUqJCvtLp6G/gIkohLSfDabLVYwmyroOza9Wb46Y3MlbGzXkHA/WAwGKwMDRrzKXPQ/mvzWfEMwmK1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qoM+EiSr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20c8a637b77so13049525ad.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584741; x=1729189541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=qoM+EiSrBnuwmjbt/H8tKBvxJwaIx0hkbfvehONsdCk9vjqOswD4mvEj0K1OvuyMS8
         Xefy/51XOxUXr3lsl7Gxr0tNwtj+ZPlYKogfR3q1PQN1U7OSpY3Nf2KyigCmie4XlfOu
         2xoglyZSTIcyp+jlQO9uqGd3hDo0QHuTSL4kl7jncKIHd+kyxUPUGGTYKg6YzSg7q58o
         hz32KEqkByEhfBdPCd4ourTLtS05BCrpdXQYuWlkGQ0tWMIgXq7FyYT20RKpzbGXrhJW
         eTw/7JHF+f6c5jdj0TmxNhUAaWushq/8RPGlbiYwR+r7c/2SWrqGoB8HMLioJXH2uYJ/
         aKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584741; x=1729189541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=r25jPQC5STPSynrSpkgMzCFYNFTwKpopENh7c9DAl9EvBIs821daelufZslft6WBm7
         jX+SD1XuKfzuYKoT0X1G8WLsDPuxNeClSBab2RKaWF/k78muTFz3TRp2Oy8Ax28i+IP1
         dKqk/Nv3HdFx6D48GFpYQRopOs0VA+nU75K9QrROJoP6XmdLU39CDkOVbqtAmnNegVTg
         /6LeA8x+VWmu60flvDv8DTX0H0QqVSc3bM3SwkhlmIkJJbCvKXIkiRf2TPrPAwniDhCs
         CVN95cZ+W3LwAemVxf7lKjBCGjzZkOSww5oh8V2D4AM6UgT36oB4T9xEpCNwhkR0oKwa
         GrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW69BhhblbO2UWKacAnaul3laqKJMx/8bEP8JrKghGnaRgc8A3cytnFBzXhV38Pks7ZhuiYhZhYcBPj@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAUqARD+dawt70ZRYwFUWsMI7A2Du8+9moIN07+XQLnypBglH
	gsCQZ6EwWFPNAImDXPj29LZHgwMGg7ZW7PBrQlYAYUg6NhiDzLgoryl2j+ipUlGRwS8ILCMBuiN
	AeA==
X-Google-Smtp-Source: AGHT+IFSsaj7YGs0xXvL7KvHpo4OHZS23TfW901WnGn1dNBw4UEq8HUBbyPz7tDSJuBwPv672jv+MkN6+4M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:2349:b0:20b:9365:e6e4 with SMTP id
 d9443c01a7336-20c63782bdcmr1094885ad.9.1728584740809; Thu, 10 Oct 2024
 11:25:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:25 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-24-seanjc@google.com>
Subject: [PATCH v13 23/85] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
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

Remove the explicit evmptr12 validity check when deciding whether or not
to unmap the eVMCS pointer, and instead rely on kvm_vcpu_unmap() to play
nice with a NULL map->hva, i.e. to do nothing if the map is invalid.

Note, vmx->nested.hv_evmcs_map is zero-allocated along with the rest of
vcpu_vmx, i.e. the map starts out invalid/NULL.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index a8e7bc04d9bf..e94a25373a59 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,11 +231,8 @@ static inline void nested_release_evmcs(struct kvm_vcp=
u *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu =3D to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	if (nested_vmx_is_evmptr12_valid(vmx)) {
-		kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
-		vmx->nested.hv_evmcs =3D NULL;
-	}
-
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	vmx->nested.hv_evmcs =3D NULL;
 	vmx->nested.hv_evmcs_vmptr =3D EVMPTR_INVALID;
=20
 	if (hv_vcpu) {
--=20
2.47.0.rc1.288.g06298d1525-goog


