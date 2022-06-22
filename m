Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A5155436B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 09:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351880AbiFVG4s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 02:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351884AbiFVG4r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 02:56:47 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C25369DA;
        Tue, 21 Jun 2022 23:56:45 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id v6so1125119qkh.2;
        Tue, 21 Jun 2022 23:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JdqWx6lr8U+xzbagEJ/PgSr3qxwp6Ew+Bmob2iYGzYY=;
        b=KW1pX2R3LF4CSJlzeGY6YrZuGCI/ngnDshEb+ybI+SZ2VKrranGb8aNxEAH0BlFc3e
         ooETXh6Q1yrEubu+nEU/Fx1g+4xt4ziXAbT6ueeoNIzoafXTJcjLhBSjBdFRnP+HXKN7
         UVPGeerP2kb05Xfm602CKh3HnDGftSKOkebz4Swv/HoDV6CIJiUwlGYYyWuwTr7/S79v
         W64npw5/ApwndP/qKUk1gKAIfAdEnb751/HlWMEQbZ9OyNPwNiZC9I4Dpt8yTXNIa7Yw
         nGAZvtjTg6z7gkzMuPBefcaEf5vu1ToXwGn0suE8MpGUvAJJguoUPpiihsrgwN1zVkJH
         dSeA==
X-Gm-Message-State: AJIora+QnhVZddzUoo3jHoCxpoBLIkjqa/qIOhUGIMrQkKwivcpZ/NRq
        8+u+M6PUmQrG3THN+SV1F9078qkKSREOfg==
X-Google-Smtp-Source: AGRyM1tj7l6UJTCVxb31Iyyv1BBPzTxpf0VeGHH/EmAZsz5xsJtt720RH+r+V7NbXGCrvvmsMv310A==
X-Received: by 2002:a05:620a:2:b0:6a6:aced:da7c with SMTP id j2-20020a05620a000200b006a6acedda7cmr1190954qki.400.1655881004947;
        Tue, 21 Jun 2022 23:56:44 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v8-20020a05622a130800b002f9114d2ebcsm14694676qtk.17.2022.06.21.23.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 23:56:44 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3137316bb69so153239257b3.10;
        Tue, 21 Jun 2022 23:56:44 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr2512589ywb.316.1655881004379; Tue, 21
 Jun 2022 23:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220622060807.4095040-1-windhl@126.com>
In-Reply-To: <20220622060807.4095040-1-windhl@126.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Jun 2022 08:56:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiZSqGY2xbosDBCxcvMej6ir8sDfuOk9qfXTzJPh6ZOw@mail.gmail.com>
Message-ID: <CAMuHMdUiZSqGY2xbosDBCxcvMej6ir8sDfuOk9qfXTzJPh6ZOw@mail.gmail.com>
Subject: Re: [PATCH] mips/kernel: Add missing of_node_get()
To:     Liang He <windhl@126.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Liang,

CC devicetree

On Wed, Jun 22, 2022 at 8:08 AM Liang He <windhl@126.com> wrote:
> In mips_cpc_default_phys_base(), we need to add of_node_get() before
> of_find_compatible_node() which will decrease the refcount of its
> first arg.
>
> Signed-off-by: Liang He <windhl@126.com>

Thanks for your patch!

> --- a/arch/mips/kernel/mips-cpc.c
> +++ b/arch/mips/kernel/mips-cpc.c
> @@ -25,6 +25,7 @@ phys_addr_t __weak mips_cpc_default_phys_base(void)
>         struct resource res;
>         int err;
>
> +       of_node_get(of_root);

Adding this looks strange to me...

However, of_find_compatible_node() indeed calls of_node_put(from),
so your patch is correct.

However, when passed NULL as the from pointer, __of_find_all_nodes()
(expanded from for_each_of_allnodes_from()) turns this into of_root.
As of_find_compatible_node() still has the original (NULL) from
pointer, of_node_put(from) becomes a no-op.

>         cpc_node = of_find_compatible_node(of_root, NULL, "mti,mips-cpc");

Hence I think it would be better to change the above to

    cpc_node = of_find_compatible_node(NULL, NULL, "mti,mips-cpc");

instead, i.e. get rid of the explicit of_root handling?

>         if (cpc_node) {
>                 err = of_address_to_resource(cpc_node, 0, &res);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
