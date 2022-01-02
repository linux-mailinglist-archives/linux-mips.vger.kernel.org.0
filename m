Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3674482B64
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jan 2022 14:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiABNcy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Jan 2022 08:32:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:52732 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229873AbiABNcy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Jan 2022 08:32:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n40yi-0002m7-01; Sun, 02 Jan 2022 14:32:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 98F05C0A4B; Sun,  2 Jan 2022 14:26:18 +0100 (CET)
Date:   Sun, 2 Jan 2022 14:26:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <yunqiang.su@cipunited.com>
Cc:     linux-mips@vger.kernel.org, paul@crapouillou.net,
        zhouyanjie@wanyeetech.com, jiaxun.yang@flygoat.com, syq@debian.org,
        aaro.koskinen@iki.fi
Subject: Re: [PATCH 2/2] MIPS: new Kconfig option ZBOOT_LOAD_ADDRESS
Message-ID: <20220102132618.GB3468@alpha.franken.de>
References: <20211222134346.1366067-1-yunqiang.su@cipunited.com>
 <20211222134346.1366067-2-yunqiang.su@cipunited.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222134346.1366067-2-yunqiang.su@cipunited.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 22, 2021 at 01:43:46PM +0000, YunQiang Su wrote:
> If this option is not 0x0, it will be used for zboot load address.
> Otherwise, the result of calc_vmlinuz_load_addr will be used.
> 
> The zload-y value for generic are also removed then, as the current
> value breaks booting on qemu -M boston.
> The result of calc_vmlinuz_load_addr works well for most of cases.
> 
> The default value of bcm47xx keeps as it currently.
> 
> Signed-off-by: YunQiang Su <yunqiang.su@cipunited.com>
> ---
>  arch/mips/Kconfig                  | 10 ++++++++++
>  arch/mips/bcm47xx/Platform         |  1 -
>  arch/mips/boot/compressed/Makefile |  4 ++++
>  arch/mips/generic/Platform         |  1 -
>  4 files changed, 14 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
