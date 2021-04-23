Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B72D3691F1
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 14:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242335AbhDWMXM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 08:23:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:38495 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231338AbhDWMXK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 08:23:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZupM-00019R-01; Fri, 23 Apr 2021 14:22:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9D4D6C0B3B; Fri, 23 Apr 2021 13:47:44 +0200 (CEST)
Date:   Fri, 23 Apr 2021 13:47:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     xiaochuan mao <maoxiaochuan@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS:DTS:Correct the license for Loongson-2K
Message-ID: <20210423114744.GB8582@alpha.franken.de>
References: <20210423030656.25632-1-maoxiaochuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423030656.25632-1-maoxiaochuan@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 23, 2021 at 11:06:56AM +0800, xiaochuan mao wrote:
> make license from GPL3.0 to GPL2.0
> 
> Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
> ---
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
