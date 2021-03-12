Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537513390A2
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 16:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhCLPDc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 10:03:32 -0500
Received: from elvis.franken.de ([193.175.24.41]:53068 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232130AbhCLPCt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 10:02:49 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lKjJN-0002Tu-02; Fri, 12 Mar 2021 16:02:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 00F5DC2118; Fri, 12 Mar 2021 16:00:48 +0100 (CET)
Date:   Fri, 12 Mar 2021 16:00:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: panel/kingdisplay,kd035g6-54nt: Remove
 spi-cs-high
Message-ID: <20210312150048.GC3743@alpha.franken.de>
References: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307192830.208245-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 07:28:29PM +0000, Paul Cercueil wrote:
> The NT39016 panel is a fun beast, even though the documentation states
> that the CS line is active-low, it will work just fine if the CS line is
> configured as active-high, but it won't work if the CS line is forced
> low or forced high.
> 
> Since it did actually work with the spi-cs-high property, this is not a
> bugfix, but we should nonetheless remove that property from the example
> to match the documentation.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml         | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
