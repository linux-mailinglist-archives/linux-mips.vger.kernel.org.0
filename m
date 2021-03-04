Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C4732D555
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 15:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhCDOd4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 09:33:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhCDOdf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 09:33:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFD2164F2C;
        Thu,  4 Mar 2021 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614868375;
        bh=tXeyflvi5gXEFLfWrEhyPYpQ9H6G+alEokJ1yiiFZAs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SUFTMJXCghhXPTfTU7DVatK7XQYGDso/6+901ptTAr+6UkFzvVY3LMy1bIBwg4Q82
         isDF6GXrYzW1tsDNFKNmrnfQGi9Pq81iowaq3SFhnU9RUHy15KF384r3EJ495u9xU3
         NCq881YQgUwtaNX3jPN2E0VR267kElrANWeJxmprwDTzSzDN1p8sT8jooPzXarYvDy
         mtBUdM42PWgJcC5evM+Re9wAYHKdY7ascu2Ek0ewIpvA8DtzgZz7SB9ab2syZ5KtWl
         VoNwX5CEdlZXGVJHEGyKYrWFY4mx9bYABQrAxfY4zQG8EPOnKH7l5Y26oldHmtbElN
         VJRGrvRWooQLg==
Received: by mail-ed1-f46.google.com with SMTP id b7so21610116edz.8;
        Thu, 04 Mar 2021 06:32:54 -0800 (PST)
X-Gm-Message-State: AOAM532ouOycI6Al4VVty7+nROx9MFQaXnS2SEq10S8e1r/sQNZ+NUmk
        hUrNWqVfSCerICKJTKdw8eKxm37z7v1HctTmIQ==
X-Google-Smtp-Source: ABdhPJzabdQJ8ncT4i9Jv5kLvVwXJ4FdjdlgX7bAUmE7phJTm1J2xtfPKQoM5FboSII3Jp66Lb89kLcDHwPLvNaueFU=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr4615939edq.137.1614868373460;
 Thu, 04 Mar 2021 06:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20210304044803.812204-2-danielwa@cisco.com>
In-Reply-To: <20210304044803.812204-2-danielwa@cisco.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 4 Mar 2021 08:32:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
Message-ID: <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Frank Rowand <frowand.list@gmail.com>,
        xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 3, 2021 at 10:48 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  drivers/of/fdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index feb0f2d67fc5..cfe4f8d3c9f5 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/serial_core.h>
>  #include <linux/sysfs.h>
>  #include <linux/random.h>
> +#include <linux/cmdline.h>
>
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #include <asm/page.h>
> @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         early_init_dt_check_for_initrd(node);
>
> +#ifdef CONFIG_GENERIC_CMDLINE

What I like about Christophe's version is it removes the old DT
implementation. Who's going to convert the rest of the DT based
arches? That's arm, arm64, hexagon, microblaze, nios2, openrisc,
riscv, sh, and xtensa. Either separate the common code from the config
like Christophe's version or these all need converting. Though it's
fine to hash out patch 1 with a couple of arches first.

>         /* Retrieve command line */
>         p = of_get_flat_dt_prop(node, "bootargs", &l);

This needs to be outside the ifdef.

> +
> +       /*
> +        * The builtin command line will be added here, or it can override
> +        * with the DT bootargs.
> +        */
> +       cmdline_add_builtin(data,
> +                           ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */
> +                           COMMAND_LINE_SIZE);
> +#else
>         if (p != NULL && l > 0)
>                 strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>
> @@ -1070,6 +1081,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>                 strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #endif
>  #endif /* CONFIG_CMDLINE */
> +#endif /* CONFIG_GENERIC_CMDLINE */
>
>         pr_debug("Command line is: %s\n", (char *)data);
>
> --
> 2.25.1
>
