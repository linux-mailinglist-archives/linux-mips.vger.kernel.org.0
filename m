Return-Path: <linux-mips+bounces-11906-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA03CC122DB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Oct 2025 01:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F02E4FA118
	for <lists+linux-mips@lfdr.de>; Tue, 28 Oct 2025 00:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5931FECD4;
	Tue, 28 Oct 2025 00:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fgGyZuxZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BC1F4CBB
	for <linux-mips@vger.kernel.org>; Tue, 28 Oct 2025 00:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611827; cv=none; b=Qlb+AYojRnOZY8ELs3pzmG1Z4TNrco2R0/WdJ4FuTHYsGmGaw5RmmVToI7Dy8EhdlCR4GNEmSaIn0NbaXYN76mUUzVqxZC0GNK06OvbmNLPQdBWBOF331U+VasusFzm3AJF3ScRV2kYhBt4QSACorVaUUKFl/sVl6i2Ben5xs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611827; c=relaxed/simple;
	bh=QdkEAMsGYBzU3fN0cne5qZg46IOFvPzz9xbD2HV7VAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D5Ty51yS1V3Vz+p6iC7VOrpnFRLFheV0/QMvnz1FNZ6fFlPei0G3F/NAgzxp+fuYzu2M3LkLR+fKSN69rGBSaqscocGoNS6yxDrDBQi1lYpySqtWzdPCxR2SRXIsn4t8kGfIWTnDDua5cvqn44dSHF5EiQL5xoqKxO1YOk0CW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fgGyZuxZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33da21394adso5095044a91.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Oct 2025 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611825; x=1762216625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=fgGyZuxZxoFhZUStZEOkgSnMD24ZyWXS2V3OZAAoEIpZKU8UWL7ea7jebGj8oXRZvS
         ptJemZcBakmkJS9N0IfXOYbmFs227noHivg6R3O20yPkmSfN6CO3Z+ztmApH78+V4wmt
         05pOWnwPEevb+e4h2Kj2Wd6JDa9GkI1IV2nTOjdHOibYwC0gFwibdcoXY05UV62Pw4Jt
         R0EnzB+vHuohh8eubyLliqqfKvzIt796M3KNC4/Nk9AWUG+hg0xldQGNUzvRsLXI1D5d
         xlbZ9Aet7yAYgIk9a05o0KkrC2b3Kd/i7/JMRWGgCcPAqXVm8r1nF3ed8R5ApIm/AU0E
         O50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611825; x=1762216625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=J16HIkgeETkkeqUM1Zb8h+YYeRax+xq5jvMMVPIIorErnE/trOCCYj/qFcl/5NUhKS
         j36n+/FxrvRC4gXCts8YRbQSh8JhQU9Lms50pG7EYEQka8aZDQAYJ6ntIC7uqoWAoIUv
         CyEWFZYsdPxd1e3wnq0CXSBwvGG2XkhRroxYe3NxHGcNqGlyom/qq6jrXXt2UD/PK7Vc
         bpripNQPPqcyvy16gO/GArkJnNh7zvVFFmDuOo8h0waADGS6Ru9mvI/WbJeBsbEJPNIL
         RR4qzx9bRkPawF2PM2IGKDQ+LSs4gWKMppKvzsN4nKw2ws3/eX5NOkmWx/AvrlJWjE0I
         Z0ig==
X-Forwarded-Encrypted: i=1; AJvYcCWludIyU3o41UiDWWcGS5FhV0bl2wfk8paNJWtyajagj8IqEFWz+mZJ++klDOeu7W0P5RYPyBzFMb6k@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqvs+FfrYel++TKNWclslb1DtIEaHEKuOkZydOOzuPy1Sy6CXc
	hf4oenC7MD2qK449rFMvW1bSaKtk2LQlEpdPViiBrAKej9r895qhGlP7rJbvNGip7X1yaCRNlsE
	kpqefyg==
X-Google-Smtp-Source: AGHT+IGoxyiEdJHjsguM4HhfYAa3a3WGl9IwGzua+OMwKu3+3dxnKcX9NeqRP2yYPcwFhiCcHGTefjSDvqI=
X-Received: from pjcc13.prod.google.com ([2002:a17:90b:574d:b0:33d:813f:6829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:329:cb75:fef2
 with SMTP id 98e67ed59e1d1-340279e5c84mr1590788a91.3.1761611825209; Mon, 27
 Oct 2025 17:37:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:37:03 -0700
In-Reply-To: <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Message-ID: <aQAQLzxyGFooGtNV@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > @@ -2781,8 +2827,6 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *ar=
gp)
> > =C2=A0	if (r)
> > =C2=A0		return r;
> > =C2=A0
> > -	guard(mutex)(&kvm->lock);
> > -
> > =C2=A0	switch (tdx_cmd.id) {
> > =C2=A0	case KVM_TDX_CAPABILITIES:
> > =C2=A0		r =3D tdx_get_capabilities(&tdx_cmd);
>=20
> IIRC, this patch removes grabbing the kvm->lock in tdx_vm_ioctl() but onl=
y
> adds the "big hammer" to tdx_td_init() and tdx_td_finalize(), so the
> tdx_get_capabilities() lost holding the kvm->lock.

Ooh, yeah, nice catch, that is indeed silly and unnecessary churn.

> As replied earlier, I think we can just hold the "big hammer" in
> tdx_vm_ioctl()?

Actually, I think we can have our cake and eat it too.  With this slotted i=
n as
a prep patch, the big hammer can land directly in tdx_vm_ioctl(), without a=
ny
change in functionality for KVM_TDX_CAPABILITIES.

--
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 27 Oct 2025 17:32:34 -0700
Subject: [PATCH] KVM: TDX: Don't copy "cmd" back to userspace for
 KVM_TDX_CAPABILITIES

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1642da9c1fa9..43c0c3f6a8c0 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2807,12 +2807,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp=
)
 	if (r)
 		return r;
=20
+	if (tdx_cmd.id =3D=3D KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
=20
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r =3D tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r =3D tdx_td_init(kvm, &tdx_cmd);
 		break;

base-commit: 672537233b8da2c29dca7154bf3a3211af7f6128
--

