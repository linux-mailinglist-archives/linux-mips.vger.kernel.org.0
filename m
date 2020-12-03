Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461432CE15A
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 23:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgLCWKC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 17:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgLCWKC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 17:10:02 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F19C061A51
        for <linux-mips@vger.kernel.org>; Thu,  3 Dec 2020 14:09:22 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id p5so3395732iln.8
        for <linux-mips@vger.kernel.org>; Thu, 03 Dec 2020 14:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y4lfXn4NQgT9AE+pcfanwBv5gymGOELzS9Yoccfg59M=;
        b=USeKbzyXElX2nDf8oeE1czUwhUCqMWIJR4/vvITllJucNT3FEMQFe2e2F+MtmZugQC
         uAoXsCagTylA+9/st75P/loFx12vESCpg98HsnoRcTk192ILskFmELosw3FjFV6G9zET
         hf6QA0wWaehLhuOrjatkgjvZt2W5JO6XlaJK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y4lfXn4NQgT9AE+pcfanwBv5gymGOELzS9Yoccfg59M=;
        b=F8i16W6ciC0u14+UHOOoqHPYITdMowCvKjNkr/IoyNH9PGyQwznm7fcO6jV/YK+IqH
         FTCOuDCbncYHGl4D8tBaor8UPcpRnXBhwFXpWi2hpBDfWaXji2AE08Y/aiMhxVeYxdXO
         FQJy7wOjXSi1oXWsa0xQLtCPaxRP2TFSSjYJGIVgQ1tYbXRaLzzx0Ck6nYUVTXJZw22x
         Anch8C1wJCQF91mrHeEPCYmB1Fn5PQMKEyE/3f3FgkLLOZcnMweAFhRgJb44wbL33H2X
         SEXUfieGHA7fqxQDiaeRAm04o/WIybk0/Mi93jO3laPcU2s1A1Dcu0NMzzdzn+2WNkkT
         W4zg==
X-Gm-Message-State: AOAM530MCIFMRc3itvJYFyxp/OFTMjUUo4dCAIhc6c9WBtfB/73Rg8ws
        X/prZWt75qU0J7GJpNJEjHUG1ZWagW0k3Q==
X-Google-Smtp-Source: ABdhPJy9iXMtVx74w/GCVRj4a426Lewc7ZHxVEtsgiddyn6TkiCJcfrngEEHMLFmwSZD3cJKO+gt4A==
X-Received: by 2002:a05:6e02:1805:: with SMTP id a5mr1714469ilv.170.1607033361282;
        Thu, 03 Dec 2020 14:09:21 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id u1sm315982ilb.74.2020.12.03.14.09.20
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 14:09:20 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id 81so3707938ioc.13
        for <linux-mips@vger.kernel.org>; Thu, 03 Dec 2020 14:09:20 -0800 (PST)
X-Received: by 2002:a02:830f:: with SMTP id v15mr1698948jag.12.1607033360437;
 Thu, 03 Dec 2020 14:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
In-Reply-To: <20201203214529.GB3579531@ZenIV.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 3 Dec 2020 14:09:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
Message-ID: <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com>
Subject: Re: [PATCHSET] saner elf compat
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 3, 2020 at 1:46 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>  The answer (for mainline) is that mips compat does *NOT* want
> COMPAT_BINFMT_ELF.  Not a problem with that series, though, so I'd
> retested it (seems to work, both for x86_64 and mips64, execs and
> coredumps for all ABIs alike), with centralization of Kconfig logics
> thrown in.

Well, the diffstat looks nice:

>  26 files changed, 127 insertions(+), 317 deletions(-)

and the patches didn't trigger anything for me, but how much did this
get tested? Do you actually have both kinds of 32-bit elf mips
binaries around and a machine to test on?

Linux-mips was cc'd, but I'm adding Thomas B to the cc here explicitly
just so that he has a heads-up on this thing and can go and look at
the mailing list in case it goes to a separate mailbox for him..

               Linus
