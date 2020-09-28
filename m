Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA1027AFD3
	for <lists+linux-mips@lfdr.de>; Mon, 28 Sep 2020 16:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgI1OQr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 28 Sep 2020 10:16:47 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55420 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgI1OQr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Sep 2020 10:16:47 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id F1EEB3AC021
        for <linux-mips@vger.kernel.org>; Mon, 28 Sep 2020 14:16:43 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3DCE7240012;
        Mon, 28 Sep 2020 14:16:18 +0000 (UTC)
Date:   Mon, 28 Sep 2020 16:16:17 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJu?= =?UTF-8?B?w6FuZGV6?= Rojas 
        <noltari@gmail.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, jonas.gorski@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mtd@lists.infradead.org, lkft-triage@lists.linaro.org
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200928161617.2a1b2244@xps13>
In-Reply-To: <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
References: <20200612073549.1658336-1-noltari@gmail.com>
        <20200615091740.2958303-1-noltari@gmail.com>
        <20200814085617.GA129183@roeck-us.net>
        <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
        <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Guenter Roeck <linux@roeck-us.net> wrote on Mon, 21 Sep 2020 20:26:19
-0700:

> On 9/21/20 8:18 PM, Naresh Kamboju wrote:
> > On Fri, 14 Aug 2020 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:  
> >>
> >> On Mon, Jun 15, 2020 at 11:17:40AM +0200, Álvaro Fernández Rojas wrote:  
> >>> Instead of trying to parse CFE version string, which is customized by some
> >>> vendors, let's just check that "CFE1" was passed on argument 3.
> >>>
> >>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> >>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>  
> >>  
> > 
> > We still see mips: allmodconfig build failure on Linus tree
> >   
> 
> Yes, same here.

Perhaps this check should be done by an exported helper so that we do
not blindly export the variable?

Alvaro, Jonas, can one of you try to address this issue please?

Thanks,
Miquèl
