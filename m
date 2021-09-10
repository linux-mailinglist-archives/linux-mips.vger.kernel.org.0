Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E75406956
	for <lists+linux-mips@lfdr.de>; Fri, 10 Sep 2021 11:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhIJJzv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Sep 2021 05:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37987 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232115AbhIJJzu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Sep 2021 05:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631267679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G3LlEYSRHK/bW1nfGLOGdZcifmv3HCR8Ukwhz+/9614=;
        b=ikADgu7dsxj3oA0dObSy86XbT460Cqls7uMImgqDa3NDIq4PhSGyFOqkgfoyWMaH3FpotA
        e5DP9lldq3+b5A+WADy70CoFl9nGd0tdMbr1SQ3fyWk9Wog8/7nL++nTqsQsw5I+EGCxcV
        MCDiTpyK3gCb14WVuLu6Mtbq70stHa8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-orLoJjMHOWOJi65rdITjbQ-1; Fri, 10 Sep 2021 05:54:37 -0400
X-MC-Unique: orLoJjMHOWOJi65rdITjbQ-1
Received: by mail-wm1-f71.google.com with SMTP id x10-20020a7bc76a000000b002f8cba3fd65so714691wmk.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Sep 2021 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G3LlEYSRHK/bW1nfGLOGdZcifmv3HCR8Ukwhz+/9614=;
        b=t6YLxXidql4iXHyR/Kya+qqyv48jzEiiNiXg/pQoMqptVZ8kJPkA84zpmdJMnoyAMM
         RAhQktAsQyWElNefX0cUkiVrwYT1ViHVzTNBll2Fd1Uhh6HX2BdxalR+iNd1V/dK3hd7
         Y+YMakmAPx+paxVJ5UAQ3jM6pqhiBbfyihu5H2AMAtkihrATRjvV9aXrkjWlPSlirwMn
         51Mef3EFTYzhPJuzPIP70bgd9RPF3NuU3/ge8s+B96RWXfaKEMgKSCGHmeViqlCuNAoB
         +dvv2NSJP+8GPuOtqwFvYPkIsAgTXThOIwAVxkyklKENaEQXJQPFbDdSGVWud2UtsSIm
         BqGA==
X-Gm-Message-State: AOAM5338Q+7eLt+GvobpBAuqKcBpy909anWLM8EkSSz8CapLFcMdYTmP
        5wT9vBFYW3Tdpk654jtHRQa6aHzRgIXMuUQstJqMAjdLadWYZ6EMGLq/+TDHo/MpCfIz9aA8Bvw
        K0tWne37xHfJUiybI9ZhGuQ==
X-Received: by 2002:adf:eb81:: with SMTP id t1mr8840999wrn.245.1631267676748;
        Fri, 10 Sep 2021 02:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO0Y/+7P/8niNtl+CoPrjCVE7HuwDhOVv5eL0lpW28+D5kEKFv5EWjYMYsYF1r6EhbMvRO7w==
X-Received: by 2002:adf:eb81:: with SMTP id t1mr8840971wrn.245.1631267676591;
        Fri, 10 Sep 2021 02:54:36 -0700 (PDT)
Received: from redhat.com ([2.55.145.189])
        by smtp.gmail.com with ESMTPSA id o7sm3686409wmc.46.2021.09.10.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 02:54:34 -0700 (PDT)
Date:   Fri, 10 Sep 2021 05:54:28 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210910054044-mutt-send-email-mst@kernel.org>
References: <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
 <20210829181635-mutt-send-email-mst@kernel.org>
 <3a88a255-a528-b00a-912b-e71198d5f58f@linux.intel.com>
 <20210830163723-mutt-send-email-mst@kernel.org>
 <69fc30f4-e3e2-add7-ec13-4db3b9cc0cbd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69fc30f4-e3e2-add7-ec13-4db3b9cc0cbd@linux.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 30, 2021 at 05:23:17PM -0700, Andi Kleen wrote:
> 
> On 8/30/2021 1:59 PM, Michael S. Tsirkin wrote:
> > 
> > > Or we can add _audited to the name. ioremap_shared_audited?
> > But it's not the mapping that has to be done in handled special way.
> > It's any data we get from device, not all of it coming from IO, e.g.
> > there's DMA and interrupts that all have to be validated.
> > Wouldn't you say that what is really wanted is just not running
> > unaudited drivers in the first place?
> 
> 
> Yes.

Then ... let's do just that?

> 
> > 
> > > And we've been avoiding that drivers can self declare auditing, we've been
> > > trying to have a separate centralized list so that it's easier to enforce
> > > and avoids any cut'n'paste mistakes.
> > > 
> > > -Andi
> > Now I'm confused. What is proposed here seems to be basically that,
> > drivers need to declare auditing by replacing ioremap with
> > ioremap_shared.
> 
> Auditing is declared on the device model level using a central allow list.

Can we not have an init call allow list instead of, or in addition to, a
device allow list?

> But this cannot do anything to initcalls that run before probe,

Can't we extend module_init so init calls are validated against the
allow list?

> that's why
> an extra level of defense of ioremap opt-in is useful.

OK even assuming this, why is pci_iomap opt-in useful?
That never happens before probe - there's simply no pci_device then.

> But it's not the
> primary mechanism to declare a driver audited, that's the allow list. The
> ioremap is just another mechanism to avoid having to touch a lot of legacy
> drivers.
> 
> If we agree on that then the original proposed semantics of "ioremap_shared"
> may be acceptable?
> 
> -Andi
> 

It looks suspiciously like drivers self-declaring auditing to me which
we both seem to agree is undesirable. What exactly is the difference?

Or are you just trying to disable anything that runs before probe?
In that case I don't see a reason to touch pci drivers though.
These should be fine with just the device model list.

-- 
MST

