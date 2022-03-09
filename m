Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03EB24D3C97
	for <lists+linux-mips@lfdr.de>; Wed,  9 Mar 2022 23:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiCIWHg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Mar 2022 17:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236824AbiCIWHf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Mar 2022 17:07:35 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0F611EF35
        for <linux-mips@vger.kernel.org>; Wed,  9 Mar 2022 14:06:36 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id n18so490509plg.5
        for <linux-mips@vger.kernel.org>; Wed, 09 Mar 2022 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4umDXsTj1CldyJcysNP+Nnq3pVu2iPQxmtjAZsmbWQc=;
        b=fonhPV0Eq1KKbf2UvQA+KGAibGPw26KwBtm0dM70xCxj6ATohjtHnwM9d6UdiJ4pES
         TtwRiVhwuqVmD1pMJN1AjZmG+ufDLj8RIalRJKwWBNl6MUbtTzyxogX/ltfosrYrsK1W
         ukbHTdoheSpC4mi3+swuWKJMWUMvllUxyoHhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4umDXsTj1CldyJcysNP+Nnq3pVu2iPQxmtjAZsmbWQc=;
        b=Mr568Dz2+OE7oLz4hNMkbC5mNHD6YwrvYY6pabB4E6jKdg/9PMJHCwdVFxsPOg7u7q
         NHUW0gtrNJdPiBCyqjyJWR6LYf65nq0N+YJG2Vp3VWUVaj1P0TMUgV8LWbRL8yQmtw97
         aqw1kwnkDuofOdqWyGrBprDMTzNbQZXIVCpUSGe2BSvazVaYBHN+j5zh9qcsq57ymtV+
         cb76zt7dQ/EfkyE6Qeb/12SIo1L7SLAPiVqcxSfGXIk2yD/1uWNvi5z4mMt8YesW9VCG
         /iYZc2MBkoat/u3Uc25Wqr30QYJ30jZX7UXRDDJuu0IvmngjYqyRGjNaKCWEUBZx9/u8
         8csQ==
X-Gm-Message-State: AOAM5326PEL3HCGTibZQUAndXCUXEtq4/GjxV7Np8GkdlkvqaHgV3EmT
        mpHn0g/6LyRfT8yDf7+OYsKPTQ==
X-Google-Smtp-Source: ABdhPJzGofjm+FGYBG97TRW7gxvFjqmZFdCBX6uEyrkbYPtSeUo2O0Yh6GCX+Sushx4dJa23puvXbA==
X-Received: by 2002:a17:902:7404:b0:151:c3f9:e43a with SMTP id g4-20020a170902740400b00151c3f9e43amr1839188pll.12.1646863595999;
        Wed, 09 Mar 2022 14:06:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u8-20020a056a00098800b004f702473553sm4134935pfg.6.2022.03.09.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:06:35 -0800 (PST)
Date:   Wed, 9 Mar 2022 14:06:35 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yanteng Si <siyanteng01@gmail.com>, linux-mips@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] MIPS: Only use current_stack_pointer on GCC
Message-ID: <202203091406.E94510FD@keescook>
References: <20220309204537.390428-1-keescook@chromium.org>
 <YikTQRql+il3HbrK@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YikTQRql+il3HbrK@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 09, 2022 at 01:51:13PM -0700, Nathan Chancellor wrote:
> Nit: I think the subject needs to be updated (I assume this was written
> before Nick's fix?).
> 
> On Wed, Mar 09, 2022 at 12:45:37PM -0800, Kees Cook wrote:
> > Unfortunately, Clang did not have support for "sp" as a global register
> > definition, and was crashing after the addition of current_stack_pointer.
> > This has been fixed in Clang 15, but earlier Clang versions need to
> > avoid this code, so add a versioned test and revert back to the
> > open-coded asm instances. Fixes Clang build error:
> > 
> > fatal error: error in backend: Invalid register name global variable
> > 
> > Fixes: 200ed341b864 ("mips: Implement "current_stack_pointer"")
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Yanteng Si <siyanteng01@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for sending this!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> > ---
> >  arch/mips/Kconfig                   | 2 +-
> >  arch/mips/include/asm/thread_info.h | 2 ++
> >  arch/mips/kernel/irq.c              | 3 ++-
> >  arch/mips/lib/uncached.c            | 4 +++-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 3f58b45fc953..15769013f46e 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -4,7 +4,7 @@ config MIPS
> >  	default y
> >  	select ARCH_32BIT_OFF_T if !64BIT
> >  	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
> > -	select ARCH_HAS_CURRENT_STACK_POINTER
> > +	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 150000
> 
> Nit: This can be 140000, as release/14.x has received the fix:
> 
> https://github.com/llvm/llvm-project/commit/0826716786cd4a8c7cbcb8c01e4d9fac46b7a17a

Oh! Excellent. Thanks; I missed that it made the branch. I'll send a v2.

-- 
Kees Cook
