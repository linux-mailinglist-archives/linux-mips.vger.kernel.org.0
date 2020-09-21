Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0487273471
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 22:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbgIUU7m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 16:59:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:49822 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgIUU7l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-07; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 585DFC0FE4; Mon, 21 Sep 2020 22:30:12 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:30:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1300
Message-ID: <20200921203012.GG29322@alpha.franken.de>
References: <20200920210348.114999-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920210348.114999-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 11:03:46PM +0200, Thomas Bogendoerfer wrote:
> Remove unused config option ALCHEMY_GPIOINT_AU1300 and related code.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/alchemy/Kconfig                       |   4 -
>  arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 137 ------------------------
>  2 files changed, 141 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
