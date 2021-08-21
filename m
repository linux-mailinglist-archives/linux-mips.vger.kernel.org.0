Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C91F3F39DC
	for <lists+linux-mips@lfdr.de>; Sat, 21 Aug 2021 11:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbhHUJ0A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 05:26:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:41935 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233306AbhHUJZ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Aug 2021 05:25:59 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mHNFe-0005Uw-03; Sat, 21 Aug 2021 11:25:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D26F9C086C; Sat, 21 Aug 2021 10:42:05 +0200 (CEST)
Date:   Sat, 21 Aug 2021 10:42:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, UNGLinuxDriver@microchip.com,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH devicetree 2/2] MIPS: mscc: ocelot: mark the phy-mode for
 internal PHY ports
Message-ID: <20210821084205.GD3555@alpha.franken.de>
References: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
 <20210819170416.2252210-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819170416.2252210-2-vladimir.oltean@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 19, 2021 at 08:04:16PM +0300, Vladimir Oltean wrote:
> The ocelot driver was converted to phylink, and that expects a valid
> phy_interface_t. Without a phy-mode, of_get_phy_mode returns
> PHY_INTERFACE_MODE_NA, which is not ideal because phylink rejects that.
> 
> The ocelot driver was patched to treat PHY_INTERFACE_MODE_NA as
> PHY_INTERFACE_MODE_INTERNAL to work with the broken DT blobs, but we
> should fix the device trees and specify the phy-mode too.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot_pcb120.dts | 4 ++++
>  arch/mips/boot/dts/mscc/ocelot_pcb123.dts | 4 ++++
>  2 files changed, 8 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
