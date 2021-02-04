Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9962D30FEFD
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 22:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhBDVBO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 16:01:14 -0500
Received: from elvis.franken.de ([193.175.24.41]:52892 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBDVBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 16:01:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7ljq-0002rO-00; Thu, 04 Feb 2021 22:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9AC80C0D5E; Thu,  4 Feb 2021 21:57:33 +0100 (CET)
Date:   Thu, 4 Feb 2021 21:57:33 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>,
        Birger Koblitz <mail@birger-koblitz.de>
Subject: Re: [PATCH v4 0/5] Add support for Realtek RTL838x/RTL839x switch
 SoCs
Message-ID: <20210204205733.GA19460@alpha.franken.de>
References: <20210119092109.185282-1-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119092109.185282-1-bert@biot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 19, 2021 at 10:21:04AM +0100, Bert Vermeulen wrote:
> v4:
> - Device tree bindings for SoC in separate patch.
> - Removed ioremap.h, and declare physical address bases in device tree.
> 
> v3:
> - all code removed, the base system is now only device tree files and docs
>    and some build config.
> - ioremap.h restored to the v1 version, with hardcoded I/O ranges, since I
>    got flak on changing that as suggested. This brings it in line with other
>    systems in arch/mips/generic.
> 
> v2:
> - Removed all new arch/mips/ code, using arch/mips/generic/ instead.
> - Use device tree ranges instead of hardcoded addresses for ioremap.
> - Moved IRQ driver to drivers/irqchip/
> - Removed reset handling code, will be replaced by device tree config.
> - All SoC family id code moved to new soc driver.
> - Header moved to realtek/ instead of mach-realtek/
> - As more of the base system now depends on device tree, a sample
>   dts for the Cisco SG220-26 switch is included. This will be further
>   filled out, and bindings documented, as drivers get merged.
> 
> Bert Vermeulen (5):
>   dt-bindings: mips: Add support for RTL83xx SoC series
>   Add support for Realtek RTL838x/RTL839x switch SoCs
>   MIPS: Add Realtek RTL838x/RTL839x support as generic MIPS system
>   dt-bindings: Add Cisco prefix to vendor list
>   mips: dts: Add support for Cisco SG220-26 switch
> 
>  .../devicetree/bindings/mips/realtek-rtl.yaml | 24 ++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  arch/mips/Kconfig                             | 31 ++++++++++
>  arch/mips/boot/dts/Makefile                   |  1 +
>  arch/mips/boot/dts/realtek/Makefile           |  2 +
>  arch/mips/boot/dts/realtek/cisco_sg220-26.dts | 25 ++++++++
>  arch/mips/boot/dts/realtek/rtl838x.dtsi       | 21 +++++++
>  arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 59 +++++++++++++++++++
>  8 files changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/realtek-rtl.yaml
>  create mode 100644 arch/mips/boot/dts/realtek/Makefile
>  create mode 100644 arch/mips/boot/dts/realtek/cisco_sg220-26.dts
>  create mode 100644 arch/mips/boot/dts/realtek/rtl838x.dtsi
>  create mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
