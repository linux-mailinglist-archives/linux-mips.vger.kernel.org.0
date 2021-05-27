Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E24392CF8
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 13:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhE0LqO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 07:46:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:51717 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234072AbhE0LqL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:46:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmERG-0007z5-04; Thu, 27 May 2021 13:44:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0D22C1149; Thu, 27 May 2021 13:43:34 +0200 (CEST)
Date:   Thu, 27 May 2021 13:43:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 2/3] MIPS: ath79: ar9331: Add OpeneEmbed SOM9331 Board
Message-ID: <20210527114334.GE9210@alpha.franken.de>
References: <20210514051743.15248-1-o.rempel@pengutronix.de>
 <20210514051743.15248-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514051743.15248-2-o.rempel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 14, 2021 at 07:17:42AM +0200, Oleksij Rempel wrote:
> Add SOM9331 based Board. It has 3 LAN ports, usb to uart controller and
> USB type A port.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/mips/boot/dts/qca/Makefile               |   1 +
>  .../qca/ar9331_openembed_som9331_board.dts    | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
