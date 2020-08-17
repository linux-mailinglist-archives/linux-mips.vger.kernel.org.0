Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE40246577
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbgHQLbi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:31:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:49797 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728453AbgHQLbY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dMD-0003tH-02; Mon, 17 Aug 2020 13:31:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6598EC0D74; Mon, 17 Aug 2020 13:22:10 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:22:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Loongson: Use default CONFIG_FRAME_WARN as 2048
 for Loongson64 to fix build warnings
Message-ID: <20200817112210.GC11725@alpha.franken.de>
References: <1597401090-4314-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1597401090-4314-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 06:31:30PM +0800, Tiezhu Yang wrote:
> After commit 70b838292bef ("MIPS: Update default config file for
> Loongson-3"), CONFIG_VHOST_SCSI and CONFIG_VHOST are set when use
> loongson3_defconfig, and then there exists the following two build
> warnings related with these two configs:
> 
>   CC [M]  drivers/vhost/scsi.o
> drivers/vhost/scsi.c: In function ‘vhost_scsi_flush’:
> drivers/vhost/scsi.c:1374:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>  }
>  ^
>   LD [M]  drivers/vhost/vhost_scsi.o
>   CC [M]  drivers/vhost/vsock.o
>   LD [M]  drivers/vhost/vhost_vsock.o
>   CC [M]  drivers/vhost/vhost.o
> drivers/vhost/vhost.c: In function ‘log_used’:
> drivers/vhost/vhost.c:1896:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>  }
>  ^
> 
> CONFIG_FRAME_WARN=2048 can fix it, since the default CONFIG_FRAME_WARN
> for 64BIT is 2048, just delete the CONFIG_FRAME_WARN line in defconfig.
> 
> config FRAME_WARN
>         int "Warn for stack frames larger than"
>         range 0 8192
>         default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>         default 1280 if (!64BIT && PARISC)
>         default 1024 if (!64BIT && !PARISC)
>         default 2048 if 64BIT
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
