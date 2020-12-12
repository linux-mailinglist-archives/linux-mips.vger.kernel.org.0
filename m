Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826752D84F5
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 06:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbgLLFxW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Dec 2020 00:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgLLFxM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Dec 2020 00:53:12 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B51AC0613D3;
        Fri, 11 Dec 2020 21:52:32 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id y5so11756313iow.5;
        Fri, 11 Dec 2020 21:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=de8qBW77ez2vG1k7g514vZ/gVwv8ByEiy7/gkUkjT1M=;
        b=vREtwM0YGPhQ/XD++8S3cVIT38mJng6WEpGZ2IoNGpR1vrFbqwryxq/RwTbzBNeyut
         ITQ2hlZyPNFcERgd6FfztKl+kQ/i0879wT6u5C4ITw1uPliT0BP3aXC3yGWs3G9l5d0r
         fHAi+dIC2C1a8TTHFbt5oiAosHDLBP/ZZ+CDZbc88lVkGgG8+y3UMj+sN+eUM/dRxylR
         g78ILa3OWWHTQjCDEVmfDuTf0B2H5nG03gcsc31nsKGwSrSMKhB4dFJxFy0zP31kFoos
         jF3WVRVQ3rFgx8b1wQbpPXnzSZKIEF3PRmxRx9afR9zqevYdETq9dJCvgJtBBGHeUepN
         i+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=de8qBW77ez2vG1k7g514vZ/gVwv8ByEiy7/gkUkjT1M=;
        b=fyH8YABECefg61h7ppufZ3WeIv2L57U12TNS7TqHad5ffJ9+gtsUr2x3UZY3gFNIj4
         7NGfSTJauTa58yjI0PTnTnNrNqZVxMNKOElcrXN2pAzH8QCksZhaZClJMribgsNwFTJx
         cxDnQWFFE3OXq1GjDjeELAERmhx+IY8XbWneMev75v9rf4t52I4noXHEyKq1RUehfzSw
         fi/HLpKcykGnSJchT0ZtJDdmlDU3We9a8EctLCe5fRJZJSYaHdFr7sNruQKHH/ekAFxC
         5/rbYK2mp1xhhkewF2oCVfRpUByK+t2hzO9dS1wmUpM2YTLFM4gws5g9b4Ddj1wTIPb/
         jkxw==
X-Gm-Message-State: AOAM532JIp6A+a/4778oCQEZE/wOILB7NIToNHvPg8IB0+bLB7bxdSOc
        wBllinlloBibU3+ColxgKGc=
X-Google-Smtp-Source: ABdhPJyIvcNYPBRy8ETgODWko7PYHuwoeJSdT+Ep4FOV4A/DgsWNsQZ/SHxOfg4PptQZ7xHi0/CkOQ==
X-Received: by 2002:a05:6638:5b2:: with SMTP id b18mr20364316jar.69.1607752351667;
        Fri, 11 Dec 2020 21:52:31 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id 143sm6795278ila.4.2020.12.11.21.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 21:52:30 -0800 (PST)
Date:   Fri, 11 Dec 2020 22:52:28 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        tsbogend@alpha.franken.de, ndesaulniers@google.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v2] mips: lib: uncached: fix non-standard usage of
 variable 'sp'
Message-ID: <20201212055228.GA823758@ubuntu-m3-large-x86>
References: <20201211102437.3929348-1-anders.roxell@linaro.org>
 <alpine.LFD.2.21.2012111950290.2104409@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2012111950290.2104409@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 11, 2020 at 07:54:07PM +0000, Maciej W. Rozycki wrote:
> On Fri, 11 Dec 2020, Anders Roxell wrote:
> 
> > diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
> > index 09d5deea747f..f80a67c092b6 100644
> > --- a/arch/mips/lib/uncached.c
> > +++ b/arch/mips/lib/uncached.c
> > @@ -37,10 +37,12 @@
> >   */
> >  unsigned long run_uncached(void *func)
> >  {
> > -	register long sp __asm__("$sp");
> >  	register long ret __asm__("$2");
> >  	long lfunc = (long)func, ufunc;
> >  	long usp;
> > +	long sp;
> > +
> > +	__asm__("move %0, $sp" : "=r" (sp));
> 
>  I thought it might be better to make `sp' global instead, so that it's 
> the compiler that chooses how to schedule accesses.  Have you tried that?
> 
>   Maciej

This will not work, as the LLVM Mips backend does not support using $sp
as a global register variable:

https://github.com/llvm/llvm-project/commit/1440bb2a26ff13df1b29762658ee122cc0bc47ae

$ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- LLVM=1 O=out \
distclean malta_kvm_guest_defconfig vmlinux
fatal error: error in backend: Invalid register name global variable
...

Cheers,
Nathan
