Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAAFD507C98
	for <lists+linux-mips@lfdr.de>; Wed, 20 Apr 2022 00:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358216AbiDSWgI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Apr 2022 18:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358214AbiDSWgH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Apr 2022 18:36:07 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B802CE06
        for <linux-mips@vger.kernel.org>; Tue, 19 Apr 2022 15:33:22 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2eba37104a2so637637b3.0
        for <linux-mips@vger.kernel.org>; Tue, 19 Apr 2022 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dPwL7aoaZ2Tj5IbNCnFua5KEAaAGPpZL6+FzfhVJ9DU=;
        b=cppk+mUylJYCtCcjAdZD6my1QeB78RbGeqdSursZUtBQwAgnkzDQSyNxHh9jUrfO1/
         VcGN3c6MOgC0vv8hXaLxWUtzzLnU5txIxFDqJx0Az/dSn2JE+mF+8BWUn6Dm6NRcmGye
         uH9sM6+tReaXvghSDyxsnzzDW2JBNBjI130ZfjLy+Sq63vdWjZBf8U7lYXLu5ul38FRZ
         lnhqmAONa0USuN0S8HcQoJ4uy71e64Gp8pka1ow38wc/uon7Cy1o2bsDiK+56FiVhU2H
         guvG0T3lpuOqjHOOgfEUaAtnGTkrP9QRxQv58sqgQ3ikJD3W7TSs/0pyGLVsA5PMN273
         hhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dPwL7aoaZ2Tj5IbNCnFua5KEAaAGPpZL6+FzfhVJ9DU=;
        b=s/1sg2O58imLUNkui3rPy2sxyzPLszimQKR0zuIf9GSNimUDwgBjUN4TbPfE7kAQGy
         V0w0AIQlcWCJuLxQm79ko3TuVF4IyENzVF7PYWpDlz3/B+C/E7AZgCECJoM0RlRZqobg
         wBXqzMW/kaEPLLsqZ/UR+Cy/kIIvfUAL6vg+jjo3VA+8851/Z25eONdL2QMYtOlzhh5P
         NKEaToOyydpHmz5C63LPFHw8EaGmOJJD5u9IS27rqbUUxktY+aRIlxtpjKtb/pdjyylS
         qr8BsgdtEAbLkNdysvIyguQsMMD/3Bv6no7r55U8Ku+igsMICOeceX5Yot1MuMFj2zJe
         YXVQ==
X-Gm-Message-State: AOAM533HF6ud9fbIJNuH316P/9AR9y4K3NCbvQrBwEzkpTzMu/EEYPUK
        Jo4LBxlRE2lrWnuu3PGwVPUz0m1yrPQnPFKLYdpeHQ==
X-Google-Smtp-Source: ABdhPJz+yFRgMHBw2zE3OHuucGEP8amS/hvIwE6uRi+tci2ORv8kQIih2dHhwvp5wJLJbquzoJV0llSzHo0T9RhKEsk=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr19457673ywh.140.1650407602056; Tue, 19
 Apr 2022 15:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220319204628.1759635-1-michael@walle.cc> <20220319204628.1759635-7-michael@walle.cc>
 <CACRpkdbrw7Hjt9mB9pr_iNsGi71g_d8BGhpT_ih1RVgKJ5U0qQ@mail.gmail.com>
 <e02e22920ffe23b49237c0c1379e888b@walle.cc> <de9b0114-23b5-04b4-86b3-0d393441a267@kernel.org>
 <735863d6476605e4ff72032d8971ac0d@walle.cc>
In-Reply-To: <735863d6476605e4ff72032d8971ac0d@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:33:10 +0200
Message-ID: <CACRpkdbxmN+SWt95aGHjA2ZGnN61aWaA7c5S4PaG+WePAj=htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] dt-bindings: pinctrl: convert ocelot-pinctrl to
 YAML format
To:     Michael Walle <michael@walle.cc>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Mon, Apr 18, 2022 at 2:04 PM Michael Walle <michael@walle.cc> wrote:
> Am 2022-04-18 13:13, schrieb Krzysztof Kozlowski:

> > I think you got all necessary acks for this pinctrl bindings change and
> > the dependency ("add reset property"), so both can go via Linus' tree.
> > That's preferred.
> >
> > DTS patches goes through your SoC maintainer tree.
>
> Ah, ok, I wasn't aware of that. Then yes, please go ahead and
> pick this and the first patch of [1] up, Linus.

I picked up this patch but:

> [1]
> https://lore.kernel.org/linux-gpio/20220313154640.63813-1-michael@walle.cc/

These patches don't apply to my tree. Please rebase on
the pinctrl "devel" branch and resend!
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
