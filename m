Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547372D40A8
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 12:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgLILGI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 06:06:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730371AbgLILFw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Dec 2020 06:05:52 -0500
X-Gm-Message-State: AOAM532FxAIWtrz3GcSyx8ySr6w4NVRAuNl3+Yw2/Go2Qoxe4JcouzN2
        jqzgKGpF1/Qt2pg2OT7C4FHzxSyrQmnmPBquyy8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607511910;
        bh=iHRngC0ANhFxQ/UVZdui4aIYpUOkA29G/4HhBsdC2io=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R3Dmty8vAYJKDiZUPF1JhJ/fkjvu0FhjsyBn5KjqeSujEf6PHTNzyF+WXZ/w76xNg
         QS+fe+Efir3U1mO7MR1r5psbffnGBO/51pjVdNN2MbZ3G5h5uUNQIx+KsGYuw5KtWU
         vW0zaQr7ETLlHN8lNEGbzDZ+z543kEozSdv2WDChe55Pnmgrr37nJBqHI6WqI6SHPq
         y99YomOV0Dk9i8y21F7gJ8XLaIifIlWXOG/j1puForpugoXaf3ekzTHrhVQamBLSfh
         bjhCYQDhx0hHgqM5nOmG5LstUgXtDzlYhZlc6Bup6iZS5Yo5Rl8C0XFMbjw3hBPKaW
         ntlLsccWVXYJA==
X-Google-Smtp-Source: ABdhPJw4nzqzhKDzwtsLZDLztoFI6ZeiCH2UTXAydkS35zR5J+dVfmgmICP5TGbv6BtesRfz9ElkAS+JEn2VttiomRY=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr1211764otm.305.1607511909951;
 Wed, 09 Dec 2020 03:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20201208164821.2686082-1-paul@crapouillou.net>
 <20201208164821.2686082-2-paul@crapouillou.net> <CAFr9PX=EgQSXeATLn++DSHkkQar35rpLGh978J5Lnw9jS8XMrw@mail.gmail.com>
In-Reply-To: <CAFr9PX=EgQSXeATLn++DSHkkQar35rpLGh978J5Lnw9jS8XMrw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Dec 2020 12:04:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a37rQz6ihEJBZNkOARJXJE7U9TX7pCUhyQjQn6fJw+jUQ@mail.gmail.com>
Message-ID: <CAK8P3a37rQz6ihEJBZNkOARJXJE7U9TX7pCUhyQjQn6fJw+jUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Only support SoCs enabled in config
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>, od@zcrc.me,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 9, 2020 at 11:13 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Paul and others,
>
> Sorry to hijack this but I actually want to do something similar to
> this in some other drivers.
> The targets I'm working with have only 64MB of ram so I want to remove
> code wherever possible.
> Is there any reason to do it like this instead of wrapping the whole
> unneeded of_device_id struct in an #ifdef?
> For example there is a rule that the compatible strings have to be
> present even if the driver isn't usable or something?

No, there is no such rule, but adding lots of #ifdef checks in this
file would be much less readable and more error-prone, as you'd
have to make sure the two #ifdef blocks around the structure
match the one for the ID table, and any function that is called
by more than one SoC has the correct combination of A || B || D
checks, and nobody ever gets that right.

      Arnd
