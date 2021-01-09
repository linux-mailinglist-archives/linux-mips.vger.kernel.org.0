Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806732F0371
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 21:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbhAIUbG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 15:31:06 -0500
Received: from elvis.franken.de ([193.175.24.41]:39071 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbhAIUbG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Jan 2021 15:31:06 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kyKsT-0000cD-00; Sat, 09 Jan 2021 21:30:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 63423C0884; Sat,  9 Jan 2021 18:59:35 +0100 (CET)
Date:   Sat, 9 Jan 2021 18:59:35 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jiri Kosina <trivial@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH trivial] MIPS: bitops: Fix reference to ffz location
Message-ID: <20210109175935.GA7156@alpha.franken.de>
References: <20210108105526.2028605-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108105526.2028605-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 08, 2021 at 11:55:26AM +0100, Geert Uytterhoeven wrote:
> Unlike most other architectures, MIPS defines ffz() below ffs().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/mips/include/asm/bitops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
