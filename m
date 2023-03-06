Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7416ABA16
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 10:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCFJjy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 04:39:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjCFJjo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 04:39:44 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF9A211C5
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 01:39:41 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id f20so5985680uam.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Mar 2023 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678095580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG4fYlpMlkVYz3KkfqTU8Qlmp6+wB13r9lUMK+XkXD0=;
        b=aGmb2xBNNCIunGeDl9p7uscsTgiuO1Q8udjIOerQ5AtqIC/QLR0Wa6xi/zpiP1mfXU
         841m5SKCVKYvBcOME9xiLpz7wXvqzX+5tDMtIqIp6/yd2QGdmbfkSZ0pp8KHlQptuFMO
         wjyjkzDX7mpfRrY4xWscFNTnz4Q+Bu1i8H/leRauyP3v5YDCVlc5D7nJe48dvF/bOn4i
         QzqBukZn5lSAXeW6byC5i7/tTYL16Gvq8443z1U93byxXGKgNfYdWcAz+7tJhp1KQG6/
         AHyFpe6/P5HJRZ9WBZdwRr3cjqsuzSAIOpXgER9y4ivMhw4ZbiH5I+CKiALPec9YZ+zf
         ARaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678095580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG4fYlpMlkVYz3KkfqTU8Qlmp6+wB13r9lUMK+XkXD0=;
        b=kXRaM6I4caOvuoNzqlyQN17IsxI4VgCU6JGj5aW9WXg1NbRy+JZ5UXv9zW+kZE8EBv
         geXmTtwoANh8LCYkq2OQiAIhKTUj+zvhKV5O3vLIPuziGP8uLc5oievJghU0Kd4BBlfB
         TUHLGTVYxJJx4ZLLFjOfyOs16kmzZgmFh5LC++l45qgN1fNgMuQJwrFtHhaPwQf70+C1
         uc1uYKuMPGW9aGipprhnfNcbelctx1wd7uouWQt3RBwXY8hWAS/Q4aTDVULNwGGuaXj7
         ZItrKnYYtixhjxCmoRSMd5jKG4PInoX/Ts2HkqlEaRyp/2GywoJI7bXAG6Ef3zg2kSkL
         fynw==
X-Gm-Message-State: AO0yUKUsL4Iqc7Vqfe4SqDYJENW77SSQkj7W7CHFJZbbVR3zTu9WB+yW
        Di9YOw87p1BjlwbO4O6Dyh/4pqnQErXfpSvVi2shcQ==
X-Google-Smtp-Source: AK7set9u32uo6jrigMFm0tYwWs6u6fKLZKYVnAgovZrS1Q70HbqXU/8l9eDzZI+y+OWVGtClmC8X+d621sscPTLhmHc=
X-Received: by 2002:a1f:2dcb:0:b0:401:42e5:6d2e with SMTP id
 t194-20020a1f2dcb000000b0040142e56d2emr6159927vkt.1.1678095580318; Mon, 06
 Mar 2023 01:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20230302125215.214014-1-keguang.zhang@gmail.com> <20230302125215.214014-5-keguang.zhang@gmail.com>
In-Reply-To: <20230302125215.214014-5-keguang.zhang@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:39:29 +0100
Message-ID: <CAMRc=McLt2+NJhmzFRuKF5LWMOqyZa-Y-eH7Ecx2ZiMHsTf1ag@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: loongson1: Add DT support
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 2, 2023 at 1:53=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.c=
om> wrote:
>
> This patch adds DT support for Loongson-1 GPIO driver.
>
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Let gpiolib parse ngpios property
>           Remove unnecessary alias id parsing
>           Remove superfluous initialization done by bgpio_init()
>           Add MODULE_DEVICE_TABLE()
>           Other minor fixes
> ---
>  drivers/gpio/gpio-loongson1.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.=
c
> index 3ac9e49e7efb..94ac0ccb450f 100644
> --- a/drivers/gpio/gpio-loongson1.c
> +++ b/drivers/gpio/gpio-loongson1.c
> @@ -68,25 +68,38 @@ static int ls1x_gpio_probe(struct platform_device *pd=
ev)
>         ls1x_gc->gc.owner =3D THIS_MODULE;
>         ls1x_gc->gc.request =3D ls1x_gpio_request;
>         ls1x_gc->gc.free =3D ls1x_gpio_free;
> -       ls1x_gc->gc.base =3D pdev->id * 32;
> +       /*
> +        * Clear ngpio to let gpiolib get the correct number
> +        * by reading ngpios property
> +        */
> +       ls1x_gc->gc.ngpio =3D 0;
>

Who could have set it before and why would this information need to be
unconditionally discarded?

Bart

>         ret =3D devm_gpiochip_add_data(dev, &ls1x_gc->gc, ls1x_gc);
>         if (ret)
>                 goto err;
>
>         platform_set_drvdata(pdev, ls1x_gc);
> -       dev_info(dev, "Loongson1 GPIO driver registered\n");
> +
> +       dev_info(dev, "GPIO controller registered with %d pins\n",
> +                ls1x_gc->gc.ngpio);
>
>         return 0;
>  err:
> -       dev_err(dev, "failed to register GPIO device\n");
> +       dev_err(dev, "failed to register GPIO controller\n");
>         return ret;
>  }
>
> +static const struct of_device_id ls1x_gpio_dt_ids[] =3D {
> +       { .compatible =3D "loongson,ls1x-gpio" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ls1x_gpio_dt_ids);
> +
>  static struct platform_driver ls1x_gpio_driver =3D {
>         .probe  =3D ls1x_gpio_probe,
>         .driver =3D {
>                 .name   =3D "ls1x-gpio",
> +               .of_match_table =3D ls1x_gpio_dt_ids,
>         },
>  };
>
> --
> 2.34.1
>
