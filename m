Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A801585BE
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2020 23:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgBJWs7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Feb 2020 17:48:59 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45523 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgBJWs7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 17:48:59 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so4408707pfg.12
        for <linux-mips@vger.kernel.org>; Mon, 10 Feb 2020 14:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5bk1J5Ksue89Zhq4uqltr2fz8VSfvcDNj7RNKaTcTJU=;
        b=g5VJIAA1U4aJ/OBJFhilafx6Hr5MnBcF/PgI4XQEsMJEj/SpOYVng/iHfsVkWhZWHU
         ddk8HAIJzzXOzUZdlfO4ynC0TEVRnLLAYIPcuUCxEdqAovUOBTLTithX7ItYwO50zVqi
         MTes1r5hKDoRv1lwZg+hNP4YRAMEvoH4aoa0eA0LZmDSAjmKyIxIrcVkFTIBiTB+gAu7
         CVRMv+E1sh1TdNwYCsFuTT++NGFdZfDpDKM31OSRYwRXVTB2ktyQyNKe5N6bSmhGEsv/
         MvLxQqF6HiPs/ImO/8cgxpgbMnovyxS+jZ38t8zwHJUr5UH7BlT1ghy5bO7+gpE2iAHO
         eF7w==
X-Gm-Message-State: APjAAAXZGSsY7dBqn0HeAsYyB11ycuDHjDTB4La9NnxkzQ8tueGXmBcO
        6bTURMVbgGjeD8QrEzAG1ThO/xAOolMMpg==
X-Google-Smtp-Source: APXvYqzHY8/e3kJJ7KAos3uEHB6eV4us880QSKKovAemX3FvjemqWFsiOtJN9AV1/eZwonJ6ZsrM+w==
X-Received: by 2002:a63:1106:: with SMTP id g6mr3796885pgl.13.1581374938532;
        Mon, 10 Feb 2020 14:48:58 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id d3sm1377427pfn.113.2020.02.10.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 14:48:57 -0800 (PST)
Date:   Mon, 10 Feb 2020 14:52:29 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Victor Kamensky (kamensky)" <kamensky@cisco.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Message-ID: <20200210225229.4px5rljkici4mlrj@lantea.localdomain>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
 <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
 <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Victor,

On Mon, Feb 10, 2020 at 09:12:59PM +0000, Victor Kamensky (kamensky) wrote:
> On Mon, Feb 10, 2020 at 11:14:24AM -0800, Paul Burton wrote:
> > Which kernel version did you find this issue with? Could you check
> > whether you have commit bbcc5672b006 ("MIPS: Avoid VDSO ABI breakage due
> > to global register variable")? That was merged for v5.5-rc5.
> 
> Ah, I just spotted your detailed cover letter - my bad :)
> 
> Please try moving from v5.4 to v5.4.18 or higher, or just cherry-picking
> the commit I mentioned.
> 
> Double commit that you mentioned is present in 5.4.15 (since
> v5.4.9) that I use. It is 5b004a238460113276319536534928c58d95e599
> 
> [kamensky@kamensky-p53s linux]$ git tag --contains 5b004a238460113276319536534928c58d95e599
> v5.4.10
> v5.4.11
> v5.4.12
> v5.4.13
> v5.4.14
> v5.4.15
> v5.4.16
> v5.4.17
> v5.4.18
> v5.4.9

Right you are; I don't know how I picked up v5.4.18 as the version it
made it into.

OK, so you're using v5.4.15.

> You can check your tree: disassemble arch/mips/vdso/vgettimeofday-n32.o
> you would see 'jalr t9' calls, then disassemble arsm/mips/vdso/vdos-n32.so
> and check that those 'jalr t9' places got converted into 'bal' instructions,
> even though t9 set up instructions are there. This conversion happens by
> ld during relocation processing if code was compiled with options I propose
> to add explicitly. Walk through gcc and binutils places that do that are in my
> cover letter write up.
> 
> You can reproduce the issue by doing opposite of what I propose:
> disable -mrelax-pic-calls and -mexplicit-relocs defaults in your
> toolchain by either using negate variant of option, ie
> -mno-relax-pic-calls or -mno-explicit-relocs or both. Something
> like in diff below. I've tried it on mips-poky-linux-gcc toolchain
> that got correct defaults and worked for us before, after adding
> no variants it shows the same 'jalr t9' crash as with other yocto
> mips toolchains.

OK, I see what's happening here but I think focusing in on the "jalr
$t9" instructions as the explanation is misleading. Those aren't a
problem in & of themselves, but the fact that the GOT is being used is
problematic because we don't apply relocations for the VDSO. That,
combined with the fact that the VDSO is position-independent, means the
GOT can't possibly contain the right address for the function being
called & indeed contains zero.

I'm a little puzzled by how we got into this state of trying to use the
GOT without relocations though. Does your VDSO image contain
relocations? Could you try running "objdump -rR vdso-n32.so.dbg.raw"? We
have a check in the genvdso tool for reloc sections that should cause
the build to fail if they're present, and I'd expect the toolchain to be
emitting relocs if it's using the GOT. GOT with no relocs makes no
sense.

I also expect that reverting commit 4467f7ad7dbb ("MIPS: genvdso: Remove
GOT checks") would flag the problem & cause your build to fail. Perhaps
we should bring that check back & either special case lld or require its
users to have a very recent version of it.

It would be good to submit a v2 of this patch with the commit message
updated to explain that some toolchains attempt to use the GOT without
these flags being specified, and even better if you can figure out why
that happens.

Thanks,
    Paul
