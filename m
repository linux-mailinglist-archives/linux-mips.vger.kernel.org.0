Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900441ACDE2
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgDPQlc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:41:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:42196 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgDPQlc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:41:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Zy-0001kl-00; Thu, 16 Apr 2020 18:41:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5CB44C0135; Thu, 16 Apr 2020 18:34:16 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:34:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     bibo mao <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix typo for user_ld macro definition
Message-ID: <20200416163416.GA24743@alpha.franken.de>
References: <1586944603-5107-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586944603-5107-1-git-send-email-maobibo@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 05:56:43PM +0800, bibo mao wrote:
> There is typo for macro user_ld if __ASSEMBLY__ is declared, this
> patch fixes this issue.
> 
> Signed-off-by: bibo mao <maobibo@loongson.cn>
> ---
>  arch/mips/include/asm/asm-eva.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
