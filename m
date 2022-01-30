Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD264A37B9
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jan 2022 17:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbiA3Qha (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jan 2022 11:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiA3Qh2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jan 2022 11:37:28 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84134C061714;
        Sun, 30 Jan 2022 08:37:28 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id x193so22377192oix.0;
        Sun, 30 Jan 2022 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PT3Z2bUaxatKYqJejA1Ui8n0atmIqmXcvqOMPx4VxPQ=;
        b=fc6QXxe8mJ5FP99vHAbRb7e4jKpMaGvXqF/IiULxJo/C0JLDFNG+yFAGXgEB2f0uAb
         PCEpWIpDDejW2xAX47UFsmVWUptxmyttw8ZO3dbykeMLx5VqHfnSxa+K/kQCj+5uziEr
         4B7tqu5zBCl1wMMmBQYmjTvclYNiBjTDQyw4FXN4QAzHh2vbqYGO6jAxwJvNiiA6sBo8
         X51dR1owr3SCbn7UDXziJTBAUUrzieOiN1gY4irWux1qcBzOMaXJ/FsbnuleuNnQ8/vU
         iywXIsxAsR52zA2blhv6uZNuUVzAAImD3pCqQ4el/Mt4Jdccwu2oDoEKOmgCQ2OUOBxu
         TiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=PT3Z2bUaxatKYqJejA1Ui8n0atmIqmXcvqOMPx4VxPQ=;
        b=v4dbd0fyMWILzj3s26sz05CbzIiGIWTxVGMLDsh0CG7/mJLFwZUADIkU2kXOHiKadB
         CG2rAQ0wSuzHGj6z0fWJ4XUG49ZzB3UGL3hKc0wlXbz7ol380kODw4MSxBOiAXGn9raR
         bRADXlqjBgDPC1ULj3jmYnroHr+2ocD58s3TgDSnuwHfQS4RhKDZurAnaVywSdXpRJ2R
         Xv33YIkhVO2+n1FCAMFVFTn9QkZTGaNu2+yLvVxrFJJHOstWZ5RsdN1l9pZY4D85nWaC
         V4dhf4+nr/JlAucDjGquL4qMUUc9wFCdwClzio1Hk2lJWYn9HMr3Qpcrbi2t4qZ9cAJs
         EmsA==
X-Gm-Message-State: AOAM531Ayt+TgAENymE5PglonyxGhwao8YXrN7qg310+EVt63j5DSqec
        rOP97SMy3tPHPVvR0ZzOOrqg8TR+nfgTzQ==
X-Google-Smtp-Source: ABdhPJziDIop/y73QGzQFkIKOGlFdaMs0EOuHIE3PaDb6Rlh0g4tWxwWNKDyXyzgKBGXoqCjhYmmbQ==
X-Received: by 2002:a05:6808:2091:: with SMTP id s17mr11924477oiw.328.1643560647631;
        Sun, 30 Jan 2022 08:37:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p82sm6062179oib.25.2022.01.30.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 08:37:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 30 Jan 2022 08:37:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix build error due to PTR used in more places
Message-ID: <20220130163725.GA2792319@roeck-us.net>
References: <20220125141946.54114-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125141946.54114-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 25, 2022 at 03:19:44PM +0100, Thomas Bogendoerfer wrote:
> Use PTR_WD instead of PTR to avoid clashes with other parts.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Building mips:cavium_octeon_defconfig ... failed
--------------
Error log:
arch/mips/cavium-octeon/octeon-memcpy.S: Assembler messages:
arch/mips/cavium-octeon/octeon-memcpy.S:187: Error: unrecognized opcode `ptr 9b,l_exc'
...

Missed one place in Cavium assembler code.

arch/mips/cavium-octeon/octeon-memcpy.S:        PTR     9b, handler;

#regzbot introduced: fa62f39dc7e2

Guenter

> ---
>  arch/mips/include/asm/asm.h            |   4 +-
>  arch/mips/include/asm/ftrace.h         |   4 +-
>  arch/mips/include/asm/r4kcache.h       |   4 +-
>  arch/mips/include/asm/unaligned-emul.h | 176 ++++++++++++-------------
>  arch/mips/kernel/mips-r2-to-r6-emul.c  | 104 +++++++--------
>  arch/mips/kernel/r2300_fpu.S           |   6 +-
>  arch/mips/kernel/r4k_fpu.S             |   2 +-
>  arch/mips/kernel/relocate_kernel.S     |  22 ++--
>  arch/mips/kernel/scall32-o32.S         |  10 +-
>  arch/mips/kernel/scall64-n32.S         |   2 +-
>  arch/mips/kernel/scall64-n64.S         |   2 +-
>  arch/mips/kernel/scall64-o32.S         |  10 +-
>  arch/mips/kernel/syscall.c             |   8 +-
>  arch/mips/lib/csum_partial.S           |   4 +-
>  arch/mips/lib/memcpy.S                 |   4 +-
>  arch/mips/lib/memset.S                 |   2 +-
>  arch/mips/lib/strncpy_user.S           |   4 +-
>  arch/mips/lib/strnlen_user.S           |   2 +-
>  18 files changed, 185 insertions(+), 185 deletions(-)
> 
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 6ffdd4b5e1d0..336ac9b65235 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -285,7 +285,7 @@ symbol		=	value
>  
>  #define PTR_SCALESHIFT	2
>  
> -#define PTR		.word
> +#define PTR_WD		.word
>  #define PTRSIZE		4
>  #define PTRLOG		2
>  #endif
> @@ -310,7 +310,7 @@ symbol		=	value
>  
>  #define PTR_SCALESHIFT	3
>  
> -#define PTR		.dword
> +#define PTR_WD		.dword
>  #define PTRSIZE		8
>  #define PTRLOG		3
>  #endif
> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
> index b463f2aa5a61..db497a8167da 100644
> --- a/arch/mips/include/asm/ftrace.h
> +++ b/arch/mips/include/asm/ftrace.h
> @@ -32,7 +32,7 @@ do {							\
>  		".previous\n"				\
>  							\
>  		".section\t__ex_table,\"a\"\n\t"	\
> -		STR(PTR) "\t1b, 3b\n\t"			\
> +		STR(PTR_WD) "\t1b, 3b\n\t"		\
>  		".previous\n"				\
>  							\
>  		: [tmp_dst] "=&r" (dst), [tmp_err] "=r" (error)\
> @@ -54,7 +54,7 @@ do {						\
>  		".previous\n"			\
>  						\
>  		".section\t__ex_table,\"a\"\n\t"\
> -		STR(PTR) "\t1b, 3b\n\t"		\
> +		STR(PTR_WD) "\t1b, 3b\n\t"	\
>  		".previous\n"			\
>  						\
>  		: [tmp_err] "=r" (error)	\
> diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
> index af3788589ee6..431a1c9d53fc 100644
> --- a/arch/mips/include/asm/r4kcache.h
> +++ b/arch/mips/include/asm/r4kcache.h
> @@ -119,7 +119,7 @@ static inline void flush_scache_line(unsigned long addr)
>  	"	j	2b			\n"		\
>  	"	.previous			\n"		\
>  	"	.section __ex_table,\"a\"	\n"		\
> -	"	"STR(PTR)" 1b, 3b		\n"		\
> +	"	"STR(PTR_WD)" 1b, 3b		\n"		\
>  	"	.previous"					\
>  	: "+r" (__err)						\
>  	: "i" (op), "r" (addr), "i" (-EFAULT));			\
> @@ -142,7 +142,7 @@ static inline void flush_scache_line(unsigned long addr)
>  	"	j	2b			\n"		\
>  	"	.previous			\n"		\
>  	"	.section __ex_table,\"a\"	\n"		\
> -	"	"STR(PTR)" 1b, 3b		\n"		\
> +	"	"STR(PTR_WD)" 1b, 3b		\n"		\
>  	"	.previous"					\
>  	: "+r" (__err)						\
>  	: "i" (op), "r" (addr), "i" (-EFAULT));			\
> diff --git a/arch/mips/include/asm/unaligned-emul.h b/arch/mips/include/asm/unaligned-emul.h
> index 2022b18944b9..9af0f4d3d288 100644
> --- a/arch/mips/include/asm/unaligned-emul.h
> +++ b/arch/mips/include/asm/unaligned-emul.h
> @@ -20,8 +20,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -41,8 +41,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -74,10 +74,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -102,8 +102,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -125,8 +125,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -145,8 +145,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -178,10 +178,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -223,14 +223,14 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> -		STR(PTR)"\t5b, 11b\n\t"		    \
> -		STR(PTR)"\t6b, 11b\n\t"		    \
> -		STR(PTR)"\t7b, 11b\n\t"		    \
> -		STR(PTR)"\t8b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t5b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t6b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t7b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t8b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -255,8 +255,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"              \
> -		STR(PTR)"\t2b, 4b\n\t"              \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                        \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));\
> @@ -276,8 +276,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                                \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -296,8 +296,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                                \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -325,10 +325,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (res)				    \
>  		: "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -365,14 +365,14 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> -		STR(PTR)"\t5b, 11b\n\t"		    \
> -		STR(PTR)"\t6b, 11b\n\t"		    \
> -		STR(PTR)"\t7b, 11b\n\t"		    \
> -		STR(PTR)"\t8b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t5b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t6b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t7b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t8b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (res)				    \
>  		: "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -398,8 +398,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -419,8 +419,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -452,10 +452,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -481,8 +481,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -504,8 +504,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -524,8 +524,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=&r" (value), "=r" (res)         \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -557,10 +557,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -602,14 +602,14 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> -		STR(PTR)"\t5b, 11b\n\t"		    \
> -		STR(PTR)"\t6b, 11b\n\t"		    \
> -		STR(PTR)"\t7b, 11b\n\t"		    \
> -		STR(PTR)"\t8b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t5b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t6b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t7b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t8b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (value), "=r" (res)	    \
>  		: "r" (addr), "i" (-EFAULT));       \
> @@ -632,8 +632,8 @@ do {                                                 \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                        \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));\
> @@ -653,8 +653,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                                \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -673,8 +673,8 @@ do {                                                \
>  		"j\t3b\n\t"                         \
>  		".previous\n\t"                     \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 4b\n\t"               \
> -		STR(PTR)"\t2b, 4b\n\t"               \
> +		STR(PTR_WD)"\t1b, 4b\n\t"           \
> +		STR(PTR_WD)"\t2b, 4b\n\t"           \
>  		".previous"                         \
>  		: "=r" (res)                                \
>  		: "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -703,10 +703,10 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (res)				    \
>  		: "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -743,14 +743,14 @@ do {                                                \
>  		"j\t10b\n\t"			    \
>  		".previous\n\t"			    \
>  		".section\t__ex_table,\"a\"\n\t"    \
> -		STR(PTR)"\t1b, 11b\n\t"		    \
> -		STR(PTR)"\t2b, 11b\n\t"		    \
> -		STR(PTR)"\t3b, 11b\n\t"		    \
> -		STR(PTR)"\t4b, 11b\n\t"		    \
> -		STR(PTR)"\t5b, 11b\n\t"		    \
> -		STR(PTR)"\t6b, 11b\n\t"		    \
> -		STR(PTR)"\t7b, 11b\n\t"		    \
> -		STR(PTR)"\t8b, 11b\n\t"		    \
> +		STR(PTR_WD)"\t1b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t2b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t3b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t4b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t5b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t6b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t7b, 11b\n\t"	    \
> +		STR(PTR_WD)"\t8b, 11b\n\t"	    \
>  		".previous"			    \
>  		: "=&r" (res)				    \
>  		: "r" (value), "r" (addr), "i" (-EFAULT)    \
> diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
> index a39ec755e4c2..750fe569862b 100644
> --- a/arch/mips/kernel/mips-r2-to-r6-emul.c
> +++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
> @@ -1258,10 +1258,10 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	10b\n"
>  			"	.previous\n"
>  			"	.section	__ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1333,10 +1333,10 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	10b\n"
>  			"       .previous\n"
>  			"	.section	__ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1404,10 +1404,10 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1474,10 +1474,10 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1589,14 +1589,14 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> -			STR(PTR) " 5b,8b\n"
> -			STR(PTR) " 6b,8b\n"
> -			STR(PTR) " 7b,8b\n"
> -			STR(PTR) " 0b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
> +			STR(PTR_WD) " 5b,8b\n"
> +			STR(PTR_WD) " 6b,8b\n"
> +			STR(PTR_WD) " 7b,8b\n"
> +			STR(PTR_WD) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1708,14 +1708,14 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j      9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> -			STR(PTR) " 5b,8b\n"
> -			STR(PTR) " 6b,8b\n"
> -			STR(PTR) " 7b,8b\n"
> -			STR(PTR) " 0b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
> +			STR(PTR_WD) " 5b,8b\n"
> +			STR(PTR_WD) " 6b,8b\n"
> +			STR(PTR_WD) " 7b,8b\n"
> +			STR(PTR_WD) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set    pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1827,14 +1827,14 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> -			STR(PTR) " 5b,8b\n"
> -			STR(PTR) " 6b,8b\n"
> -			STR(PTR) " 7b,8b\n"
> -			STR(PTR) " 0b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
> +			STR(PTR_WD) " 5b,8b\n"
> +			STR(PTR_WD) " 6b,8b\n"
> +			STR(PTR_WD) " 7b,8b\n"
> +			STR(PTR_WD) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -1945,14 +1945,14 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"       j	9b\n"
>  			"       .previous\n"
>  			"       .section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,8b\n"
> -			STR(PTR) " 2b,8b\n"
> -			STR(PTR) " 3b,8b\n"
> -			STR(PTR) " 4b,8b\n"
> -			STR(PTR) " 5b,8b\n"
> -			STR(PTR) " 6b,8b\n"
> -			STR(PTR) " 7b,8b\n"
> -			STR(PTR) " 0b,8b\n"
> +			STR(PTR_WD) " 1b,8b\n"
> +			STR(PTR_WD) " 2b,8b\n"
> +			STR(PTR_WD) " 3b,8b\n"
> +			STR(PTR_WD) " 4b,8b\n"
> +			STR(PTR_WD) " 5b,8b\n"
> +			STR(PTR_WD) " 6b,8b\n"
> +			STR(PTR_WD) " 7b,8b\n"
> +			STR(PTR_WD) " 0b,8b\n"
>  			"       .previous\n"
>  			"       .set	pop\n"
>  			: "+&r"(rt), "=&r"(rs),
> @@ -2007,7 +2007,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,3b\n"
> +			STR(PTR_WD) " 1b,3b\n"
>  			".previous\n"
>  			: "=&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV)
> @@ -2065,7 +2065,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,3b\n"
> +			STR(PTR_WD) " 1b,3b\n"
>  			".previous\n"
>  			: "+&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV));
> @@ -2126,7 +2126,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,3b\n"
> +			STR(PTR_WD) " 1b,3b\n"
>  			".previous\n"
>  			: "=&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV)
> @@ -2189,7 +2189,7 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			STR(PTR) " 1b,3b\n"
> +			STR(PTR_WD) " 1b,3b\n"
>  			".previous\n"
>  			: "+&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV));
> diff --git a/arch/mips/kernel/r2300_fpu.S b/arch/mips/kernel/r2300_fpu.S
> index cbf6db98cfb3..2748c55820c2 100644
> --- a/arch/mips/kernel/r2300_fpu.S
> +++ b/arch/mips/kernel/r2300_fpu.S
> @@ -23,14 +23,14 @@
>  #define EX(a,b)							\
>  9:	a,##b;							\
>  	.section __ex_table,"a";				\
> -	PTR	9b,fault;					\
> +	PTR_WD	9b,fault;					\
>  	.previous
>  
>  #define EX2(a,b)						\
>  9:	a,##b;							\
>  	.section __ex_table,"a";				\
> -	PTR	9b,fault;					\
> -	PTR	9b+4,fault;					\
> +	PTR_WD	9b,fault;					\
> +	PTR_WD	9b+4,fault;					\
>  	.previous
>  
>  	.set	mips1
> diff --git a/arch/mips/kernel/r4k_fpu.S b/arch/mips/kernel/r4k_fpu.S
> index b91e91106475..2e687c60bc4f 100644
> --- a/arch/mips/kernel/r4k_fpu.S
> +++ b/arch/mips/kernel/r4k_fpu.S
> @@ -31,7 +31,7 @@
>  .ex\@:	\insn	\reg, \src
>  	.set	pop
>  	.section __ex_table,"a"
> -	PTR	.ex\@, fault
> +	PTR_WD	.ex\@, fault
>  	.previous
>  	.endm
>  
> diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
> index f3c908abdbb8..cfde14b48fd8 100644
> --- a/arch/mips/kernel/relocate_kernel.S
> +++ b/arch/mips/kernel/relocate_kernel.S
> @@ -147,10 +147,10 @@ LEAF(kexec_smp_wait)
>  
>  kexec_args:
>  	EXPORT(kexec_args)
> -arg0:	PTR		0x0
> -arg1:	PTR		0x0
> -arg2:	PTR		0x0
> -arg3:	PTR		0x0
> +arg0:	PTR_WD		0x0
> +arg1:	PTR_WD		0x0
> +arg2:	PTR_WD		0x0
> +arg3:	PTR_WD		0x0
>  	.size	kexec_args,PTRSIZE*4
>  
>  #ifdef CONFIG_SMP
> @@ -161,10 +161,10 @@ arg3:	PTR		0x0
>   */
>  secondary_kexec_args:
>  	EXPORT(secondary_kexec_args)
> -s_arg0: PTR		0x0
> -s_arg1: PTR		0x0
> -s_arg2: PTR		0x0
> -s_arg3: PTR		0x0
> +s_arg0: PTR_WD		0x0
> +s_arg1: PTR_WD		0x0
> +s_arg2: PTR_WD		0x0
> +s_arg3: PTR_WD		0x0
>  	.size	secondary_kexec_args,PTRSIZE*4
>  kexec_flag:
>  	LONG		0x1
> @@ -173,17 +173,17 @@ kexec_flag:
>  
>  kexec_start_address:
>  	EXPORT(kexec_start_address)
> -	PTR		0x0
> +	PTR_WD		0x0
>  	.size		kexec_start_address, PTRSIZE
>  
>  kexec_indirection_page:
>  	EXPORT(kexec_indirection_page)
> -	PTR		0
> +	PTR_WD		0
>  	.size		kexec_indirection_page, PTRSIZE
>  
>  relocate_new_kernel_end:
>  
>  relocate_new_kernel_size:
>  	EXPORT(relocate_new_kernel_size)
> -	PTR		relocate_new_kernel_end - relocate_new_kernel
> +	PTR_WD		relocate_new_kernel_end - relocate_new_kernel
>  	.size		relocate_new_kernel_size, PTRSIZE
> diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
> index b1b2e106f711..9bfce5f75f60 100644
> --- a/arch/mips/kernel/scall32-o32.S
> +++ b/arch/mips/kernel/scall32-o32.S
> @@ -72,10 +72,10 @@ loads_done:
>  	.set	pop
>  
>  	.section __ex_table,"a"
> -	PTR	load_a4, bad_stack_a4
> -	PTR	load_a5, bad_stack_a5
> -	PTR	load_a6, bad_stack_a6
> -	PTR	load_a7, bad_stack_a7
> +	PTR_WD	load_a4, bad_stack_a4
> +	PTR_WD	load_a5, bad_stack_a5
> +	PTR_WD	load_a6, bad_stack_a6
> +	PTR_WD	load_a7, bad_stack_a7
>  	.previous
>  
>  	lw	t0, TI_FLAGS($28)	# syscall tracing enabled?
> @@ -216,7 +216,7 @@ einval: li	v0, -ENOSYS
>  #endif /* CONFIG_MIPS_MT_FPAFF */
>  
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> -#define __SYSCALL(nr, entry) 	PTR entry
> +#define __SYSCALL(nr, entry) 	PTR_WD entry
>  	.align	2
>  	.type	sys_call_table, @object
>  EXPORT(sys_call_table)
> diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
> index f650c55a17dc..97456b2ca7dc 100644
> --- a/arch/mips/kernel/scall64-n32.S
> +++ b/arch/mips/kernel/scall64-n32.S
> @@ -101,7 +101,7 @@ not_n32_scall:
>  
>  	END(handle_sysn32)
>  
> -#define __SYSCALL(nr, entry)	PTR entry
> +#define __SYSCALL(nr, entry)	PTR_WD entry
>  	.type	sysn32_call_table, @object
>  EXPORT(sysn32_call_table)
>  #include <asm/syscall_table_n32.h>
> diff --git a/arch/mips/kernel/scall64-n64.S b/arch/mips/kernel/scall64-n64.S
> index 5d7bfc65e4d0..5f6ed4b4c399 100644
> --- a/arch/mips/kernel/scall64-n64.S
> +++ b/arch/mips/kernel/scall64-n64.S
> @@ -109,7 +109,7 @@ illegal_syscall:
>  	j	n64_syscall_exit
>  	END(handle_sys64)
>  
> -#define __SYSCALL(nr, entry)	PTR entry
> +#define __SYSCALL(nr, entry)	PTR_WD entry
>  	.align	3
>  	.type	sys_call_table, @object
>  EXPORT(sys_call_table)
> diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
> index cedc8bd88804..d3c2616cba22 100644
> --- a/arch/mips/kernel/scall64-o32.S
> +++ b/arch/mips/kernel/scall64-o32.S
> @@ -73,10 +73,10 @@ load_a7: lw	a7, 28(t0)		# argument #8 from usp
>  loads_done:
>  
>  	.section __ex_table,"a"
> -	PTR	load_a4, bad_stack_a4
> -	PTR	load_a5, bad_stack_a5
> -	PTR	load_a6, bad_stack_a6
> -	PTR	load_a7, bad_stack_a7
> +	PTR_WD	load_a4, bad_stack_a4
> +	PTR_WD	load_a5, bad_stack_a5
> +	PTR_WD	load_a6, bad_stack_a6
> +	PTR_WD	load_a7, bad_stack_a7
>  	.previous
>  
>  	li	t1, _TIF_WORK_SYSCALL_ENTRY
> @@ -214,7 +214,7 @@ einval: li	v0, -ENOSYS
>  	END(sys32_syscall)
>  
>  #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> -#define __SYSCALL(nr, entry)	PTR entry
> +#define __SYSCALL(nr, entry)	PTR_WD entry
>  	.align	3
>  	.type	sys32_call_table,@object
>  EXPORT(sys32_call_table)
> diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
> index 5512cd586e6e..ae93a607ddf7 100644
> --- a/arch/mips/kernel/syscall.c
> +++ b/arch/mips/kernel/syscall.c
> @@ -122,8 +122,8 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
>  		"	j	3b					\n"
>  		"	.previous					\n"
>  		"	.section __ex_table,\"a\"			\n"
> -		"	"STR(PTR)"	1b, 4b				\n"
> -		"	"STR(PTR)"	2b, 4b				\n"
> +		"	"STR(PTR_WD)"	1b, 4b				\n"
> +		"	"STR(PTR_WD)"	2b, 4b				\n"
>  		"	.previous					\n"
>  		"	.set	pop					\n"
>  		: [old] "=&r" (old),
> @@ -152,8 +152,8 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
>  		"	j	3b					\n"
>  		"	.previous					\n"
>  		"	.section __ex_table,\"a\"			\n"
> -		"	"STR(PTR)"	1b, 5b				\n"
> -		"	"STR(PTR)"	2b, 5b				\n"
> +		"	"STR(PTR_WD)"	1b, 5b				\n"
> +		"	"STR(PTR_WD)"	2b, 5b				\n"
>  		"	.previous					\n"
>  		"	.set	pop					\n"
>  		: [old] "=&r" (old),
> diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
> index a46db0807195..7767137c3e49 100644
> --- a/arch/mips/lib/csum_partial.S
> +++ b/arch/mips/lib/csum_partial.S
> @@ -347,7 +347,7 @@ EXPORT_SYMBOL(csum_partial)
>  	.if \mode == LEGACY_MODE;		\
>  9:		insn reg, addr;			\
>  		.section __ex_table,"a";	\
> -		PTR	9b, .L_exc;		\
> +		PTR_WD	9b, .L_exc;		\
>  		.previous;			\
>  	/* This is enabled in EVA mode */	\
>  	.else;					\
> @@ -356,7 +356,7 @@ EXPORT_SYMBOL(csum_partial)
>  		    ((\to == USEROP) && (type == ST_INSN));	\
>  9:			__BUILD_EVA_INSN(insn##e, reg, addr);	\
>  			.section __ex_table,"a";		\
> -			PTR	9b, .L_exc;			\
> +			PTR_WD	9b, .L_exc;			\
>  			.previous;				\
>  		.else;						\
>  			/* EVA without exception */		\
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index 277c32296636..18a43f2e29c8 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -116,7 +116,7 @@
>  	.if \mode == LEGACY_MODE;				\
>  9:		insn reg, addr;					\
>  		.section __ex_table,"a";			\
> -		PTR	9b, handler;				\
> +		PTR_WD	9b, handler;				\
>  		.previous;					\
>  	/* This is assembled in EVA mode */			\
>  	.else;							\
> @@ -125,7 +125,7 @@
>  		    ((\to == USEROP) && (type == ST_INSN));	\
>  9:			__BUILD_EVA_INSN(insn##e, reg, addr);	\
>  			.section __ex_table,"a";		\
> -			PTR	9b, handler;			\
> +			PTR_WD	9b, handler;			\
>  			.previous;				\
>  		.else;						\
>  			/*					\
> diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
> index b0baa3c79fad..0b342bae9a98 100644
> --- a/arch/mips/lib/memset.S
> +++ b/arch/mips/lib/memset.S
> @@ -52,7 +52,7 @@
>  9:		___BUILD_EVA_INSN(insn, reg, addr);	\
>  	.endif;						\
>  	.section __ex_table,"a";			\
> -	PTR	9b, handler;				\
> +	PTR_WD	9b, handler;				\
>  	.previous
>  
>  	.macro	f_fill64 dst, offset, val, fixup, mode
> diff --git a/arch/mips/lib/strncpy_user.S b/arch/mips/lib/strncpy_user.S
> index 556acf684d7b..13aaa9927ad1 100644
> --- a/arch/mips/lib/strncpy_user.S
> +++ b/arch/mips/lib/strncpy_user.S
> @@ -15,7 +15,7 @@
>  #define EX(insn,reg,addr,handler)			\
>  9:	insn	reg, addr;				\
>  	.section __ex_table,"a";			\
> -	PTR	9b, handler;				\
> +	PTR_WD	9b, handler;				\
>  	.previous
>  
>  /*
> @@ -59,7 +59,7 @@ LEAF(__strncpy_from_user_asm)
>  	jr		ra
>  
>  	.section	__ex_table,"a"
> -	PTR		1b, .Lfault
> +	PTR_WD		1b, .Lfault
>  	.previous
>  
>  	EXPORT_SYMBOL(__strncpy_from_user_asm)
> diff --git a/arch/mips/lib/strnlen_user.S b/arch/mips/lib/strnlen_user.S
> index 92b63f20ec05..6de31b616f9c 100644
> --- a/arch/mips/lib/strnlen_user.S
> +++ b/arch/mips/lib/strnlen_user.S
> @@ -14,7 +14,7 @@
>  #define EX(insn,reg,addr,handler)			\
>  9:	insn	reg, addr;				\
>  	.section __ex_table,"a";			\
> -	PTR	9b, handler;				\
> +	PTR_WD	9b, handler;				\
>  	.previous
>  
>  /*
> -- 
> 2.29.2
> 
