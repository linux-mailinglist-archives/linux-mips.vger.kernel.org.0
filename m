Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7193E1437
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 13:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhHELzs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 07:55:48 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50384 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhHELzr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 07:55:47 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 175Bt3iE011866;
        Thu, 5 Aug 2021 20:55:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 175Bt3iE011866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628164504;
        bh=QtmFIMbSkPrFHJ5F2MOHK1582vI0vTuaUebcEfPiA5I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P2xXn+b35DN1tjVaqBC5J0Eoh24Uq4fU5ixhEuAyg8ZgoPFU+vQmBTV7o32YcfXj+
         KEe288tTzDZBmtGWDcybLxztOpuglgDFKb0oTajI4aaJDJpDXgheo/FjiR2/lq6mBB
         i2Xt8feKtE9Min3x9RRWywKVgQWAJFx1PzPHSEHI0ym/eNe8Frwek1vCtKLdd4C5sp
         vE/EWZ2mUehmQz0ZsGOAIpSb8Lzc0IGQLm37zWGe3GcHlm+zVmx2nsZ3TiVD1y5cNc
         DR5SOCNrE4xKPuxOmTO6TT+U5R2hn0lpKk4xwwtoi3WSEIzRdKFl2CrAOj0CjDVVSV
         4rSc4WypAOL1A==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id cl16-20020a17090af690b02901782c35c4ccso4969357pjb.5;
        Thu, 05 Aug 2021 04:55:03 -0700 (PDT)
X-Gm-Message-State: AOAM5336A2wdWgtkke5PtxzC2eRtOWVZ7apwcV8DZ7wreOes+DVdwXIh
        ggHJiVbQRXFrhGz66+30hKcQJCp2ac+bjbTxDrk=
X-Google-Smtp-Source: ABdhPJyIJzICcuvyV7P/46KDij6cT86sBszR/MDTE6vE0qa6ddqSBrO7rm3TcQHy6WMDIOLdzqww4IsmdoMZ7o7nfis=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr1794883pgj.47.1628164503024;
 Thu, 05 Aug 2021 04:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625734629.git.hns@goldelico.com> <4AC1CCE9-CCAF-4D4B-BAD5-CEB9E5155FDF@goldelico.com>
 <CAKwvOd=FdZsQZCGqqpnbzgVZ+s2=ffyh337RwqyTAzHMcjUb+w@mail.gmail.com> <BFB4FABC-60B7-445D-ACEB-4AAE177AF8D4@goldelico.com>
In-Reply-To: <BFB4FABC-60B7-445D-ACEB-4AAE177AF8D4@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 20:54:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLJwwqp0j9yFH9CCfR1VN5yfLyCDjLD8nJ3F4kdG1ZyA@mail.gmail.com>
Message-ID: <CAK7LNARLJwwqp0j9yFH9CCfR1VN5yfLyCDjLD8nJ3F4kdG1ZyA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Regex fixes for mips and x86 cross-compile
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 4, 2021 at 12:59 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi all,
> any chance to get that reviewed and merged into v5.15-rc1 and backported to stable?
> Thank you,
> Nikolaus Schaller



I have a macbook (macOS catalina), and was able to
reproduce this issue.

I applied both to kbuild tree.
Thanks.





>
> > Am 19.07.2021 um 22:37 schrieb Nick Desaulniers <ndesaulniers@google.com>:
> >
> > + Masahiro, linux-kbuild (EOM)
> >
> > On Mon, Jul 19, 2021 at 12:07 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>
> >> Any chance that it gets merged?
> >>
> >>> Am 08.07.2021 um 10:57 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >>>
> >>> Trying to run the x86 relocs tool on a BSD based HOSTCC (cross
> >>> compilation environment) leads to errors like
> >>>
> >>> VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
> >>> CC      arch/x86/boot/compressed/misc.o - due to: arch/x86/boot/compressed/../voffset.h
> >>> OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
> >>> RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
> >>> empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
> >>> make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1
> >>>
> >>> and when cross compiling a MIPS kernel on a BSD based HOSTCC
> >>> we get errors like
> >>>
> >>> SYNC    include/config/auto.conf.cmd - due to: .config
> >>> egrep: empty (sub)expression
> >>> UPD     include/config/kernel.release
> >>> HOSTCC  scripts/dtc/dtc.o - due to target missing
> >>>
> >>> It turns out that relocs.c on x86 uses patterns like
> >>>
> >>>      "something(|_end)"
> >>>
> >>> while MIPS uses egrep with
> >>>
> >>>      (|MINOR_|PATCHLEVEL_)
> >>>
> >>> In both cases it is not valid syntax or gives undefined results
> >>> according to POSIX 9.5.3 ERE Grammar
> >>>
> >>>      https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
> >>>
> >>> It seems to be silently accepted by the Linux regcmp() or egrep
> >>> implementation while a BSD host complains.
> >>>
> >>> Such patterns can be replaced by a transformation like
> >>>
> >>>      "(|p1|p2)" -> "(p1|p2)?"
> >>>
> >>> Test Linux:
> >>>
> >>> root@letux:~# echo foo | egrep '^(|foo)$'
> >>> foo
> >>> root@letux:~# echo fool | egrep '^(foo)?$'
> >>> root@letux:~# echo fun | egrep '^(|foo)$'
> >>> root@letux:~# echo f | egrep '^(|foo)$'
> >>> root@letux:~# echo | egrep '^(|foo)$'
> >>>
> >>> root@letux:~# echo foo | egrep '^(foo)?$'
> >>> foo
> >>> root@letux:~# echo fool | egrep '^(foo)?$'
> >>> root@letux:~# echo fun | egrep '^(foo)?$'
> >>> root@letux:~# echo f | egrep '^(foo)?$'
> >>> root@letux:~# echo | egrep '^(foo)?$'
> >>>
> >>> root@letux:~#
> >>>
> >>> Test BSD:
> >>>
> >>> iMac:master hns$ echo foo | egrep '^(|foo)$'
> >>> egrep: empty (sub)expression
> >>> iMac:master hns$ echo fool | egrep '^(foo)?$'
> >>> egrep: empty (sub)expression
> >>> iMac:master hns$ echo fun | egrep '^(|foo)$'
> >>> egrep: empty (sub)expression
> >>> iMac:master hns$ echo f | egrep '^(|foo)$'
> >>> egrep: empty (sub)expression
> >>> iMac:master hns$ echo | egrep '^(|foo)$'
> >>> egrep: empty (sub)expression
> >>> iMac:master hns$ echo foo | egrep '^(foo)?$'
> >>> foo
> >>> iMac:master hns$ echo fool | egrep '^(foo)?$'
> >>> iMac:master hns$ echo fun | egrep '^(foo)?$'
> >>> iMac:master hns$ echo f | egrep '^(foo)?$'
> >>> iMac:master hns$ echo | egrep '^(foo)?$'
> >>>
> >>> iMac:master hns$
> >>>
> >>>
> >>> H. Nikolaus Schaller (2):
> >>> x86/tools/relocs: Fix non-POSIX regexp
> >>> arch: mips: Fix non-POSIX regexp
> >>>
> >>> arch/mips/Makefile      | 2 +-
> >>> arch/x86/tools/relocs.c | 8 ++++----
> >>> 2 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> --
> >>> 2.31.1
> >>>
> >>
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>


-- 
Best Regards
Masahiro Yamada
