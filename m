Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9557158351
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2020 20:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBJTKz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Feb 2020 14:10:55 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40979 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgBJTKz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 14:10:55 -0500
Received: by mail-pf1-f196.google.com with SMTP id j9so4161066pfa.8
        for <linux-mips@vger.kernel.org>; Mon, 10 Feb 2020 11:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VogtqelQY92uQ90ADDttWa+mU+yx6s+QDpCwPVXTTi8=;
        b=LwSdLvNU1yWoPjzxqJgKcVuq+we05gp72HqCFLuRtAfmsLgxpnMpBsWKDJ8RO+dFMA
         AkRmZGg3a2OuUwbTPIb/1Wg2ddKWfrGIkCwVMv7GkdeTOpcrcnQFLve6zExQ64jo64jA
         5TEneIRnfW04RatmMnOF4B5VSF1zzpIzjv81GugNVI+/MU81qOlhExO2euBvc1odcOzX
         5d0CSGNIFboTNY4IhKQRkDMdgugZQ1tfZ07JcPrYK5Nb+Y/YTzSTpbuzR/CjkAiBmwRE
         /73+nJh5Xx0LzJ0lu8XTU35AjgUKzlF9TFLztXIFFpqy6SClsASuER4/MjoZdl4LTixY
         oG2w==
X-Gm-Message-State: APjAAAUWQb1UwkCH6ryG7dQfKeVcCMhccxWHj+Y7xpK9fH9Qe6pGrvWx
        3R+xeLdgFhrOYs1VHECtKt0=
X-Google-Smtp-Source: APXvYqyMkiMPr4CwRH1qrp2Aj6OAqsQag/tZoEZcpMi+zg6pPWIKIQbfjqf5ucbVbowyZNKPD+kzFw==
X-Received: by 2002:a63:1c1b:: with SMTP id c27mr3231458pgc.251.1581361854322;
        Mon, 10 Feb 2020 11:10:54 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id w26sm1123374pfj.119.2020.02.10.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 11:10:53 -0800 (PST)
Date:   Mon, 10 Feb 2020 11:14:24 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Victor Kamensky <kamensky@cisco.com>
Cc:     linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Message-ID: <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203233133.38613-2-kamensky@cisco.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Victor,

On Mon, Feb 03, 2020 at 03:31:32PM -0800, Victor Kamensky wrote:
> Observed that when kernel is built with Yocto mips64-poky-linux-gcc,
> and mips64-poky-linux-gnun32-gcc toolchain, resulting vdso contains
> 'jalr t9' instructions in its code and since in vdso case nobody
> sets GOT table code crashes when instruction reached. On other hand
> observed that when kernel is built mips-poky-linux-gcc toolchain, the
> same 'jalr t9' instruction are replaced with PC relative function
> calls using 'bal' instructions.

Interesting. I'm guessing that the root of your problem is that $gp/$28
isn't set up? So a load from $gp gets you a bogus address in $t9 which
you then jump to?

> The difference boils down to -mrelax-pic-calls and -mexplicit-relocs
> gcc options that gets different default values depending on gcc
> target triplets and corresponding binutils. -mrelax-pic-calls got
> enabled by default only in mips-poky-linux-gcc case. MIPS binuitls
> ld relies on R_MIPS_JALR relocation to convert 'jalr t9' into 'bal'
> and such relocation is generated only if -mrelax-pic-calls option
> is on.

Note that function pointers aren't necessarily the only thing that uses
$gp - data can be referenced via it too, which would also cause problems
without $gp set appropriately. So I don't think this would actually fix
the problem, it's just working around it. Really we just want $gp to be
set to the right value.

> Solution call out -mrelax-pic-calls and -mexplicit-relocs options
> explicitily while compiling MIPS vdso code. That would get correct
> and consistent between different toolchains behaviour.

Which kernel version did you find this issue with? Could you check
whether you have commit bbcc5672b006 ("MIPS: Avoid VDSO ABI breakage due
to global register variable")? That was merged for v5.5-rc5.

Having said that I'm not necessarily against adding -mrelax-pic-calls if
it's done as an optimization rather than the claimed bug fix.

Thanks,
    Paul

> Reported-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  arch/mips/vdso/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index b2a2e032dc99..ec6c5c645edd 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -35,7 +35,9 @@ cflags-vdso := $(ccflags-vdso) \
>  	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
>  	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
>  	$(call cc-option, -fno-asynchronous-unwind-tables) \
> -	$(call cc-option, -fno-stack-protector)
> +	$(call cc-option, -fno-stack-protector) \
> +	$(call cc-option, -mrelax-pic-calls) \
> +	$(call cc-option, -mexplicit-relocs)
>  aflags-vdso := $(ccflags-vdso) \
>  	-D__ASSEMBLY__ -Wa,-gdwarf-2
>  
> -- 
> 2.21.1
> 
