Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792692D9D19
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 18:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391382AbgLNQ7o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 11:59:44 -0500
Received: from elvis.franken.de ([193.175.24.41]:40398 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440315AbgLNQ73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 11:59:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1korBJ-0006zU-03; Mon, 14 Dec 2020 17:58:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A60AFC0386; Mon, 14 Dec 2020 16:36:46 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:36:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/2] MAINTAINERS: Add linux-mips mailing list
 to JZ47xx entries
Message-ID: <20201214153646.GD9983@alpha.franken.de>
References: <20201029154414.25852-1-krzk@kernel.org>
 <20201029154414.25852-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029154414.25852-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 29, 2020 at 04:44:14PM +0100, Krzysztof Kozlowski wrote:
> The entries for JZ47xx SoCs and its drivers lacked MIPS mailing list.
> Only MTD NAND driver pointed linux-mtd.  Add linux-mips so the relevant
> patches will get attention of MIPS developers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> 
> Changes since v1:
> 1. Do not update DMA driver entry
> 2. Add ack
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
