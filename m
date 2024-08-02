Return-Path: <linux-mips+bounces-4689-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27809463EF
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 21:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BD6AB21CDE
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 19:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E7A4437F;
	Fri,  2 Aug 2024 19:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vReEFtMb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65A24B28
	for <linux-mips@vger.kernel.org>; Fri,  2 Aug 2024 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722627132; cv=none; b=GqvV02MQVk0C6Y+Qmg4kIqgLaONcR3LJQygwK4QeunD6ef1zctHp+qXHKmsEtXlRuFFlozzeixQhdHaE6v4t/UbrCmoz65ybN7DOyX4aRnk/YMiLTBWgWYoBikLsyueVbvP8xtFBc/+qrkVzGGrS53yZ9kxxUkeVcO+SMxQhyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722627132; c=relaxed/simple;
	bh=csd0MkbfiRZ32mkpXZ9twM9kRQL1vy8OM+kdMsU6aRQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mnZ9xlt2R4S1TVr+XKEb6wTe7/vSmkniaxRdxoxCJADk1B4WjUgmWbOF/8gY5H2B5/41Afau7ur1Anh6EyXqQmUbRVAEZWcQk0oKjlNSIx5oaK/ez+5G92MXryJd11tLllj98IvGBsUesuQLECTm9wvPn/LzGKf/cJ0DKycfRDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vReEFtMb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2cfe9270d82so2854031a91.3
        for <linux-mips@vger.kernel.org>; Fri, 02 Aug 2024 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722627130; x=1723231930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=vReEFtMb8CAFhD48LXhHNrq42SN4FMUwrKuHu78nDaMkuGiLYNH1S3ueug3tXdbDSD
         q5/zS/NxBlhvweltAffWXpLjFA5ySn6JAucM8gptfp+77wlNo33nuMzRmAFXoqKiFujy
         6mwzUX4RAO5+z24IWxRWuO3kF1fGqaF59au7q9oQbBS2XmJxRikAZTTvt4I04CpjPrSa
         S6fxMg8+gTW+e1qpQ46Y2+B23wGX7N6vDh2eewOPELlk5rV7qX1tHxZoJ3XqWw11R+jx
         Luz+GmqHYSNzPr/kjcU1hIY9WUn9VQat5QdbLPsFxWpAIPbZ39r2dQTyic6l7T55ERUj
         ejwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722627130; x=1723231930;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TTqa7oavJrWkxSTFWtVmMnGsBDrmN4Dgl5PSeoZtRS0=;
        b=KD98OktGI6RlRaIbJn8efGpZ1eP9WX03Ee1mxTbRnZTWpcthuNUwIYaZ+yqlfC3s7q
         24Mi6pdjaOoudUmILAmToVt9++ssgEII+h1Ee9/NQsuZfce9LajDcT844GldEe+07bes
         cmB5ZlHKvdsW3DZzP0KJIQR3645+rllGwZR8QLKncxP3dExSktGu8csPygxxNqfylB95
         U01pik3d1+weo8QmgKYei5y/fF8eedV14UohFHpt5kJMSK4t2DiOj8ejfTkBhAm7N3kX
         OdFVxGgxxav12hOomflPhXrA09yhCdnnrpG4x/Fforybg+Qy8lpuMgr9B69cGdNeZ5JE
         E9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWLFMtACerNCfIApHMC1ReCwJlw3s7qnETrcHkmzK6TDNcQI1dzvqwFCb/h+YeZMl+eR8GCG4iuFIyb8az22yk5J2nmLyg380sCjQ==
X-Gm-Message-State: AOJu0YxzwqNYCz0oLb4Dr//kUNqOt2/0JQQBflF/vJ539IF8WTIa2H73
	w4m3A+K3fab+nduaRuzUSLn1idErxIAqYp7NfDLMhwTaNfYs+AT3fObP2IrjQt4Or0Vdx1H3q8Z
	FMw==
X-Google-Smtp-Source: AGHT+IHxpD4UvI3cH5YcMAfSn5X/q5FbzhvcZwiTnoiXfWEKupcq/mKgFqqrl+E4nqq+ftOi/sOAAYuzYXs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:50cf:b0:2c9:61f9:9b27 with SMTP id
 98e67ed59e1d1-2cff9526286mr68117a91.5.1722627130434; Fri, 02 Aug 2024
 12:32:10 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:32:09 -0700
In-Reply-To: <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
Message-ID: <Zq00OYowF5kc9QFE@google.com>
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
From: Sean Christopherson <seanjc@google.com>
To: maobibo <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2024, maobibo wrote:
> On 2024/7/27 =E4=B8=8A=E5=8D=887:52, Sean Christopherson wrote:
> > Mark pages/folios dirty only the slow page fault path, i.e. only when
> > mmu_lock is held and the operation is mmu_notifier-protected, as markin=
g a
> > page/folio dirty after it has been written back can make some filesyste=
ms
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > the race is minuscule, hence the lack of complaints).
> >=20
> > See the link below for details.
> >=20
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.c=
om
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> > index 2634a9e8d82c..364dd35e0557 100644
> > --- a/arch/loongarch/kvm/mmu.c
> > +++ b/arch/loongarch/kvm/mmu.c
> > @@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcp=
u, unsigned long gpa, bool writ
> >   		if (kvm_pte_young(changed))
> >   			kvm_set_pfn_accessed(pfn);
> > -		if (kvm_pte_dirty(changed)) {
> > -			mark_page_dirty(kvm, gfn);
> > -			kvm_set_pfn_dirty(pfn);
> > -		}
> >   		if (page)
> >   			put_page(page);
> >   	}
> > +
> > +	if (kvm_pte_dirty(changed))
> > +		mark_page_dirty(kvm, gfn);
> > +
> >   	return ret;
> >   out:
> >   	spin_unlock(&kvm->mmu_lock);
> > @@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, un=
signed long gpa, bool write)
> >   	else
> >   		++kvm->stat.pages;
> >   	kvm_set_pte(ptep, new_pte);
> > -	spin_unlock(&kvm->mmu_lock);
> > -	if (prot_bits & _PAGE_DIRTY) {
> > -		mark_page_dirty_in_slot(kvm, memslot, gfn);
> > +	if (writeable)
> Is it better to use write or (prot_bits & _PAGE_DIRTY) here?  writable is
> pte permission from function hva_to_pfn_slow(), write is fault action.

Marking folios dirty in the slow/full path basically necessitates marking t=
he
folio dirty if KVM creates a writable SPTE, as KVM won't mark the folio dir=
ty
if/when _PAGE_DIRTY is set.

Practically speaking, I'm 99.9% certain it doesn't matter.  The folio is ma=
rked
dirty by core MM when the folio is made writable, and cleaning the folio tr=
iggers
an mmu_notifier invalidation.  I.e. if the page is mapped writable in KVM's
stage-2 PTEs, then its folio has already been marked dirty.

