Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E76285C86
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgJGKJB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:09:01 -0400
Received: from mail.thorsis.com ([92.198.35.195]:35513 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727996AbgJGKI6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Oct 2020 06:08:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 0C54D3579;
        Wed,  7 Oct 2020 12:08:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a5gx01CScUQn; Wed,  7 Oct 2020 12:08:54 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id D21B536BC; Wed,  7 Oct 2020 12:08:54 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Wed, 07 Oct 2020 12:08:46 +0200
Message-ID: <2640582.VKub60Wb7X@ada>
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de> <20201005203451.9985-4-post@lespocky.de> <20201007100359.GC12224@duo.ucw.cz>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hei Pavel,

Am Mittwoch, 7. Oktober 2020, 12:03:59 CEST schrieb Pavel Machek:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > 
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.exampl
> > e.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'> 
> >         From schema:
> >         /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/
> >         leds-pwm.yaml> 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> 
> Okay, so I need Rob's ack here, I guess... and rest of the series is
> not really for my tree.

I think so, too.

I saw you applied patch number 1, all the other patches are DT and from my 
side those can wait for the Acks required and maybe I change the indexes again 
and I'm fine resending all that after the 5.10 merge window.

Thanks for applying the non-DT patches for leds subsystem, the rest will be 
sorted out without hurry.

Greets
Alex



