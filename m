Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE303F39D9
	for <lists+linux-mips@lfdr.de>; Sat, 21 Aug 2021 11:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhHUJ0A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 05:26:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:41931 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233301AbhHUJZ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Aug 2021 05:25:59 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mHNFe-0005Uw-02; Sat, 21 Aug 2021 11:25:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7884EC086C; Sat, 21 Aug 2021 10:41:51 +0200 (CEST)
Date:   Sat, 21 Aug 2021 10:41:51 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, UNGLinuxDriver@microchip.com,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH devicetree 1/2] MIPS: mscc: ocelot: disable all switch
 ports by default
Message-ID: <20210821084151.GC3555@alpha.franken.de>
References: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819170416.2252210-1-vladimir.oltean@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 19, 2021 at 08:04:15PM +0300, Vladimir Oltean wrote:
> The ocelot switch driver used to ignore ports which do not have a
> phy-handle property and not probe those, but this is not quite ok since
> it is valid to not have a phy-handle property if there is a fixed-link.
> 
> It seems that checking for a phy-handle was a proxy for the proper check
> which is for the status, but that doesn't make a lot of sense, since the
> ocelot driver already iterates using for_each_available_child_of_node
> which skips the disabled ports, so I have no idea.
> 
> Anyway, a widespread pattern in device trees is for a SoC dtsi to
> disable by default all hardware, and let board dts files enable what is
> used. So let's do that and enable only the ports with a phy-handle in
> the pcb120 and pcb123 device tree files.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi       | 11 +++++++++++
>  arch/mips/boot/dts/mscc/ocelot_pcb120.dts |  8 ++++++++
>  arch/mips/boot/dts/mscc/ocelot_pcb123.dts |  4 ++++
>  3 files changed, 23 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
