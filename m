Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5917E338DBD
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 13:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbhCLMwS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 07:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhCLMwD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Mar 2021 07:52:03 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E401FC061574;
        Fri, 12 Mar 2021 04:52:02 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d8so11872965plg.10;
        Fri, 12 Mar 2021 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AkpjLp5UBjKVoBHZLmED7C5kygWoJZwWtVk7xxQUh1c=;
        b=K3eCFVI639YAyoTkryxWOlAdLqK4fvGeRgAn3SVdPqFew+ae3AnVXVYy8ux/pU3Twb
         aWlG6zNan4hukaFhUTHwlRBCSE3JY3MpSnBzYnFQSbY7nEynl9VGIwuMh4uwfVqS9hVI
         5VsawwWQ+nRgQRgiJxEg4MGs83jzlKoMm6p9ypCEGRuTbgsweGLl3/wfL8nKt5X6kdVQ
         FbznUpmZsdQFgGWS3xWYBxGKdlj3tJKoNjyWT0yEM9qO7muL/MSikIoYTuNqyvHhGITu
         KFPZ+oE6/4T2WM637WmuulalqJ2Dlo/QhgZu0j5wOBWuBz87VLUXSlq5fHBTED73ZpVU
         f4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AkpjLp5UBjKVoBHZLmED7C5kygWoJZwWtVk7xxQUh1c=;
        b=Kq+DFjbKHMMxVGXk0jBTUvXMyJJbpmiuG0Piq/vJemoOKVdPA3P4uU48xlasTKnkhG
         Zutew04SYf3fEUYFbBkGxiVVCjBlxEllHptVjz1HRKAST2Fv6YFOluzp+IDbR8c1j3LO
         7bXKS9FwpwB3/Nj/q5gW+WH0Bf51DFarU5cyd0SPnJJ1uaT7GJ+T6NaY9Di9mDf+Crdo
         fCsEoSn4Tc4DIGtYBUgKbqGRFvsv6KOZv58gqVEXhrzJvMVpJ6bU6q5nTrcDyVGzP1PP
         w+gc3AcoDzOKkvo1GQIbyo7TLSrdJlGRNJnY44ZRBDvhdfS0bMErncJMlN+gLLRwI9k7
         6imQ==
X-Gm-Message-State: AOAM533dcjcN9TWf8nrlLTI/eq1IUSFe7m/5jdRlC3zYpziarsUDYZtO
        CHL4dfurvg2MX9oEnBl0ycv7ERjYYK42YDFOSro=
X-Google-Smtp-Source: ABdhPJxvmWPTi5wqy4XGiI+wbqmsVu3uppMa5hV+Go8UcO43YFJf/yzLdemrojkBJ5TlF19Ff7cCQ4MR2tsRMFPSX6g=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr14558931pjx.181.1615553522521;
 Fri, 12 Mar 2021 04:52:02 -0800 (PST)
MIME-Version: 1.0
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Mar 2021 14:51:46 +0200
Message-ID: <CAHp75VfMFK_boZ_aWfat6DVuToUgDgM7gzU6SXRxcF8C8zFA4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Fix bugs and add support for new Ingenic SoCs.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 11, 2021 at 5:23 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:
>
> v1->v2:
> 1.Split [1/3] in v1 to [1/6] [2/6] [3/6] [4/6] in v2.
> 2.Fix the uninitialized warning.

With the split done the series looks much better!

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(with the exception of DT bindings)

> =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (6):
>   pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
>   pinctrl: Ingenic: Add support for read the pin configuration of X1830.
>   pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
>   pinctrl: Ingenic: Reformat the code.
>   dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
>   pinctrl: Ingenic: Add support for new Ingenic SoCs.
>
>  .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
>  drivers/pinctrl/pinctrl-ingenic.c                  | 1423 ++++++++++++++=
++++--
>  2 files changed, 1353 insertions(+), 93 deletions(-)
>
> --
> 2.7.4
>


--=20
With Best Regards,
Andy Shevchenko
