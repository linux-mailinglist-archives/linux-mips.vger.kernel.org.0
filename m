Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35D429DFB9
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 02:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731928AbgJ2BET (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 21:04:19 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34680 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbgJ1WGl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 18:06:41 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id E59163A1EA6;
        Wed, 28 Oct 2020 19:21:51 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7BCB2200002;
        Wed, 28 Oct 2020 19:21:28 +0000 (UTC)
Date:   Wed, 28 Oct 2020 20:21:28 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v7 00/12] leds: pwm: Make automatic labels work
Message-ID: <20201028192128.GF12276@piout.net>
References: <20201005203451.9985-1-post@lespocky.de>
 <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28/10/2020 19:56:14+0100, Alexandre Belloni wrote:
> On Mon, 5 Oct 2020 22:34:39 +0200, Alexander Dahl wrote:
> > Hei hei,
> > 
> > for leds-gpio you can use the properties 'function' and 'color' in the
> > devicetree node and omit 'label', the label is constructed
> > automatically.  This is a common feature supposed to be working for all
> > LED drivers.  However it did not work until recently for the 'leds-pwm'
> > driver.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] ARM: dts: at91: smartkiz: Reference led node directly
>       commit: 02e46262af5db410da5a27783833d68e2bdfb352
> [2/2] ARM: dts: at91: Fix schema warnings for pwm-leds
>       commit: 997ebd64df39f3916c37ca67a6eff58e79a13c73

This was obviously 04/12 and 05/12.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
