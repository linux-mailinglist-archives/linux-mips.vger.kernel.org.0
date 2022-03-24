Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B734E690A
	for <lists+linux-mips@lfdr.de>; Thu, 24 Mar 2022 20:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352831AbiCXTIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Mar 2022 15:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352834AbiCXTIo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Mar 2022 15:08:44 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC0CB82D9
        for <linux-mips@vger.kernel.org>; Thu, 24 Mar 2022 12:07:12 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2e612af95e3so61154357b3.9
        for <linux-mips@vger.kernel.org>; Thu, 24 Mar 2022 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pseG2z7S6drXw7B6bZFmu5Aq0qIPkTegmGqNFv03N28=;
        b=YV8zjBbDPKhPuua63RB0aEnfwtnQRi2RXudWvZLwzJ6TbcetrLsgZP2EXKryNkqqNs
         WzObgFsfIMMm8KL8SyoRILWYW3dOaaD2QUYX9QCWsy+YSBLUgn0t8woNrgmak24MCpeA
         bkXHLnIYyUWVOmJitwEmeQ8kfrl88nff9tzE+TnhF+NmDe4vc/B0KtfInUxKdfHFEvPf
         jAtgjS6GqSAV5VDDLJfTHZHWKdteM1is/qGpgTzJElZ8oryga8khQztvmc1tTSETeHAR
         DX0HC6lRwhkVx3TZIxVjZmCzbX/lTTQOGTUFrPuhAKObpAh2f7sUYrS67XpgBlBd6RDJ
         bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pseG2z7S6drXw7B6bZFmu5Aq0qIPkTegmGqNFv03N28=;
        b=dD2+QWDmiNPD8s45iIeTbLUXbPES35kn0ixV6nV5LYP32PqbEM5H54v8MgHCh8Zpwh
         NoLmlNrtumy+GBQg91usc+o+wwvMVsWvGcPcgLkwpcxJNIYv0KQCgPzk3T6BdCxwVtc/
         QsmXx1mUrUsaBTiplR3SxYIQ2vnUd3eNXzsYejEdc2+31tUtunm1OIeOkwHuekve+mD1
         NakLJfZfMoLcZS38uRLSoENwIYS2Fp2r6FONhjZfDPTQU7Ea/3iuQZeaSHfFDTxCYp6E
         mFf9xKOfR1IsgYi33mC+Gt21o1ycFJxeRYNPjqkNMDWvVe6x+erlcFv8GQ0FUuW+rxQD
         rYYA==
X-Gm-Message-State: AOAM531UU3TZYsO/4m377V/x3dw6QiQlPy0NNERvC5dcLb/PKc1V9EJW
        ptNkpcRrJsN72mfrC0qVSE0cLquaE/se5xpsEJWRDQ==
X-Google-Smtp-Source: ABdhPJy3Tun+JOoRB0PYnpMrTm04joB8Ft64Szzjf/r0Dh8SbNJEXf+JKX1agsVDSy3HORuyZGHZFxe9asZz1qxEwjw=
X-Received: by 2002:a81:d542:0:b0:2e5:c060:a0ac with SMTP id
 l2-20020a81d542000000b002e5c060a0acmr6382708ywj.118.1648148831342; Thu, 24
 Mar 2022 12:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220317000740.1045204-1-aidanmacdonald.0x0@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 20:07:00 +0100
Message-ID: <CACRpkdbEukaSdZDbA0JRuwCFjK5WLdMWB1Rs2VLe=WNSvfjBZA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: ingenic: Fix regmap on X series SoCs
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 17, 2022 at 1:07 AM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:

> The X series Ingenic SoCs have a shadow GPIO group which is at a higher
> offset than the other groups, and is used for all GPIO configuration.
> The regmap did not take this offset into account and set max_register
> too low, so the regmap API blocked writes to the shadow group, which
> made the pinctrl driver unable to configure any pins.
>
> Fix this by adding regmap access tables to the chip info. The way that
> max_register was computed was also off by one, since max_register is an
> inclusive bound, not an exclusive bound; this has been fixed.
>
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
> v1 -> v2: use regmap_access_table
> v2 -> v3: compute max_register instead of putting it in chip_info
> v3 -> v4: explain the fix to the max_register calculation

Patch applied!

Yours,
Linus Walleij
