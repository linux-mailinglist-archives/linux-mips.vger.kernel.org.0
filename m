Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513972ED45C
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbhAGQaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:30:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:34742 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726468AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-05; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 825D2C080E; Thu,  7 Jan 2021 17:28:03 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:28:03 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: zboot: Avoid endless loop in clear BSS.
Message-ID: <20210107162803.GF11882@alpha.franken.de>
References: <1609894059-6112-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609894059-6112-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 06, 2021 at 08:47:39AM +0800, Jinyang He wrote:
> Commit 2ee1503e546f ("MIPS: zboot: head.S clean up").
> 
> After .noreorder removed, clear BSS fall into endless loop. The bne
> instruction will add nop to the delay slot at compile time. So a0
> register will not increment by 4. Fix it and clear BSS from _edata
> to (_end - 1).
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/boot/compressed/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
