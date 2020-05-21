Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583F81DC773
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 09:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgEUHS1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 03:18:27 -0400
Received: from elvis.franken.de ([193.175.24.41]:32942 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727900AbgEUHSX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 03:18:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jbfTB-0001b7-00; Thu, 21 May 2020 09:18:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 72FA7C0155; Thu, 21 May 2020 09:17:37 +0200 (CEST)
Date:   Thu, 21 May 2020 09:17:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: SGI-IP27: Remove not used definition TICK_SIZE in
 ip27-timer.c
Message-ID: <20200521071737.GD7309@alpha.franken.de>
References: <1589958482-9948-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589958482-9948-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 20, 2020 at 03:08:02PM +0800, Tiezhu Yang wrote:
> After commit f5ff0a280201 ("[MIPS] Use generic NTP code for all MIPS
> platforms"), TICK_SIZE is not used in ip27-timer.c for many years,
> remove it.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> Hi Thomas,
> 
> I find this not used definition TICK_SIZE just now, maybe I should send
> these cleanup patches in a patch series, sorry for that if it is noisy.

no problem:-)

>  arch/mips/sgi-ip27/ip27-timer.c | 2 --
>  1 file changed, 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
