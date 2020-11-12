Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924EC2B122C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 23:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgKLWuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 17:50:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:57122 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbgKLWuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 17:50:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kdLQ2-0005gc-00; Thu, 12 Nov 2020 23:50:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A2334C4DE0; Thu, 12 Nov 2020 23:38:05 +0100 (CET)
Date:   Thu, 12 Nov 2020 23:38:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 0/9] MIPS: Add support for more mscc SoCs: Luton,
 Serval and Jaguar2
Message-ID: <20201112223805.GA19695@alpha.franken.de>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-1-gregory.clement@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 10, 2020 at 12:44:59PM +0100, Gregory CLEMENT wrote:
> Hello,
> 
> Ocelot SoC belongs to a larger family of SoCs called VCoreIII. Luton,
> Serval and Jaguar2 are part of this family and are added with this
> series.
> 
> This the second version with a few changes in device tree.
> 
> To be able to run a linux kernel the irqchip support and the pinctrl
> support are needed. Two series of patches adding this support has been
> posted to their subsystem. However there is no build dependency
> between them.
> 
> Changelog:
> v1 -> v2
>  - Moved the changes in binding documentation from patch 8 to 2
>  - Fixed i2c devices node name in jaguar2 device tree files
>  - Added Acked-by from Rob Herring
>  - Fixes few more devices tree nodes, now there is no more warning when
>    running "make W=1 dtbs"
> 
> Gregory
> 
> Gregory CLEMENT (9):
>   dt-bindings: mips: Add Luton
>   dt-bindings: mips: Add Serval and Jaguar2
>   MIPS: mscc: Prepare configuration to handle more SoCs
>   MIPS: mscc: Fix configuration name for ocelot legacy boards
>   MIPS: mscc: Add luton dtsi
>   MIPS: mscc: Add luton PC0B91 device tree
>   MIPS: mscc: build FIT image for Luton
>   MIPS: mscc: Add jaguar2 support
>   MIPS: mscc: Add serval support
> 
>  .../devicetree/bindings/mips/mscc.txt         |   2 +-
>  arch/mips/boot/dts/Makefile                   |   2 +-
>  arch/mips/boot/dts/mscc/Makefile              |  11 +-
>  arch/mips/boot/dts/mscc/jaguar2.dtsi          | 167 +++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_common.dtsi   |  25 ++
>  arch/mips/boot/dts/mscc/jaguar2_pcb110.dts    | 267 ++++++++++++++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb111.dts    | 107 +++++++
>  arch/mips/boot/dts/mscc/jaguar2_pcb118.dts    |  57 ++++
>  arch/mips/boot/dts/mscc/luton.dtsi            | 116 ++++++++
>  arch/mips/boot/dts/mscc/luton_pcb091.dts      |  30 ++
>  arch/mips/boot/dts/mscc/serval.dtsi           | 153 ++++++++++
>  arch/mips/boot/dts/mscc/serval_common.dtsi    | 127 +++++++++
>  arch/mips/boot/dts/mscc/serval_pcb105.dts     |  17 ++
>  arch/mips/boot/dts/mscc/serval_pcb106.dts     |  17 ++
>  arch/mips/generic/Kconfig                     |  37 ++-
>  arch/mips/generic/Platform                    |   3 +
>  arch/mips/generic/board-jaguar2.its.S         |  40 +++
>  arch/mips/generic/board-luton.its.S           |  23 ++
>  arch/mips/generic/board-serval.its.S          |  24 ++
>  19 files changed, 1218 insertions(+), 7 deletions(-)
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_common.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
>  create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
>  create mode 100644 arch/mips/boot/dts/mscc/luton.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/luton_pcb091.dts
>  create mode 100644 arch/mips/boot/dts/mscc/serval.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/serval_common.dtsi
>  create mode 100644 arch/mips/boot/dts/mscc/serval_pcb105.dts
>  create mode 100644 arch/mips/boot/dts/mscc/serval_pcb106.dts
>  create mode 100644 arch/mips/generic/board-jaguar2.its.S
>  create mode 100644 arch/mips/generic/board-luton.its.S
>  create mode 100644 arch/mips/generic/board-serval.its.S

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
