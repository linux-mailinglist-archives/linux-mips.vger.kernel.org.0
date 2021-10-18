Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907904323A8
	for <lists+linux-mips@lfdr.de>; Mon, 18 Oct 2021 18:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbhJRQUx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Oct 2021 12:20:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:55145 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231768AbhJRQUx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Oct 2021 12:20:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mcVLT-0008Tz-03; Mon, 18 Oct 2021 18:18:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C05E6C2616; Mon, 18 Oct 2021 18:18:00 +0200 (CEST)
Date:   Mon, 18 Oct 2021 18:18:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kael_w@yeah.net
Subject: Re: [PATCH] MIPS: Loongson64: Add of_node_put() before break
Message-ID: <20211018161800.GD16375@alpha.franken.de>
References: <20211015070122.11467-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015070122.11467-1-wanjiabing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 15, 2021 at 03:01:22AM -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./arch/mips/loongson64/init.c:174:1-22: WARNING: Function
> for_each_node_by_name should have of_node_put() before break
> 
> Early exits from for_each_node_by_name should decrement the
> node reference counter.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  arch/mips/loongson64/init.c | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
