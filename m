Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583B31DFDF5
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 11:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgEXJ2l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 05:28:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:36885 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727848AbgEXJ2l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 05:28:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jcmvv-0005CF-00; Sun, 24 May 2020 11:28:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 695BBC01D2; Sun, 24 May 2020 11:28:20 +0200 (CEST)
Date:   Sun, 24 May 2020 11:28:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: DTS: Only build subdir of current platform
Message-ID: <20200524092820.GA4874@alpha.franken.de>
References: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 10:15:06AM +0800, Tiezhu Yang wrote:
> Add config check in Makefile to only build the subdir of current platform.
> 
> E.g. without this patch:
> 
>   AR      arch/mips/built-in.a
>   AR      arch/mips/boot/dts/brcm/built-in.a
>   AR      arch/mips/boot/dts/cavium-octeon/built-in.a
>   AR      arch/mips/boot/dts/img/built-in.a
>   AR      arch/mips/boot/dts/ingenic/built-in.a
>   AR      arch/mips/boot/dts/lantiq/built-in.a
>   DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>   DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>   AR      arch/mips/boot/dts/loongson/built-in.a
>   AR      arch/mips/boot/dts/mscc/built-in.a
>   AR      arch/mips/boot/dts/mti/built-in.a
>   AR      arch/mips/boot/dts/netlogic/built-in.a
>   AR      arch/mips/boot/dts/ni/built-in.a
>   AR      arch/mips/boot/dts/pic32/built-in.a
>   AR      arch/mips/boot/dts/qca/built-in.a
>   AR      arch/mips/boot/dts/ralink/built-in.a
>   AR      arch/mips/boot/dts/xilfpga/built-in.a
>   AR      arch/mips/boot/dts/built-in.a
> 
> With this patch:
> 
>   AR      arch/mips/built-in.a
>   DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
>   DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
>   DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
>   AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
>   AR      arch/mips/boot/dts/loongson/built-in.a
>   AR      arch/mips/boot/dts/built-in.a
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/boot/dts/Makefile | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
