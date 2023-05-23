Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EB070D8D6
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbjEWJWl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 23 May 2023 05:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbjEWJWk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:22:40 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D4194;
        Tue, 23 May 2023 02:22:38 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6af6f5fc42aso2517648a34.1;
        Tue, 23 May 2023 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833758; x=1687425758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElqaZMSGIZr1PDsUyYzS4b4CKhVSDM9bJ+kKBcpqibs=;
        b=igAbnxKmYpl8G8NR9kiR4zYtC5LarEkNJ48I8jVbUdztsToPdHwV/H1cTclSUHgvlz
         V8t7jDAwvaD/26JYpEKAYuqgXx+Bd7U5AaA7uQvRMyGDBna13gZjiijZQhPBQEGvR2vD
         Q7DzXjYw7LGVrFL42KApQzHM0ee94DlcwyGZWAg0Acb3zn5L1WkKtqZcNfMN6m2B92GE
         RyUAQVwH3zMpvErA0x3KmaiNbNVwnb5joM93MkqOiPe42BNH/SYeGkaVU0157jhBhFUM
         iUV/QlY0ywwJOI3OqpR6rUUPuNHf0FL4igJ1SEYI62TIaA6SyUBLlcD7HaxFBrNaD5yX
         intQ==
X-Gm-Message-State: AC+VfDwEdN8kj3+2vKE23zxEgczSzscvy5qnp4dlfbk5V1NF9uXM9fcg
        UcBTXMY0iqrrt/B2zGsRrajMnozYcP8Blw==
X-Google-Smtp-Source: ACHHUZ73qUy71q9MTXVPPU0P5dIaNf2Fg31SqM9zMkiPZVWbq62xSy0r1uHdaOsYAY3h+06OlL7i5w==
X-Received: by 2002:a05:6830:20d8:b0:6af:7e6f:4959 with SMTP id z24-20020a05683020d800b006af7e6f4959mr2861399otq.21.1684833757696;
        Tue, 23 May 2023 02:22:37 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id y5-20020a9d6345000000b006ab1ea1af9esm3174383otk.68.2023.05.23.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:22:37 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6af89b0f3e5so1005667a34.0;
        Tue, 23 May 2023 02:22:37 -0700 (PDT)
X-Received: by 2002:a81:5bc6:0:b0:562:16d7:e6eb with SMTP id
 p189-20020a815bc6000000b0056216d7e6ebmr15255699ywb.40.1684833736388; Tue, 23
 May 2023 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 May 2023 11:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
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
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Vlastimil,

Thanks for your patch!

On Tue, May 23, 2023 at 11:12 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=y get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
>
> In all defconfigs with CONFIG_SLAB=y remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.

Technically, removing these lines from the defconfig files does not
have any impact, right?
And it removes one more sync point indicating the last time some
defconfig files were (not) updated by their maintainers ;-)

> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
> [2] https://lwn.net/Articles/932201/
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

>  arch/m68k/configs/amiga_defconfig               |  1 -
>  arch/m68k/configs/apollo_defconfig              |  1 -
>  arch/m68k/configs/atari_defconfig               |  1 -
>  arch/m68k/configs/bvme6000_defconfig            |  1 -
>  arch/m68k/configs/hp300_defconfig               |  1 -
>  arch/m68k/configs/mac_defconfig                 |  1 -
>  arch/m68k/configs/multi_defconfig               |  1 -
>  arch/m68k/configs/mvme147_defconfig             |  1 -
>  arch/m68k/configs/mvme16x_defconfig             |  1 -
>  arch/m68k/configs/q40_defconfig                 |  1 -
>  arch/m68k/configs/sun3_defconfig                |  1 -
>  arch/m68k/configs/sun3x_defconfig               |  1 -

Regardless,
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
