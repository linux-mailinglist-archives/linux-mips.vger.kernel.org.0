Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7462C1AFDEB
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 22:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgDSUGC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 16:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgDSUGB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 16:06:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DED4C061A0C;
        Sun, 19 Apr 2020 13:06:01 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o185so3448466pgo.3;
        Sun, 19 Apr 2020 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c83bq8ed+sqgwSVUBCBP9r/j44GMioCiEFSCJDfpF7U=;
        b=unqQADth7BEvNHoVtKDp4tRsURcEpQbxvjiI6HNGEEA6kVK1qJNF6CN1G22i1VeHaJ
         iXtdMT9iN78dIXiJ2/AwstGwn1LxOsG/XbqPHaAnuf9tsWQXopfjhxWty0bEWHF5/Knn
         Dhwzn720OehZTnJ5z23zgTAXUZnGSIki4mSw3S7LjBWdh5T1mdezpV9/TNxXQnNqsIR1
         C6vXvATA4JMPShjH/A0AWHxV0K9+QYEPFgDZ6cXecTLLKSRZ8VRVwYnoeF3cYOE5VEtD
         NrayDwmFGH43vo/doeHzmmT60thEXe8Q1k7E0pu5xSE3Nn65HkpOWWk81BozwHMuzhgU
         vh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c83bq8ed+sqgwSVUBCBP9r/j44GMioCiEFSCJDfpF7U=;
        b=ll4uUllclLeipR6QUVHdNzhXBegRMR/3oFKGQOLl33YBDIHjTKa74GIpP9S2XBA3UV
         kqh19GKoLEw4wpbPlElvOnD9EIWcGhe7cUfaB9mru2NN2ZZblBB9dMMNUvSgjUbekacc
         jrd1Vu+dhq6+5Jx0Y6MYNRTdoJ2EnAGrRaTEZ0iB78Uv87rblDGVhLKZcmCls8GHcnWQ
         Op3Bw0qMOiYIYpt7jowJVKEgpcMDcxzDfI8gk/uZWgaeJK9w9u0pZ21ReJ7tCOD4gHMY
         ierm+LiSIAASSZ6FSP0FRPl0aPuXbWs9K6UiC1aAFI0lwRhbeE8B87JYF106IbZhChwa
         9g2w==
X-Gm-Message-State: AGi0PuYOywUFxvubyslZWVZfg6qc6mlJS1CSmPFqumS40iDDSqqby+gy
        Fjzp0qLxLO1bbO7b9rMPTJM=
X-Google-Smtp-Source: APiQypJfPiyTQ0pIT4e5nl/vxLqLWBnzwHIRQIMsq/gouF/f5ptcgb8T/fdRB4Z0XoZDy4+gE+EMng==
X-Received: by 2002:a63:41c2:: with SMTP id o185mr12868739pga.139.1587326760839;
        Sun, 19 Apr 2020 13:06:00 -0700 (PDT)
Received: from Ryzen-7-3700X.localdomain ([82.102.31.53])
        by smtp.gmail.com with ESMTPSA id s66sm10858784pgb.84.2020.04.19.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 13:05:59 -0700 (PDT)
Date:   Sun, 19 Apr 2020 13:05:58 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH 2/2] MIPS: VDSO: Do not disable VDSO when linking with
 ld.lld
Message-ID: <20200419200558.GA13017@Ryzen-7-3700X.localdomain>
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419180445.26722-2-natechancellor@gmail.com>
 <20200419181715.GA36234@ubuntu-s3-xlarge-x86>
 <CAK7LNAS7QHB3GuBeLDh66OHbYRMzmNQNwiueU7jH1i7v0UTAAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS7QHB3GuBeLDh66OHbYRMzmNQNwiueU7jH1i7v0UTAAQ@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Masahiro,

On Mon, Apr 20, 2020 at 04:32:20AM +0900, Masahiro Yamada wrote:
> On Mon, Apr 20, 2020 at 3:17 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Sun, Apr 19, 2020 at 11:04:45AM -0700, Nathan Chancellor wrote:
> > > Currently, when linking with ld.lld, this warning pops up:
> > >
> > >     arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25
> > >
> > > ld-ifversion calls ld-version, which calls scripts/ld-version.sh, which
> > > is specific to GNU ld. ld.lld has a completely different versioning
> > > scheme (as it follows LLVM's versioning) and it does not have the issue
> > > mentioned in the comment above this block so it should not be subjected
> > > to this check.
> > >
> > > With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
> > > vgettimeofday.o.
> > >
> > > $ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
> > >                       00000024:  R_MIPS_PC32  _start
> > >                       000000b0:  R_MIPS_PC32  _start
> > >                       000002bc:  R_MIPS_PC32  _start
> > >                       0000036c:  R_MIPS_PC32  _start
> > >                       00000468:  R_MIPS_PC32  _start
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/785
> > > Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
> > > Reported-by: Dmitry Golovin <dima@golovin.in>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >  arch/mips/vdso/Makefile | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> > > index d7fe8408603e..f99e583d14a1 100644
> > > --- a/arch/mips/vdso/Makefile
> > > +++ b/arch/mips/vdso/Makefile
> > > @@ -65,9 +65,11 @@ DISABLE_VDSO := n
> > >  # the comments on that file.
> > >  #
> > >  ifndef CONFIG_CPU_MIPSR6
> > > -  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> > > -    $(warning MIPS VDSO requires binutils >= 2.25)
> > > -    DISABLE_VDSO := y
> > > +  ifndef CONFIG_LD_IS_LLD
> > > +    ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> > > +      $(warning MIPS VDSO requires binutils >= 2.25)
> > > +      DISABLE_VDSO := y
> > > +    endif
> > >    endif
> > >  endif
> > >
> > > --
> > > 2.26.1
> > >
> >
> > Hmmm, I still see this warning when first runing make <config>... I
> > assume because this Makefile gets parsed before Kconfig runs.
> 
> 
> I do not see the warning for 'make <config>'.
> 
> Could you tell me how to reproduce it?
> 
> 
> For cleaning, indeed, i see the warning.
> 
> 
> $ make ARCH=mips  LLVM=1 clean
> arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25

This is enough. I think I figured out how to avoid it, I'll be sending
out v2 shortly, I'd appreciate any comments that you have.

> >
> > Perhaps it would be better to check if ld-version is 0 (since that means
> > we are not using GNU ld):
> >
> > ifneq ($(call ld-ifversion, -eq, 0, y),y)
> >
> > I am open to suggestions though.
> >
> > Cheers,
> > Nathan
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200419181715.GA36234%40ubuntu-s3-xlarge-x86.
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

Cheers,
Nathan
