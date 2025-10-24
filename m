Return-Path: <linux-mips+bounces-11889-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A7C07574
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 18:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037DC3A9927
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 16:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3746927D786;
	Fri, 24 Oct 2025 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S98sl5ZV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70B26ED2F
	for <linux-mips@vger.kernel.org>; Fri, 24 Oct 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323747; cv=none; b=YLbzOx9Nedfx5tZGO5E3ZIxr4vWK8UoadJz2Fh42ywf9uWmryc7Qc/Whl1aGQtRLOy8hX/ZMHmhZaCdc88gQHmEeTklr9pQ4npp0QFlNKAmz0iO0bpUaUiqsxQssOAQQpySxr1WXMPK+9/jtQbLnfKKk3K0DTpaz8zlj9PeGSO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323747; c=relaxed/simple;
	bh=s28pXsj7j48oGy0M5J0TJBpSlcMgbzBpynjpCatcGWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uuorGu3efuEF+49KRODh0SfnKLjB3DwU+eV3s/n9+PYyhzS1DeR14t7srWXKVUP+feRkvGYdwtdWrwaBDz8qI8+52thHabyuFAdDmXZLWJychCgW/PcZNM48q7XPj4gc1Wux39fRb/2m/84Kdc8Ihgxdv+z3BucSZK8nSyr64Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S98sl5ZV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-27ee41e062cso25925935ad.1
        for <linux-mips@vger.kernel.org>; Fri, 24 Oct 2025 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323745; x=1761928545; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=S98sl5ZVlIfJITCmpiPM4pNhlCKBX3Eb20XqdPrNCytlHZIMG36yne3iWraYfyOdpF
         i7Xi/yDHMtdGBjUnwhwX1ulpj1fOU46lg9dzAPAKDx6cmIKjafL0Vp6Qm43FqsiCQQQz
         EZyYammqXFkIOM1mg2jJYZR1WV0u+REXDs8cx5Yxy9Cs2nnb1t16qJtZ6LP67JAqXSMZ
         6W6d6pMVo3c6vF9ORolmEM1SHhTT6BvYL42JIZPjWpwKWVsI0Ak/H0Pj9A6T7Wdd1T5i
         Y+nwXy1qFeoiV1en4G1PoKJw92OivvwYXcuC8RHZylrO7+PmUbuxNMR3V62E4jeMB+Ul
         25xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323745; x=1761928545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu0gmfEAQ+U9vhoL2h/iCeG4Q5kdgS/ChdUsj5vfglQ=;
        b=EmGTSiHvV2uzxbtwIZ3YrzMXzfT/tSD7oD767tbLbDuyIc8A/UAJsrElfah+PhrFeM
         mRkYszM3ozDsYdfbEVpaI6ElMWvpz+3UCvOv7xO3V2SFaDyJWRDvipXhCeVK0wJJSHhj
         vzhzWrjXv4SbZkEps1VnS1iLaM8yXrwHz8XQPZAv8qpKXn3O21faIqeyXHQyM7483h71
         rjk6bM+gLyNp4cD3Ol9Z7cQyQeIRFKPFa+5ZbGmz1zv4xO2L3UMPYyQIz66jASUylOFY
         yViDootjemsNo+9jvvr93PF5dNd1W2q0zZHilEof6iotCji47JCsTpE2Q71O9bxacNKg
         D6CA==
X-Forwarded-Encrypted: i=1; AJvYcCUFBq/CvQYtsdBKx817RCZj7IwuUELx+1gdEQk81txyV2dCJ4+MGR0bRi/LEzSpqmuxRxoaBG3invzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5eNWCDpte/YB+DzH6ZOvQrxij6nAQtWnPELDwNDAsOHIoMbPt
	zYUWGoGsIRqViibOXnARyNIpvv6eVQGNIpEPFBEO3I1NWc85vVE3ZXymGyDj8XhDiDgVJwvndKU
	dBjeVLA==
X-Google-Smtp-Source: AGHT+IHEqEX/8GwSPDTtO9R4g/+ZtFO0C94Pe4ULgHF/AbXONvqtNga/vyT3hE3hD5zVd0KE3EnoXL2eWbI=
X-Received: from pjyj8.prod.google.com ([2002:a17:90a:e608:b0:33b:51fe:1a8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db05:b0:24e:3cf2:2450
 with SMTP id d9443c01a7336-290c9c8a5e6mr368813165ad.2.1761323744332; Fri, 24
 Oct 2025 09:35:44 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:35:43 -0700
In-Reply-To: <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-15-seanjc@google.com>
 <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
Message-ID: <aPuq33-qEJsDhdgG@google.com>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
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
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 23, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > mapping is invalid, and it should be impossible for the S-EPT mappings to
> > be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> > 
> > Holding slots_lock prevents zaps due to memslot updates,
> > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> > entries that can be used for the initial image.  The call from sev.c is
> > obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
> > so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
> > __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
> > image, the APIC page has its own non-guest_memfd memslot and so can't be
> > used for the initial image, which means that too is mutually exclusive.
> > 
> > Opportunistically switch to "goto" to jump around the measurement code,
> > partly to make it clear that KVM needs to bail entirely if extending the
> > measurement fails, partly in anticipation of reworking how and when
> > TDH_MEM_PAGE_ADD is done.
> > 
> > Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
> 
> So IIUC this patch only adds a KVM_BUG_ON() when TDH.MR.EXTEND fails.  How
> does this fix anything?

Hmm, yeah, I'll drop the Fixes.  It made more sense when I thought it was
impossible for tdh_mr_extend() to fail, as returning an error and not explicitly
terminating the VM was "wrong".  But I agree it does far more harm than good,
even when relocated to the end of the series.

