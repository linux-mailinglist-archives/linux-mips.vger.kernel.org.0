Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A9C3152EF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 16:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhBIPjo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 10:39:44 -0500
Received: from elvis.franken.de ([193.175.24.41]:36832 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231995AbhBIPjm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 10:39:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9V6R-0005On-00; Tue, 09 Feb 2021 16:38:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B9967C0DF1; Tue,  9 Feb 2021 16:38:43 +0100 (CET)
Date:   Tue, 9 Feb 2021 16:38:43 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH 2/6] MIPS: Loongson64: Distinguish firmware dependencies
 DTB/LEFI.
Message-ID: <20210209153843.GA14595@alpha.franken.de>
References: <20210209093224.7085-1-zhangqing@loongson.cn>
 <20210209093224.7085-3-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209093224.7085-3-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 09, 2021 at 05:32:20PM +0800, Qing Zhang wrote:
> Add DTB boot support, only support LS2K1000 processor for now,
> determine whether to use the built-in DTB or the DTB from the
> firmware by checking the range of CKSEG0 and XKPHYS.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
> ---
>  .../include/asm/mach-loongson64/boot_param.h     |  6 ++++++
>  arch/mips/include/asm/mach-loongson64/loongson.h |  3 ++-
>  arch/mips/loongson64/env.c                       | 13 ++++++++++++-
>  arch/mips/loongson64/init.c                      | 16 ++++++++++++++--
>  4 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index 4592841b6b0c..53c29a305ff0 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -198,7 +198,13 @@ enum loongson_bridge_type {
>  	VIRTUAL = 3
>  };
>  
> +enum loongson_fw_interface {
> +	LOONGSON_LEFI = 0,
> +	LOONGSON_DTB = 1,
> +};
> +
>  struct loongson_system_configuration {
> +	enum loongson_fw_interface fw_interface;

do you need this for future use ? Right now this information is only
needed in init.c and doesn't need to be exported...

> +	if (fw_arg2 == 0 || (be32_to_cpup((__be32 *)fw_arg2) == OF_DT_HEADER)) {

what about using fdt_magic(fw_arg2) == FDT_MAGIC ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
