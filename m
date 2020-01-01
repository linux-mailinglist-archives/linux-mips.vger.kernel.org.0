Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06F5112E0B4
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jan 2020 23:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbgAAWUe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 1 Jan 2020 17:20:34 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:46099 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgAAWUd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Jan 2020 17:20:33 -0500
Received: by mail-yb1-f194.google.com with SMTP id k128so5673734ybc.13;
        Wed, 01 Jan 2020 14:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PjjfS+Y9kWHtQ/q+KDR0uj94xEE/rL5CDqpi3YaNtqU=;
        b=HObaKxZsqAfpFaP/g+jeekpFqKzDxqWKoWOa/V6W+lxwkCRoF27UpqGxnojyjHRaTV
         QqXUuHsWZtI5vQockPQC1LzzBjN/Y169M3LJmjoDsHTTKY04VPGmauMAvIb9J67izvca
         bbwxLfdU+qagweNl3Vhriiq/hAI9LuhfgPvYvxSbh4CljDGmT/Khz9uEi8CWtUV8zZgs
         L8GDm3aMMqHfnSxd56ydDGWHbyzqN/FwSpEOug2eMmC0nHOo+0kOVaJSeVXErjuNv8Q2
         QlKKutN3ZNc+1LnUCHOzkLSSVG61Is02QurFPuMiTDKqQnWdd0+qEpALEBz8D9ZR4CqJ
         Lx7g==
X-Gm-Message-State: APjAAAVUcEDg6SwvdzLSFsK/FaTnGwzYvfu4ROC+VnsBheoUr8MN0jLo
        Cw4bCPs+yFmB9yk7hcJEli9JX7kQaQ7j7v0DDi0=
X-Google-Smtp-Source: APXvYqzkUq4iSNuFbtUHx2mmAyEbfXIAG/D5eED47D47XUF8Rt8PHW61kkcCQ0VNPBEoiSLeNeZ4qWXhsWBpTJ1w030=
X-Received: by 2002:a5b:2cc:: with SMTP id h12mr41443609ybp.316.1577917232632;
 Wed, 01 Jan 2020 14:20:32 -0800 (PST)
MIME-Version: 1.0
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr> <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 1 Jan 2020 23:25:57 +0100
Message-ID: <CAAdtpL44h4f=4yYC4r7ebqh6dZS268rrjfb+4EeXRwE4KWHNng@mail.gmail.com>
Subject: Re: [PATCH 08/10] MIPS: use resource_size
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        kernel-janitors@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 1, 2020 at 7:26 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Use resource_size rather than a verbose computation on
> the end and start fields.
>
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
>
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  arch/mips/kernel/setup.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index c3d4212b5f1d..701f4bc3046f 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -515,8 +515,7 @@ static void __init request_crashkernel(struct resource *res)
>         ret = request_resource(res, &crashk_res);
>         if (!ret)
>                 pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
> -                       (unsigned long)((crashk_res.end -
> -                                        crashk_res.start + 1) >> 20),
> +                       (unsigned long)(resource_size(&crashk_res) >> 20),
>                         (unsigned long)(crashk_res.start  >> 20));
>  }
>  #else /* !defined(CONFIG_KEXEC)                */
> @@ -698,8 +697,7 @@ static void __init arch_mem_init(char **cmdline_p)
>         mips_parse_crashkernel();
>  #ifdef CONFIG_KEXEC
>         if (crashk_res.start != crashk_res.end)
> -               memblock_reserve(crashk_res.start,
> -                                crashk_res.end - crashk_res.start + 1);
> +               memblock_reserve(crashk_res.start, resource_size(&crashk_res));
>  #endif
>         device_tree_init();
>         sparse_init();
>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks Julia!
