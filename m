Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB125386CC1
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 00:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239687AbhEQWG3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 18:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235143AbhEQWG3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 18:06:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA38EC061756
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 15:05:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v9so9672049lfa.4
        for <linux-mips@vger.kernel.org>; Mon, 17 May 2021 15:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0EnX96LwxQySMD7I4X6fO6Rjc5x34+gOGsRYBFgDTog=;
        b=qK4wqp1m3BeMYs8JRjpUe+jYFuWN1Ex03txiYUevSXortgsFyi5QTGOhWKZmYXPWBK
         UyajBCIqb9pg0cEN4P2vBJODU1HLkfL7MMT5r6OHY3xSpgEVz4usMhWkrZCjKpsIXf10
         zFkrX3RUDbN9DCDx8vOKvEyyL+aSaNa+z0v+ShnkIPeAO7G+XouF6HEZ7HQsOJY0zAhZ
         2b64tAjqpBWKw6j7H9C4UrY3y3D9ah1wM/swQn+hicno+e5howWuYm9PbpyqDErPZnAv
         RVEi/RCPdD+QY7kxKOTUmzOJAeizYg6lOIQsnShC2qCtkc1+84Y+y6TnxoCQXQ/CZsU6
         ydxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0EnX96LwxQySMD7I4X6fO6Rjc5x34+gOGsRYBFgDTog=;
        b=tIa+AW8khTRIOaNOdOCi4qgjHvk+4U1Dwx8RVfdzqvtpVU3q+x4iJRuyZcJYfK/23q
         gSqzEUGC0uq64pMbGLcUe7oTd/HPVvKM12ZqJl1FrLkCkep8HPJoI8t6va/TvdcPC0oL
         bIP6w8CE7JgAbU5Sq5WDBGfvgkPHHV8YKiX8xuAdOZN04DLtDx5yggaZo+/W8MEa5fbp
         sdZNZPV5dFHQHfVd+l5IcErzUY3oyK+DUSE5TgHl98QCIcYPLbWm8pf+pFzlN9I9aQWm
         aC1e2FV+9bnfQRZcWIlakHHvMFIWn/s626lQQIu6fhgN97uyz5P/g1/QBhJyrnn8QWaI
         03uQ==
X-Gm-Message-State: AOAM531+pizrytg/If7yHlnT4/LqynrA5Hx/shxICyoiMJ9WSAFSfB8n
        VUygQEyT5hfFOaaUPMHJbkzgn1rdlJQpKpHydXKSHw==
X-Google-Smtp-Source: ABdhPJzl7dXCM37hLA/3mkPPX/iWZAFk9lbQyOoe5Ys2y8odDTzF7712gF3wvnQrQLLs8jNqPWEDff17PPpBHSaVjfc=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr1359070lfl.291.1621289109448;
 Mon, 17 May 2021 15:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210516190014.25664-1-rdunlap@infradead.org> <CACRpkdbcN4d2sdCDjqqW7txDm7--_B2MX10CDA6z8FOq4mQ7=g@mail.gmail.com>
 <20210517103435.GA179901@rocinante.localdomain> <2a5204be-7761-2d0b-e1a6-af5b6d4fdb0d@infradead.org>
In-Reply-To: <2a5204be-7761-2d0b-e1a6-af5b6d4fdb0d@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 May 2021 00:04:58 +0200
Message-ID: <CACRpkdYdFLrt0Mtb+KxQPZKebuMMr7bq6_J7SR=Z9DJxVemu3w@mail.gmail.com>
Subject: Re: [PATCH] PCI: ftpci100: rename macro name collision
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 17, 2021 at 6:16 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> On 5/17/21 3:34 AM, Krzysztof Wilczy=C5=84ski wrote:
> > Hi Randy and Linus,
> >
> > [...]
> >>> PCI_IOSIZE is defined in mach-loongson64/spaces.h, so change the name
> >>> of this macro in pci-ftpci100.c.
> > [...]
> >> Though I suspect the real solution is to prefix all macros with FTPCI_=
*?
>
> I'm willing to go that far.

Go for it.

> > Having said that, I actually wonder if some of these constants and
> > macros are would be something we already have declared (people tend to
> > often solve the same problems)and could be reused, as per:
(...)
> If you would like to take that and run with it, please go ahead.

I will look into it on top of your syntactic fix.

Yours,
Linus Walleij
