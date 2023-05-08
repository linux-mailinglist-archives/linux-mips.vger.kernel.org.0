Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B506FB97B
	for <lists+linux-mips@lfdr.de>; Mon,  8 May 2023 23:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjEHVX7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 May 2023 17:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjEHVX6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 May 2023 17:23:58 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA04173A
        for <linux-mips@vger.kernel.org>; Mon,  8 May 2023 14:23:56 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-b9e27684b53so4501540276.0
        for <linux-mips@vger.kernel.org>; Mon, 08 May 2023 14:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683581035; x=1686173035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jGQCX8Vl6J+teZGmxFzw1k6uuzeGq3x6M1Mg+KmvWU=;
        b=I88Y+UwW/ecdrdJYEYRQu84hQHEaAlwkBoqcY2OuiSC/fZd9XNJTetBoDsbTnL/mhS
         ZuE4HjGiHTZs634+rfTp1iWzyZKxHdtSgv1t0C8ngfs2JYKt0bUVW/j15pBp6NAhiKGR
         YKmwGJJP8/qagETAIGdZY8zpYZupX+SXkHtE5vyFWjBqJto4kUrgIwRuXcz+TO0lUGq8
         jMoSb6nX6bsJ4RBVQ5uYeqbPfz4tAm1FZBC0TrKwbGYr/DvRxfNR9D2rEu/sfehNSTkM
         zB4rT2OYkz5xjtBQkWRiDNoPPlQrctV8Ddiw1tEWVD53tZvZTnDKuAro4Tcxf0urL0Ic
         bzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683581035; x=1686173035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jGQCX8Vl6J+teZGmxFzw1k6uuzeGq3x6M1Mg+KmvWU=;
        b=fro36gNoTRmVmaRqMUF1Px+Mw9QNwREaMimkqjzIH6n2Cr2mSCp/WzXosRyqgQOL8k
         5nvEPOGgy2UJ9Z5CbjadfecJNL+TK2vojt/3CnVxiYPl8XtHZ7C6qrzz80qn5nMPNfwi
         uxAqoFJ/wi+SFoV/2Ni/7cRS89Mxn54CUeEnLmyq/YjZJBVTQi9DiyD7N1tg7oyf8pTf
         T76pUeP9/Jp0pkYbnLOjrGS7Fq46cxlhKFqoONlwqrjJu1kR5PXqdttGv8yVfjtXWgRM
         ScV1OZv8NvdU0tsK6q87+EQbhlnyv94ocpbPVnkX3zPKGJMHnZmtxPcbSmCi84NizLyj
         jLqA==
X-Gm-Message-State: AC+VfDxgb9B94OH0dvVrhVudzjcB0q24TMVYSI8pzSt0Z0K5aXKCaKKc
        kzjxtUfwZXxywWnIiuTSo/ks1J38B9tYTl0Gq3qV8g==
X-Google-Smtp-Source: ACHHUZ7rm8jz+s02nlAbnve92YjRuDz/1QELgf4UleY+8kKnTxtAJt2R2YQqJHyvz+tJndbn/SLgLqnkCbtBYasX8ws=
X-Received: by 2002:a25:215:0:b0:ba2:77e:e5f8 with SMTP id 21-20020a250215000000b00ba2077ee5f8mr12026435ybc.1.1683581035348;
 Mon, 08 May 2023 14:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org> <ZFVGMiuRT+e2eVXw@google.com>
In-Reply-To: <ZFVGMiuRT+e2eVXw@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 May 2023 23:23:44 +0200
Message-ID: <CACRpkdZUXOTOK9CObdXuHQx4PMD3ykMKco8X5ijchkZ8cEmQvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 5, 2023 at 8:08=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > -     return !gpio_get_value(ts->gpio_pendown);
> > +     return !gpiod_get_value(ts->gpio_pendown);
>
> This needs to be
>
>         return !gpiod_get_value_raw(ts->gpio_pendown);

There is no such function. The gpio descriptor runpath simply assumes that
device trees can be trusted.

> I looked at various DTSes we have and they use a mix of active high and
> active low annotations, so we have to go with the "raw" variant for now,
> and then update to normal one once we update bad DTSes.

I just sighed and fixed all the device trees :D

Yours,
Linus Walleij
