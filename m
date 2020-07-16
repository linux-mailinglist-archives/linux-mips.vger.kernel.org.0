Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4212C222021
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgGPKB6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:01:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:38165 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgGPKB6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-00; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0F33CC080E; Thu, 16 Jul 2020 11:52:14 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:52:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Guoyun Sun <sunguoyun@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH] MIPS: fix vdso different address spaces
Message-ID: <20200716095213.GD8455@alpha.franken.de>
References: <1594706867-4426-1-git-send-email-sunguoyun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594706867-4426-1-git-send-email-sunguoyun@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 02:07:47PM +0800, Guoyun Sun wrote:
> From: Sunguoyun <sunguoyun@loongson.cn>
> 
> sparse report build warning as follows:
> arch/mips/vdso/vdso-n32-image.c:13:35:
> incorrect type in assignment (different address spaces) @@
> expected void *[usertype] vdso @@     got void [noderef] <asn:1> * @@
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Sunguoyun <sunguoyun@loongson.cn>
> ---
>  arch/mips/vdso/genvdso.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
