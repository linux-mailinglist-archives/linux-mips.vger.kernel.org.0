Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE353504A1B
	for <lists+linux-mips@lfdr.de>; Mon, 18 Apr 2022 01:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235398AbiDQXoU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Apr 2022 19:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbiDQXoU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Apr 2022 19:44:20 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8294E0D5
        for <linux-mips@vger.kernel.org>; Sun, 17 Apr 2022 16:41:42 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ec42eae76bso126368157b3.10
        for <linux-mips@vger.kernel.org>; Sun, 17 Apr 2022 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kBWZvPDWX8dbAUSP9kssP0OC5V7ojEsXZQypRCglwc8=;
        b=Qx+qxtMoZeSgNogDFYJh5SF2f0K6X0VV9WKxQUJkvnKGJu91Fi4w4niV6q1HQvbgc9
         vLxUpuLsvc64PfYVJ3cE7EBA53R/mMWzFtZKpkBLSRmXr/+UwWySzfBkA/NRif55VCMz
         3Ho1pXKRfbkFn9kvX+zzWzEKg5f2fiJfKbrQk74Nvi2kJtw2B82iUK6SA8BWf5lQ/Eef
         wOsecoWRiuPK4xJJrzFK8gDSNKO6btFmnIpk0A9BZmE+OVuu0wfWsML4kAudfkohS20k
         JHg1qWc1FW52TCVttj1tUGqO8PaqM0Osdjj6nLzFppzmlnEUz1Cxn5dshpbK4wGPgz1g
         4vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kBWZvPDWX8dbAUSP9kssP0OC5V7ojEsXZQypRCglwc8=;
        b=MPWjJj7SbRtiJpSS55pZS3XkGx7dX+wPShd4mAqD3bLiKx0F5sr9lKbVwombDPfEgC
         gtJEcD9xVYG7WNiWxiTnxZszCxir1ymNaWl/ovfIF+2qMJKjTpaygxJjwg27+dGT2DqI
         RdOxKc/A5pxK/z9mUOjDnWnoYmLEFUwtKyRES9EkVS4draKpgiI0DdkFMkqVmmrPTdOI
         p1VUCK0K9Jh4/zxPOVLaJVldytydW9WV6k/OqI0dqTQ1n/+3re7ZMCdNZMuIUdBUPaB7
         wR00kXoCaH0OUjTMn/CrqqjNituB7+hfPnMeBp03oTKLIjp6degK+9S6gJStAH+lbywd
         J+Bg==
X-Gm-Message-State: AOAM532ALJKh7P8OoODl+ZOlc1TJpAbL0e3fl0EhtRq1H2x4lX1UEb9r
        H8L1YtGTXakV0p3hFzj1eJ+u+eNe7wdNsxxIIDZ6zg==
X-Google-Smtp-Source: ABdhPJzJDVt2Bv5XZp3mPzI0kj0ziWyK55YlE1BNID97fc+BtketIWe7wHtz5A5WteeOs/qIagWPMO5U3Gueu3b3KMI=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr2363390ywd.118.1650238901925; Sun, 17
 Apr 2022 16:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220319204628.1759635-1-michael@walle.cc> <20220319204628.1759635-7-michael@walle.cc>
In-Reply-To: <20220319204628.1759635-7-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:41:30 +0200
Message-ID: <CACRpkdbrw7Hjt9mB9pr_iNsGi71g_d8BGhpT_ih1RVgKJ5U0qQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: convert ocelot-pinctrl to
 YAML format
To:     Michael Walle <michael@walle.cc>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Quentin Schulz <quentin.schulz@bootlin.com>,
        Antoine Tenart <atenart@kernel.org>,
        Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
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

On Sat, Mar 19, 2022 at 9:47 PM Michael Walle <michael@walle.cc> wrote:

> Convert the ocelot-pinctrl device tree binding to the new YAML format.
>
> Additionally to the original binding documentation, add interrupt
> properties which are optional and already used on several SoCs like
> SparX-5, Luton, Ocelot and LAN966x but were not documented before.
>
> Also, on the sparx5 and the lan966x SoCs there are two items for the
> reg property.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

So is this single patch something I should apply to the pin control tree?
If you want to merge it all through ARM SoC go ahead:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
