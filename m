Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B0C3E5B91
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 15:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhHJN1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Aug 2021 09:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbhHJN1u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Aug 2021 09:27:50 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89E9C061799
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 06:27:28 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h2so16885087lji.6
        for <linux-mips@vger.kernel.org>; Tue, 10 Aug 2021 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pF6V8VR884m9lXXeStRNQD2bGZpEx7NkDPcYVysjhp8=;
        b=KacULvs7Gu39X4aVuaAJXdO3DXrjG4oS+2EpZc1lDyoaoWfuNfRTvT8zZISfFMYGmP
         4uU03/er7SfPLLSJ+vvI4AtJ+VgSS5Qxdob/NDspowXDSBBd+NiZrccN6tZmOSw4zDkk
         cL8mH3a18bdrhqwla80xiRVOROi5Uvu8w2etXNmB3aoWIi/goqFs9lbQqFImz7y1uVAq
         d/iqcSXCqC9eB0w5AMhY/rnaPCijGtILa6CDw1JfR3o5n1E7Y7WIKM+/uHT7W47PWsuI
         2doXFF/XI1xpTYPXIUWf2tBfkNH94xdg2sT0mCqENI9vRU9aKFz2UydyKT23owQSehU4
         n5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pF6V8VR884m9lXXeStRNQD2bGZpEx7NkDPcYVysjhp8=;
        b=CrZD5Amkn/5BT0y1pmBLc9pr//K6ZVdUD3f5/+px7iy3sFnQXHEPIAhjHJBCpYJs5Y
         2kmYa9B/YfH6w0cpnFO6WXyjRc/agsRDcQIwFUvdG6lQfjlHdEPIc8HqF34SLTHMLPCH
         N+neMVy2iMNs5wzypy304XTGjCibDJr7cul7dGU07/f5588bHB29iZu2AqidNU8rGkgK
         9+r7c9q/jfUbvCMjVGhnYiZMcMwQ3p9WMFAyvwPhkkXyE7nk6M6itNlLx6+k7LpO6Z0L
         ImLH6GaAsgwepJA7Vo/kqwd8wzB8Vwjs2vnzWiRFYIkipqgzrsQ6LW5vHMruR/RHMi0+
         Yvjw==
X-Gm-Message-State: AOAM532kaRrN1+mDXmQZZJiBMQHSHeJ90A3wF8dElF1qfO8yFye6tr3X
        b5g0X4KifMAFjdBryRMwnyVZaHitb+opRGkL8EG+1g==
X-Google-Smtp-Source: ABdhPJyvjj3KxX7v1w+P5zqdN+YPQt4DlGffAink3HMU1FfLlBQDLLhxd/EdjbMGVZ2Pui9bq3uJ5c93ohZxQv3mEto=
X-Received: by 2002:a2e:a804:: with SMTP id l4mr12623209ljq.273.1628602047152;
 Tue, 10 Aug 2021 06:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
 <20210627045631.2882-7-jiaxun.yang@flygoat.com> <CACRpkdZkvSg___ZxdE639SMbTs5rJbjHBq-HkTCuv0e645Rssg@mail.gmail.com>
 <c7de97c3-196b-6bc3-a8b1-d6c6e6ab583d@flygoat.com>
In-Reply-To: <c7de97c3-196b-6bc3-a8b1-d6c6e6ab583d@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:27:15 +0200
Message-ID: <CACRpkdZjdNasty5g1K5nL+fztN+LPgwYog91bi-UvVH39TXMkg@mail.gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: pistachio: Make it as a option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 25, 2021 at 4:49 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
> =E5=9C=A8 2021/7/24 =E4=B8=8A=E5=8D=8812:13, Linus Walleij =E5=86=99=E9=
=81=93:
> > On Sun, Jun 27, 2021 at 6:57 AM Jiaxun Yang <jiaxun.yang@flygoat.com> w=
rote:
> >
> >> So it will be avilable for generic MIPS kernel.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Is this solved, or should I apply this patch?
>
> I guess so, btw I think it should go via MIPS tree to avoid troubles.

OK feel free to merge this in the MIPS tree then:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
