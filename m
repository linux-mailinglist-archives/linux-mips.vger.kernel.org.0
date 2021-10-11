Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4E0428C85
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 14:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbhJKMG1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 08:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234577AbhJKMG0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Oct 2021 08:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633953865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6/UQYl/XVfz1u8aL1mV3gDk9yEhwnmg9oxdpI3UoFb8=;
        b=KvXHy3fh1FPYpujiGXPgtA1C79NPw5HgdNUuh7vu9WhSMbi81dBjH79lX2JzSMxlqHUmbF
        zj5THRZfUhysKGTBvngQV29JrpN0/5a5RbwhvHnirJelsa0QTfpbLqk0N2Qb/UADggulbt
        Iib4q6Qnv6OootSKKbpNLQCiMYnEz1A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-L3SPMWNVMseteX6MgTJStA-1; Mon, 11 Oct 2021 08:04:24 -0400
X-MC-Unique: L3SPMWNVMseteX6MgTJStA-1
Received: by mail-ed1-f69.google.com with SMTP id p13-20020a056402044d00b003db3256e4f2so15765565edw.3
        for <linux-mips@vger.kernel.org>; Mon, 11 Oct 2021 05:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6/UQYl/XVfz1u8aL1mV3gDk9yEhwnmg9oxdpI3UoFb8=;
        b=cZp5BNH0vQiLr7g/CXhaCenkyUexWrxs5UAq7il6L/hFzIjaapxw920xE/CaEE/peM
         Q6d8ICyRcofS21wPJCs/64WXBHammI3WiAnci5Y0qpE+vANqQZCyLcwrzFoDgM/6Ekhz
         +84tBH+CCT/yU4stMfsjYot5VubqH46mP8SEHIgJf1YRc3mSCJpC+APaoLyZ0b5qbgso
         1zbvuqVQ1P6/MJjO7/9HBrJR2IS8ujEwGN1eZVYRZ9TWeQUrps55Ln4QiqQXYIzpkp9g
         DHPGzaOQ4zBmlhWvPzaEO67/uAYU7RwOXbSUVjc0vywGERn9pgpyYHMnbc4F8czceLPL
         PmBw==
X-Gm-Message-State: AOAM530d2mwnjPR8odSP9ye/W7zy6QnmmeqJdr2d6N8sqthHahA1tMI6
        sIvKrMLVUcMGSFCMMCEEfonLex1khXbdyLBfoSR6q/lXwHIe+0ijexaZyFf/ytSBS2et2gZe8Uq
        eBkABXwRXGOXcokut6LFE2A==
X-Received: by 2002:a17:906:6bce:: with SMTP id t14mr5105168ejs.546.1633953863649;
        Mon, 11 Oct 2021 05:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVo7pMtVffuQEXqsF/L2jnPTyIClLeLABvDqmnuGdNXl4W+vIVe08L9GSGn7GemWiCV8sawQ==
X-Received: by 2002:a17:906:6bce:: with SMTP id t14mr5105145ejs.546.1633953863516;
        Mon, 11 Oct 2021 05:04:23 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id j22sm3412840ejt.11.2021.10.11.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 05:04:22 -0700 (PDT)
Date:   Mon, 11 Oct 2021 08:04:16 -0400
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
Message-ID: <20211011075945-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 10, 2021 at 07:39:55PM -0700, Andi Kleen wrote:
> 
> > The connection is quite unfortunate IMHO.
> > Can't there be an option
> > that unbreaks drivers *without* opening up security holes by
> > making BIOS shared?
> 
> That would require new low level APIs that distinguish both cases, and a
> tree sweep.
> 
> 
> -Andi

Presumably bios code is in arch/x86 and drivers/acpi, right?
Up to 200 calls the majority of which is likely private ...

I don't have better ideas but the current setup will just
result in people making their guests vulnerable whenever they
want to allow device pass-through.

-- 
MST

