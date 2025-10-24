Return-Path: <linux-mips+bounces-11888-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A4C0757D
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 18:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2E34507D02
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 16:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16DF271A9D;
	Fri, 24 Oct 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+guq7qX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DE26ED2D
	for <linux-mips@vger.kernel.org>; Fri, 24 Oct 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323622; cv=none; b=cpfKMkMDxOWWrwP7gLn4/qQFq3k6fOcxGb4xTLfjmEfEFL9RU+1vs9Pgq33auwg0e/T1b7LwcM3vQHzRjv10+fGEnnAxCWKtOe4a39NMNAh8Zbv25lpaDAwrQSG95Vrwzd3U9eCT+MLmaPmfmYNNpvWZteB7uhP40qD4v1thomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323622; c=relaxed/simple;
	bh=Z5gHvRc1WODjsQTzSZtHdDP0DGz77od9Vxxo/tfntr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JTRdi+a/1vyQgcOusDRRNpFLYkqwUpAE3h8z/H+eCZmsDN4eujURYvHyrkz2vjVDDqUq8edpE83iC0U2GoD8lk6V7mELj83HrhfnxrAwP751F3yf6dvDpom8dEQHb1PcKVONnQsbm8fKdK91LihyhmuylUoiD4NqG9aEKeR+myY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+guq7qX; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b522037281bso1398371a12.3
        for <linux-mips@vger.kernel.org>; Fri, 24 Oct 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=S+guq7qXK+4NrsVNV/bpyJ9RE8uOU1+4Xl8ecVZ4N1l/fGdcYuqBIsZtCvukd0sf2d
         PIVIsBo58cHgL8/QfPHW2L9iu01UXiNp5JhleUsXiQ0z/HGveo2lfPckObD27r/LvqQh
         PdnF6OrbwiaM4BfpK4dELTdp2eEpF7QRD0RDTN8nb+A+3RAHMyKtSN4gX6c8s4c9RVmq
         t2oAMewsLDHpysnFczekizuwWsn6LEMIgI4+IsFzphgcOVDWjsBoS0f3zo5CHz9POjqP
         xKcJWQiWeNaI2A6Lhzp+KH62uTERX01QcqFE9tdxRuV8s2UistWMLP6mEI+xNz24y8Tk
         W6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=kZc7Xp97XboU8HUWOrCFVK7+kfGF/lvWlW2scYvq+i1bxHUhAN5SVfb4MUmX7QT0kb
         /bT28KztVPD8C2eATjdtaOPlmRT/OhSOYmoY13X9/wbTPQghj4QCD1fvxjtwlgWWTrqX
         2rxrGlj7rZYD7X23wp+pGq9EPu7oyZ9maXxvNbQuaxp7WBg1cJpWmblX0M8zqaau2TZO
         2jtanUlwSH6pbuJ0ofOGh8kmdC0AuZEPNYXXOg/xR3B693fwi4vFbzMMJoD9O3ADk7Pg
         RnaHZtB1bIoA+A5P6su210iBrG2cHBlgUh8joDAxeWNl8t9uk46pN0SWhkcej64PrUeF
         mwyg==
X-Forwarded-Encrypted: i=1; AJvYcCWqRyWQ7hmbdor6i5+VCt7YGPwgxWHRA8H7CQSe1vxp4uU8VWE4wFtQcj1+h5hS3YDxvt608S+rCtSN@vger.kernel.org
X-Gm-Message-State: AOJu0YwF79Naq/wyuXONTYNu313CjeB/NnLDF+iubBqDw6nSSIWMBzEQ
	iEE7dYnr3VtWUqvf15vY17koJzaQavTdpfbsMewvSHjxM1JpMebQLdtIG3/lVELCWLK+ZdFLLJb
	r305W3w==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() =
as
> > providing a one-off helper for effectively three lines of code is at be=
st a
> > wash, and splitting the code makes the comment for smp_rmb()  _extremel=
y_
> > confusing as the comment talks about reading kvm->arch.pre_fault_allowe=
d
> > before kvm_tdx->state, but the immediately visible code does the exact
> > opposite.
> >=20
> > Opportunistically rewrite the comments to more explicitly explain who i=
s
> > checking what, as well as _why_ the ordering matters.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>=20
> One nit below.
>=20
> [...]
> > +	/*
> > +	 * If the TD isn't finalized/runnable, then userspace is initializing
> > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
> > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
> > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?

Yeah, updated (and then it gets deleted a few commits later :-) ).

