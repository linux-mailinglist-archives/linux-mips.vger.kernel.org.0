Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F6C273535
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgIUVxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 17:53:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:49925 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgIUVxM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 17:53:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-0A; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 97D04C0FE4; Mon, 21 Sep 2020 22:31:04 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:31:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: malta: remove mach-malta/malta-dtshim.h header file
Message-ID: <20200921203104.GJ29322@alpha.franken.de>
References: <20200920211343.117262-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920211343.117262-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 11:13:42PM +0200, Thomas Bogendoerfer wrote:
> To clean up mach-* directories move external declaration of malta_dt_shim()
> to mips-boards/malta.h and remove malta-dtshim.h.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-malta/malta-dtshim.h | 25 -------------------------
>  arch/mips/include/asm/mips-boards/malta.h       |  2 ++
>  arch/mips/mti-malta/malta-setup.c               |  1 -
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
