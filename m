Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4463F1BE646
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 20:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgD2SdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 14:33:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:60633 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726519AbgD2SdU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 14:33:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTrWH-000430-02; Wed, 29 Apr 2020 20:33:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 41318C034E; Wed, 29 Apr 2020 20:26:04 +0200 (CEST)
Date:   Wed, 29 Apr 2020 20:26:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Liangliang Huang <huanglllzu@gmail.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: Re: [PATCH] MIPS: Loongson64: Switch the order of RS780E and LS7A
Message-ID: <20200429182604.GA21234@alpha.franken.de>
References: <1588151057-27932-1-git-send-email-huangll@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588151057-27932-1-git-send-email-huangll@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 05:04:17PM +0800, Liangliang Huang wrote:
> Sort the members of enum in alphabetical order is better to avoid
> duplicate mistakes (because the list may be grow very large), so
> fix it by exchanging the order.
> 
> Signed-off-by: Liangliang Huang <huangll@lemote.com>
> ---
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
