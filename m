Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7AF1E4034
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 13:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbgE0LiX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 07:38:23 -0400
Received: from elvis.franken.de ([193.175.24.41]:41043 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbgE0LiX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 07:38:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jduO3-00011U-05; Wed, 27 May 2020 13:38:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6BEEBC0594; Wed, 27 May 2020 13:36:14 +0200 (CEST)
Date:   Wed, 27 May 2020 13:36:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: ingenic: DTS: Add memory info of GCW Zero
Message-ID: <20200527113614.GF13537@alpha.franken.de>
References: <20200525174155.457491-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525174155.457491-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 25, 2020 at 07:41:53PM +0200, Paul Cercueil wrote:
> Add memory info of the GCW Zero in its devicetree. The bootloader
> generally provides this information, but since it is fixed to 512 MiB,
> it doesn't hurt to have it in devicetree. It allows the kernel to boot
> without any parameter passed as argument.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/gcw0.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

applied patch 1-3 to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
