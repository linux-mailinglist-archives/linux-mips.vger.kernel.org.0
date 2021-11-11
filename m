Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A229D44D537
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 11:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhKKKqD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 05:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKKqD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Nov 2021 05:46:03 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A97BC061766
        for <linux-mips@vger.kernel.org>; Thu, 11 Nov 2021 02:43:14 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 207so11024779ljf.10
        for <linux-mips@vger.kernel.org>; Thu, 11 Nov 2021 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdlEntx/bV7G4AsDiF3jxVAMPp4OZ6W0+ZvfFXAAPeA=;
        b=UQmAR8AaEOEO5IFxI5xvWs5axVFnXhyxAWqF45ZUq1KigIU8fMEOGu15URAtyLO1en
         J48qehtV9Rf9uuIhNdx11JTFGd+eoP4jK3Z6Er4do1DomGn2mNiiMaUXXtljOqLzvi69
         a35J8yH6GiAvVFYQ9lhMtU8Nh3GS63Bd9IOHb+k32kNTHELJxVOzDW+hQGxxFpwxGqvx
         RMceCsEs8M/gId5BARlR4CKhojsKGnqo79Sxn9tlRSYki4YlVlq663ghCwo6DM9+q61p
         FL1Zb74/JeVO7PpJhFmY2wRwp/cyo6QHDJD+xEEtLZNhn/zMEI2OD7vC5d4iALpd7Igy
         LdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdlEntx/bV7G4AsDiF3jxVAMPp4OZ6W0+ZvfFXAAPeA=;
        b=qO2REeT0ASZniORzB7lo7rEda9bRcWXPtfbUxob1uToG2wy67SP3WEv2qsqHPlQEiT
         PMBQDm5Uj/t3APxhl6IQAlZSiQ+FTItrMJlaFhaUj+OqLEp62wm5aXQFKXrNlRdpjiDV
         c3vc/CK4KQJM7+Sj9kl0N+gQivwQ9fO3j3XIoK2tRsgPhMZaUBDEix+AKZbjfrgTqztq
         zy1aMvllw1vYdtx//SACXVqY6LU4NqMWqDzaBrZngYScGlFcRiAxDUzZ4se94fFfZIQI
         QZTMNYWleh5TisGstxtnevKUUX7AptBvTS/RTjJ6Pq/Wp7XFVIl0qjwx2wA/pw28giNh
         F1sw==
X-Gm-Message-State: AOAM531EzK9STBKQTEWLYR29XaBxDmd0M9smIAc4cpjOTxTgWT0IykMG
        peoGCA/GxOpYZQiWNEQQMvp9ZZZLUKVoa4doatyEFuq9NJs=
X-Google-Smtp-Source: ABdhPJyTKwk0+lRBSGsuh9JXonXwvjBKNZrb6BcCyMKZMcMNGTSqI+8+wA5L2ltjbDUfGvq4ekLwAo9jUI6tJJwT9Lk=
X-Received: by 2002:a2e:a404:: with SMTP id p4mr5989126ljn.78.1636627392657;
 Thu, 11 Nov 2021 02:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20211109161253.2202108-1-robh@kernel.org>
In-Reply-To: <20211109161253.2202108-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 11:43:01 +0100
Message-ID: <CACRpkda1+86GgvCJEehg9CGS78Q10FJ3ZHzdmHpYHrY7tAwkwA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Remove Netlogic XLP variants
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 9, 2021 at 5:12 PM Rob Herring <robh@kernel.org> wrote:

> Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> support"). With those gone, the single platform left to support is
> Cavium ThunderX2. Remove all the Netlogic variants and DT support.
>
> For simplicity, the existing kconfig name is retained.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

A question:


> @@ -373,7 +263,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
>         gc->label = dev_name(&pdev->dev);
>         gc->base = 0;

Can we also set this to -1 and use dynamic GPIO base allocation?
(Can be a separate patch.)

Yours,
Linus Walleij
