Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE051A69DA
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 18:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731516AbgDMQZe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 12:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731510AbgDMQZd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Apr 2020 12:25:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45366C0A3BDC
        for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2020 09:25:33 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so3547874plk.7
        for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2020 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JwAO8xsQIwVha/87e1cz/mK2hxAGtEnUvhnRC7uNihg=;
        b=U7ikXblVAvb3djXivI6h+WdkdCl/w8DkMjW+939N5zQqYiKTgapLFuvy+uKG1MN+A+
         uOZtiYYZ46ikWI4iaUGn7ossQ/xj/GtPFiJhl2cvQGymKMCkKVshu9pKlH/w40kUlf2I
         uRCYO2+Lju8w6ys525kr+p7h3t3GZ11fpR6ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JwAO8xsQIwVha/87e1cz/mK2hxAGtEnUvhnRC7uNihg=;
        b=Y4JTRp1RERuN18HFboblhWDN6IcjeCi8A+VvpGXBkE8m0MYIx0Kp3HsIi1POpFfjq7
         mXjOVzEJ08dI6+Eq+WLsEMqO/0uIgEQ+a4v7pOT8Dwcd+ZmOSNlx+GXesQ9EYtTgrJMw
         gruzbhpfz4tfvjHibpNDX3+Arp7DKXd+Y3PSwKTK/OitHR+5nuJs+L1r/8ygEqwiruEd
         H4Fr2CBFiuTNGEdISb+Kf3iBOMl3KxgqiFA99QraiwVgSMjt9ZlJCwK38nPbem5W7jqL
         lz0EtzhtjVCkJrM7WjbiFCMKZAbVkKJdmJ0TnOhcfw+Do6wQ+LRPdRJj7a5eMGkdFD+f
         qyUg==
X-Gm-Message-State: AGi0PuYD9h90USrTF11jtxHmHdhcXWPdAQ88O6ct3LKkhZ4q+rhjgwec
        dPGADp5J+ckra7fq+kKcSKCuKg==
X-Google-Smtp-Source: APiQypK3pOQisc1e6Bfnk05jixfozTyE2Vw3OJ+nvZ31oIa0sQ+YeHv9MnXlWjairAS3SwoxJBbtzQ==
X-Received: by 2002:a17:90a:757:: with SMTP id s23mr22619308pje.166.1586795132812;
        Mon, 13 Apr 2020 09:25:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 71sm9372363pfw.180.2020.04.13.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:25:32 -0700 (PDT)
Date:   Mon, 13 Apr 2020 09:25:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, macro@linux-mips.org,
        clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
Message-ID: <202004130925.F1B57BC7@keescook>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 13, 2020 at 02:26:49PM +0800, Jiaxun Yang wrote:
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> Link: https://github.com/ClangBuiltLinux/linux/issues/786
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
> Cc: Fangrui Song <maskray@google.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> --
> V2: Take MaskRay's shell magic.
> 
> V3: After spent an hour on dealing with special character issue in
> Makefile, I gave up to do shell hacks and write a util in C instead.
> Thanks Maciej for pointing out Makefile variable problem.
> 
> v4: Finally we managed to find a Makefile method to do it properly
> thanks to Kees. As it's too far from the initial version, I removed
> Review & Test tag from Nick and Fangrui and Cc instead.
> ---
>  arch/mips/Makefile             | 12 +++++++++++-
>  arch/mips/kernel/vmlinux.lds.S |  2 +-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e1c44aed8156..18495568f03e 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -288,9 +288,19 @@ ifdef CONFIG_64BIT
>    endif
>  endif
>  
> +# When linking a 32-bit executable the LLVM linker cannot cope with a
> +# 32-bit load address that has been sign-extended to 64 bits.  Simply
> +# remove the upper 32 bits then, as it is safe to do so with other
> +# linkers.
> +ifdef CONFIG_64BIT
> +	load-ld			= $(load-y)
> +else
> +	load-ld			= $(subst 0xffffffff,0x,$(load-y))
> +endif
> +
>  KBUILD_AFLAGS	+= $(cflags-y)
>  KBUILD_CFLAGS	+= $(cflags-y)
> -KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y)
> +KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DVMLINUX_LINK_ADDRESS=$(load-ld)
>  KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
>  
>  bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y) \
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index a5f00ec73ea6..5226cd8e4bee 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -55,7 +55,7 @@ SECTIONS
>  	/* . = 0xa800000000300000; */
>  	. = 0xffffffff80300000;
>  #endif
> -	. = VMLINUX_LOAD_ADDRESS;
> +	. = VMLINUX_LINK_ADDRESS;
>  	/* read-only */
>  	_text = .;	/* Text and read-only data */
>  	.text : {
> -- 
> 2.26.0.rc2
> 

-- 
Kees Cook
