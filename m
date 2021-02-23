Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A80322AE6
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 13:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhBWM5x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 07:57:53 -0500
Received: from elvis.franken.de ([193.175.24.41]:49448 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232604AbhBWM5v (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Feb 2021 07:57:51 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lEXFU-0002LK-02; Tue, 23 Feb 2021 13:57:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 81F95C07B1; Tue, 23 Feb 2021 13:27:27 +0100 (CET)
Date:   Tue, 23 Feb 2021 13:27:27 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: bmips: init clocks earlier
Message-ID: <20210223122727.GC7765@alpha.franken.de>
References: <20210222203350.4249-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210222203350.4249-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 22, 2021 at 09:33:50PM +0100, Álvaro Fernández Rojas wrote:
> device_initcall() is too late for bcm63xx.
> We need to call of_clk_init() earlier in order to properly boot.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  arch/mips/bmips/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
