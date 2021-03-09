Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0A4331FEB
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 08:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCIHe0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 02:34:26 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:63339 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229625AbhCIHeM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 02:34:12 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4Dvn5Y3ZSfz9txlJ;
        Tue,  9 Mar 2021 08:34:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id Ts3OxJuiZwLg; Tue,  9 Mar 2021 08:34:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4Dvn5Y2c3Vz9txlH;
        Tue,  9 Mar 2021 08:34:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 6357A8B7CE;
        Tue,  9 Mar 2021 08:34:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id vEw3QlpfrpDT; Tue,  9 Mar 2021 08:34:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 885058B773;
        Tue,  9 Mar 2021 08:34:09 +0100 (CET)
Subject: Re: [PATCH v2 1/7] CMDLINE: add generic builtin command line
To:     Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xe-linux-external@cisco.com
Cc:     Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org
References: <20210309000247.2989531-2-danielwa@cisco.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2654902f-c738-b3a2-2f3c-a376cdf1e46d@csgroup.eu>
Date:   Tue, 9 Mar 2021 08:34:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309000247.2989531-2-danielwa@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 09/03/2021 à 01:02, Daniel Walker a écrit :
> This code allows architectures to use a generic builtin command line.
> The state of the builtin command line options across architecture is
> diverse. On x86 and mips they have pretty much the same code and the
> code prepends the builtin command line onto the boot loader provided
> one. On powerpc there is only a builtin override and nothing else.

Same comment as in v1: The above is not correct for powerpc.

> 
> The code in this commit unifies the code into a generic
> header file under the CONFIG_GENERIC_CMDLINE option. When this
> option is enabled the architecture can call the cmdline_add_builtin()
> to add the builtin command line.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   include/linux/cmdline.h | 89 +++++++++++++++++++++++++++++++++++++++++
>   init/Kconfig            | 68 +++++++++++++++++++++++++++++++
>   2 files changed, 157 insertions(+)
>   create mode 100644 include/linux/cmdline.h
> 
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..00929b6e49e6
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_CMDLINE_H
> +#define _LINUX_CMDLINE_H
> +
> +/*
> + *
> + * Copyright (C) 2006,2021. Cisco Systems, Inc.
> + *
> + * Generic Append/Prepend cmdline support.
> + */
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_CMDLINE_BOOL)
> +
> +#ifndef CONFIG_CMDLINE_OVERRIDE
> +#define GENERIC_CMDLINE_NEED_STRLCAT
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dest: The destination of the final appended/prepended string
> + * @src: The starting string or NULL if there isn't one.
> + * @tmp: temporary space used for prepending
> + * @length: the maximum length of the strings above.
> + * @cmdline_strlcpy: point to a compatible strlcpy
> + * @cmdline_strlcat: point to a compatible strlcat
> + */
> +static inline void
> +__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size),
> +		size_t (*cmdline_strlcat)(char *dest, const char *src, size_t count))
> +{
> +	if (src != dest && src != NULL) {
> +		cmdline_strlcpy(dest, " ", length);
> +		cmdline_strlcat(dest, src, length);
> +	}
> +
> +	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)

This test can probably be avoided. if CONFIG_CMDLINE_APPEND is empty, it will add a space at the end 
of dest, that's harmless.

> +		cmdline_strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
> +
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {

Same. Keep it simple. Provide tmp all the time, have only one logic.

> +		cmdline_strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
> +		cmdline_strlcat(tmp, dest, length);
> +		cmdline_strlcpy(dest, tmp, length);
> +	}
> +}
> +
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)			\
> +{														\
> +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {								\
> +		static label char cmdline_tmp_space[length];							\
> +		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, cmdline_strlcpy, cmdline_strlcat);	\
> +	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) {								\
> +		__cmdline_add_builtin(dest, src, NULL, length, cmdline_strlcpy, cmdline_strlcat);		\
> +	}													\

No need to micro-optimise this, you can provide cmdline_tmp_space all the time and only keep on leg 
of the if/elseif

> +}
> +#define cmdline_add_builtin(dest, src, length)	\
> +	cmdline_add_builtin_custom(dest, src, length, __initdata, strlcpy, strlcat)
> +
> +#else /* CONFIG_CMDLINE_OVERRIDE */
> +
> +static inline void
> +__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))

Argh ! So the same function as different semantics whether CONFIG_CMDLINE_OVERRIDE and/or 
CONFIG_CMDLINE_BOOL is selected ? It means the architecture will have to know it as well in order to 
call it right ? That looks like micro-optimisation, I think it is not worth it.


> +{
> +	cmdline_strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND, length);
> +}
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
> +	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
> +#define cmdline_add_builtin(dest, src, length)	\
> +	__cmdline_add_builtin_custom(dest, src, length, strlcpy)
> +#endif /* !CONFIG_CMDLINE_OVERRIDE */
> +
> +#else /* !CONFIG_GENERIC_CMDLINE || !CONFIG_CMDLINE_BOOL */
> +
> +static inline void
> +__cmdline_add_builtin_custom(char *dest, const char *src, unsigned long length,
> +		size_t (*cmdline_strlcpy)(char *dest, const char *src, size_t size))
> +{
> +	if (src != NULL)
> +		cmdline_strlcpy(dest, src, length);
> +}
> +#define cmdline_add_builtin_custom(dest, src, length, label, cmdline_strlcpy, cmdline_strlcat)	\
> +	__cmdline_add_builtin_custom(dest, src, length, cmdline_strlcpy)
> +#define cmdline_add_builtin(dest, src, length)	\
> +	__cmdline_add_builtin_custom(dest, src, length, strlcpy)	\
> +
> +#endif /* CONFIG_GENERIC_CMDLINE */
> +
> +#endif /* _LINUX_CMDLINE_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index 29ad68325028..28363ab07cd4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2032,6 +2032,74 @@ config PROFILING
>   config TRACEPOINTS
>   	bool
>   
> +config GENERIC_CMDLINE
> +	bool
> +
> +if GENERIC_CMDLINE
> +
> +config CMDLINE_BOOL
> +	bool "Built-in kernel command line"
> +	help
> +	  Allow for specifying boot arguments to the kernel at
> +	  build time.  On some systems (e.g. embedded ones), it is
> +	  necessary or convenient to provide some or all of the
> +	  kernel boot arguments with the kernel itself (that is,
> +	  to not rely on the boot loader to provide them.)
> +
> +	  To compile command line arguments into the kernel,
> +	  set this option to 'Y', then fill in the
> +	  the boot arguments in CONFIG_CMDLINE.

CONFIG_CMDLINE doesn't exist.

> +
> +	  Systems with fully functional boot loaders (i.e. non-embedded)
> +	  should leave this option set to 'N'.
> +
> +config CMDLINE_APPEND
> +	string "Built-in kernel command string append"
> +	depends on CMDLINE_BOOL

I think it would be better to have CMDLINE_APPEND and CMDLINE_PREPENT defined at all time, and not 
leak CMDLINE_BOOL into code. It should just be used here to unable user customisation of 
CMDLINE_APPEND, as follows:

config CMDLINE_APPEND
	string "Built-in kernel command string append" if CMDLINE_BOOL
	default ""


> +	default ""
> +	help
> +	  Enter arguments here that should be compiled into the kernel
> +	  image and used at boot time.  If the boot loader provides a
> +	  command line at boot time, this string is appended to it to
> +	  form the full kernel command line, when the system boots.
> +
> +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> +	  change this behavior.
> +
> +	  In most cases, the command line (whether built-in or provided
> +	  by the boot loader) should specify the device for the root
> +	  file system.
> +
> +config CMDLINE_PREPEND
> +	string "Built-in kernel command string prepend"
> +	depends on CMDLINE_BOOL

Same comment as for CMDLINE_APPEND

> +	default ""
> +	help
> +	  Enter arguments here that should be compiled into the kernel
> +	  image and used at boot time.  If the boot loader provides a
> +	  command line at boot time, this string is prepended to it to
> +	  form the full kernel command line, when the system boots.
> +
> +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> +	  change this behavior.
> +
> +	  In most cases, the command line (whether built-in or provided
> +	  by the boot loader) should specify the device for the root
> +	  file system.
> +
> +config CMDLINE_OVERRIDE
> +	bool "Built-in command line overrides boot loader arguments"
> +	depends on CMDLINE_BOOL
> +	help
> +	  Set this option to 'Y' to have the kernel ignore the boot loader
> +	  command line, and use ONLY the built-in command line. In this case
> +	  append and prepend strings are concatenated to form the full
> +	  command line.
> +
> +	  This is used to work around broken boot loaders.  This should
> +	  be set to 'N' under normal conditions.

In powerpc, by default, when a CMDLINE is provided, it is used only if the bootloader doesn't 
provide a command line. I can't see how I can do that here.

> +endif
> +
>   endmenu		# General setup
>   
>   source "arch/Kconfig"
> 
