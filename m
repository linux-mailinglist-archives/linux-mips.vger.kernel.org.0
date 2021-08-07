Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54F13E3465
	for <lists+linux-mips@lfdr.de>; Sat,  7 Aug 2021 11:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhHGJoM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Aug 2021 05:44:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:50725 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231687AbhHGJoM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 7 Aug 2021 05:44:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mCIru-0007FW-00; Sat, 07 Aug 2021 11:43:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A6D05C0661; Sat,  7 Aug 2021 11:28:19 +0200 (CEST)
Date:   Sat, 7 Aug 2021 11:28:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/9] MIPS: Migrate pistachio to generic kernel
Message-ID: <20210807092819.GA4506@alpha.franken.de>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
 <1bb80cdf-f7d5-f99f-a4f3-635552df916b@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bb80cdf-f7d5-f99f-a4f3-635552df916b@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 07, 2021 at 11:06:12AM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2021/7/23 上午10:25, Jiaxun Yang 写道:
> > I'm lucky enough to get a Creator CI40 board from dusts.
> > This patchset move it to gerneic kernel to reduce maintenance burden.
> > It have been tested with SD Card boot.
> 
> Hi Thomas,
> 
> For the series, the pinctrl one have been applied by subsystem maintainer
> and
> rests have been acked by subsystem maintainers, could you please apply them
> to MIPS tree?

sure that's my plan.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
