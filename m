Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FE5277359
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgIXN7f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 09:59:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:55130 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728161AbgIXN7W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 09:59:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLRmK-0005vQ-00; Thu, 24 Sep 2020 15:59:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8B7EBC1014; Thu, 24 Sep 2020 15:51:46 +0200 (CEST)
Date:   Thu, 24 Sep 2020 15:51:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, stable@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson2ef: Disable Loongson MMI instructions
Message-ID: <20200924135146.GA13973@alpha.franken.de>
References: <20200923103312.55507-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923103312.55507-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 23, 2020 at 06:33:12PM +0800, Jiaxun Yang wrote:
> It was missed when I was forking Loongson2ef from Loongson64 but
> should be applied to Loongson2ef as march=loongson2f
> will also enable Loongson MMI in GCC-9+.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Fixes: 71e2f4dd5a65 ("MIPS: Fork loongson2ef from loongson64")
> Reported-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: stable@vger.kernel.org # v5.8+
> ---
>  arch/mips/loongson2ef/Platform | 4 ++++
>  1 file changed, 4 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
