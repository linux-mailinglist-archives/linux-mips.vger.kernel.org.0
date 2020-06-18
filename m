Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6FD1FEDAC
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 10:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgFRIb6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jun 2020 04:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgFRIb6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Jun 2020 04:31:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB147C06174E;
        Thu, 18 Jun 2020 01:31:56 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 64so2444950pfv.11;
        Thu, 18 Jun 2020 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpvBCNreMFHRCyXrfUPmBsfCUSsV/gLfu8O/s2ZlKTU=;
        b=Dd6GBRSKoTGsMfDWEuAIZly6qDPrieU28huK4UIoNXSzpKVB+tCm9k3ysgnloilyBO
         8rbDDlSjrhiGXCTO6k/GIGAzQ2dLAiygTxBIwyyTgeUOZb4L3wao7e4pOA+zCXPk04ig
         jnQSYj00CCJyBDF/OURcKq99tCPNdSjjgHaUAGfutbM8rv3H7aR5289SSZHxZukipygE
         uPashPZUcMYLiEirvirhWvRdF8wY17Q7pM/UcT7g8IBxNCSe5S+iWp4y0U6reRFcSEiI
         8p5OCJjFDyaS03+aUqkczrKDutKxPnLuRwGh0LO+h8pGu0nnvtVxBTQ1WW7PEkYwLawu
         MqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpvBCNreMFHRCyXrfUPmBsfCUSsV/gLfu8O/s2ZlKTU=;
        b=Z/R/a3iu35AzsTGq31XUViKsZVqWlVKLzxT8Q2KOqzUDsukmKvG4gwMH0NfsZj+9/7
         VhG4Wuk1e2LZmtU4o5szI28mDGLHyRMrS/5TcdZjk5iKWJOVsc2TncMuQaJpRwXtN0Xi
         qLC2U/C4lTATk8L/gmrnGddzicmqShSlWq+d+5TbgGHLsarhTYIyJ3O529rPFH0VQBgq
         JGkBy/7Qlfpgg0mOVE9y6C9fPrD2fyFOO7BHM9yUnWEV6GgrD6RYKsewwGBpFecSMbub
         C7LnAJeqNFbWaJLPCxgHHFd/bpi6YVeqoWluZICcL+VlYsPa0ZNzE51Wi04kxuLNm1Si
         l5/A==
X-Gm-Message-State: AOAM533x9gMB5F3zdtM0xJQKYzNd9RKz/6hCIWS0fYH9z9vonsVqVJmf
        ZTpMF0KYyWZsGCx25Cok2LhlefVSmvv966AWBMU=
X-Google-Smtp-Source: ABdhPJzIogL9zJwyMTDVa9GrEwtZfyEuOcY8rzHq2ppylVuZVw695VzA+I2FTmRHzOjsQTa8VeIuXwTbhhu2Was/fgw=
X-Received: by 2002:a63:f042:: with SMTP id s2mr2425063pgj.4.1592469116343;
 Thu, 18 Jun 2020 01:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200617224813.23853-1-Sergey.Semin@baikalelectronics.ru> <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
In-Reply-To: <CAHp75VfPEdxN1UeKJ+gCWpgJymK7YzQs1Lznq1aBfoRNBiMHbQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Jun 2020 11:31:44 +0300
Message-ID: <CAHp75VdD+=L4OQkwVDx2aLKRssW-qBQL2nsF48J=dCntU8N7Ng@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 0/3] serial: 8250_dw: Fix ref clock usage
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tony Lindgren <tony@atomide.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 11:17 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jun 18, 2020 at 1:52 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:

> I'm wondering how this will collaborate with runtime PM.

Forgot to mention the WIP repository [1] for runtime PM rework  (it
doesn't mean my comment against patch 3 is not valid). Tony and I are
working on it, you actually may be interested as well.

[1]: https://gitlab.com/andy-shev/next

-- 
With Best Regards,
Andy Shevchenko
