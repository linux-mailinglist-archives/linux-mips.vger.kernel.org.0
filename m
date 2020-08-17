Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27AD246571
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgHQLb2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:31:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:49794 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728421AbgHQLbV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dMD-0003tH-01; Mon, 17 Aug 2020 13:31:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 25513C0D74; Mon, 17 Aug 2020 13:17:26 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:17:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-fixes] MIPS: Loongson64: Do not override watch and
 ejtag feature
Message-ID: <20200817111726.GB11725@alpha.franken.de>
References: <20200808123227.2873961-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200808123227.2873961-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 08, 2020 at 08:32:27PM +0800, Jiaxun Yang wrote:
> Do not override ejtag feature to 0 as Loongson 3A1000+ do have ejtag.
> For watch, as KVM emulated CPU doesn't have watch feature, we should
> not enable it unconditionally.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This patch should go into mips-fixes tree as watch feature is blocking
> KVM guest boot in some cases.
> ---
>  arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h | 2 --
>  1 file changed, 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
