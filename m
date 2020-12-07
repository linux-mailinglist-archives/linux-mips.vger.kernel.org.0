Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7C02D0E11
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 11:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgLGKd7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 05:33:59 -0500
Received: from elvis.franken.de ([193.175.24.41]:54211 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgLGKd6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Dec 2020 05:33:58 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kmDpT-00058D-00; Mon, 07 Dec 2020 11:33:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A2790C02EA; Mon,  7 Dec 2020 11:32:21 +0100 (CET)
Date:   Mon, 7 Dec 2020 11:32:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Rob Herring <robh+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        James Hartley <james.hartley@sondrel.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>
Subject: Re: [PATCH v8 5/5] MIPS: DTS: img: Fix schema warnings for pwm-leds
Message-ID: <20201207103221.GA15686@alpha.franken.de>
References: <20201128215353.3991-1-post@lespocky.de>
 <20201128215353.3991-6-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128215353.3991-6-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Nov 28, 2020 at 10:53:53PM +0100, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v7 -> v8:
>       * rebased on v5.10-rc1
>     
>     v6 -> v7:
>       * added another explaining sentence to commit message
>     
>     v6:
>       * added this patch to series
> 
>  arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
