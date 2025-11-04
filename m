Return-Path: <linux-mips+bounces-12040-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45034C327C3
	for <lists+linux-mips@lfdr.de>; Tue, 04 Nov 2025 18:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D4584E39A0
	for <lists+linux-mips@lfdr.de>; Tue,  4 Nov 2025 17:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA887337108;
	Tue,  4 Nov 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g2kNi4TS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68644329375
	for <linux-mips@vger.kernel.org>; Tue,  4 Nov 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279134; cv=none; b=FYEZoYdqo5XAioIsA0JnBh0t9aurvm6i1J9unaZZW4mKwfCwS5HY2BfKyG1e5oDEppwO3iVzs+/zIRa7BjnPK5ywCLuKkc2DPBfWYpjSa7xWVo76BhpTQuf5izB+NefuMgKxzLShodCWUNoWS/zRe5NvmyP2LYzmJjl2BDDtMRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279134; c=relaxed/simple;
	bh=M8hteS49kDBBnmC972KvrKrHthGw8+MuUqHN8fekdI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rGkLZrI1xE7YAafoPoYNMXljjri13hb8Ck/DCIT78XvwODJGEb2F0Y2boY5NojVgQJuMvwK00JMZ/PH5lkw8+5QheHkP0rdn2Z8lNogOOmdQMH1ai9rX0fPyKVEckfbueO1rPxZCuvpgRRDWHm66a73soMMXV5LGYI5MaFv7hmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g2kNi4TS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-295592eb5dbso37882165ad.0
        for <linux-mips@vger.kernel.org>; Tue, 04 Nov 2025 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279133; x=1762883933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=g2kNi4TS0fhFySox+vfyeebQMICDYfFWWT16X4bYfp/CkS5n94JN6/0S7IOoRkQk06
         qgRwW+mxLsg0bmaMSvvpxawCzdNLpQZY7nwFXNdCTapkuBKVn1k+nzQu6XgcknhTeVIe
         mAky9pOZHG76ics0INdEgmUiKSspTqqo+vVnVE0QJ7amB4CRut6Wr3YD5SVesImRX/OZ
         oh8S9lQkG8QvWhtKBLOVDt56/xX9buqOypkdNm7/wb4UX8ygiM3maiAKI2nx6oLYsl2Q
         KCW6qoL0fyocQ3UO+vq8Q8eyJE+IM2mPIr/iDdDs8lQ2kOxwr75sPeEZQKpQGAe86ZZu
         3yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279133; x=1762883933;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sTsoW0ur76ePtMo7HcuL4NYZdCCENhkyANXlSBYjqrA=;
        b=nyLF+5OjDQOiEzE367OTWO8UHKWkr55ivIgg1w0NEFFf3jSuQQnBOFveAw9L+3GRK1
         meGbQRyv8eNW/aBn2R5aLeiqTcx+X70bQGg8Jm753QgqJ7qW2+QvXqixfvePZeDCi98u
         KSA6E03sLU9y9PrQcyv/p4XVqkM+Qb+a3SEo7ZZgl4REQlnDtWNWpfgQ0hX+mtFJDhiL
         ooiNLlscWzQXW8tA3m1Xc42p5xE76lfz5abhFh+YLB9fX4jJK7fHD3Ut7iTRBjDA2hyG
         W9brBwFBy8N4v/sz4YStlwnK6L6r3M90LwDiSi/azaBOZN3ULmOskeNd0Y6q4eUrO3l2
         JUdg==
X-Forwarded-Encrypted: i=1; AJvYcCX7ISHr1U3/niJANA9GaIhzmSrhZ2JYsQOr4wiSu+5oBc5nkE3M6BphrEiSwgx3x17Vs1bMKQiKvtOa@vger.kernel.org
X-Gm-Message-State: AOJu0YwCe7rPgaYdVplLoOrrK5mh/GqU95bV8LIkS5k4fevbGaUpoBjT
	HZ16XlGHrRhqMWrIfA2uRvE7KvwKRLDoEiSZY0SxmrK99VvFfwJeudf8r0yZ/bTbbtdda1K5se4
	5KKZ93w==
X-Google-Smtp-Source: AGHT+IHo6/KH4EkXGXP40ZLufzSsgW7yh9/qU70MiYfxQR70XqX2CyQgg6697l1DVe5Ug6vhYlNvwdh/uJA=
X-Received: from plok6.prod.google.com ([2002:a17:903:3bc6:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:295:4d97:84dd
 with SMTP id d9443c01a7336-2962adb8f9cmr4243385ad.51.1762279132506; Tue, 04
 Nov 2025 09:58:52 -0800 (PST)
Date: Tue, 4 Nov 2025 09:58:48 -0800
In-Reply-To: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
Message-ID: <aQo-2OQd8ktU0ygn@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-30 at 13:09 -0700, Sean Christopherson wrote:
> > v4:
> > =C2=A0- Collect reviews/acks.
> > =C2=A0- Add a lockdep assertion in kvm_tdp_mmu_map_private_pfn(). [Yan]
> > =C2=A0- Wrap kvm_tdp_mmu_map_private_pfn() with CONFIG_KVM_GUEST_MEMFD=
=3Dy. [test bot]
> > =C2=A0- Improve (or add) comments. [Kai, and probably others]
> > =C2=A0- s/spte/mirror_spte to make it clear what's being passed in
> > =C2=A0- Update set_external_spte() to take @mirror_spte as well. [Yan]
> > =C2=A0- Move the KVM_BUG_ON() on tdh_mr_extend() failure to the end. [R=
ick]
> > =C2=A0- Take "all" the locks in tdx_vm_ioctl(). [Kai]
> > =C2=A0- WARN if KVM attempts to map SPTEs into an invalid root. [Yan]
> > =C2=A0- Use tdx_flush_vp_on_cpu() instead of tdx_disassociate_vp() when=
 freeing
> > =C2=A0=C2=A0 a vCPU in VCPU_TD_STATE_UNINITIALIZED state. [Yan]
>=20
> Do you want someone to follow up with a v2 of this after the series lands=
? (with
> Binbin's verbiage comments incorporated)

Feel free to send a v2 now.  Or just reply to Binbin's mail with the update=
d
comment.

> https://lore.kernel.org/kvm/20251028002824.1470939-1-rick.p.edgecombe@int=
el.com/#t

