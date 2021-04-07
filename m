Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF07135736D
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 19:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348078AbhDGRqu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 13:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236534AbhDGRqt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 13:46:49 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B2EC06175F;
        Wed,  7 Apr 2021 10:46:38 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so18870590otk.5;
        Wed, 07 Apr 2021 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=6a3pKzUY9FjNI9SCR2cZ016ggnL3fH7yvaUV3WTaho0=;
        b=fsNwTrsr961elAIF/i3LPqUBBa3aPoH4XkohpEi+RWm45lViZIKo/hmAFljnpbBEw7
         lOjo3wQh8/0ciKGleHd0ou+jSDPDO3WPAPYYlZf2FFNXaV7fRAcdvEwvje4UOh654eYa
         +ExZLXz6OdV9+X3EKyc4Rdq2tEb17zbkERF6U9UzPjVOfezpVRTTZdqL/do4zYLGmmal
         ZaMVDDGT+7g+6ftmZbliG4caKbVziLQ9Yz3Bs4u46HSofrGpwLvV2TjwtzrRXRAEwhLT
         16zE/qA2z1d1w0OFn0jpOJyYuQH63jPMM9WPm8MD0zFEzyE+U/aGoQDUyrF/O/Ef7aXy
         8Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=6a3pKzUY9FjNI9SCR2cZ016ggnL3fH7yvaUV3WTaho0=;
        b=ZleNeK441XRvD4uxorYJ+Pf68ioJKaAi41J0ySggkKnEiMtoEFgVTUL9n4qgvkPexc
         2RxG11nfns4wFTwoa1SZt5AVjKD5M1NHsQkEoh2mbx+DFUjvu+PaGW8J6M7EJ+hocN2I
         dQFR3ozXQYr4bsEelEjac31pQ/AQu2cI/BKLSyD9Y5Ia0BXupJ/DdcbYMZ4r6gfHV9i0
         4muI90G60Gl90dc/2BCczezxtwI+m+yHz7clIbvyHNU8O28vyFVSrEhttoSwo4hCv63p
         b7zw9qov9RUC2neQ5NJiBtl9PlIrAxfLtB0GRrpCmuXnflXH8NKZccGS0p20LRqH0AI0
         +lOw==
X-Gm-Message-State: AOAM532sP7OaqsbYiVbQHBYI6dSmoMFA9EdOkBuiTaH56LqmTltIZtCI
        N4vbn6/yIATK/OlDLee7XgE=
X-Google-Smtp-Source: ABdhPJx4+s3ZA25gFjrUyH9Zl9zFVuWc4qCqsJn4x9HwCgMbl8N0HLtuVu0s+FJIrBLCaNEOnOnlJQ==
X-Received: by 2002:a9d:6a14:: with SMTP id g20mr3886340otn.205.1617817596433;
        Wed, 07 Apr 2021 10:46:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 8sm5528015otx.1.2021.04.07.10.46.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:46:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 7 Apr 2021 10:46:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: select ARCH_KEEP_MEMBLOCK unconditionally
Message-ID: <20210407174634.GA22486@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 07, 2021 at 10:35:43AM -0700, Nick Desaulniers wrote:
> While removing allnoconfig_y from Kconfig, ARCH=mips allnoconfig builds
> started failing with the error:
> 
> WARNING: modpost: vmlinux.o(.text+0x9c70): Section mismatch in reference
> from the function reserve_exception_space() to the function
> .meminit.text:memblock_reserve()
> The function reserve_exception_space() references the function __meminit
> memblock_reserve().
> This is often because reserve_exception_space lacks a __meminit
> annotation or the annotation of memblock_reserve is wrong.
> ERROR: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> 
> allnoconfig disables DEBUG_KERNEL and thus ARCH_KEEP_MEMBLOCK, which
> changes __init_memblock to be equivalent to __meminit triggering the
> above error.
> 
> Link: https://lore.kernel.org/linux-kbuild/20210313194836.372585-11-masahiroy@kernel.org/
> Fixes: commit a8c0f1c634507 ("MIPS: Select ARCH_KEEP_MEMBLOCK if

s/commit //

> DEBUG_KERNEL to enable sysfs memblock debug")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e9893cd34992..702648f60e41 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -12,7 +12,7 @@ config MIPS
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_GCOV_PROFILE_ALL
> -	select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL
> +	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_SUPPORTS_UPROBES
>  	select ARCH_USE_BUILTIN_BSWAP
>  	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 
