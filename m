Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80A02D098A
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 04:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbgLGDsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Dec 2020 22:48:05 -0500
Received: from terminus.zytor.com ([198.137.202.136]:52205 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgLGDsF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Dec 2020 22:48:05 -0500
X-Greylist: delayed 643 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Dec 2020 22:48:04 EST
Received: from [IPv6:2601:646:8680:a581:458a:7aa1:7e4f:150e] ([IPv6:2601:646:8680:a581:458a:7aa1:7e4f:150e])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 0B73aNsS2299624
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sun, 6 Dec 2020 19:36:25 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 0B73aNsS2299624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2020112401; t=1607312188;
        bh=wbkAToI/itQ/qNYtHwZIZR/QpPQ/3vZmoTo1c2ql5ks=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=fCnbIQHXFuq8mQbOol2dRg9W8bNR+/a4dfcteKrs0tvV2zKs/1yPVLpxCdpe8/5+f
         UStv2U3tuz7je57z+evG7sLms9YlFYyg0ZW/VT5gBv3JS6gpVX/U5U4q8qO8zolcLU
         iLjO7vk9H8MKQFqWC1/SE3cxavJz+V2TNr4BAwwUuMmu7uP62uJixEn95bHoqrqvoq
         6GHdVn8rRYYGT+/focPsP8EhIh04YeIN2PNNY1YyUlQWjITGwxOWUrlpaDHJ+JLOAF
         S8+we7tGZbmOGaw8EJhCXDYftHc2XpYCJNxQ5/b1deQykRgQIuU6oTSyDAO8/YTST2
         GYX+oi/krzRFg==
Date:   Sun, 06 Dec 2020 19:36:15 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20201206032305.GD3579531@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk> <CAHk-=wiRNT+-ahz2KRUE7buYJMZ84bp=h_vGLrAaOKW3n_xyXQ@mail.gmail.com> <20201203230336.GC3579531@ZenIV.linux.org.uk> <20201206032305.GD3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHSET] saner elf compat
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
From:   hpa@zytor.com
Message-ID: <0FF0E78B-6D38-43BD-8E64-CC9360903B2D@zytor.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On December 5, 2020 7:23:05 PM PST, Al Viro <viro@zeniv=2Elinux=2Eorg=2Euk>=
 wrote:
>On Thu, Dec 03, 2020 at 11:03:36PM +0000, Al Viro wrote:
>> > >  The answer (for mainline) is that mips compat does *NOT* want
>> > > COMPAT_BINFMT_ELF=2E  Not a problem with that series, though, so
>I'd
>> > > retested it (seems to work, both for x86_64 and mips64, execs and
>> > > coredumps for all ABIs alike), with centralization of Kconfig
>logics
>> > > thrown in=2E
>> >=20
>> > Well, the diffstat looks nice:
>> >=20
>> > >  26 files changed, 127 insertions(+), 317 deletions(-)
>> >=20
>> > and the patches didn't trigger anything for me, but how much did
>this
>> > get tested? Do you actually have both kinds of 32-bit elf mips
>> > binaries around and a machine to test on?
>>=20
>> Yes (aptitude install gcc-multilib on debian mips64el/stretch sets
>the toolchain
>> and libraries just fine, and then it's just a matter of -mabi=3Dn32
>passed
>> to gcc)=2E  "Machine" is qemu-system-mips64el -machine malta -m 1024
>-cpu 5KEc
>> and the things appear to work; I hadn't tried that on the actual
>hardware=2E
>> I do have a Loongson-2 box, but it would take a while to dig it out
>and
>> get it up-to-date=2E
>>=20
>> > Linux-mips was cc'd, but I'm adding Thomas B to the cc here
>explicitly
>> > just so that he has a heads-up on this thing and can go and look at
>> > the mailing list in case it goes to a separate mailbox for him=2E=2E
>>=20
>> I would certainly appreciate review and testing - this branch sat
>> around in the "should post it someday" state since June (it was
>> one of the followups grown from regset work back then), and I'm
>> _not_ going to ask pulling it without an explicit OK from mips
>> folks=2E
>
>BTW, there's something curious going on in ELF binary recognition for
>x32=2E  Unlike other 64bit architectures, here we have a 32bit binary
>that successfully passes the native elf_check_arch()=2E  Usually we
>either have different EM_=2E=2E=2E values for 64bit and 32bit (e=2Eg=2E f=
or ppc
>and sparc) or we have an explicit check for ->e_ident[EI_CLASS]
>having the right value (ELFCLASS32 or ELFCLASS64 for 32bit and 64bit
>binaries resp=2E)
>
>For x32 that's not true - we use EM_X86_64 for ->e_machine and that's
>the only thing the native elf_check_arch() is looking at=2E  IOW,
>it looks like amd64 elf_load_binary() progresses past elf_check_arch()
>for x32 binaries=2E  And gets to load_elf_phdrs(), which would appear
>to have a check of its own that should reject the sucker:
>        /*
>         * If the size of this structure has changed, then punt, since
>         * we will be doing the wrong thing=2E
>         */
>        if (elf_ex->e_phentsize !=3D sizeof(struct elf_phdr))
>                goto out;
>After all, ->e_phentsize is going to be 32 (sizeof(struct elf32_phdr)
>rather than expected 56 (sizeof(struct elf64_phdr)) and off we bugger,
>even though it happens at slightly later point than usual=2E  Except that
>we are looking at struct elf64_hdr ->e_phentsize - in struct elf32_hdr=2E
>I=2Ee=2E at offset 54, two bytes past the end of in-file struct elf32_hdr=
=2E
>
>Usually we won't find 0x38 0x00 in that location, so everything works,
>but IMO that's too convoluted=2E
>
>Peter, is there any reason not to check ->ei_ident[EI_CLASS] in
>amd64 elf_check_arch()?  It's a 1-byte load from hot cacheline
>(offset 4 and we'd just read the 4 bytes at offsets 0=2E=2E3) +
>compare + branch not taken, so performance impact is pretty much
>nil=2E  I'm not saying it's a security problem or anything of that
>sort, just that it makes the analysis more subtle than it ought
>to be=2E=2E=2E
>
>Is it about some malformed homegrown 64bit binaries with BS value
>at offset 4?  Confused=2E=2E=2E

I can't think of any=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
