Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EE3280FF2
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 11:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgJBJeG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 05:34:06 -0400
Received: from mail.thorsis.com ([92.198.35.195]:36622 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBJeG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 05:34:06 -0400
X-Greylist: delayed 378 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Oct 2020 05:34:05 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 91F613B69;
        Fri,  2 Oct 2020 11:27:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vwTROurmSmhf; Fri,  2 Oct 2020 11:27:46 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 59E2F4125; Fri,  2 Oct 2020 11:27:45 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 5/7] ARM: dts: Fix schema warnings for pwm-leds
Date:   Fri, 02 Oct 2020 11:27:32 +0200
Message-ID: <4533120.poq1GmoeVQ@ada>
In-Reply-To: <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de> <20200930234637.7573-6-post@lespocky.de> <CAJKOXPfBKnESpRkSDZp5CB3T-t95DXg2dNKQnNNXv6Q_ywck2w@mail.gmail.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:12:50 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:53, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> > 
> > Notes:
> >     v6:
> >       * added this patch to series
> >  
> >  arch/arm/boot/dts/at91-kizbox.dts             | 10 +++----
> >  arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +++---
> >  arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++------
> >  arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++----
> >  arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +++---
> >  arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++----
> >  arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++----
> >  .../boot/dts/berlin2cd-google-chromecast.dts  |  6 ++---
> >  arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +--
> >  arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +--
> 
> Somehow you did not CC the maintainers... please use
> scripts/get_maintainers.pl to obtain list of addresses.

Well, that will be a huge list of Cc then.  What is the policy?  Everybody 
gets the whole series or different list of receivers per patch?

> All these should be separate patches per sub-architecture.

I already suspected that.  Will do in v7.

Thanks for your feedback.
Alex



