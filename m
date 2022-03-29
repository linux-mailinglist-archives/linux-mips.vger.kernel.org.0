Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406074EADFA
	for <lists+linux-mips@lfdr.de>; Tue, 29 Mar 2022 14:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbiC2M5n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Mar 2022 08:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbiC2M5m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Mar 2022 08:57:42 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3088815A09
        for <linux-mips@vger.kernel.org>; Tue, 29 Mar 2022 05:55:57 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h4so12818735edr.3
        for <linux-mips@vger.kernel.org>; Tue, 29 Mar 2022 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbPuFqQGb2Jze62c/iH+wYbxt07J3o8t9exdIPPiA8Y=;
        b=R9ye1naZF+VzC9L1uRtovziMOtnPS1ObKD+ioTDq9I2KH36oK9xvUZhiAJfJYJonqc
         E1bCHIz9oBQbDJBlTwbt5g0OhnN6uXa43pQzwZOcmzlVOCFrhGwa2JrORJVSVFECelnX
         vm3ExJTzRJZ0Kp7DRgmDy7axscifNW7Q/PPUcw4kxJJyNc+trrkAxQu/YY0YkirIw7js
         k2K1B/qTv5sygrUWNPV7QN0nmBaBW1G3HYc++P2oyZBt8aMYr/4oesAW1o903Zx3lHO9
         ivlm1PT8Lr+EuArRCi+k6iM7A8FQzRxcgd73hsaFgkJSRKjWTmi5SzNuRjisFn5VW/uC
         iw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbPuFqQGb2Jze62c/iH+wYbxt07J3o8t9exdIPPiA8Y=;
        b=KjXB9mUJ4gGzwtrMh/ItRHmFle+XCARMMEjnM1YDIHX8hgPfwKviTPdbvwX5pO4yZI
         p91Q3XErEfzwaV1Z3TNgDlwBxpxSyF3L8KMKqbqTZeHlbzv92YnqWsSCbyO18Fo3etFp
         BZUk37HIDIZlFqKxrjXr8ZZ5OzB8jYhW2jCD5es9qJKRWuah8hsgZnbqG8kmMdoQLDvs
         uGi+bZSCLK/mBc7WcD8epgWGhy/H7uBZhV9HVqduMa0or4f+ntrFbhSXQL3VLo+FX/uf
         PUjvfeO9ixzNPCOZ93Mo1dY5A+l3YJKTuecBfUtIqgirf1SVydW5wjqltcqRiB1cRJxF
         S1jg==
X-Gm-Message-State: AOAM531c45/UwJ3I6BpHm+VNfiieLKfNTMBt54H72/o1U7YcUex2xYRj
        I9kK9EWuqkvo5flb7Jj+YVOM9nbbSzEAINg/8NepFUDImb05PQ==
X-Google-Smtp-Source: ABdhPJwtwM2ZldvHkkNETBFZPNMwkh9UHbXg7PNF7O9xnmKMtbHzIPe01I47sC9moFwnDAsglJSdSkDnUkcCVl9PSsE=
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr4548369edm.122.1648558555655; Tue, 29
 Mar 2022 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220329014537.4180966-1-liu.yun@linux.dev>
In-Reply-To: <20220329014537.4180966-1-liu.yun@linux.dev>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Mar 2022 15:54:49 +0300
Message-ID: <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 29, 2022 at 4:46 AM Jackie Liu <liu.yun@linux.dev> wrote:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> My kernel robot report build error from drivers/iio/adc/da9150-gpadc.c,
>
> We define GPIOD in rb.h, in fact he should only be used in gpio.c, but

he --> it

> it affects the driver da9150-gpadc.c which goes against the original
> intention of the design, just move it to his scope.

> At the same time, GPIONMIEN and IMASK6 are not used anywhere, just delete
> them.

While not being used it's good to leave (save) them since it might be
the only means of the HW documentation. I know that Git history will
keep that, but it is more explicit just to have them in the code.

...

>  #define DEV3TC         0x01003C
>  #define BTCS           0x010040
>  #define BTCOMPARE      0x010044
> -#define GPIOBASE       0x050000

...

> +#define GPIOBASE       0x050000

I think this one belongs to the header.

-- 
With Best Regards,
Andy Shevchenko
