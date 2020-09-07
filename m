Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EF8260C31
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 09:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgIHHhT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 03:37:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:59490 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728922AbgIHHhR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Sep 2020 03:37:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kFYBn-0003e2-00; Tue, 08 Sep 2020 09:37:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4F5C7C0F59; Mon,  7 Sep 2020 22:32:17 +0200 (CEST)
Date:   Mon, 7 Sep 2020 22:32:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: dts/ingenic: Cleanup qi_lb60.dts
Message-ID: <20200907203217.GA18497@alpha.franken.de>
References: <20200904123647.11678-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904123647.11678-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 04, 2020 at 02:36:47PM +0200, Paul Cercueil wrote:
> Cleanup a bit the Device Tree file:
> 
> 1. Respect the number of cells in GPIO descriptors and keyboard matrix;
> 2. Use 'ecc-engine' instead of deprecated 'ingenic,bch-controller'
>    property;
> 3. The NAND's rb-gpios is actually active high;
> 3. The FRE/FWE pins must be configured in the proper mode for the NAND
>    to work if it was not already done by the bootloader.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/qi_lb60.dts | 137 ++++++++++++-------------
>  1 file changed, 68 insertions(+), 69 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
