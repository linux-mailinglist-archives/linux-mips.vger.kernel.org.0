Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC75B1B1C12
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 04:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgDUCm7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 22:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbgDUCm7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 22:42:59 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD25C061A0E;
        Mon, 20 Apr 2020 19:42:59 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id s202so10833202oih.3;
        Mon, 20 Apr 2020 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=22HJzOmHnmam1tgxVzraGLccgsF7pCDzxppnKXmeCcc=;
        b=jKmwOwQWKpYMPZofyZTuYn+7LdAMlYL6swWuBqaWWYS2ZHe065aplsFe1ypvqsjVg/
         E79G3ZVOsXfSzITV1aNWOhL/+In9irYnxjpqJ4QUtvf3mMJCwB1hqygj3wSyZkyM9jtI
         GL9bG947tM1umGFCgOdTRzHnZl2M1t1CwGB4ZyZeoh2ONAnlOTPW7w5sJ6dHdOC7LGy1
         M70e4C+70oD1J2hsUkjImoXoNrDzlyd0lcd/IAMObQgb9rHaw0OegZzdtbtSdFUpJ67c
         +xlz3pyhFZEtqYXqFur48USkQu5StZsixLj2jtbp5NqpaFCungz+3cEiNzynVfhMoG1i
         WyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=22HJzOmHnmam1tgxVzraGLccgsF7pCDzxppnKXmeCcc=;
        b=TvH+Cssds32hzl6A7L8Yh8+D5+9gcYCudhLr28WqlPGSoV4qrjfuAXL2bV2uyBzGoR
         jsueqJj+/kA6ps65AQLMhqk5hx1VcYsd1KRVtWX0M35ipedYyLP7lfOBM+qIpf7H57Za
         6vSPvpBh0R0Tq6PziI7mIRmYWHBvIUaqlMZ0K2+kyOPFrXzIKMRvNfBd7wqWq0w73Oka
         VKMn+o5py3EtJVOG7T38HSa5pAfVWfPTThAUzJn+Crrnl/g0eB6ey/kajctTEossG2tB
         gv9B947GnqOLiEJSWUChKb4ob7GM01+EbpqvbPLzdUg8GMNlqMPvomvc+k+objLXoG7u
         vf7w==
X-Gm-Message-State: AGi0PuZpNKmk+cZ/tWg/SbGx/dP3S3g5gKr+y1vR0/ukf6kUGqkEzqGN
        n1jCyQKOe3fEIYnU8VyBvMQ=
X-Google-Smtp-Source: APiQypJkewVCDBhIo/LPbuliAqXKDGfd5imYzqWqvA5pHn7Gaa4TcDgnRMZK41fAT8W64wzDCFRm+w==
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr1702091oih.71.1587436978810;
        Mon, 20 Apr 2020 19:42:58 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id b6sm425594otq.18.2020.04.20.19.42.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 19:42:58 -0700 (PDT)
Date:   Mon, 20 Apr 2020 19:42:56 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Subject: Re: [PATCH v2 2/3] MIPS: VDSO: Move disabling the VDSO logic to
 Kconfig
Message-ID: <20200421024256.GA42179@ubuntu-s3-xlarge-x86>
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com>
 <20200419202128.20571-2-natechancellor@gmail.com>
 <CA+icZUVaLW+38WEJhqnfO7B_unHvrbSr0moKnfJ6zXGGA06CWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUVaLW+38WEJhqnfO7B_unHvrbSr0moKnfJ6zXGGA06CWQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 20, 2020 at 11:53:55AM +0200, Sedat Dilek wrote:
> On Sun, Apr 19, 2020 at 10:21 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > After commit 9553d16fa671 ("init/kconfig: Add LD_VERSION Kconfig"), we
> > have access to GNU ld's version at configuration time. As a result, we
> > can make it clearer under what configuration circumstances the MIPS VDSO
> > needs to be disabled.
> >
> > This is a prerequisite for getting rid of the MIPS VDSO binutils
> > warning and linking the VDSO when LD is ld.lld. Wrapping the call to
> > ld-ifversion with CONFIG_LD_IS_LLD does not work because the config
> > values are wiped away during 'make clean'.
> >
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > v1 -> v2:
> >
> > * New patch.
> >
> >  arch/mips/Kconfig         |  2 ++
> >  arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
> >  arch/mips/vdso/Makefile   | 30 ++----------------------------
> >  arch/mips/vdso/vdso.lds.S |  2 +-
> >  4 files changed, 23 insertions(+), 29 deletions(-)
> >  create mode 100644 arch/mips/vdso/Kconfig
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 690718b3701a..45220e4b8a65 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -3275,3 +3275,5 @@ endmenu
> >  source "drivers/firmware/Kconfig"
> >
> >  source "arch/mips/kvm/Kconfig"
> > +
> > +source "arch/mips/vdso/Kconfig"
> > diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> ...
> > --- /dev/null
> > +++ b/arch/mips/vdso/Kconfig
> ...
> > +config MIPS_DISABLE_VDSO
> > +       def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
> ...
> > diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> ...
> > --- a/arch/mips/vdso/vdso.lds.S
> > +++ b/arch/mips/vdso/vdso.lds.S
> ...
> > -#ifndef DISABLE_MIPS_VDSO
> > +#ifndef CONFIG_DISABLE_MIPS_VDSO
> 
> Should be s/CONFIG_DISABLE_MIPS_VDSO/CONFIG_MIPS_DISABLE_VDSO ?
> 
> - Sedat -

Ugh yes, thank you much for pointing it out.

I'll send a v3 once I get further feedback on the series.

Cheers!
Nathan
