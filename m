Return-Path: <linux-mips+bounces-719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C88121F8
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 23:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2D621F21794
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 22:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257E181854;
	Wed, 13 Dec 2023 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpmQelrF"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB32F7
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702507458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
	b=cpmQelrFh2kfK6YmAaEdPqt7RajsqRJSunkeJfJTASYW94TaRPxGBt+fOxSasRF2ErfZvi
	TW3qd5Yh3eisKlbeLrxWoYrpZKVqD2+KBIc+puJfCu6ZvF0wcEjBM3fzSsOikvm5CTq5NR
	g9mllIu7kG63mgYKm/fNqytDuVrI6BQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-MttPWZa5NPWPmbnp5jVfbA-1; Wed, 13 Dec 2023 17:44:17 -0500
X-MC-Unique: MttPWZa5NPWPmbnp5jVfbA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33340d20b90so6238682f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507456; x=1703112256;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
        b=aasG25tGyb30RTSgY9JTgN7ippmnLr5Y5nw7U/Ynqbki142Ha1zGtuU5CFCoTboE/J
         ZsiXIFCs8het5AVBQE5wObFLtkEWpMon9rcUYfIcqIy9D4tcYjDdfrAsea+hOXX/6jE1
         X989d5m3tQPSA/3so2YhDwK4i+iYArxsPcIadzH5jPrk+4uP0TrIuV7EeK62m576Sr98
         4lJIcWwgSUNYGQaDce96Zz6Jtg0QctKqH4Up+Dks+e5CEr05eDO35zTOItP7uHAe1zjd
         LB81qpWahWz6J9JYzJIY1/M44ZxmEMvyMMOJNpYcWX5BSENSr8K1Mwqmo2AgYa6lXVWS
         zSzw==
X-Gm-Message-State: AOJu0YzVX3dXJqtvflTdF2C2iIiuiYJKqsfnZYV9MGzE2hb9FbZfYxeM
	2tM2b81MbWsctEXZk8dCS9hEIL3NSHalNakiZB74llFQu7kt2pTLM42ldlez7YCL/qv3CD9Hqhg
	uuRavJq6DnzBCNZvo5mAyBw==
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902502wmj.100.1702507455963;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5EdNQIMrjofmVv1zrJdv8ykEuwHCs2ZxHKs/y4nPdIAePbusp9PWe8bHPWPpyIDEswd1Chw==
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902490wmj.100.1702507455621;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id az23-20020a05600c601700b0040c0902dc22sm22569330wmb.31.2023.12.13.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Message-ID: <0c86e5ffb65f07cd3e444038d1f0ed39f0f4130a.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, alexandru.elisei@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	borntraeger@linux.ibm.com, chenhuacai@kernel.org, david@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, james.morse@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
Date: Thu, 14 Dec 2023 00:44:12 +0200
In-Reply-To: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
	 <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
	 <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2023-12-13 at 14:31 -0800, Jim Mattson wrote:
> On Wed, Dec 13, 2023 at 2:25 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> > > On Sun, Dec 10, 2023, Jim Mattson wrote:
> > > > On Thu, Dec 7, 2023 at 8:21 AM Sean Christopherson <seanjc@google.com> wrote:
> > > > > Doh.  We got the less obvious cases and missed the obvious one.
> > > > > 
> > > > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> > > > > thing should really be folded into vmx_has_nested_events().
> > > > > 
> > > > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> > > > > specifically checks if L1 interrupts are blocked.
> > > > > 
> > > > > Compile tested only, and definitely needs to be chunked into multiple patches,
> > > > > but I think something like this mess?
> > > > 
> > > > The proposed patch does not fix the problem. In fact, it messes things
> > > > up so much that I don't get any test results back.
> > > 
> > > Drat.
> > > 
> > > > Google has an internal K-U-T test that demonstrates the problem. I
> > > > will post it soon.
> > > 
> > > Received, I'll dig in soonish, though "soonish" might unfortunately might mean
> > > 2024.
> > > 
> > 
> > Hi,
> > 
> > So this is what I think:
> > 
> > 
> > KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
> > to check if nested APICv has a pending interrupt before halting.
> > 
> > 
> > However the problem is bigger - with APICv we have in essence 2 pending interrupt
> > bitmaps - the PIR and the IRR, and to know if the guest has a pending interrupt
> > one has in theory to copy PIR to IRR, then see if the max is larger then the current PPR.
> > 
> > Since we don't want to write to guest memory, and the IRR here resides in the guest memory,
> > I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call
> > it from  kvm_guest_apic_has_interrupt().
> > 
> > What do you think? I can prepare a patch for this.
> > 
> > Can you share a reproducer or write a new one that can be shared?
> 
> See https://lore.kernel.org/kvm/20231211185552.3856862-1-jmattson@google.com/.

Thank you!

Best regards,
	Maxim Levitsky

> 
> > Best regards,
> >         Maxim Levitsky
> > 



