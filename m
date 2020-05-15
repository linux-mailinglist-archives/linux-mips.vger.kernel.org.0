Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1858F1D48A2
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgEOIiM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:38:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:54118 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbgEOIiM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:38:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZVr7-0007jn-00; Fri, 15 May 2020 10:38:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 324E6C04A1; Fri, 15 May 2020 10:10:46 +0200 (CEST)
Date:   Fri, 15 May 2020 10:10:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] MIPS: ath79: ar9331_dpt_module: update led nodes
Message-ID: <20200515081046.GA8653@alpha.franken.de>
References: <20200510060324.25134-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510060324.25134-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 10, 2020 at 08:03:23AM +0200, Oleksij Rempel wrote:
> Fit led nodes to the latest naming schema.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/mips/boot/dts/qca/ar9331_dpt_module.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

both patches applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
