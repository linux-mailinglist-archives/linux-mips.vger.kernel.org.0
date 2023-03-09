Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D2D6B26A8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Mar 2023 15:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjCIOVx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Mar 2023 09:21:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjCIOVx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Mar 2023 09:21:53 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F63588D86
        for <linux-mips@vger.kernel.org>; Thu,  9 Mar 2023 06:21:51 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536c2a1cc07so37946187b3.5
        for <linux-mips@vger.kernel.org>; Thu, 09 Mar 2023 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678371711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iafJZnGixciBIJiE6m5EiTSjxv4EI/PwHYeMlRsAhQ4=;
        b=RH3d8+9m0PaOPRNA6QFcjWe9nyYCPQccxdKGXGBTmP5ThOw8Dc7il3J4i2yk0mynO1
         atdNjRYJVb52NBqd4PVr6WyI4TFGTDYeKUgT2ggbPB1sY1IXVYhSrmW8pMXjuI3pSxg6
         tCUOn0YOitSMo7KZIEiFAmic6RjUGitG/9KYbVC7lScrvDdHEcs3s4LRWOnwzSUL7TZM
         AZHz3uIRb2tFJxjzIIohukwNg7viX8Wd1k6wCLHgif2K44C+ZPRfpgBefNRGbglWZ3T1
         FuKQrbWqoG7/IscnFZf5pIifrI0NVOVoII4SuCK1ZaIw4mPIC5fbtOebLmo6giaEO1ef
         9nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iafJZnGixciBIJiE6m5EiTSjxv4EI/PwHYeMlRsAhQ4=;
        b=PsRR1Yx+v0Q0/AUIaawEnW3cHuYyK26BCZtEpl22K2Vy+UCqK8gjmc1Rr3cZQd2oQb
         8c2RYFwzmHM6EDjLPegXX+MRYOKqbDmTrBmQOCh+L1giY7i1kxCAg3uG+z+Zhmjwr7gP
         Q61M0CLfhFofpw5ZJq52l86ZHa6hcHs1P4b2DQzH8H7vOzef36KHLDbEzr7UVyBx4Rlx
         CyF/pvXq2h+0U+iMACG2+l/nNt1zDQMT450aaShT8ByKpwTEBL7Fm+KeWRS4cM8a5S87
         MWS98mgc6l4VbGB5DzCZeivK1em4or7oX0NR2fAHxn9rOf1LFTe5WCiqvzqjB0mQhVkj
         Zllw==
X-Gm-Message-State: AO0yUKVM5Er8mX1UWVLujNXyVbhe60rKbX5XByaR3EK7yUwOMa1iYvIC
        N/mJfAJKUERlJzv1Hw9gfSR4lqoSSM1n0s4XAv9L3w==
X-Google-Smtp-Source: AK7set+m0LG2zwrv2ra5H/2MqKHhYnb/GA0KhFZkZ+CP90teyFtZBj+ePS1tAkcB4HR58mr3QukEhaoLNM7xjKop6D4=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr13582945ywk.9.1678371710871; Thu, 09
 Mar 2023 06:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20230308145303.826942-1-arnd@kernel.org> <CACRpkdZAJJr5+f8wiEhnAAV8mLjzYCBMDC9GXwQOAmsQLfShoA@mail.gmail.com>
 <ZAnnv/1ETFTRH8Qi@smile.fi.intel.com>
In-Reply-To: <ZAnnv/1ETFTRH8Qi@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 15:21:39 +0100
Message-ID: <CACRpkdYsZhoT4iCigrj=Q728GAmJ3+vF6dnbzZ9fX5WusM4rAg@mail.gmail.com>
Subject: Re: [PATCH] mips: ar71: include linux/gpio/driver.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 9, 2023 at 3:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > If this is the only problem merging this set was amazingly painless.
>
> Too early to celebrate. We have one more patch on the same matters.

Yeah I would expect some more noise, I had a similar patch in one
of my kernelorg branches and the zeroday robot would spit some
weird bugs like this at me after a few days of randconfig builds.

Yours,
Linus Walleij
