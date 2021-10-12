Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841D042AF6D
	for <lists+linux-mips@lfdr.de>; Wed, 13 Oct 2021 00:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhJLWCR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 18:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233953AbhJLWCP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 18:02:15 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84A8C061749
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 15:00:13 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id m26so698348pff.3
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtMAj68aUuTTSGbrDQhTvggvj29pIYu2zJBH77+GR9M=;
        b=l4aQQdqM1qp9TtohjZx2PZM0wFCEL6l/kvo8NN9KzJyymhBkkyJgSo+9JA65w2tJEC
         9LMd/PZYWtD639cxF6qZMwd7jZd9819/ZvHD/DyB/7wSK2/pajxSegKWAuJyX3EvYN36
         Hvgx10j1dFhPR07T/GBgmSYWFBkdDDI7TrgeSvfoF3jbQGYARg2lN3Mrzq8mhpCVohvp
         ZGTcRKSDYPs1LYZ9Cvfeg4KhU92J4uRVYVOhbj7jW97OCTyGTD9dTqfQJOsiIMNnWVv0
         /ozc6W/ADlxkkOe6vMPoo0ylJl6JzbiIVBISrC3VjWn2vlC4L7iJWKamuM1v2Iw/lFzH
         VREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtMAj68aUuTTSGbrDQhTvggvj29pIYu2zJBH77+GR9M=;
        b=Va5mSff3Ww91J0FXz740BCav/gMCKKgmNcn1fhySaprxHX5sou7tlmsl6hamNmwfQy
         lLIuZ8yMI3GmtEfz9L2J+E5frFoVMxXC7A5lkMQGz8HmlsbH1EMBpCKufJKfI1zKVvpC
         Y7id71+eztayVd33TV8x1leSb0p2L6zQQscvxr3gZ952VgkJbNfAdE+xhv3ZErf7D9PR
         rsoA7u5HKVfj8TGYNRMn/Cxpcqb7c/dwjQhbrLOOlUcrCcOEgvQsocXyrUsmvKq7hA3v
         daiNiXrSbV/QBsispLfqSovnPiLs/l39nbXKd/xGJKqdUDIXgI87y2aa+0oLa4W8/Gbm
         ho0g==
X-Gm-Message-State: AOAM530IONYGQymemjpj4D1Qda57d6G9VzsHSZvlNF7Xou4GX9uFYaSG
        0DBL+wjMJE5nV/im4OOAeVGMufMMbkN477PBiFJj/g==
X-Google-Smtp-Source: ABdhPJy/e3jBUJgWufF7ultP6rKqv7OOHb6VQ8mNAhGHcU3yrYfDGGAVb/xjngRbf2MGZ68jBqzuzUn25eWS2pvZ40Y=
X-Received: by 2002:a63:1262:: with SMTP id 34mr24624590pgs.356.1634076012990;
 Tue, 12 Oct 2021 15:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org> <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com> <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
 <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com> <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
 <bca75b04-f084-5bda-c071-249fd91aaa1e@linux.intel.com>
In-Reply-To: <bca75b04-f084-5bda-c071-249fd91aaa1e@linux.intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 12 Oct 2021 15:00:01 -0700
Message-ID: <CAPcyv4gZfG-Bm+_jGRjSHd8K+jO2M2NgXisqacanxGZgZKFaJA@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(), pci_iomap_host_shared_range()
To:     Andi Kleen <ak@linux.intel.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Kuppuswamy Sathyanarayanan 
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
        virtualization@lists.linux-foundation.org,
        "Reshetova, Elena" <elena.reshetova@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 12, 2021 at 2:28 PM Andi Kleen <ak@linux.intel.com> wrote:
[..]
> >> But how do you debug the kernel then? Making early undebuggable seems
> >> just bad policy to me.
> > I am not proposing making the early undebuggable.
>
>
> That's the implication of moving the policy into initrd.
>
>
> If only initrd can authorize then it won't be possible to authorize
> before initrd, thus the early console won't work.

Again, the proposal is that the allow-list is limited to just enough
devices to startup and debug the initramfs and no more. Everything
else can be dynamic, and this allows for a powerful custom override
interface without needing to debate additional ABI like command line
overrides, and minimizes future changes to this kernel-internal
allow-list.
