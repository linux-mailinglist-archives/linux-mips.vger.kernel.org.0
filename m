Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7A1D45DD
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2019 18:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfJKQyw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Oct 2019 12:54:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43818 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbfJKQyv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Oct 2019 12:54:51 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so8564458oih.10
        for <linux-mips@vger.kernel.org>; Fri, 11 Oct 2019 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fd35zIRYs2iDeqG/fufo7UYVAFPrUOkQHDy4sOGoI0M=;
        b=YMhJ4ANEUAGDWeQXTiDnBTv+prRGYWIT6nE2e1tR0tXEDO6nEITElUnF+EN2Yok/dx
         xrtOjPBFU74z4X00QFxjWBBkyAEpSfYibmQaSfsn2pgXDWlXcgFhP7hIkfAfpseFO4pS
         fsyahWrmAoL2NoMUtPAPYH2qG9n89S9tDXmuunNkNMGPNUKcaDufcIgxBxCOPfSMBLTh
         C24KMwBAcKUTGk5YZLZEEEtWJaDjrh0FO/z8wRLbfRddSAAiSx/jzR0ToMlmcteIV1D0
         Grtr8usWKdjCEzjo6OAhqG83yYlaZ5FV1Ty2rFlSslnF7YlMc7HPVC6Z2AtpqfbK17FC
         tAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fd35zIRYs2iDeqG/fufo7UYVAFPrUOkQHDy4sOGoI0M=;
        b=WzdMSnw0+BVRCOiBjXI39oUncKWS+YL8OvS8Tif/nnUjAA1TEOgGKytuf4etaKR58f
         RTMTOyWIhq1xy10hRPAf0uwGRgPNlScs0Lpdlr3Dkw2UFhgoSQCZ1hs3W3C4sEtwBijO
         nyWpdOytPEwlcS5vlF8Ne6s7HXrCSVMtORyL/fOWB11OmET+Uwe0g5Fgb5ah7xlJ2ztU
         RvYqItF8rqLhy7OOWEOlhdEeOUFN5glz0C5xflIjYWBTDeBl7Y8BsLVHvY05VSA9k9Pc
         X4VM6CO14jiJWmy+pML047PhQrSNcMuufAuMWpuEVepjhbmQE2JefurJ5Rp7mQrRtsxK
         Pxfg==
X-Gm-Message-State: APjAAAWd2xVDHKWc5YXUMAITgFiH1yDT4mJLBa9B/da7jcxKqhpOK4TK
        Yv+EuFt1v+v2a6wAutyI4Lc=
X-Google-Smtp-Source: APXvYqx1ViIzHjRoAs7Jna5Hcl+BfCZBKhR7QmduyLkhW18EvFl29zGHkwp2FdiHWwxQPpGNCildVg==
X-Received: by 2002:aca:e0d5:: with SMTP id x204mr6050846oig.112.1570812890150;
        Fri, 11 Oct 2019 09:54:50 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id q199sm2794260oic.16.2019.10.11.09.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:54:49 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:54:48 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH v2] MIPS: cmdline: Clean up boot_command_line
 initialization
Message-ID: <20191011165448.GA47944@ubuntu-m2-xlarge-x86>
References: <20191009230936.2290413-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009230936.2290413-1-paul.burton@mips.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 09, 2019 at 11:09:45PM +0000, Paul Burton wrote:
> Our current code to initialize boot_command_line is a mess. Some of this
> is due to the addition of too many options over the years, and some of
> this is due to workarounds for early_init_dt_scan_chosen() performing
> actions specific to options from other architectures that probably
> shouldn't be in generic code.
> 
> Clean this up by introducing a new bootcmdline_init() function that
> simplifies the initialization somewhat. The major changes are:
> 
> - Because bootcmdline_init() is a function it can return early in the
>   CONFIG_CMDLINE_OVERRIDE case.
> 
> - We clear boot_command_line rather than inheriting whatever
>   early_init_dt_scan_chosen() may have left us. This means we no longer
>   need to set boot_command_line to a space character in an attempt to
>   prevent early_init_dt_scan_chosen() from copying CONFIG_CMDLINE into
>   boot_command_line without us knowing about it.
> 
> - Indirection via USE_PROM_CMDLINE, USE_DTB_CMDLINE, EXTEND_WITH_PROM &
>   BUILTIN_EXTEND_WITH_PROM macros is removed; they seemingly served only
>   to obfuscate the code.
> 
> - The logic is cleaner, clearer & commented.
> 
> Two minor drawbacks of this approach are:
> 
> 1) We call of_scan_flat_dt(), which means we scan through the DT again.
>    The overhead is fairly minimal & shouldn't be noticeable.
> 
> 2) cmdline_scan_chosen() duplicates a small amount of the logic from
>    early_init_dt_scan_chosen(). Alternatives might be to allow the
>    generic FDT code to keep & expose a copy of the arguments taken from
>    the /chosen node's bootargs property, or to introduce a function like
>    early_init_dt_scan_chosen() that retrieves them without modification
>    to handle CONFIG_CMDLINE. Neither of these sounds particularly
>    cleaner though, and this way we at least keep the extra work in
>    arch/mips.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> 
> ---
> 
> Changes in v2:
> - Keep CONFIG_MIPS_CMDLINE_DTB_EXTEND &
>   CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND for now.
> - Hoist bootcmdline_append() into a function to avoid duplicating its
>   logic multiple times.
> 
>  arch/mips/kernel/setup.c | 125 ++++++++++++++++++++++++++-------------
>  1 file changed, 83 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 5eec13b8d222..4aeba3122972 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -538,11 +538,88 @@ static void __init check_kernel_sections_mem(void)
>  	}
>  }
>  
> -#define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
> -#define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
> -#define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
> -#define BUILTIN_EXTEND_WITH_PROM	\
> -	IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND)
> +static void __init bootcmdline_append(const char *s, size_t max)
> +{
> +	if (!s[0] || !max)
> +		return;
> +
> +	if (boot_command_line[0])
> +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +
> +	strlcat(boot_command_line, s, max);
> +}
> +
> +static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
> +					  int depth, void *data)
> +{
> +	bool *dt_bootargs = data;
> +	const char *p;
> +	int l;
> +
> +	if (depth != 1 || !data ||
> +	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
> +		return 0;
> +
> +	p = of_get_flat_dt_prop(node, "bootargs", &l);
> +	if (p != NULL && l > 0) {
> +		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
> +		*dt_bootargs = true;
> +	}
> +
> +	return 1;
> +}
> +
> +static void __init bootcmdline_init(char **cmdline_p)
> +{
> +	bool dt_bootargs = false;
> +
> +	/*
> +	 * If CMDLINE_OVERRIDE is enabled then initializing the command line is
> +	 * trivial - we simply use the built-in command line unconditionally &
> +	 * unmodified.
> +	 */
> +	if (IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +		return;
> +	}
> +
> +	/*
> +	 * If the user specified a built-in command line &
> +	 * MIPS_CMDLINE_BUILTIN_EXTEND, then the built-in command line is
> +	 * prepended to arguments from the bootloader or DT so we'll copy them
> +	 * to the start of boot_command_line here. Otherwise, empty
> +	 * boot_command_line to undo anything early_init_dt_scan_chosen() did.
> +	 */
> +	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +	else
> +		boot_command_line[0] = 0;
> +
> +	/*
> +	 * If we're configured to take boot arguments from DT, look for those
> +	 * now.
> +	 */
> +	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB))
> +		of_scan_flat_dt(bootcmdline_scan_chosen, &dt_bootargs);
> +
> +	/*
> +	 * If we didn't get any arguments from DT (regardless of whether that's
> +	 * because we weren't configured to look for them, or because we looked
> +	 * & found none) then we'll take arguments from the bootloader.
> +	 * plat_mem_setup() should have filled arcs_cmdline with arguments from
> +	 * the bootloader.
> +	 */
> +	if (IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND) || !dt_bootargs)
> +		bootcmdline_append(arcs_cmdline, COMMAND_LINE_SIZE);
> +
> +	/*
> +	 * If the user specified a built-in command line & we didn't already
> +	 * prepend it, we append it to boot_command_line here.
> +	 */
> +	if (IS_ENABLED(CONFIG_CMDLINE_BOOL) &&
> +	    !IS_ENABLED(CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND))
> +		bootcmdline_append(builtin_cmdline, COMMAND_LINE_SIZE);
> +}
>  
>  /*
>   * arch_mem_init - initialize memory management subsystem
> @@ -570,48 +647,12 @@ static void __init arch_mem_init(char **cmdline_p)
>  {
>  	extern void plat_mem_setup(void);
>  
> -	/*
> -	 * Initialize boot_command_line to an innocuous but non-empty string in
> -	 * order to prevent early_init_dt_scan_chosen() from copying
> -	 * CONFIG_CMDLINE into it without our knowledge. We handle
> -	 * CONFIG_CMDLINE ourselves below & don't want to duplicate its
> -	 * content because repeating arguments can be problematic.
> -	 */
> -	strlcpy(boot_command_line, " ", COMMAND_LINE_SIZE);
> -
>  	/* call board setup routine */
>  	plat_mem_setup();
>  	memblock_set_bottom_up(true);
>  
> -#if defined(CONFIG_CMDLINE_BOOL) && defined(CONFIG_CMDLINE_OVERRIDE)
> -	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -#else
> -	if ((USE_PROM_CMDLINE && arcs_cmdline[0]) ||
> -	    (USE_DTB_CMDLINE && !boot_command_line[0]))
> -		strlcpy(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> -
> -	if (EXTEND_WITH_PROM && arcs_cmdline[0]) {
> -		if (boot_command_line[0])
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> -	}
> -
> -#if defined(CONFIG_CMDLINE_BOOL)
> -	if (builtin_cmdline[0]) {
> -		if (boot_command_line[0])
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -	}
> -
> -	if (BUILTIN_EXTEND_WITH_PROM && arcs_cmdline[0]) {
> -		if (boot_command_line[0])
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -		strlcat(boot_command_line, arcs_cmdline, COMMAND_LINE_SIZE);
> -	}
> -#endif
> -#endif
> +	bootcmdline_init(cmdline_p);
>  	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
> -
>  	*cmdline_p = command_line;
>  
>  	parse_early_param();
> -- 
> 2.23.0
> 

Hi Paul,

This causes a build error on malta_defconfig because CONFIG_CMDLINE_BOOL
is not set so builtin_cmdline is not defined.

https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/244643074

../arch/mips/kernel/setup.c: In function 'bootcmdline_init':
../arch/mips/kernel/setup.c:582:30: error: 'builtin_cmdline' undeclared (first use in this function); did you mean 'builtin_driver'?
   strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
                              ^~~~~~~~~~~~~~~
                              builtin_driver
../arch/mips/kernel/setup.c:582:30: note: each undeclared identifier is reported only once for each function it appears in

Cheers,
Nathan
