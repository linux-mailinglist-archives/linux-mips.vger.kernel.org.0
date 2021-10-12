Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1109142AEF6
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 23:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbhJLVct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 17:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234829AbhJLVcs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Oct 2021 17:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634074245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eq+RzJgPHGQ1lh7AV+pnk4SW99n38qW+iDQrUerrfKQ=;
        b=S1pGqFAtZflV7/4+/KOYFjNtM4GsgLjuwrKSu3HlmI2O0Tdow9hi/sRxk83gb6UMEM7O1P
        WIFfwfgDJLdrIsgmbPPytJXrJBTbIQsnNZzNAT2xGu8JI28+yP9hkdtsYaN3krU8sVm/15
        ZqMRay0JPNxMs8Qwi3lnsQjkOd4Dfpo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-etei-i9ENHyAOz2r5LDAyA-1; Tue, 12 Oct 2021 17:30:44 -0400
X-MC-Unique: etei-i9ENHyAOz2r5LDAyA-1
Received: by mail-wr1-f69.google.com with SMTP id y12-20020a056000168c00b00160da4de2c7so361796wrd.5
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 14:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eq+RzJgPHGQ1lh7AV+pnk4SW99n38qW+iDQrUerrfKQ=;
        b=sXKylB7j5n4tKDO3Yt8NCu+50X+sAJm0yixksd+FLRwdsEcSyzSTMVbq73bur8KHQO
         /Atu8A8jkW5qb+IVI7a/TA6fWZm/f1eQHedsSWPUFf646AWHTw30m8x+kvyzhrAAyQjC
         RmRxSZ1wx20rSSkqVGSTlL/eMRknX+e4ECGhqyQL2GmogN1qMcP4oCPJDDNey7TkiYI9
         G/qdwWPPE1S5sK7vMSvs9PTZA9qcVgLDCt8chAmEV/9rRtBym0DWDmgujWNdJYE4uqXn
         wMeyHojUnF/cNNWZAKFwtndHLHE+tOWlOBABbgDUS4dsaRJKp2231JYg1Bf0FRmKX12z
         TeIA==
X-Gm-Message-State: AOAM532+d7NsUPc7nuua+gaYmtMGZOwNsf/HeSBnzA4Q/Z7+ZmXL8nNF
        JYAOD1er47bOXBBy10r7BLUfWT7CSMXh8QbrXDX/H4FZBFzBeQa0BnBIl6MwZBWfwG1k7Fu0ke2
        G/oxXbJIrax1Le6Pyb3RNkQ==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr8596836wmc.27.1634074243370;
        Tue, 12 Oct 2021 14:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDiipoOYS8wHel/0NefRnO1CIzQW9KYRq/ON4whSk4X4kD3O7SLlEE9ljv12IUks5+RmoxVw==
X-Received: by 2002:a1c:f216:: with SMTP id s22mr8596816wmc.27.1634074243191;
        Tue, 12 Oct 2021 14:30:43 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id k17sm3951985wmj.0.2021.10.12.14.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:30:42 -0700 (PDT)
Date:   Tue, 12 Oct 2021 17:30:36 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Kuppuswamy Sathyanarayanan 
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
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Message-ID: <20211012171846-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
 <20211011075945-mutt-send-email-mst@kernel.org>
 <9d0ac556-6a06-0f2e-c4ff-0c3ce742a382@linux.intel.com>
 <20211011142330-mutt-send-email-mst@kernel.org>
 <4fe8d60a-2522-f111-995c-dcbefd0d5e31@linux.intel.com>
 <20211012165705-mutt-send-email-mst@kernel.org>
 <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 12, 2021 at 02:18:01PM -0700, Andi Kleen wrote:
> 
> > Interesting. VT-d tradeoffs ... what are they?
> 
> The connection to the device is not encrypted and also not authenticated.
> 
> This is different that even talking to the (untrusted) host through shared
> memory where you at least still have a common key.

Well it's different sure enough but how is talking to host less secure?
Cold boot attacks and such?

> > Allowing hypervisor to write into BIOS looks like it will
> > trivially lead to code execution, won't it?
> 
> This is not about BIOS code executing. While the guest firmware runs it is
> protected of course. This is for BIOS structures like ACPI tables that are
> mapped by Linux. While AML can run byte code it can normally not write to
> arbitrary memory.

I thought you basically create an OperationRegion of SystemMemory type,
and off you go. Maybe the OSPM in Linux is clever and protects
some memory, I wouldn't know.

> The risk is more that all the Linux code dealing with this hasn't been
> hardened to deal with malicious input.
> 
> -Andi


-- 
MST

