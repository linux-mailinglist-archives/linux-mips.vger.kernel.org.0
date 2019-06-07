Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4D639924
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 00:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbfFGWuj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 18:50:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:59794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbfFGWui (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Jun 2019 18:50:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02A5D20868;
        Fri,  7 Jun 2019 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559947838;
        bh=ApxVfHs8JnkHiww93//1LZR4TXbvN/4IO2MtYEzl9mo=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=xfujo2GLbkIM+KKtYFuiV81Iew3/QJfwEMbo2anGI8s4SiwI07Ah1j2/ciUOhTDOO
         q3goGaFH8UPTc3Ej7pzCV+vxygsPZnRYStoVowZC3Jxm6bRTeQ9ni5Ny2lOQ1txxv7
         PtMvH0dcM+c/REo3Y1kZ5cZB/lRKUS2wrJhduqGA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1559944794.11351.0@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net> <20190521145141.9813-6-paul@crapouillou.net> <20190607212819.A5FAE208C3@mail.kernel.org> <1559944794.11351.0@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        James Hogan <jhogan@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mathieu Malaterre <malat@debian.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v12 05/13] clk: ingenic: Add driver for the TCU clocks
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 15:50:37 -0700
Message-Id: <20190607225038.02A5D20868@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2019-06-07 14:59:54)
> Hi Stephen, thanks for the review.
> > Quoting Paul Cercueil (2019-05-21 07:51:33)
> >>  diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> >>  new file mode 100644
> >>  index 000000000000..7249225a6994
> >>  --- /dev/null
> >>  +++ b/drivers/clk/ingenic/tcu.c
> >>  @@ -0,0 +1,458 @@
> >>  +// SPDX-License-Identifier: GPL-2.0
> >>  +/*
> >>  + * JZ47xx SoCs TCU clocks driver
> >>  + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> >>  + */
> >>  +
> >>  +#include <linux/clk.h>
> >>  +#include <linux/clk-provider.h>
> >>  +#include <linux/clkdev.h>
> >>  +#include <linux/clockchips.h>
> >>  +#include <linux/mfd/ingenic-tcu.h>
> >>  +#include <linux/regmap.h>
> >>  +
> >>  +#include <dt-bindings/clock/ingenic,tcu.h>
> >>  +
> >>  +/* 8 channels max + watchdog + OST */
> >>  +#define TCU_CLK_COUNT  10
> >>  +
> >>  +#define TCU_ERR(...) pr_crit("ingenic-tcu-clk: " __VA_ARGS__)
> >=20
> > Why is it pr_crit instead of pr_err()?
>=20
> If the TCU timer clocks are not provided for any reason, the system
> will have no timer, and the kernel will hang very early in the init
> process. That's why I chose pr_crit().

HMm. So maybe it should be TCU_CRIT() then? Or just drop the wrapper
macro and define a pr_fmt for this file that has ingenic-tcu-clk: for
it?

>=20
> Most of the code here works without a struct device, it wouldn't be=20
> easy to
> get it to work with runtime PM.
>=20
> I can enable the "tcu" clock in the probe and just gate/ungate it in the
> suspend/resume callbacks, that would work just fine. We don't need=20
> anything
> fancy here.

OK. That sounds like a better approach to gate and ungate in
suspend/resume.

