Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E821BEE7F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgD3DFx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3DFw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:05:52 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0AEC035494;
        Wed, 29 Apr 2020 20:05:52 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id k133so3935111oih.12;
        Wed, 29 Apr 2020 20:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VUvIqhD5Rxtvk/jJNTE+TX+Ap06+KNlY2PxWsoF7YmE=;
        b=uENcP0JHZuNMkaSj1t7het/sY4CM7iUdPdQKE7KG3ndlBgIBTx12cuMhgPg/mEsJGk
         qGtosYFNSpPj3UoukqC/H9FaF1cLDqpT5PAonTiMiCYEe1nxZQwBTjwaWAJRSoAZbBfr
         h9mXNAwimPXirORJaJ/+A6D4MuppnM1nOuEayDk9mZUkxiQAQzdak3X5xHwwSsUKdLst
         A5s2g2suW3ZUGQYrwyyTKJZU5OiGJPJMrIuJqs0H4RD67EjGQEE29oXDnzbnzDn37jro
         B4EIruWgxFf34rHjHSYDPA1+fHP4+Vqdv1yS1XYDAz4OZJC/yCMd3SVZ+GUbSmv4DfzF
         8juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VUvIqhD5Rxtvk/jJNTE+TX+Ap06+KNlY2PxWsoF7YmE=;
        b=kBPAy8sVpRdHcAA2w+x5GVY0HFHo8ULJRkhNFYm5TBgNYH8U+HjU5zJ61etA8F721r
         tLx4RtoIecCrXSuz7kg+x3Tfp2tE4znaB7diV4Mp9fAoNQdkq/xfA+RVTqp1i/xiEvjP
         hnanP2wzYpkHDRuzMvm9SJ2cctTCUzlcDcyabeNU8LUBrZ1TWSRENBJJH0Lm49I/bkKA
         pzqI+KAlPfsRhc6XddIyOEmXQ/agoiGMcApjRvQTwN8xEFmXeGEBh0bFf2miOmVZPH39
         D2kLmAj4QpG3aSpEhFW7R4w8oEyV8tiFO9GWsM2L5mpKH9wxwDlscJbi7uzJKwSeHzWq
         Drnw==
X-Gm-Message-State: AGi0Pua1kjkzgEZ0u1n0KRknGaZt73bJOIYtpNkwxmu8k49wyWBSu1dw
        YDaJ3x+IYH12PLUm6PmKlsw=
X-Google-Smtp-Source: APiQypJxYT67Wj4GYwNMziw54LqhetN94i+LuGa/7Fi/4X5Mj5VAWqVhBi1y04LKBxXwUaIAMUGIJg==
X-Received: by 2002:aca:53cd:: with SMTP id h196mr311956oib.104.1588215950910;
        Wed, 29 Apr 2020 20:05:50 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id h65sm916166oth.34.2020.04.29.20.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 20:05:50 -0700 (PDT)
Date:   Wed, 29 Apr 2020 20:05:48 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Subject: Re: [PATCH v4 1/5] kbuild: add CONFIG_LD_IS_LLD
Message-ID: <20200430030548.GA3546299@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200428221419.2530697-2-natechancellor@gmail.com>
 <CA+icZUXa3JBittjDVdNyV1M08dRt_pwACi2-0nLPEwao6yNABw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUXa3JBittjDVdNyV1M08dRt_pwACi2-0nLPEwao6yNABw@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 09:13:40AM +0200, Sedat Dilek wrote:
> On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
> > specific logic such as ld-version or ld-ifversion and gain the
> > ability to select potential features that depend on the linker at
> > configuration time such as LTO.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> > [nc: Reword commit message]
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> 
> Testing on Debian/testing AMD64 (since Linux v5.3):
> #1: LLVM/Clang/LLD version 9.0 and 10.0
> #2: Debian's GCC 9.3 with ld.lld-9 and ld.lld-10
> 
> I am linking my Linux-kernels with ld.lld despite there are issues -
> then check with ld.bfd.

What issues are these? Have they been reported?

Cheers,
Nathan

> - Sedat -
> 
> > ---
> >
> > v3 -> v4:
> >
> > * No changes.
> >
> > v2 -> v3:
> >
> > * Add Masahiro's ack.
> >
> > v1 -> v2:
> >
> > * No changes.
> >
> > Sami, please scream if you are unhappy with how I worded this commit.
> >
> >  init/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 9e22ee8fbd75e..c15ee42b82726 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -23,6 +23,9 @@ config LD_VERSION
> >  config CC_IS_CLANG
> >         def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
> >
> > +config LD_IS_LLD
> > +       def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> > +
> >  config CLANG_VERSION
> >         int
> >         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> >
> > base-commit: 96c9a7802af7d500a582d89a8b864584fe878c1b
> > --
> > 2.26.2
> >
