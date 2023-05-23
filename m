Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B844A70DB02
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 12:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236048AbjEWK54 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 06:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjEWK5z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 06:57:55 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F780121;
        Tue, 23 May 2023 03:57:53 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4573e1e6cb9so2023482e0c.0;
        Tue, 23 May 2023 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684839472; x=1687431472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPZGzse+EwoYxx5aP+jOlzsmNfWXOwQHS1xYrgjsec4=;
        b=dOQwlVtHCe09Vk6RBJyv4UlmNvYYMnzQdN2fEZMcAJCu/TvLE+aT6q3cEIc8MDOmBx
         HP4ow/lRyQjX5ou5gynKDIgwRGlxnKP17GdXlnjq6uz1ijUiCnacny3Md+zs9HDXlWpd
         /vJJE9f2AKfUpQCBaZ86Lp475NcG+d8oj3/lzlNgDDkfbpoahI9iEBZqgJGax+ZttcuR
         gxFYk69/1/g6u8rT0LmqyntNq4QgPOiylA448Fmme9hwmf33rBx4ObygcWDs9zyaVSfI
         o7vxmAgMbJLQQXRgL/2ax63tRT4pKoFENMaUoAU0k0zcTFUWAtxubuxDUMY5St7Chco4
         J29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839472; x=1687431472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPZGzse+EwoYxx5aP+jOlzsmNfWXOwQHS1xYrgjsec4=;
        b=bqnPw/3oG9T1IZXG2OwHJ3MGmqkalH5Fkgz66MZP88uTYBgqP4Ly/YCk7fRZjUlQ3r
         l4cK4refT2uQnHkhb1/861TGQVzHeFBXFk3pmEpgNF3AuSoc8MoXryHpjY6309huCVl5
         wfRExDBBNN2nYWMWo0FeBgvPqcM8pQ9/hOXj2m+0A7ldiE5mJW16DHY7r++WRMpCCznD
         DGuL+bB1nTHnqzPJLAV5rAy0qKY/VWk4jm3alUZy7EC3rLpnEFqCXgEaTcewf6hWVe8c
         boaP9O/bHXeQNib5+3j8TxBr6Ca7H1kgKY68Rd0+832JwHSBpucoJ42KubJPuDQGz2xP
         X6oA==
X-Gm-Message-State: AC+VfDzkNLnNJr0B6dO3+u5qLVrbX1uGYn4zAY7abBaRXelpb2OwCcCI
        PzRkXbGOBsYin+/gT3GPIO2+cIWOBhjzSZ1qA+U=
X-Google-Smtp-Source: ACHHUZ5BnP3gkAdc5bGRbbNu8BA4XYUOvijVFedQabDgzPfHyqbd3wbCe7zKvL1rqhCSR6cTKzJAQSc6wb3cCiUjneM=
X-Received: by 2002:a1f:2cce:0:b0:440:4c82:6508 with SMTP id
 s197-20020a1f2cce000000b004404c826508mr4142026vks.3.1684839472183; Tue, 23
 May 2023 03:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date:   Tue, 23 May 2023 19:58:03 +0900
Message-ID: <CAB=+i9RycsnDbJ1f1jTiJ6fXnGUmH95h23G37Ss6XNAA3VJ3_w@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 23, 2023 at 6:12=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=3Dy get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
>
> In all defconfigs with CONFIG_SLAB=3Dy remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.
>
> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse=
.cz/
> [2] https://lwn.net/Articles/932201/
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

<snip>

> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7672a22647b4..b537c4436d18 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -218,11 +218,18 @@ choice
>         help
>            This option allows to select a slab allocator.
>
> -config SLAB
> -       bool "SLAB"
> +config SLAB_DEPRECATED
> +       bool "SLAB (DEPRECATED)"
>         depends on !PREEMPT_RT
>         select HAVE_HARDENED_USERCOPY_ALLOCATOR
>         help
> +         Deprecated and scheduled for removal in a few cycles. Replaced =
by
> +         SLUB.
> +
> +         If you cannot migrate to SLUB, please contact linux-mm@kvack.or=
g
> +         and the people listed in the SLAB ALLOCATOR section of MAINTAIN=
ERS
> +         file, explaining why.
> +
>           The regular slab allocator that is established and known to wor=
k
>           well in all environments. It organizes cache hot objects in
>           per cpu and per node queues.
> @@ -240,6 +247,11 @@ config SLUB
>
>  endchoice
>
> +config SLAB
> +       bool
> +       default y
> +       depends on SLAB_DEPRECATED
> +
>  config SLUB_TINY
>         bool "Configure SLUB for minimal memory footprint"
>         depends on SLUB && EXPERT
> --
> 2.40.1

Thank you for the work!
It looks good to me.
let's see some users raise their voice.

Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
