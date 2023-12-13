Return-Path: <linux-mips+bounces-718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CC812183
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 23:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 688291F21324
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 22:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0157FBD3;
	Wed, 13 Dec 2023 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3WyYytAH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF10107
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:31:56 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so4890a12.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702506714; x=1703111514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=3WyYytAHSD/eQrWR1CM3X7lfeJA3uh4lj3ZLT8vdGgj5uZo05UIwZZ3Ct2IJMvfQLI
         1LowL9UkjNCYdjtqWS1gvMlyTFKQ5UWxsNNhmmN0TRkJrAUJkv812PUk1+e/N3YyT0S6
         85Sk+y/MAdZPAqB4PnxBeKUjr3gLmbkuJgTsAdfncY9zbmOTXd7lSS2vHYEbXYXLGTqz
         EgnYnUUn6WMBsIZHojSEFjp7nFlmPxTur50Xl4Ll9huTCcRUZCdGrB6rG3072odabJDV
         qdCpKSkcrCAHH7kF29tctVkeoxvekpOx9RirkLNtj+PWeHAjmnHBE+ZmupWfEdNJnces
         cWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506714; x=1703111514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PgJaJWhApgF9FmIhLYdcKhchOF9hVT1X2VoAnpn0Ao=;
        b=hUnInOgLt+NwRKatBvZH+/KNYtF6VnEubj5GrVuTUiCbDxrYdnSY0e1uOhAOMzQqQz
         ZwxaZAXv8MSCMUZYssDftV5Xjpmg3uUCw9jBFn1kFXU1+upMv8KAzD7ZSVpazGQR0kfy
         7cAVm/UbvBJdwEPPlCtci7ah1udi/J9logD3QG548mhckGXAfSuUd+R/Iwim0P1uy7Te
         YLSlW1XRRvv+qh8OaqUKDpeccgDXMCq95iAKOcugA4D5mVz3fVxlFx3bwhMYo5t0Z2wb
         ioIhaOwjvmPnzQs5bdGs4DPeNdhnbpylRQWBCRXh99PNLtcyVhc9MvoTnbiZdCBAI+7B
         jv/A==
X-Gm-Message-State: AOJu0Yz9Si6fZK7zTdnbTdzjZp6T5sNtMwzqTWCRHEAF3Zx64rkC8Ktd
	VQyvWx7hrL9N92nv/vbvQ4mkceH/xW1Ud3zf0DEtlg==
X-Google-Smtp-Source: AGHT+IETGng/qZp64XWpPY6SM575xAjiFlUFwCCdv1u6UWr+/vXroByM0/GH9N8F8x7DGSWZmaydB5N9a7FN1v/1FZ8=
X-Received: by 2002:a05:6402:35c5:b0:551:9870:472 with SMTP id
 z5-20020a05640235c500b0055198700472mr314909edc.1.1702506714443; Wed, 13 Dec
 2023 14:31:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com> <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
 <ZXh8Nq_y_szj1WN0@google.com> <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
In-Reply-To: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 13 Dec 2023 14:31:40 -0800
Message-ID: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, alexandru.elisei@arm.com, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, borntraeger@linux.ibm.com, 
	chenhuacai@kernel.org, david@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, james.morse@arm.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	maz@kernel.org, oliver.upton@linux.dev, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 2:25=E2=80=AFPM Maxim Levitsky <mlevitsk@redhat.com=
> wrote:
>
> On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > >
> > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interr=
upt().  That
> > > > thing should really be folded into vmx_has_nested_events().
> > > >
> > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing becau=
se that
> > > > specifically checks if L1 interrupts are blocked.
> > > >
> > > > Compile tested only, and definitely needs to be chunked into multip=
le patches,
> > > > but I think something like this mess?
> > >
> > > The proposed patch does not fix the problem. In fact, it messes thing=
s
> > > up so much that I don't get any test results back.
> >
> > Drat.
> >
> > > Google has an internal K-U-T test that demonstrates the problem. I
> > > will post it soon.
> >
> > Received, I'll dig in soonish, though "soonish" might unfortunately mig=
ht mean
> > 2024.
> >
>
> Hi,
>
> So this is what I think:
>
>
> KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> to check if nested APICv has a pending interrupt before halting.
>
>
> However the problem is bigger - with APICv we have in essence 2 pending i=
nterrupt
> bitmaps - the PIR and the IRR, and to know if the guest has a pending int=
errupt
> one has in theory to copy PIR to IRR, then see if the max is larger then =
the current PPR.
>
> Since we don't want to write to guest memory, and the IRR here resides in=
 the guest memory,
> I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_=
interrupt' and call
> it from  kvm_guest_apic_has_interrupt().
>
> What do you think? I can prepare a patch for this.
>
> Can you share a reproducer or write a new one that can be shared?

See https://lore.kernel.org/kvm/20231211185552.3856862-1-jmattson@google.co=
m/.

> Best regards,
>         Maxim Levitsky
>

