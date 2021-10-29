Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934CF43FCEE
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 15:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhJ2NG0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 09:06:26 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:34406 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhJ2NGP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 09:06:15 -0400
Received: by mail-ot1-f47.google.com with SMTP id t17-20020a056830083100b00553ced10177so13289081ots.1;
        Fri, 29 Oct 2021 06:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GUgwMXhwSQTFzdsPOpVylcxzTUCtR44EYeKlhGLEh1U=;
        b=e9IQStTn6RDzTvcK39e2aIpAVGaa7JP5UQAhQZT/ka2ptkASM/583BpLK5ia/WH5oj
         kBp/uJVNYreA+BviTU43HYxBsfsUuix74j6wMdLoFF8qkec4h9tzOamZA4o7r07zKCOv
         ghA4QGhfRevYt1YLfMnXeQ3CnysV+6hMShPjGH8RsVTR7Sfl01wmo5VyFkSWoQ81BUBU
         iVC6yp5kLysJq0zChqGNqosvu1Y+B78cUEwsm5hNZyw26UgBxI5IO6CKhKtzNxDwiVqG
         H7M/BtrCQo88qqWvBALEgpUa6ufljJEPYbFvQreJ8fNra0RKTw+t73nTMQzmQSIlRUg/
         U1AQ==
X-Gm-Message-State: AOAM532Id+7TukJxfzFebjMkTz0sj9PTaV6BKDonq1dRUysBpXQYyw4z
        eK5RWK2BstNNTay7vVuchPSRLkilLw==
X-Google-Smtp-Source: ABdhPJyIltRRP6sAabUPC3/q0WHhW9vBTKyllyRe/hBhVRmRd1KUvkdgCMdJyiyJnXk9pBKD+Sz75Q==
X-Received: by 2002:a9d:4a8d:: with SMTP id i13mr8485328otf.180.1635512626347;
        Fri, 29 Oct 2021 06:03:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 46sm1925284otf.49.2021.10.29.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 06:03:45 -0700 (PDT)
Received: (nullmailer pid 2062293 invoked by uid 1000);
        Fri, 29 Oct 2021 13:03:44 -0000
Date:   Fri, 29 Oct 2021 08:03:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
Message-ID: <YXvxMHmx2i56sXdI@robh.at.kernel.org>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
 <9d57d026-19f3-e92d-4c02-d7e8e2c2bc25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d57d026-19f3-e92d-4c02-d7e8e2c2bc25@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 29, 2021 at 01:39:02PM +0200, Rafał Miłecki wrote:
> [Rob: please kindly comment on this]
> 
> On 28.10.2021 18:29, Florian Fainelli wrote:
> > On 10/28/21 2:30 AM, Rafał Miłecki wrote:
> > > From: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > Hardware supported by this driver goes back to the old bcm63xx days. It
> > > was then reused in BCM7038 and later also in BCM4908.
> > > 
> > > Depending on SoC model registers layout differs a bit. This commit
> > > introduces support for per-chipset registers offsets & adds BCM4908
> > > layout.
> > > 
> > > Later on BCM63xx SoCs support should be added too (probably as platform
> > > devices due to missing DT). Eventually this driver should replace
> > > bcm63xx_wdt.c.
> > > 
> > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > ---
> > 
> > [snip]
> > 
> > > +
> > > +static const u16 bcm7038_wdt_regs_bcm4908[] = {
> > > +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
> > > +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
> > > +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
> > 
> > I don't understand what you are doing here and why you are not
> > offsetting the "reg" property appropriately when you create your
> > bcm4908-wdt Device Tree node such that the base starts at 0, and the
> > existing driver becomes usable as-is. This does not make any sense to me
> > when it is obviously the simplest way to make the driver "accept" the
> > resource being passed.
> 
> I believe that DT binding should cover the whole hardware block and
> describe it (here: use proper compatible to allow recognizing block
> variant).
> 
> That's because (as far as I understand) DT should be used to describe
> hardware as closely as possible. I think it shouldn't be adjusted to
> make mapping match Linux's driver implementation.
> 
> 
> So if:
> 1. Hardware block is mapped at 0xff800400
> 2. It has interesting registers at 0xff800428 and 0xff80042c
> 
> I think mapping should use:
> reg = <0xff800400 0x3c>;
> even if we don't use the first N registers.
> 
> That way, at some point, you can extend Linux (or whatever) driver to
> use extra registers without reworking the whole binding. That's why I
> think we need to map whole hardware block & handle different registers
> layouts in a driver.

Yes, that's the correct thing to do.

The question is whether you'd need sub nodes for the other functions. 
Folks tend to want to have sub nodes for convenience which isn't really 
needed and then requires a DT update ('cause they add nodes as adding 
drivers).

Based on the registers, you really don't need sub nodes here.

Rob
