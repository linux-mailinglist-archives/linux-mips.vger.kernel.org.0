Return-Path: <linux-mips+bounces-12003-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67301C26734
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 18:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D704E563C86
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 17:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C6A308F1A;
	Fri, 31 Oct 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3TLlFyOs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4B33E374
	for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932095; cv=none; b=u9jCFo9OeWCUXSy6egeLljRixANIMmk5Q73D3vtoccoyM5yce4qbbd5WuIThWAQgsrtynaiHRBdhJ0PaDuw1eVr84otLIHfgMGO9blw1DwLwTz7ZXUQbqGTFn/w5BSR5iznhLwMkfesRAqTZD/4Z5MlrGZBZKRjtspsjPjnuQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932095; c=relaxed/simple;
	bh=tRSFG9dRXG0FAWpU/Id6Zgckz1056dIV6+Bvj3jPwAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PMPIn+E9A0OV9QUoId+49E8ceyD0EwFWeRa0zssl7ok0k0VlxP+kq1qcm0pfu3GsLzqbuRK8W1drb4OAYqgDPTn7pqMl5eqEnW5L+DmUytnJopxsFzV7cl+9L2KOtSU7/i5uHoUxv+2kpHDx7VeL6jH91iFNgC9+d+MEr+0cKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3TLlFyOs; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3407734d98bso1859937a91.3
        for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761932093; x=1762536893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=3TLlFyOsKZ39E3sP6F/sSgzfKLTE/aLQmWLs6nTpdumA2BQLMnXZaz4g4Ijjh9X020
         yzhlz3MQSfUwiLkHevuUuP6mFg/J8NIjBrZXeOk4gA0HUd30/Eu6Kr3vmVpPiZFc/JBd
         ME1qC+7XylwakWIEppEi3OFJULxxgsraCG0n0iqAjy60azEXEE1I6f8XCnPKSDWh7Xty
         Z1k0luwe1bzeGknhtm8KyNoTF0jgcRG9lHJuonwW5w0cGxy8W0vwnoyj3UchghrcOEeL
         Wg3sTxPDD3j45S2+9eIzWgnSyYA/md23HEQivpyw6xIrBagfmg8B2dCkBbREYSzCrwL5
         qpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932093; x=1762536893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=sQk63wGsdtgouPGbm2SI7cdeQXT3JWZK2kVO+oS1thSA5Nix5IfJlvFRVGjuTFLAUs
         C7WzU7ViqRLgJ4K2R7Xx6uaQ9TTbqOCLiUAzUA5cqgJ+ya42XT6s+u7ovGsWSTn7yGWh
         +2o7QvjUzMq/PYDEQRArJSsfLcWUDzjYn2C38rbfHpwnv0LP5FPtFq+OSmFE95DfXZh9
         psmoQWUm5QQB7w1mb6zdgcJjNn7en6RgV3GoLUg524hOD8QhoM5E364YazZMJwRHVszB
         OPgjfHY1i8OxfFY0CKIoDDXkLYd51uAO8NN1aZy+Jnlrp3i26/UQC9vsF0fNzdMIsZ4i
         PL5g==
X-Forwarded-Encrypted: i=1; AJvYcCXSMjUONh2Lt/n4sQ6wOedv2qY9GROffTdnutdcbWDhsQIAn0SdAM46XhA3ZgejCTZ0H8CyH3rzkSOK@vger.kernel.org
X-Gm-Message-State: AOJu0YxI2FFbgcL9y3GvP5aOLzOvSVs6er5SgtTNzzRYAYLLB1fDe2+W
	+qdtAeLhtrNluEJC/pvrkAkW5mHTQFOmXC5JxrGbOif0c6ec/oSAWWFaEBrTcGBWo/SPQ+5Pso9
	306e3tg==
X-Google-Smtp-Source: AGHT+IEhd62pQuR9tjnc3Il5ckB3BFxieNfGOf0XAASHT7mISEiuLVbYaHxfkZsCDA/umOxHYLwWX5NLxe4=
X-Received: from pjbmg14.prod.google.com ([2002:a17:90b:370e:b0:33e:34c2:1e17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4b:b0:32e:5646:d43f
 with SMTP id 98e67ed59e1d1-3408306e65fmr6078929a91.19.1761932092859; Fri, 31
 Oct 2025 10:34:52 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:34:51 -0700
In-Reply-To: <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-27-seanjc@google.com>
 <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Message-ID: <aQTzO7D1O02zQbcD@google.com>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 31, 2025, Yan Zhao wrote:
> On Thu, Oct 30, 2025 at 01:09:49PM -0700, Sean Christopherson wrote:
> > Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> > servicing ioctls that (a) transition the TD to a new state, i.e. when
> > doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> > state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> > the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> > due to racing actions, e.g. if tdh_vp_create() contends with either
> > tdh_mr_extend() or tdh_mr_finalize().
> > 
> > For all intents and purposes, the paths in question are fully serialized,
> > i.e. there's no reason to try and allow anything remotely interesting to
> > happen.  Smack 'em with a big hammer instead of trying to be "nice".
> > 
> > Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> > prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
> s/kvm_mmu_zap_all_fast/kvm_mmu_zap_memslot

Argh!  Third time's a charm?  Hopefully...

> > @@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
> >  
> >  int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
> >  {
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> reverse xmas tree ?

No, because the shorter line generates an input to the longer line.  E.g. we could
do this if we really, really want an xmas tree:

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
	struct kvm *kvm = vcpu->kvm;

but this won't compile

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
	struct kvm *kvm = vcpu->kvm;

