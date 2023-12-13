Return-Path: <linux-mips+bounces-717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA4812167
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 23:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69C0EB21068
	for <lists+linux-mips@lfdr.de>; Wed, 13 Dec 2023 22:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA53881830;
	Wed, 13 Dec 2023 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iU/G7Nm0"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38B2BD
	for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702506358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
	b=iU/G7Nm00k7cgzum12nO7emqOUCED7s1iG2G2RhYyooWSlQS+RhPd1/K7h12xJ1l4KOffI
	WlQuLc1uFmb2L4yPxHjZ/paAQrqVfX2oXK5OZ3PD4u8VNAbE02PR4Pw93DSl2UKtCjqKLc
	FCjwQf3xFA9EBhsdRWTvEKQfYy/UdJQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-mPgFW6ZQPxiha0B6T_PPqw-1; Wed, 13 Dec 2023 17:25:55 -0500
X-MC-Unique: mPgFW6ZQPxiha0B6T_PPqw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-336447277fcso7802f8f.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Dec 2023 14:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506354; x=1703111154;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
        b=Ys2RqVIYzRf55KntjpspyNhe4cAEDbL6KvdPvMiWBAztbI+cfTn1NQEhgyuUCYAagx
         C+nb4imqsfMtFz3TqqL/o9BNoLbmt4D26iEzBX2xlkV/YESNNkBbA0ZMZjuh4gHtcIvQ
         OeYrtfp0q2boEybi2VjNQCR8Da/4qgsp5VDr9YQ4f0LIRfPr1MKGKRJKlPI9iG69CvtX
         3QwHXkafz3j45zKjSQHlWa7BzdKKAgP7fD6baBzQOsuOuYXyKwRAdO0MWoWv4PzMyaYJ
         ug9sx2sSiCcxHuwzQqBZ8bzvF46GL+crbOTe/ooQFEWX9bJJJGKXA2JLUD7V+afBOH+0
         qOAw==
X-Gm-Message-State: AOJu0YzHnVw3HopNa5yHQhitNS3Zzh5ohAEr+7VTBGXBb8xRAOL986uU
	rHEVg6w8ef7cGJ2lNFXJGuJPZvM4P/LGUNu445KEpTOw1YYiUM4nixW0124KLHQN6UE+HmynAPL
	1ZWxAtiyktT1+GHSfvIc2iA==
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800762wmb.86.1702506354404;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq5vSBS9iWIl4hhY+47LaF7O2e11U2yVs0UmGQ3dWeLwMn5yVhoe2ukGq+e6/HNoX4k1QrCw==
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800760wmb.86.1702506354019;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm24509354wms.30.2023.12.13.14.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:25:53 -0800 (PST)
Message-ID: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Jim Mattson
 <jmattson@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
Date: Thu, 14 Dec 2023 00:25:50 +0200
In-Reply-To: <ZXh8Nq_y_szj1WN0@google.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2023-12-12 at 07:28 -0800, Sean Christopherson wrote:
> On Sun, Dec 10, 2023, Jim Mattson wrote:
> > On Thu, Dec 7, 2023 at 8:21 AM Sean Christopherson <seanjc@google.com> wrote:
> > > Doh.  We got the less obvious cases and missed the obvious one.
> > > 
> > > Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> > > thing should really be folded into vmx_has_nested_events().
> > > 
> > > Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> > > specifically checks if L1 interrupts are blocked.
> > > 
> > > Compile tested only, and definitely needs to be chunked into multiple patches,
> > > but I think something like this mess?
> > 
> > The proposed patch does not fix the problem. In fact, it messes things
> > up so much that I don't get any test results back.
> 
> Drat.
> 
> > Google has an internal K-U-T test that demonstrates the problem. I
> > will post it soon.
> 
> Received, I'll dig in soonish, though "soonish" might unfortunately might mean
> 2024.
> 

Hi,

So this is what I think:


KVM does have kvm_guest_apic_has_interrupt() for this exact purpose,
to check if nested APICv has a pending interrupt before halting.


However the problem is bigger - with APICv we have in essence 2 pending interrupt
bitmaps - the PIR and the IRR, and to know if the guest has a pending interrupt
one has in theory to copy PIR to IRR, then see if the max is larger then the current PPR.

Since we don't want to write to guest memory, and the IRR here resides in the guest memory,
I guess we have to do a 'dry-run' version of 'vmx_complete_nested_posted_interrupt' and call
it from  kvm_guest_apic_has_interrupt().

What do you think? I can prepare a patch for this.

Can you share a reproducer or write a new one that can be shared?

Best regards,
	Maxim Levitsky


