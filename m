Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293C61C7D75
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 00:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgEFWgm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 18:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbgEFWgm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 18:36:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BCEC061A0F;
        Wed,  6 May 2020 15:36:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so4150727ljg.12;
        Wed, 06 May 2020 15:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B+lR9RibOagVSsl39LZ9OK8akQe4JLP7xJR19GpLf1o=;
        b=Tsm34CKsvSLpR0vTdnP3NXEIfocWbivLXWk8w+tAJE4vffmJ6ALKGmPAv3YVr6sNTJ
         PZhbhmMAaEJIGzYHbhPiJhHEcc3P37y+LVjHDK11d/zgxezjvH1QIiHmKvMoSMWkso+F
         p9iRxQbECLqV26uxb4vt/iaRUo0fe68iCd2eQJXK51S3tYRbCQQUDyELDVHtlMplWRNW
         irFmAnBBMMqbfnHmGW3cJyIwJGM1Pxx4RSYQMyd9fYnCp+iUIqYBaZwM9HpTy2VzOZIz
         eDFakF5MmrzMKhoY8RzaeIbBgiMHs/uPr8z5P2yWV6A8M/DD3+sBc68tVFny5VTRfxSO
         q+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B+lR9RibOagVSsl39LZ9OK8akQe4JLP7xJR19GpLf1o=;
        b=jdV95793K56F2VxemgqF4SBIs0eE6YIQHOSwaDBlYNtM2rGGF3dQw7ZZJLKRxHVm1K
         zH+4+qS3TDeXdsW2G6+v8f3ElXAvMkE6dwFHT6grG0M4u6jCvIUsnqjEZ++NvuO+hwma
         3K9xMmIa6RxBbpOi8/aLCw7S6cKNbtVqkaZA6snSuk7N6S+fw4Oh59SNwTT5DQG40bxg
         QAhPg9VrbkJNUH8eC/a5IuEnYgF6JlmOcewbN++xY3y4ImI/UuKW8X6Xeezq8T6mHDX2
         BKhq651gY5VRkrBuvSeVyrY+tPDucARZWH08A/EOxknBJicoY2jJqtmQBdC76pORY9nz
         u00w==
X-Gm-Message-State: AGi0PubTqOBRW2uVSFCrKnlOECXMUUWltAIPW1ElaedLROplcSrij9AZ
        q/UMVvhW62Z+dptQJ/kzFow=
X-Google-Smtp-Source: APiQypIn3b6fKkJd20UjwwrJFveGF8cjFc17xH6wdHxzh2I3WM+a3Zo4qxNiMUlQ/0tz6anyOynLdA==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr6438685lji.161.1588804600577;
        Wed, 06 May 2020 15:36:40 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id j19sm404666lfh.19.2020.05.06.15.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:36:39 -0700 (PDT)
Date:   Thu, 7 May 2020 01:36:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Xie <tony.xie@rock-chips.com>, Wen He <wen.he_1@nxp.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: Add Baikal-T1 CCU PLLs driver
Message-ID: <20200506223636.pgegmxc2z4uqbnbg@mobilestation>
References: <20200306130053.BCBFC803078F@mail.baikalelectronics.ru>
 <20200506222300.30895-1-Sergey.Semin@baikalelectronics.ru>
 <20200506222300.30895-4-Sergey.Semin@baikalelectronics.ru>
 <9259445e-86a8-8e4a-58c9-822bd00d62f8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9259445e-86a8-8e4a-58c9-822bd00d62f8@infradead.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

On Wed, May 06, 2020 at 03:27:57PM -0700, Randy Dunlap wrote:
> Hi,
> 
> Typo(s):
> 
> On 5/6/20 3:22 PM, Serge Semin wrote:
> > diff --git a/drivers/clk/baikal-t1/Kconfig b/drivers/clk/baikal-t1/Kconfig
> > new file mode 100644
> > index 000000000000..e1257af9f49e
> > --- /dev/null
> > +++ b/drivers/clk/baikal-t1/Kconfig
> > @@ -0,0 +1,30 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config CLK_BAIKAL_T1
> > +	bool "Baikal-T1 Clocks Control Unit interface"
> > +	depends on (MIPS_BAIKAL_T1 && OF) || COMPILE_TEST
> > +	default MIPS_BAIKAL_T1
> > +	help
> > +	  Clocks Control Unit is the core of Baikal-T1 SoC System Controller
> > +	  responsible for the chip subsystems clocking and resetting. It
> > +	  consists of multiple global clock domains, which can be reset by
> > +	  means of the CCU control registers. These domains and devices placed
> > +	  in them are fed with clocks generated by a hierarchy of PLLs,
> > +	  configurable and fixed clock dividers. Enable this option to be able
> > +	  to select Baikal-T1 CCU PLLs and Dividers drivers.
> > +
> > +if CLK_BAIKAL_T1
> > +
> > +config CLK_BT1_CCU_PLL
> > +	bool "Baikal-T1 CCU PLLs support"
> > +	select MFD_SYSCON
> > +	default MIPS_BAIKAL_T1
> > +	help
> > +	  Enable this to support the PLLs embedded into the Baikal-T1 SoC
> > +	  System Controller. These are five PLLs placed at the root of the
> > +	  clocks hierarchy, right after an external reference osciallator
> 
> 	                                                      oscillator

Fixed. Thanks.

> 
> > +	  (normally of 25MHz). They are used to generate high frequency
> > +	  signals, which are either directly wired to the consumers (like
> > +	  CPUs, DDR, etc) or passed over the clock dividers to be only then
> 
> and while you are here:
> 
>                      etc.)

Thanks again.

-Sergey

> 
> > +	  used as an individual reference clock of a target device.
> > +
> > +endif
> 
> thanks.
> -- 
> ~Randy
> 
