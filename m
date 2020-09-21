Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75971273487
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgIUVAM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 17:00:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:49821 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgIUU7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-06; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4CB79C0FE4; Mon, 21 Sep 2020 22:29:53 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:29:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP30: Move irq bits to better header files
Message-ID: <20200921202953.GF29322@alpha.franken.de>
References: <20200920205151.112113-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920205151.112113-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 10:51:50PM +0200, Thomas Bogendoerfer wrote:
> Move HEART specific parts of mach-ip30/irq.h to asm/sgi/heart.h and IP30
> specific parts to sgi-ip30/ip30-common.h.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-ip30/irq.h | 87 -----------------------------------
>  arch/mips/include/asm/sgi/heart.h     | 51 ++++++++++++++++++++
>  arch/mips/sgi-ip30/ip30-common.h      | 14 ++++++
>  arch/mips/sgi-ip30/ip30-irq.c         |  2 +
>  4 files changed, 67 insertions(+), 87 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-ip30/irq.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
