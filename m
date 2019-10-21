Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7954DF0A2
	for <lists+linux-mips@lfdr.de>; Mon, 21 Oct 2019 16:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJUO6H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Oct 2019 10:58:07 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38168 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbfJUO6E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Oct 2019 10:58:04 -0400
Received: by mail-ua1-f68.google.com with SMTP id 107so3893331uau.5
        for <linux-mips@vger.kernel.org>; Mon, 21 Oct 2019 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xl5HbtCvAk9GKynQL9GOsijJT7m6YA6GZF9QqoAexoI=;
        b=DoMy1wWt5SqZIDChScV+zdd7Y/Ie0TLM9sKJrQs2S1hZ+hsiLtUtPUHxCUMMEX8LbO
         vb3opcGd+/Na4K9DSLQaZaOK1JHr+l+jy0YE6BUfkWll6cIaz78qArRQZsm7zaV6jF/q
         TbEH7N0DzGXwR4FJv02eq9B2qrJXTP9myHnx6zDjUn3k1fmT6lHKNdfhK6YZjOjXQwxm
         iJJgca2JS9CzzeIFrgiqXAR40ulixXCiblT2rmpxPf0JYOF/sCaQT7s/wSVAZLyIo2LY
         r0x2B56H4BEb0qhbjRqzLE0aXuVfEbeXRJz5/OEopQxtmNJmODXX5kZIg130P9JUkZ+H
         NMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xl5HbtCvAk9GKynQL9GOsijJT7m6YA6GZF9QqoAexoI=;
        b=W130JwrxKAXUiMSslKWESLeR8bxc1E7a1/gXApJdsWvF3OwKxl+vqDNAUMasTQLzDz
         5i9KYZh34NyXuyMyQWXNQI6UU5ybK7+4FQZvOAi7tu6G7bdYZci3eXNXCkX/XvaLpAOI
         9RlbalDxxOHxc546u1x1uicT2qqP2+DHQy3meN/ru0p86qfXiL1z35dMYvuM6XvywaA8
         A99eQDmn1Osie59VmwdydUGTxvVyJ4PqWLEv+cOZnhI9FTr9WOnQ5iy1t6RvGPxsGP8x
         CDQiDM8sFsA7PjcBQXhBCN/1EnLxHFZqe0Z8C6xFi2JVAPPdxrIcaGsAvRzVhkeUcjTD
         4B9A==
X-Gm-Message-State: APjAAAVDmqKJOCdRv+P+PicdyQ6Tec/MjdgG+GXdsFROcK8STrxiWYR0
        QqIUE+dag/HidN58IIacsHuLPhmHYh0hL8w0BEa//g==
X-Google-Smtp-Source: APXvYqwR8uDfCggaF5xEo1UJr8wTwbIeCqoiB4/XGD3itd7jHcJkuglR2FjN1rtjKVpnR3u4ZBFOp3qgc5xIPsE/sIw=
X-Received: by 2002:ab0:331a:: with SMTP id r26mr6107644uao.104.1571669882589;
 Mon, 21 Oct 2019 07:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <5DA9EE2F.4030603@zoho.com> <47f6-5dab7580-33-5680128@176712317>
In-Reply-To: <47f6-5dab7580-33-5680128@176712317>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 21 Oct 2019 16:57:26 +0200
Message-ID: <CAPDyKFqzT5Gf1R_26Hzyt-_xEshk4k-EW3yUSKw1MVi7ayh3QA@mail.gmail.com>
Subject: Re: [PATCH 6/6 v2] MMC: JZ4740: Add support for LPM.
To:     Ezequiel Garcia <ezequiel.garcia@collabora.com>
Cc:     Zhou Yanjie <zhouyanjie@zoho.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Mark Rutland <mark.rutland@arm.com>, syq@debian.org,
        Linus Walleij <linus.walleij@linaro.org>, armijn@tjaldur.nl,
        Thomas Gleixner <tglx@linutronix.de>,
        YueHaibing <yuehaibing@huawei.com>,
        Mathieu Malaterre <malat@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 19 Oct 2019 at 22:44, Ezequiel Garcia
<ezequiel.garcia@collabora.com> wrote:
>
> On Friday, October 18, 2019 13:54 -03, Zhou Yanjie <zhouyanjie@zoho.com> =
wrote:
>
>
> >
> > >
> > > I also have a general question. Should we perhaps rename the driver
> > > from jz4740_mmc.c to ingenic.c (and the file for the DT bindings, the
> > > Kconfig, etc), as that seems like a more appropriate name? No?
> >
> > I am very much in favor of this proposal. Now jz4740_mmc.c is not only =
used
> > for the JZ4740 processor, it is also used for JZ4725, JZ4760, JZ4770, J=
Z4780
> > and X1000, and now Ingenic's processor is no longer named after JZ47xx,
> > it is divided into three product lines: M, T, and X. It is easy to caus=
e
> > some
> > misunderstandings by using jz4740_mmc.c. At the same time, I think that
> > some register names also need to be adjusted. For example, the STLPPL
> > register name has only appeared in JZ4730 and JZ4740, and this register
> > in all subsequent processors is called CTRL. This time I was confused b=
y
> > the STLPPL when I added drivers for the JZ4760's and X1000's LPM.
> >
>
> I am very much against renamings, for several reasons. As Paul already me=
ntioned, it's pointless and just adds noise to the git-log, making history =
harder to recover. Driver file names don't really have to reflect the devic=
e > > exactly. For the compatibility list, it's far easier to just git-grep=
 for compatible strings, or git-grep Documentation and/or Kconfig.

I have no strong opinions. What matters to me, is that people agree on
the best option, based on a case by case discussion.

>
> Renaming macros and register names, is equally pointless and equally git-=
history invasive. Simply adding some documentation is enough.

Sounds like documentation is what people prefer here - and the DT doc
seems already fine in regards to that.

Perhaps some more words added to the header in driver's c-file could
be and option to consider, as today it only mentions "JZ4740 SD/MMC
controller driver".

Anyway, it's up to you. :-)

Kind regards
Uffe
