Return-Path: <linux-mips+bounces-4766-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 550C3949422
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 17:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09AB9284670
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 15:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A021EA0A0;
	Tue,  6 Aug 2024 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="iKoKFFTL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE367200131
	for <linux-mips@vger.kernel.org>; Tue,  6 Aug 2024 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722956674; cv=none; b=qJamHW6IeIjh1dieE8eyKzVGyUV7abDYF6vnb/lawuOyWGEPyD0KLK4YiJLRaxlqabsIGZ8wxQWI4JxXP4mumcDmSwcB7F6mSwMivVZemV6MOpHDv5wEDneCpd5QeA9nP3X70CHZFZPBTbZTOe5lFY4bnUREgzq8JWQBUUTF/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722956674; c=relaxed/simple;
	bh=LUNW9RUIstkrjibzIwDixQZwd8z0VowIYpuqj/xpKxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdFCg4eihC8wRxA8ZBdCKBmFszFAkSFr8EEAI2YlDbnFzF8QUp8QCRC2LSZkmOK0v8h9eAOuj8dRglG4myk8gPdnIYJIFiMjmHmHpBazqaAHrxyxMHoWC41GHmLKm+1SDQZhlAS8My7J5qL7GIK6nX4BueXfjMXTMXSFTf1O4Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=iKoKFFTL; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-81f8f0198beso35641639f.1
        for <linux-mips@vger.kernel.org>; Tue, 06 Aug 2024 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722956672; x=1723561472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=iKoKFFTLryYPOWUdBF0OmGS7FVRhwN5ye0tJ32Z2psvZeXuSZkRDLQaQnzb+ToFDLk
         KcClRqddrYOGLA2n9ajYccWuyVKbaxWA01PvF6mHH5+Xa6s1ATIe4rdPFER2wkNhm3SZ
         3A0l8Dwz74GoTqqRm6EZssrDCa2FhAEZuSR84i3HlHV+eTz0m5WynBx18WH7lfi3dhTU
         M754ZlFDs4GmF6YjEUz8YF7xD/Oz/7+XsyAFsMOqdZeBB1T36GQKiJByqYeK167L5FoH
         KC8ubMrA2D+NzQJgOC1iUcrDlXTYzdZbBTJACJuxZE/o3gKv5X/A5lDTWgvdf6kAaEjL
         QAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956672; x=1723561472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLbAu/3JQVhbekGE1m18EyrvzfniM5U0p+PtTw3SPlQ=;
        b=xTSlxsPR0toEROs0Yb/fFE2B1R5TWwTacs1uD3m6FfNnNQilwEOKiOF18TlXtDtB/Y
         KB+qombNzgzxzYHK2rWqViox1v4FqxHQgOivedBmixYm+dMi2qU4M4EGCV9LxGCXKqI0
         qXEJ9NNv6PYRZ6GTBoA1Y4okfikaFQzLzaBrFiiZZDF2xzm9stpQOHK4PQoqU6nNgaeG
         N7Jj7KjU/aBIxSmzGyNzYcHBxwyrt7VmzQaqI3/KdPX6BtuAULM2uneCjfP2Cphhs999
         6fsRjvp+cfTmMAwwyWolb2/Lv5JCYqLW63K0rj6nc+5XT9Sd770LQLPOb/wI9ZbQORHe
         D05g==
X-Forwarded-Encrypted: i=1; AJvYcCVHyRrHxVYv2w+4UpYUPIIO2lFZRtfQC/te2h6qNZ3CJI/RxviEcfmoi24mRp75IWtF5YDtO8P154knerbvTFkZK7vohgcsuTy8Lw==
X-Gm-Message-State: AOJu0YwnHPmSW5wB5wwQrjc4akpXPfmCSWqL/hVUnhb5f7kEE1c20cgn
	KAGkpmAfbcQAqhRhyMMFY9nd4vESgT01uHSU9CfKTaficUfD9AkZQ6dSOe77q3rIWg74fWEZnr5
	sGXHfd70GR29NX4C9fsv3o0pofoCib5NOO7ro/Q==
X-Google-Smtp-Source: AGHT+IHdYOEWf6qlsoZVXjSZ7lVz4nHt9XoyHycNquwMn333FMaz4B6ys0O5Sw1BKpWpYjBg2+pZRslO+PRicrnJai8=
X-Received: by 2002:a92:d1cd:0:b0:39a:e86b:a76a with SMTP id
 e9e14a558f8ab-39b1fc2bbbdmr148654105ab.26.1722956671518; Tue, 06 Aug 2024
 08:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-59-seanjc@google.com>
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:34:20 +0530
Message-ID: <CAAhSdy2whfRBm9HBkr=gSwxpFHGwGtB70fKNCqG1-MeHmB1K7w@mail.gmail.com>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 5:24=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
> are new APIs to consolidate arch code and provide consistent behavior
> across all KVM architectures.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/riscv/kvm/mmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 806f68e70642..f73d6a79a78c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>         bool logging =3D (memslot->dirty_bitmap &&
>                         !(memslot->flags & KVM_MEM_READONLY)) ? true : fa=
lse;
>         unsigned long vma_pagesize, mmu_seq;
> +       struct page *page;
>
>         /* We need minimum second+third level pages */
>         ret =3D kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>
>         /*
>          * Read mmu_invalidate_seq so that KVM can detect if the results =
of
> -        * vma_lookup() or gfn_to_pfn_prot() become stale priort to acqui=
ring
> +        * vma_lookup() or __kvm_faultin_pfn() become stale priort to acq=
uiring
>          * kvm->mmu_lock.
>          *
>          * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pa=
irs
> @@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 return -EFAULT;
>         }
>
> -       hfn =3D gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
> +       hfn =3D kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
>         if (hfn =3D=3D KVM_PFN_ERR_HWPOISON) {
>                 send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>                                 vma_pageshift, current);
> @@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                 kvm_err("Failed to map in G-stage\n");
>
>  out_unlock:
> -       if ((!ret || ret =3D=3D -EEXIST) && writable)
> -               kvm_set_pfn_dirty(hfn);
> -       else
> -               kvm_release_pfn_clean(hfn);
> -
> +       kvm_release_faultin_page(kvm, page, ret && ret !=3D -EEXIST, writ=
able);
>         spin_unlock(&kvm->mmu_lock);
>         return ret;
>  }
> --
> 2.46.0.rc1.232.g9752f9e123-goog
>

