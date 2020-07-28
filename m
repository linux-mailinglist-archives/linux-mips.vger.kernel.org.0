Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AE2230593
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 10:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgG1IjA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 04:39:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:51655 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727996AbgG1Ii7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 04:38:59 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k0L8B-0000DV-00; Tue, 28 Jul 2020 10:38:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2D519C0A4B; Tue, 28 Jul 2020 10:30:00 +0200 (CEST)
Date:   Tue, 28 Jul 2020 10:30:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: ath79: Remove unused include
 <asm/mips_machine.h>
Message-ID: <20200728083000.GA9062@alpha.franken.de>
References: <20200726165828.55175-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726165828.55175-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 26, 2020 at 06:58:27PM +0200, Paul Cercueil wrote:
> Since commit 3a77e0d75eed ("MIPS: ath79: drop machfiles"), this header
> is not used anymore.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/ath79/setup.c | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
