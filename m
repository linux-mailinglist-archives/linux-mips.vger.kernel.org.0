Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE101D292D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 09:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgENH5K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 03:57:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:53041 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgENH5K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 03:57:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZ8js-0005U5-00; Thu, 14 May 2020 09:57:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B31E7C0482; Thu, 14 May 2020 09:41:22 +0200 (CEST)
Date:   Thu, 14 May 2020 09:41:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] MIPS: dts: mscc: Updated changed name for miim pinctrl
 function
Message-ID: <20200514074122.GA5880@alpha.franken.de>
References: <20200513132347.24975-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513132347.24975-1-lars.povlsen@microchip.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 03:23:47PM +0200, Lars Povlsen wrote:
> This is an add-on patch to the main SoC Sparx5 series
> (Message-ID: <20200513125532.24585-1-lars.povlsen@microchip.com>).
> 
> This changes the miim pinctrl function name from "miim1" to "miim" due
> to refactoring in the driver, obsoleting the instance number.
> 
> The change in the driver was to better fit new platforms, as the
> instance number is redundant information. Specifically, support for
> the Microchip Sparx5 SoC is being submitted, where this change became
> necessary.
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
