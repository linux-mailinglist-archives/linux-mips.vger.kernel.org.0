Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7F91D66AA
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 10:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgEQIzo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:56345 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbgEQIzo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaF5B-0003F8-04; Sun, 17 May 2020 10:55:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6E326C04D6; Sun, 17 May 2020 10:41:24 +0200 (CEST)
Date:   Sun, 17 May 2020 10:41:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 2/2] MIPS: Remove not used 8250-platform.c
Message-ID: <20200517084124.GE3939@alpha.franken.de>
References: <1589595349-31656-1-git-send-email-yangtiezhu@loongson.cn>
 <1589595349-31656-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589595349-31656-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 16, 2020 at 10:15:49AM +0800, Tiezhu Yang wrote:
> When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, there exists build errors
> of 8250-platform.c due to linux/module.h is not included.
> 
> CONFIG_HAVE_STD_PC_SERIAL_PORT is not used in arch/mips for many years,
> 8250-platform.c is also not built and used, so it is not necessary to
> fix the build errors, just remove the not used file 8250-platform.c and
> the related code in Kconfig and Makefile.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2:
>   - No changes
> 
> v3:
>   - Remove not used 8250-platform.c
> 
>  arch/mips/Kconfig                |  3 ---
>  arch/mips/kernel/8250-platform.c | 46 ----------------------------------------
>  arch/mips/kernel/Makefile        |  2 --
>  3 files changed, 51 deletions(-)
>  delete mode 100644 arch/mips/kernel/8250-platform.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
