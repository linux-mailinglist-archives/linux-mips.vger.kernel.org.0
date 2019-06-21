Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 638974E038
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 08:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfFUGGM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 02:06:12 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34971 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfFUGGL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 02:06:11 -0400
Received: by mail-lf1-f68.google.com with SMTP id a25so4153946lfg.2;
        Thu, 20 Jun 2019 23:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Us9SZtnCz2EeCOZyrZ0mXxBCzbiC8YyMbRyNWhRn56g=;
        b=tLX52EUmCyDejuOuDkuAEPyovndrLyf0ijKLR6SPpuRb3sb6hnGQdb+HD/ARLuLfLi
         ClCuyehKswfIpeltF4uWj4v/c1+97vTolsFMEO17bQ1Xr4e/gZ1R1v3TdCsh3WMPq70b
         YXfgtZ66wLWC4zK30oop5lFe1fxDDGe0tizlNGxmxToa0APE/uQIhvD8iY0KXKOwHhcc
         ekZdgKE3fT0fNONZQDUE+tZAgKS7DW+IPq3SqyXLkigM5j9ctVQtK2QX20LPecTeSwuN
         Ie5w4oHn8TFpYiosGMgP2ptqGPWV6HNCK//yehcaLRZ9IYWI6MDXtIumlDVkXZsVDiCG
         gcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Us9SZtnCz2EeCOZyrZ0mXxBCzbiC8YyMbRyNWhRn56g=;
        b=MwhtVhg7LW7kRyvtmPSyEw51yeC0vnbPQ+6eAGCJLnS+lcc21URXeCQsm9rXBr2F1c
         N0Ugj//PJy8JHmmUUahh/Ppn/E2iiKuIMhPGPL4qz86aFG1Zra8r90T0p1e7vT5GyLQh
         hHpRftgNzHywJS6Y0DSI1WVQhRe1JSq6OUcBvSIfM4ZOQ5RWb3awN5NqlMfG7eNr4tt8
         QQKDvotTnJw2o7MNzIhjC3nf8k4+Eurqp1bD30e+OntOtCWGKvUH5FHIHqTnSW8b2N5v
         QrPFcKlnScDCpmd/jaHusHVVAwfsMlTe1qGJRo0hxhpNXoQJLw3aSksxP+4xIHEEbSmi
         jLNg==
X-Gm-Message-State: APjAAAWqgOL/UjdjwVZsIJTZPTjCjJsl0kOoSdH9YBjy6aguhhHU64NQ
        bkOdaK2b5I4oJn8PET8GbCE=
X-Google-Smtp-Source: APXvYqyXGrLpmpW5po6mgKNT0oWg8gLE/EdeyuiyQ5xXvv9xF1YrGzwdJP3pK7NPmBQ0oOTWIkRbTw==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr66821749lfi.180.1561097168921;
        Thu, 20 Jun 2019 23:06:08 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id g5sm245935ljj.69.2019.06.20.23.06.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 23:06:08 -0700 (PDT)
Date:   Fri, 21 Jun 2019 09:06:01 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
Message-ID: <20190621060600.eb6yrh4z42s7dh7z@mobilestation>
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
 <20190620174002.tgayzon7dc5d57fh@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620174002.tgayzon7dc5d57fh@pburton-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Paul,

On Thu, Jun 20, 2019 at 05:40:04PM +0000, Paul Burton wrote:
> Hi Serge,
> 
> On Fri, Jun 14, 2019 at 09:33:42AM +0300, Serge Semin wrote:
> > There are some generic drivers in the kernel, which make use of the
> > q-accessors or their derivatives. While at current asm/io.h the accessors
> > are defined, their implementation is only applicable either for 64bit
> > systems, or for systems with cpu_has_64bits flag set. Obviously there
> > are MIPS systems which are neither of these, but still need to have
> > those drivers supported. In this case the solution is to define some
> > generic versions of the q-accessors, but with a limitation to be
> > non-atomic. Such accessors are defined in the
> > io-64-nonatomic-{hi-lo,lo-hi}.h file. The drivers which utilize the
> > q-suffixed IO-methods are supposed to include the header file, so
> > in case if these accessors aren't defined for the platform, the generic
> > non-atomic versions are utilized. Currently the MIPS-specific asm/io.h
> > file provides the q-accessors for any MIPS system even for ones, which
> > in fact don't support them and raise BUG() in case if any of them is
> > called. Due to this the generic versions of the accessors are never
> > used while an attempt to call the IO-methods causes the kernel BUG().
> > In order to fix this we need to define the q-accessors only for
> > the MIPS systems, which actually support them, and don't define them
> > otherwise, so to let the corresponding drivers to use the non-atomic
> > q-suffixed accessors.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Cc: Vadim V. Vlasov <vadim.vlasov@t-platforms.ru>
> > ---
> >  arch/mips/include/asm/io.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> 
> So this seems pretty reasonable. Build testing all our defconfigs only
> showed up one issue for decstation_defconfig & decstation_r4k_defconfig:
> 
>   drivers/net/fddi/defza.c: In function 'fza_reads':
>   drivers/net/fddi/defza.c:88:17: error: implicit declaration of
>     function 'readq_relaxed'; did you mean 'readw_relaxed'?
>     [-Werror=implicit-function-declaration]
>    #define readq_u readq_relaxed
>                    ^~~~~~~~~~~~~
>   drivers/net/fddi/defza.c:126:13: note: in expansion of macro 'readq_u'
>       *dst++ = readq_u(src++);
>                ^~~~~~~
>   drivers/net/fddi/defza.c: In function 'fza_writes':
>   drivers/net/fddi/defza.c:92:18: error: implicit declaration of
>     function 'writeq_relaxed'; did you mean 'writel_relaxed'?
>     [-Werror=implicit-function-declaration]
>    #define writeq_u writeq_relaxed
>                     ^~~~~~~~~~~~~~
>   drivers/net/fddi/defza.c:151:4: note: in expansion of macro 'writeq_u'
>       writeq_u(*src++, dst++);
>       ^~~~~~~~
>     CC      net/core/scm.o
>   cc1: some warnings being treated as errors
>   make[4]: *** [scripts/Makefile.build:279: drivers/net/fddi/defza.o] Error 1
> 

Thanks for review and testing this for each target. I see you and Maciej already
agreed regarding the solution, and you even sent the fixup. So I don't have
to send the v2 patch.)

Regards,
-Sergey

> These uses of readq_relaxed & writeq_relaxed are both conditional upon
> sizeof(unsigned long) == 8, ie. upon CONFIG_64BIT=y so they're not going
> to present a runtime issue but we need to provide some implementation of
> the *q accessors to keep the compiler happy.
> 
> I see a few options:
> 
> 1) We could just have defza.c include <io-64-nonatomic-lo-hi.h> to get
>    the appropriate declarations, which should then get optimized away by
>    the compiler anyway & never actually be used.
> 
> 2) We could have defza.h #define its readq_u & writeq_u macros
>    differently for CONFIG_32BIT=y kernels, perhaps using
>    __compiletime_error to catch any bogus use of them.
> 
> 3) We could do the same in a generic header, though if nobody else has
>    needed it so far & this is the only place we need it then maybe it's
>    not worth it.
> 
> So I'm thinking option 2 might be best, as below. Having said that I
> don't mind option 1 either - it's simple. Maciej do you have any
> preference?
> 

> Thanks,
>     Paul
> 
> ---
> diff --git a/drivers/net/fddi/defza.c b/drivers/net/fddi/defza.c
> index c5cae8e74dc4..85d6a7f22fe7 100644
> --- a/drivers/net/fddi/defza.c
> +++ b/drivers/net/fddi/defza.c
> @@ -85,11 +85,21 @@ static u8 hw_addr_beacon[8] = { 0x01, 0x80, 0xc2, 0x00, 0x01, 0x00 };
>   */
>  #define readw_u readw_relaxed
>  #define readl_u readl_relaxed
> -#define readq_u readq_relaxed
>  
>  #define writew_u writew_relaxed
>  #define writel_u writel_relaxed
> -#define writeq_u writeq_relaxed
> +
> +#ifdef CONFIG_32BIT
> +extern u64 defza_readq_u(const void *ptr)
> +	__compiletime_error("readq_u should not be used by 32b kernels");
> +extern void defza_writeq_u(u64 val, void *ptr)
> +	__compiletime_error("writeq_u should not be used by 32b kernels");
> +# define readq_u defza_readq_u
> +# define writeq_u defza_writeq_u
> +#else
> +# define readq_u readq_relaxed
> +# define writeq_u writeq_relaxed
> +#endif
>  
>  static inline struct sk_buff *fza_alloc_skb_irq(struct net_device *dev,
>  						unsigned int length)
> 
