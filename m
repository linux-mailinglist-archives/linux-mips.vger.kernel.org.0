Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D7542E8BB
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 08:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhJOGRN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 15 Oct 2021 02:17:13 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:41383 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhJOGRN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Oct 2021 02:17:13 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 19BBA100006;
        Fri, 15 Oct 2021 06:15:03 +0000 (UTC)
Date:   Fri, 15 Oct 2021 08:14:47 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: rawnand/ingenic: JZ4740 needs 'oob_first' read
 page function
Message-ID: <20211015081447.25836fc7@xps13>
In-Reply-To: <20211009184952.24591-4-paul@crapouillou.net>
References: <20211009184952.24591-1-paul@crapouillou.net>
        <20211009184952.24591-4-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

paul@crapouillou.net wrote on Sat,  9 Oct 2021 20:49:52 +0200:

> The ECC engine on the JZ4740 SoC requires the ECC data to be read before
> the page; using the default page reading function does not work. Indeed,
> the old JZ4740 NAND driver (removed in 5.4) did use the 'OOB first' flag
> that existed back then.
> 
> Use the newly created nand_read_page_hwecc_oob_first() to address this
> issue.
> 
> This issue was not found when the new ingenic-nand driver was developed,
> most likely because the Device Tree used had the nand-ecc-mode set to
> "hw_oob_first", which seems to not be supported anymore.

I would rename both the boolean and the helper "*_access_oob_first"
which seems more precise.

> 
> Cc: <stable@vger.kernel.org> # v5.2
> Fixes: a0ac778eb82c ("mtd: rawnand: ingenic: Add support for the JZ4740")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index 0e9d426fe4f2..b18861bdcdc8 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -32,6 +32,7 @@ struct jz_soc_info {
>  	unsigned long addr_offset;
>  	unsigned long cmd_offset;
>  	const struct mtd_ooblayout_ops *oob_layout;
> +	bool oob_first;
>  };
>  
>  struct ingenic_nand_cs {
> @@ -240,6 +241,9 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
>  	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>  		chip->bbt_options |= NAND_BBT_NO_OOB;
>  
> +	if (nfc->soc_info->oob_first)
> +		chip->ecc.read_page = nand_read_page_hwecc_oob_first;
> +
>  	/* For legacy reasons we use a different layout on the qi,lb60 board. */
>  	if (of_machine_is_compatible("qi,lb60"))
>  		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
> @@ -534,6 +538,7 @@ static const struct jz_soc_info jz4740_soc_info = {
>  	.data_offset = 0x00000000,
>  	.cmd_offset = 0x00008000,
>  	.addr_offset = 0x00010000,
> +	.oob_first = true,
>  };
>  
>  static const struct jz_soc_info jz4725b_soc_info = {


Thanks,
Miquèl
