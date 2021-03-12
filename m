Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436D5338A3A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 11:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbhCLKer (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 05:34:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:52580 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233201AbhCLKel (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 05:34:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lKf7u-0007WV-06; Fri, 12 Mar 2021 11:34:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 01657C1E4A; Fri, 12 Mar 2021 11:33:41 +0100 (CET)
Date:   Fri, 12 Mar 2021 11:33:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on
 MT7621
Message-ID: <20210312103341.GG7027@alpha.franken.de>
References: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 11:08:06AM -0800, Ilya Lipnitskiy wrote:
> Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
> WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
> was reported by MediaTek WCN division [0].
> 
> [0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html

I don't see the Mediatek WCN reporting there. Looking at the 1004K user
manual I couldn't find a notice about such behaviour. So this looks
more like a fix for papering over the real bug by just introducing
a few more syncs. Could you please point me to where this is
really documented ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
