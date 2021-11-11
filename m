Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E0944DC64
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 21:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhKKUQ3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 15:16:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhKKUQ2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Nov 2021 15:16:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D8061452;
        Thu, 11 Nov 2021 20:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636661619;
        bh=OBl2/RJkXnTVlorNWEsue6KPdxSG9wgVBCBBr67fFww=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gGyvwUq8Iha0Q1SelN8UMWn3RCs61h+LhxzHI9QlpVBZI+q7nUsahrGXqLupPSoQw
         ebZ346MQ0ozQP/4VjUfjczbuIDa7qE+s+kd/bl/1wBvZKOTeloLMjKCCCIkblNucZ5
         /yxQ2WBrqMoaITa8fATEb4S7MYNOEF9k18xP6bUdK4noW01NdM+VNvhUu8fP6dG5zt
         QcBsTsIrg8sMaryxSBWgyexyckwb6rw1iOv0k9T30MBOjPT05G1rayUF5KkXQx049F
         Zoi4M9sZQIJN4lRS6OavpbRvSsSuWmqN/KNFMi/lBoBvNXHhDcRxfiEpijF6odGHvc
         yF+Cy/Nth/6RA==
Received: by mail-ed1-f52.google.com with SMTP id c8so28308477ede.13;
        Thu, 11 Nov 2021 12:13:39 -0800 (PST)
X-Gm-Message-State: AOAM533//ixxNAn8gIdN9pVLDquYHm/yJQHt+q69iKZ2tUuMk3zzDESf
        DTuykvtESYOOvkz0Ky6wObgaAbAoE80vzwPZBw==
X-Google-Smtp-Source: ABdhPJzK590YjmtXBIbhO+gFqRQ/Rx60J8XhDq4QBtLpLTnNV2NmS29qR9v3NBJEfa6Vnv79XQMVuPYgluWvwaQSnCE=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr12803070ejc.390.1636661617574;
 Thu, 11 Nov 2021 12:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20211109161253.2202108-1-robh@kernel.org> <CACRpkda1+86GgvCJEehg9CGS78Q10FJ3ZHzdmHpYHrY7tAwkwA@mail.gmail.com>
In-Reply-To: <CACRpkda1+86GgvCJEehg9CGS78Q10FJ3ZHzdmHpYHrY7tAwkwA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 11 Nov 2021 14:13:25 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+gjP=3=wMYJ83KAn7Jf6xgaqoW9yn-bfoqD3Ung+CcKg@mail.gmail.com>
Message-ID: <CAL_Jsq+gjP=3=wMYJ83KAn7Jf6xgaqoW9yn-bfoqD3Ung+CcKg@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Remove Netlogic XLP variants
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 11, 2021 at 4:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 9, 2021 at 5:12 PM Rob Herring <robh@kernel.org> wrote:
>
> > Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> > support"). With those gone, the single platform left to support is
> > Cavium ThunderX2. Remove all the Netlogic variants and DT support.
> >
> > For simplicity, the existing kconfig name is retained.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> A question:
>
>
> > @@ -373,7 +263,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
> >         gc->label = dev_name(&pdev->dev);
> >         gc->base = 0;
>
> Can we also set this to -1 and use dynamic GPIO base allocation?
> (Can be a separate patch.)

No clue. What's normal for GPIO ACPI systems? Does that mean more than
1 instance is broken currently?

Rob
