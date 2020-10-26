Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D1D29996F
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 23:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392681AbgJZWQh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 26 Oct 2020 18:16:37 -0400
Received: from aposti.net ([89.234.176.197]:42682 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392335AbgJZWQh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 26 Oct 2020 18:16:37 -0400
Date:   Mon, 26 Oct 2020 22:16:03 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: ingenic: remove unused platform_data header file
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        linux-mips@vger.kernel.org
Message-Id: <RUXTIQ.Q47O9XR6N4VF@crapouillou.net>
In-Reply-To: <20201026192040.GA350265@ravnborg.org>
References: <20201026192040.GA350265@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le lun. 26 oct. 2020 à 20:20, Sam Ravnborg <sam@ravnborg.org> a écrit 
:
> There are no users of this headers file in the kernel.
> All users are likely migrated to device tree which is a good thing.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: linux-mips@vger.kernel.org
> ---
> 
> I noticed this while surfing around in platform_data for no apperant
> reason. So no fancy tooling or some such involved.

The jz4740-nand driver has been removed in Linux 5.3. Therefore:

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> 
> 	Sam
> 
>  .../linux/platform_data/jz4740/jz4740_nand.h  | 25 
> -------------------
>  1 file changed, 25 deletions(-)
>  delete mode 100644 include/linux/platform_data/jz4740/jz4740_nand.h
> 
> diff --git a/include/linux/platform_data/jz4740/jz4740_nand.h 
> b/include/linux/platform_data/jz4740/jz4740_nand.h
> deleted file mode 100644
> index b3f066d63059..000000000000
> --- a/include/linux/platform_data/jz4740/jz4740_nand.h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
> - *  JZ4740 SoC NAND controller driver
> - */
> -
> -#ifndef __JZ4740_NAND_H__
> -#define __JZ4740_NAND_H__
> -
> -#include <linux/mtd/rawnand.h>
> -#include <linux/mtd/partitions.h>
> -
> -#define JZ_NAND_NUM_BANKS 4
> -
> -struct jz_nand_platform_data {
> -	int			num_partitions;
> -	struct mtd_partition	*partitions;
> -
> -	unsigned char banks[JZ_NAND_NUM_BANKS];
> -
> -	void (*ident_callback)(struct platform_device *, struct mtd_info *,
> -				struct mtd_partition **, int *num_partitions);
> -};
> -
> -#endif
> --
> 2.27.0
> 


