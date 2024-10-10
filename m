Return-Path: <linux-mips+bounces-5918-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADB999084
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE907284E4B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7201F9409;
	Thu, 10 Oct 2024 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOB3fNA4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911471F9420
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584747; cv=none; b=XUQaeZHEVj8ygN12yIMqTO3jgdrLj4CMOcyOWB+QsQaYGPg5nc6gF1FwIAoRPJgyHTEvDauSkRhErMGnHT+EFt9kcNwtbtVPX+5YK5VnXEgV4sYW1TfgE2w0wbNS9fYRma03hZfDAMUR+QYAAl09pRUsCFImNTbH1PUcpDvyq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584747; c=relaxed/simple;
	bh=H3zY/Xt0t+c4LMWpCCUO1umdZ2mHGDI4Sis4Gpw2f4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V0HI4gfCzEjFycC/+wOYIV22+VWWgInbTRcNeORlSqKsMJe75U4kZuxLXoV/PUWCLsTOniKXswhiV6ywrioK/mageKeMZ69iSQyA/r6SAKvnRpHIbnpWUUgC7TIZYshL7UX3BJJyCDytBp+kZXyWBqNGR4Z4S6je//iJgY3ApZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOB3fNA4; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6886cd07673so27431547b3.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584745; x=1729189545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=dOB3fNA47Ys/t2RsrBoFMYei+S0bW216ulRwWrnfXEdN8iMvrCGNtKMihXfXcvqKyO
         UwHBwAHc8CUabZz6ufuXBq9dDxqCduiUDhRaekZSGdsbD//eJIWik8hOLt/7s3rfOiEJ
         z1Uug1P8XEYf+oxXnQpeR8VnmbIOdQv4uB4mOAhxzWuOX9ZERNYGDzAES/UqOG5jy5PV
         rtiiw/BOtjrl63GJm9GZUYSl6rhmyGpAthr4RNSdMa+mvLJhz3Sbj/1MdqYhqoqW/Pe4
         JhLDjNtSaQNO119lhq8ZFAG0O0b9ck7954dyAKa4UuBRfnmamD6eqSzGHFWMXD7lGYjg
         mLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584745; x=1729189545;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=eFo2RoBeJZjidYJAZGtFa/evKREB64PJgYG8UcZ4HBFYZKt7IF5Tj/sjqp607EVqaj
         0O7QXo3TZhLs7SmdVZLpfVtDp/nPDsyDlNBmK61Uz+1dGhkfyWdobiqGXSglKwWYKktF
         BPJtd8I38RmjVRd34qUaRis9bTHlYRqAFZOOIltGhOQGDBmMYCIV+iuCgFLSHcxP+r6+
         4VxZrKdI2aTEoFEt16snQGPF0g2D91mOHMnfeX9I4Bca/x9VWa7S3c3R69DTCiOFKb4l
         CGmbUunCXg7oQ4y9L3ibB0JLHKQ/J7jsbG3VmPzyFGPmp/wBcLZUbihXiaImW0TfgLm8
         OxMA==
X-Forwarded-Encrypted: i=1; AJvYcCXFc/uNwZbZw/3vxKIOiHJ7Nv5UMt8GTmcmqXSRFT1SvtUMzuCBkXgN6zSWXNEcngbzYPs9pF8tY7+H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/BV4SU8S7StDg8/YVVGeRLy+SaaqAWEYKc4oQSHiowQYkuVS
	VVJYuwoiJsu+v9JjQeyuQzt3mWQgFRz6CFoHO1FuLJrSxCg18B3bg5T9I2iHiEhoCiWrNpUtqYP
	+MQ==
X-Google-Smtp-Source: AGHT+IEdX//xUJq0LlzHSFsWnzcNANrEE9KtnndGvFzP5BAu23zXYFVXA6eeBi51F5M5i08FgAsxiLe5HbY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:300b:b0:6e3:f32:5fc8 with SMTP id
 00721157ae682-6e32217bbe0mr502817b3.1.1728584744665; Thu, 10 Oct 2024
 11:25:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:27 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-26-seanjc@google.com>
Subject: [PATCH v13 25/85] KVM: nVMX: Add helper to put (unmap) vmcs12 pages
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

Add a helper to dedup unmapping the vmcs12 pages.  This will reduce the
amount of churn when a future patch refactors the kvm_vcpu_unmap() API.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index fb37658b62c9..81865db18e12 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -314,6 +314,21 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, str=
uct loaded_vmcs *vmcs)
 	vcpu->arch.regs_dirty =3D 0;
 }
=20
+static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
+
+	/*
+	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
+	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
+	 * and if it is written, the contents are irrelevant.
+	 */
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	vmx->nested.pi_desc =3D NULL;
+}
+
 /*
  * Free whatever needs to be freed from vmx->nested when L1 goes down, or
  * just stops using VMX.
@@ -346,15 +361,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 	vmx->nested.cached_vmcs12 =3D NULL;
 	kfree(vmx->nested.cached_shadow_vmcs12);
 	vmx->nested.cached_shadow_vmcs12 =3D NULL;
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc =3D NULL;
+
+	nested_put_vmcs12_pages(vcpu);
=20
 	kvm_mmu_free_roots(vcpu->kvm, &vcpu->arch.guest_mmu, KVM_MMU_ROOTS_ALL);
=20
@@ -5010,11 +5018,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm=
_exit_reason,
 		vmx_update_cpu_dirty_logging(vcpu);
 	}
=20
-	/* Unpin physical memory we referred to in vmcs02 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc =3D NULL;
+	nested_put_vmcs12_pages(vcpu);
=20
 	if (vmx->nested.reload_vmcs01_apic_access_page) {
 		vmx->nested.reload_vmcs01_apic_access_page =3D false;
--=20
2.47.0.rc1.288.g06298d1525-goog


