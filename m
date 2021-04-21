Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13377366B3C
	for <lists+linux-mips@lfdr.de>; Wed, 21 Apr 2021 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239954AbhDUMwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 08:52:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:35174 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239998AbhDUMwc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 08:52:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZCKf-0004Cw-00; Wed, 21 Apr 2021 14:51:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 27283C07F4; Wed, 21 Apr 2021 14:00:55 +0200 (CEST)
Date:   Wed, 21 Apr 2021 14:00:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     xiaochuan mao <maoxiaochuan@loongson.cn>
Cc:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael <michael5hzg@gmail.com>
Subject: Re: [PATCH] mips/bootinfo:correct some comments of fw_arg
Message-ID: <20210421120055.GA8637@alpha.franken.de>
References: <20210421061917.13953-1-maoxiaochuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421061917.13953-1-maoxiaochuan@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 21, 2021 at 02:19:17PM +0800, xiaochuan mao wrote:
> from arch/mips/kernel/head.S we know that use a0~a3 for fw_arg0~fw_arg3
> there is some code from head.S:
> 	LONG_S		a0, fw_arg0		# firmware arguments
> 	LONG_S		a1, fw_arg1
> 	LONG_S		a2, fw_arg2
> 	LONG_S		a3, fw_arg3
> 
> Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
> ---
>  arch/mips/include/asm/bootinfo.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
