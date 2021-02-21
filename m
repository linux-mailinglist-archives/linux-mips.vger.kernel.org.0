Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDA5320C01
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 18:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBURQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 12:16:24 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33446 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhBURQX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Feb 2021 12:16:23 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 11LHFQMn029412;
        Mon, 22 Feb 2021 02:15:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11LHFQMn029412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613927726;
        bh=+E+JRgKeitH5eFBx4Z/rh8FyWasix1MSTNAEXqizMQU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fY8q6G98uh1+un5PrwsG4Zb3rSAd52PO9NSoxDJ8nwquEkzuJdR6rBF5sZrJUQbe9
         KWCT8wBjnWUfz7vheSDo+fWEVgovNo9SHlNVuFyQQj0HmV7nB2ApBNZANPZVurwuRE
         OPvztrgFoeH+fOxkb4nxTbw8JucqU5hHRx4mF3+AMVhL15XIswHkujGL0xSI8cL6QI
         Ii+CzdqSBbptV3imDDdvgz94e1uZBko1b579roKG6OFciJ/jTRWVIx1O7HbRt/m0Tc
         pLkXdi0thvqyabjecA6KbCP/kR2SvsJ0NPIVn7afYMW4aobGgVsdv/ZSnZtoPqwJ1E
         OSXLJ0vAyyr9A==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id u11so6119214plg.13;
        Sun, 21 Feb 2021 09:15:26 -0800 (PST)
X-Gm-Message-State: AOAM530f3OWgCXm+QZ167geaZY82/Uo9+39wdJo5pmm4HsKG5QmkcNNT
        mL1vjaSkpRTYyM05el/V9QycQ4fsrEROqr66210=
X-Google-Smtp-Source: ABdhPJxczjkYYwfFedULPavyehBQNlTo4yyE2oDz3aAz68ppY9EMF/VKLUDXMsDnW+fSNSL17VJtx2kpM0VX1zgRRK4=
X-Received: by 2002:a17:90a:609:: with SMTP id j9mr19512007pjj.198.1613927724902;
 Sun, 21 Feb 2021 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20210215004823.440102-1-masahiroy@kernel.org>
In-Reply-To: <20210215004823.440102-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Feb 2021 02:14:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch: syscalls: add missing FORCE and fix 'targets'
 to make if_changed work
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Chris Zankel <chris@zankel.net>,
        "David S. Miller" <davem@davemloft.net>,
        Fenghua Yu <fenghua.yu@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
        Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Luck <tony.luck@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 15, 2021 at 9:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The rules in these Makefiles cannot detect the command line change
> because the prerequisite 'FORCE' is missing.
>
> Adding 'FORCE' will result in the headers being rebuilt every time
> because the 'targets' additions are also wrong; the file paths in
> 'targets' must be relative to the current Makefile.
>
> Fix all of them so the if_changed rules work correctly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


Both applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
