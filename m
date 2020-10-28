Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E7E29D43F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Oct 2020 22:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgJ1Vua (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 17:50:30 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:36222 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgJ1Vu3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 17:50:29 -0400
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BE50E3A7812;
        Wed, 28 Oct 2020 18:57:03 +0000 (UTC)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5D5E81C0003;
        Wed, 28 Oct 2020 18:56:37 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v7 00/12] leds: pwm: Make automatic labels work
Date:   Wed, 28 Oct 2020 19:56:14 +0100
Message-Id: <160391135997.385141.5554228268638639718.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 5 Oct 2020 22:34:39 +0200, Alexander Dahl wrote:
> Hei hei,
> 
> for leds-gpio you can use the properties 'function' and 'color' in the
> devicetree node and omit 'label', the label is constructed
> automatically.  This is a common feature supposed to be working for all
> LED drivers.  However it did not work until recently for the 'leds-pwm'
> driver.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: at91: smartkiz: Reference led node directly
      commit: 02e46262af5db410da5a27783833d68e2bdfb352
[2/2] ARM: dts: at91: Fix schema warnings for pwm-leds
      commit: 997ebd64df39f3916c37ca67a6eff58e79a13c73

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
