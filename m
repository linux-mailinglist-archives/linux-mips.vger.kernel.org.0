Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9715187628
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 00:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732855AbgCPXST (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Mar 2020 19:18:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34493 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732873AbgCPXSS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Mar 2020 19:18:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id a23so8720458plm.1
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2020 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3FIhTFNcgat7mhCmnlEZ3vIzM5FnCV33yV9BtfaIwq8=;
        b=MmUkFgM4y0R0205HYDTl+mpzKwJedpclTssgLi58VnRAsb2LQfRXiAy409ML7099t7
         nyBwBQaLpfZwZF2beOeenydU2Zlnk82mFmrxNNPtjODSey0DAAi5/9NlEiBvn9VCDGW5
         y6Ze/qAt/2SX7ejoRshEBOf1QfArq09LziPt81ANoCN2zLzhLCXTc+AV/NOxYe0Fpt8A
         GmR9bsymibUv0D0LpAZNYqI2adnXqgqq3hsi0s269YUVVbfA9RsL23/RC4Cw/Q/Dh6ME
         dgKz4hAaHauUDD3X5s5DKN5NlqNJ7XC1xnIa7udsdVWQl0UEILrRtXzKZgyTpjrJ53uV
         J9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3FIhTFNcgat7mhCmnlEZ3vIzM5FnCV33yV9BtfaIwq8=;
        b=b9gqnNqJ8TCGnGQ1z09PAtU4xbZaW/v7GV/3Vi3yuKrjucu2znbcwVTclzSCr0u4A7
         ixqyPUxVDWp57KSv/z55WxaliWe4HM5AUd+mjrwqb6OhfdwrUE55llt+3MyVOQyTohB6
         8VD6ZxpqX7nvn+KUSaQeu3rSb7ytfQATpFwwRhGYS0phup1BXtKXLlPytoD4ePMoEXXd
         yTqYQVA22IrtLlevjGBXUXx1QP7W4+m7s5CVC7bBBMhvz7j6Fnuh48toDmAKsm52lfTG
         1gLZfeDVRylXOwlege09cgFNgpjeKUBYrNuVAhWllQnK/kM/j3H4FzJ3dd9Vv2Lqzmog
         2NUQ==
X-Gm-Message-State: ANhLgQ3Fe+F23cfqDdqRzRFeQod9UG8TGJhO+JcTOuJ3oHyXeF0FOzck
        agw+/66V/oPXZWG0pns0hDdsSKhnNKiEFEoHhQkrtH2i
X-Google-Smtp-Source: ADFU+vsrO9+sQubmwKt1ZMGewtSfsw6a08UDILUqifmsUkFxjnwZV7AqCy178tkIce9rBheZpfcd17qX827//YVfhDQ=
X-Received: by 2002:a17:90b:311:: with SMTP id ay17mr2003744pjb.27.1584400694892;
 Mon, 16 Mar 2020 16:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200311223725.27662-2-masahiroy@kernel.org> <202003121230.lys3M8E8%lkp@intel.com>
 <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com> <CAKwvOdmGh+NkVvf=e1W_ThZ8hW2KFe0R+AJ=-0jJ5FUg4sGoaA@mail.gmail.com>
In-Reply-To: <CAKwvOdmGh+NkVvf=e1W_ThZ8hW2KFe0R+AJ=-0jJ5FUg4sGoaA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Mar 2020 16:18:03 -0700
Message-ID: <CAKwvOdkxBmGxj5N+3tPD4JUC=a+PRkD0kTPZ4vB6n3yTM=Rb_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "sparclinux@vger.kernel.org, David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+ linux-mips this time

On Mon, Mar 16, 2020 at 4:13 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 11, 2020 at 11:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi MIPS forks,
> >
> >
> > I got the following report from 0-day bot.
> > Please advise me how to fix it.
> >
> >
> > I am not sure how multi-platform works in MIPS.
> >
> > The cavium-octeon platform has its own implementation
> > of various functions.
> >
> > So, vmlinux links different library routines
> > depending on whether CONFIG_CAVIUM_OCTEON_SOC, correct?
> >
> >
> >
> > fw_init_cmdline():
> > arch/mips/cavium-octeon/setup.c
> > arch/mips/fw/lib/cmdline.c
> >
> >
> > __delay(), __udelay(), __ndelay():
> > arch/mips/cavium-octeon/csrc-octeon.c
> > arch/mips/lib/delay.S
> >
> >
> > memcpy(), memmove():
> > arch/mips/cavium-octeon/octeon-memcpy.S
> > arch/mips/lib/memcpy.S
> >
> >
> >
> > FWIW, the following fixes the multiple definition errors.
> >
> >
> >
> > diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
> > index 6ecda64ad184..6ac6e0493e1f 100644
> > --- a/arch/mips/fw/lib/cmdline.c
> > +++ b/arch/mips/fw/lib/cmdline.c
> > @@ -16,6 +16,7 @@ int fw_argc;
> >  int *_fw_argv;
> >  int *_fw_envp;
> >
> > +#ifndef CONFIG_CAVIUM_OCTEON_SOC
> >  void __init fw_init_cmdline(void)
>
> Alternatively, you could define this fw_init_cmdline as __weak, then
> let the strong definition in arch/mips/cavium-octeon/setup.c override
> it. But both should work, so:
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Eitherway, octeon has some multiple definition errors that should get fixed.
>
> >  {
> >         int i;
> > @@ -41,6 +42,7 @@ void __init fw_init_cmdline(void)
> >                         strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
> >         }
> >  }
> > +#endif
> >
> >  char * __init fw_getcmdline(void)
> >  {
> > diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
> > index 479f50559c83..4cc98af4161a 100644
> > --- a/arch/mips/lib/Makefile
> > +++ b/arch/mips/lib/Makefile
> > @@ -3,10 +3,14 @@
> >  # Makefile for MIPS-specific library files..
> >  #
> >
> > -lib-y  += bitops.o csum_partial.o delay.o memcpy.o memset.o \
> > +lib-y  += bitops.o csum_partial.o memset.o \
> >            mips-atomic.o strncpy_user.o \
> >            strnlen_user.o uncached.o
> >
> > +ifneq ($(CONFIG_CAVIUM_OCTEON_SOC),y)
> > +lib-y  += delay.o memcpy.o
> > +endif
> > +
> >  obj-y                  += iomap_copy.o
> >  obj-$(CONFIG_PCI)      += iomap-pci.o
> >  lib-$(CONFIG_GENERIC_CSUM)     := $(filter-out csum_partial.o, $(lib-y))
> >
> >
> >
> > On Thu, Mar 12, 2020 at 1:31 PM kbuild test robot <lkp@intel.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > I love your patch! Yet something to improve:
> > >
> > > [auto build test ERROR on kbuild/for-next]
> > > [also build test ERROR on v5.6-rc5 next-20200311]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/sparc-revive-__HAVE_ARCH_STRLEN-for-32bit-sparc/20200312-073459
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> > > config: mips-cavium_octeon_defconfig (attached as .config)
> > > compiler: mips64-linux-gcc (GCC) 9.2.0
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # save the attached .config to linux build tree
> > >         GCC_VERSION=9.2.0 make.cross ARCH=mips
> > >
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    mips64-linux-ld: arch/mips/fw/lib/cmdline.o: in function `fw_init_cmdline':
> > > >> cmdline.c:(.init.text+0x0): multiple definition of `fw_init_cmdline'; arch/mips/cavium-octeon/setup.o:setup.c:(.init.text+0xad8): first defined here
> > >    mips64-linux-ld: arch/mips/lib/delay.o: in function `__delay':
> > > >> delay.c:(.text+0x0): multiple definition of `__delay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x80): first defined here
> > >    mips64-linux-ld: arch/mips/lib/delay.o: in function `__udelay':
> > > >> delay.c:(.text+0x10): multiple definition of `__udelay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x8): first defined here
> > >    mips64-linux-ld: arch/mips/lib/delay.o: in function `__ndelay':
> > > >> delay.c:(.text+0x50): multiple definition of `__ndelay'; arch/mips/cavium-octeon/csrc-octeon.o:csrc-octeon.c:(.text+0x40): first defined here
> > >    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memmove':
> > > >> (.text+0x0): multiple definition of `memmove'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x3a0): first defined here
> > >    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `__rmemcpy':
> > > >> (.text+0x20): multiple definition of `__rmemcpy'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x3c0): first defined here
> > >    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memcpy':
> > > >> (.text+0x80): multiple definition of `memcpy'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x0): first defined here
> > >    mips64-linux-ld: arch/mips/lib/memcpy.o: in function `memcpy':
> > > >> (.text+0x84): multiple definition of `__copy_user'; arch/mips/cavium-octeon/octeon-memcpy.o:(.text+0x4): first defined here
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
