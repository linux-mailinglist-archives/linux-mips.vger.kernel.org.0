Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387FB2B1229
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 23:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgKLWuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 17:50:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:57131 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbgKLWuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 17:50:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kdLQ2-0005gc-02; Thu, 12 Nov 2020 23:50:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9DFAEC4DE1; Thu, 12 Nov 2020 23:41:05 +0100 (CET)
Date:   Thu, 12 Nov 2020 23:41:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Serge Semin <fancer.lancer@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes
 name
Message-ID: <20201112224105.GC19695@alpha.franken.de>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
 <20201111091552.15593-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111091552.15593-8-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 11, 2020 at 12:15:41PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
