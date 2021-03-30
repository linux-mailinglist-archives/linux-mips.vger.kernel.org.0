Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD28534F1CC
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 21:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbhC3Tt7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 15:49:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233254AbhC3Tt1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 15:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ACA761919;
        Tue, 30 Mar 2021 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617133767;
        bh=Ck1XHsPMXKddkO7/YY+lWQc5sW8Ayvngr37xovx4Afg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gEcNh7zo1605nJ8Hjwu4y4qAZxIi22sCNRw5bFtvEBODv+GcaOmodshXmLvXjV/t4
         yDViKbTiOEZs8Xg7AxAUYTWED/fmy1qnnrA6cnzJVkJU5ys2Fm9MoVyedghkW76SwD
         FCOVQBFKbAQQ986t/02MAQqbdli2694er9Ec9kjMM7c5EVZRW8UCgbTQQ2vQMM8dbT
         cimawJ7XvGtVIF9UwsSj9od7XaLHi9WEre1AKUaxPm6rzJc/+RlXz9yJaWBASK3oYK
         OhmRDT63nchAo7rm+sZqwAUBD4bVS10/D/ito1bQGxYshGgyNTN6AZm36Wic4i6V/d
         1lysvtPWpYsDA==
Received: by mail-ej1-f43.google.com with SMTP id e14so26541621ejz.11;
        Tue, 30 Mar 2021 12:49:26 -0700 (PDT)
X-Gm-Message-State: AOAM531mFG1fBVx0Jn4FbCpJeTYrw9hLavDElHtfHsQwzNKTne9ME212
        0EoSH7Wn63FB4exHxl/z4GYXBwJT5N8k8/jqZw==
X-Google-Smtp-Source: ABdhPJwtsu4GSSCTGvon7NUuoXgbKxlglqptEfp3lbXOUs7+wjr+Z+gLBfdBRTrJqyuy+lFVou3niNRuxiswKCsp+tY=
X-Received: by 2002:a17:906:c405:: with SMTP id u5mr35182498ejz.341.1617133765515;
 Tue, 30 Mar 2021 12:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
In-Reply-To: <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 30 Mar 2021 14:49:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
Message-ID: <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
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

On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
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
>  drivers/of/fdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index dcc1dd96911a..d8805cd9717a 100644
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
> @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         /* Retrieve command line */
>         p = of_get_flat_dt_prop(node, "bootargs", &l);
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)

Moving in the wrong direction... This code already has too many
#ifdef's. I like Christophe's version as it gets rid of all the code
here.

> +       /*
> +        * The builtin command line will be added here, or it can override
> +        * with the DT bootargs.
> +        */
> +       cmdline_add_builtin(data,
> +                           (l > 0 ? p : NULL), /* This is sanity checking */
> +                           COMMAND_LINE_SIZE);
> +#elif defined(CONFIG_GENERIC_CMDLINE)
> +       strlcpy(data, p, COMMAND_LINE_SIZE);
> +#else
>         if (p != NULL && l > 0)
>                 strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>
> @@ -1070,6 +1083,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
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
