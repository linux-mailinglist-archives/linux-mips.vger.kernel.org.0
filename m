Return-Path: <linux-mips+bounces-4738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9877A948B3C
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 10:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244CA1F22C8A
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24961BD01C;
	Tue,  6 Aug 2024 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tYPRa2kB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199601BD011
	for <linux-mips@vger.kernel.org>; Tue,  6 Aug 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932724; cv=none; b=nfcTIkj0PY3+8TiR8/Eje/DLj2rfGg1lrNiPb+pGCnM/lIdNIUP7f7Q0RcyUP4n2jpSJq2qfllI6inV3YHpQevM4J2dslh9oUrA1n3MbQZ9V8kLMK41iZx58CcGLfMMjT5BmjaCDW22794IdbHwOkqtuOTix9y4e4ZDJgfMqzko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932724; c=relaxed/simple;
	bh=k7zHAEEEUxyRomVtvnM2viO2YFKTnrtBHjiLIBw6Z38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPxa1Rfo4eji1SFrkRo6dXGkZHseV29lvHoZEWrGVveaDwJ///2u6mZOvBOyM6sYKp4c0maqKuc/+4b/CRQKoVCWQ6JIR/bysCVz3lyTFg9XxD9vKHOKzhylP73TSjh/KDQCZXZd1fJIMl1m/TubaU2rxbPZiyImArmUhAJUaTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tYPRa2kB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-368313809a4so3707655f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 06 Aug 2024 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722932721; x=1723537521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=tYPRa2kB2odRm+MJ+l681PUDuyo3bcqu/eESNFU6taVOoHz5LAYAbhSqCGA8033Jla
         RqREqsEUfdIM0PbEM4MqsH5VsBeZnroBOHpCPFBxo/IUuFxB86M1shxBXmpHfaNN6fKI
         PqnjUs/RJSgDq8LaSoYAWSuCfg97pnKHR2ZLa/kTQozXbSTxGgTM5Z+Dntypd0s0dWDr
         EpcTrBH0lcgsKJg92ZjF8X8uK6ir6HAW1qo2NPmqGAD0GCSrlZbs9SAt9ObiH3ezsV6T
         YfqlquUFL/j3pLhEP8GPsOzmlMJ49JAeNPFBT+ZPJYIsK0HBlIgIq6Xo3F7erZXDW3GR
         GNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722932721; x=1723537521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=OYYTU7JcytjtI4t2hgG0TJDaSETKnwthhhsTGorhjJPliBX+yDvxCsyYIb9XIq+L87
         qDhkLQUmWu1qokx3h4ElSzYDalW/a1qapUxwKvFidsTeSWdJpgzX9KRydyuOiywMfkK5
         FD8xIGKVFL/l6nuN6XkrgeSH22d+lQle/dn3PaCTtIluqDfpSGnLFisFGKe3NmMoxUmw
         Hv+HI2//S0k+pd9wfCfMDagzgHHMSCnJ0kOQuFnWRmlYelf71J1+nUg2LVXPVW+jiZJu
         y4gCXaK0BM0nlP3pN/yEnXg3QKCFCS9nbkvhIS91BvT7KBjnQtxj7ikELol4Dbz2rA42
         Vs0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmmQxe8w5lh9Z/is8oWrjpgBPo7UafPBtPLjDZG0ynmyzQfZ4CU5vgzZrUo/Dh2T7QfOtJkMV6gI0i7lvDR7cOcLuE8/lR8REWqw==
X-Gm-Message-State: AOJu0YyJq7RXI5SHBoLSDjuF92tkishjuJCWKqfNALvxonZZClGZLZY2
	GM27DO15pBojV9sWO5IE3z5WIcf/e3qxU2y+BPioXvo8vMCqhZbL9ypqv8aBH1S9nPdR2sEhXUU
	aINIEN/Excj0H0XD5jFE33wfICX2dAJuNx717
X-Google-Smtp-Source: AGHT+IEuJVBQVgvvzdKoA/IljQMVSQQCy4ILUfIi4PfR2IcPP3crNOUdNiIGa90I2U+SlhluocGZ2/3ZifLac4nEAJY=
X-Received: by 2002:a05:6000:1151:b0:362:2af4:43cc with SMTP id
 ffacd0b85a97d-36bbbe5be99mr9354068f8f.19.1722932721184; Tue, 06 Aug 2024
 01:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
In-Reply-To: <ZrFfgzRbiqT-Zi2O@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Aug 2024 09:24:43 +0100
Message-ID: <CA+EHjTxZwDOeC94Y1otxcp-mcwUZA=TpQp4pav-E8Xvb2MA64Q@mail.gmail.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
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
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Tue, 6 Aug 2024 at 00:26, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> [+cc Fuad]
>
> Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> the page as dirty out of the critical section") that restructuring
> around the MMU lock was helpful for reuse (presumably for pKVM), but I
> lack the context there.

That was for some refactoring I'd done later on for mem_aborts in
pKVM. That said, I didn't know at the time that there might be a race
with some filesystems. I'll keep this in mind for the pKVM code we
have for now, and when upstreaming.

Thanks,
/fuad

> On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > page/folio dirty after it has been written back can make some filesystems
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
>
> typo: s/will/with/
>
> > the race is minuscule, hence the lack of complaints).  See the link below
> > for details.
> >
> > This will also allow converting arm64 to kvm_release_faultin_page(), which
> > requires that mmu_lock be held (for the aforementioned reason).
> >
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 22ee37360c4e..ce13c3d884d5 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       }
> >
> >  out_unlock:
> > +     if (writable && !ret)
> > +             kvm_set_pfn_dirty(pfn);
>
> I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> a reference.
>
> > +     else
> > +             kvm_release_pfn_clean(pfn);
> > +
> >       read_unlock(&kvm->mmu_lock);
> >
> >       /* Mark the page dirty only if the fault is handled successfully */
> > -     if (writable && !ret) {
> > -             kvm_set_pfn_dirty(pfn);
> > +     if (writable && !ret)
> >               mark_page_dirty_in_slot(kvm, memslot, gfn);
> > -     }
> >
> > -     kvm_release_pfn_clean(pfn);
> >       return ret != -EAGAIN ? ret : 0;
> >  }
> >
> > --
> > 2.46.0.rc1.232.g9752f9e123-goog
> >
>
> --
> Thanks,
> Oliver
>

