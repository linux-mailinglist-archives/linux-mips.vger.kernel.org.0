Return-Path: <linux-mips+bounces-3109-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F528BC8FC
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 10:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE389281C5F
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 08:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA4145322;
	Mon,  6 May 2024 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N9jRWrur"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F22140E29;
	Mon,  6 May 2024 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714982386; cv=none; b=MrUerofSrg7PPiygoVnBa4oICBFoLRVvQCX72VmYS/vCk3/CVavfAdiLitA7yem6mi17nJqsUNSyuUaCWMxvtcDYNlwUb/p/p82unWEHnn+JqvE5yTGJfoOHl0jmyuAE5gPjBm1r1JqwJ5p/tmfuxVHSTPto82GseK5dzObAf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714982386; c=relaxed/simple;
	bh=AbqMdLHBCN4Iq2oR3bhaOnCCZdRq2yxGX8gYr7eEdQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jt3E3MOq3kD7DE2XVx6uIX/nmIkkp0cywHxbPikoPRRcM+zA2fQ1RBRkgnCDBV7UOmtOfX9YmM2xxGatZI8kztXrKKix61PmTbTEx/7KKvA458JEADY77gYcHm7XAmy3fzRYutae0v7Tf4SiUHHdPB1YgPzjyHXZLVDW/N1ukRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N9jRWrur; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09D7FE0005;
	Mon,  6 May 2024 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714982379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oU6awB1JV0wpUNgoAgldHiUr3bwM6oTrm8bMZCjHsQ8=;
	b=N9jRWrurKBwLFX8iBZLK6lRbIb4iKvRHnUjfk6NWejbQLMzyAGshwr0+O/kQnqDwqDUE6a
	zk33RoURxan17HTGiYI/8Dra4ucyW6peuC0vxHiV7/7d308G/gnDfd1Rff/ytCze9hZmCr
	6RSX5cexVxlpwe4nCQCu0i34DTV7TdCw+TNxTEXR74eG5V2mMSEps26x1VpYn7Yz93gmn3
	OTdoKv6/UUN+xBV6/NwY+gr29M9M1K0h+asRRqGPFtxTuv0SJAWtsaHCfhbsPcgxyzUI7b
	YuPZRKD8LnvXvh1b2qhyVPr1iI8m7K8oteyohGC9SRMfWU9P4yGZ5zqvbV9puw==
Date: Mon, 6 May 2024 09:59:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add Loongson-1 NAND Controller
 driver
Message-ID: <20240506095938.4a910adc@xps-13>
In-Reply-To: <20240430-loongson1-nand-v7-3-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-3-60787c314fa4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
19:11:12 +0800:

> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> This patch adds NAND Controller driver for Loongson-1 SoCs.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v7:
> - Rename the dependency to LOONGSON1_APB_DMA
>=20
> Changes in v6:
> - Amend Kconfig
> - Add DT support
> - Use DT data instead of platform data
> - Remove MAX_ID_SIZE
> - Remove case NAND_OP_CMD_INSTR in ls1x_nand_set_controller()
> - Move ECC configuration to ls1x_nand_attach_chip()
> - Rename variable "nand" to "ls1x"
> - Rename variable "nc" to "nfc"
> - Some minor fixes
> - Link to v5: https://lore.kernel.org/all/20210520224213.7907-1-keguang.z=
hang@gmail.com
>=20
> Changes in v5:
> - Update the driver to fit the raw NAND framework.
> - Implement exec_op() instead of legacy cmdfunc().
> - Use dma_request_chan() instead of dma_request_channel().
> - Some minor fixes and cleanups.
>=20
> Changes in v4:
> - Retrieve the controller from nand_hw_control.
>=20
> Changes in v3:
> - Replace __raw_readl/__raw_writel with readl/writel.
> - Split ls1x_nand into two structures:
> ls1x_nand_chip and ls1x_nand_controller.
>=20
> Changes in v2:
> - Modify the dependency in Kconfig due to the changes of DMA module.
> ---
>  drivers/mtd/nand/raw/Kconfig          |   7 +
>  drivers/mtd/nand/raw/Makefile         |   1 +
>  drivers/mtd/nand/raw/loongson1_nand.c | 748 ++++++++++++++++++++++++++++=
++++++
>  3 files changed, 756 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index cbf8ae85e1ae..822bb7a2cea9 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -449,6 +449,13 @@ config MTD_NAND_RENESAS
>  	  Enables support for the NAND controller found on Renesas R-Car
>  	  Gen3 and RZ/N1 SoC families.
> =20
> +config MTD_NAND_LOONGSON1
> +	tristate "Loongson1 NAND controller"
> +	depends on LOONGSON1_APB_DMA || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  Enables support for NAND controller on Loongson1 SoCs.
> +
>  comment "Misc"
> =20
>  config MTD_SM_COMMON
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 25120a4afada..b3c65cab819c 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+=3D intel-nand-contro=
ller.o
>  obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+=3D rockchip-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_PL35X)		+=3D pl35x-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_RENESAS)		+=3D renesas-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_LOONGSON1)	+=3D loongson1_nand.o
> =20
>  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_=
ids.o
>  nand-objs +=3D nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/loongson1_nand.c b/drivers/mtd/nand/raw=
/loongson1_nand.c
> new file mode 100644
> index 000000000000..d0f66a81ba0b
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/loongson1_nand.c
> @@ -0,0 +1,748 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * NAND Controller Driver for Loongson-1 SoC
> + *
> + * Copyright (C) 2015-2024 Keguang Zhang <keguang.zhang@gmail.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sizes.h>
> +
> +/* Loongson-1 NAND Controller Registers */
> +#define NAND_CMD		0x0
> +#define NAND_ADDR1		0x4
> +#define NAND_ADDR2		0x8
> +#define NAND_TIMING		0xc
> +#define NAND_IDL		0x10
> +#define NAND_IDH_STATUS		0x14
> +#define NAND_PARAM		0x18
> +#define NAND_OP_NUM		0x1c
> +#define MAX_DUMP_REGS		0x20
> +
> +#define NAND_DMA_ADDR		0x40
> +
> +/* NAND Command Register Bits */
> +#define OP_DONE			BIT(10)
> +#define OP_SPARE		BIT(9)
> +#define OP_MAIN			BIT(8)
> +#define CMD_STATUS		BIT(7)
> +#define CMD_RESET		BIT(6)
> +#define CMD_READID		BIT(5)
> +#define BLOCKS_ERASE		BIT(4)
> +#define CMD_ERASE		BIT(3)
> +#define CMD_WRITE		BIT(2)
> +#define CMD_READ		BIT(1)
> +#define CMD_VALID		BIT(0)

Please add a common suffix to all your definitions and functions (LSN_,
LSN1_, LOONGSON_, whatever)

> +
> +#define MAX_ADDR_CYC		5U
> +
> +#define WAIT_CYCLE_MASK		GENMASK(7, 0)
> +#define HOLD_CYCLE_MASK		GENMASK(15, 8)
> +#define CELL_SIZE_MASK		GENMASK(11, 8)
> +
> +#define BITS_PER_WORD		(4 * BITS_PER_BYTE)
> +
> +/* macros for registers read/write */
> +#define nand_readl(nfc, off)		\
> +	readl((nfc)->reg_base + (off))
> +
> +#define nand_writel(nfc, off, val)	\
> +	writel((val), (nfc)->reg_base + (off))
> +
> +struct ls1x_nfc_data {
> +	unsigned int status_field;
> +	unsigned int op_scope_field;
> +	unsigned int hold_cycle;
> +	unsigned int wait_cycle;
> +	void (*parse_address)(struct nand_chip *chip, const u8 *addrs,
> +			      unsigned int naddrs, int cmd);
> +};
> +
> +struct ls1x_nfc {
> +	void __iomem *reg_base;
> +	struct regmap *regmap;
> +	const struct ls1x_nfc_data *data;
> +	__le32 addr1_reg;
> +	__le32 addr2_reg;
> +
> +	char *buf;
> +	unsigned int len;
> +	unsigned int rdy_timeout;
> +
> +	/* DMA Engine stuff */
> +	struct dma_chan *dma_chan;
> +	dma_cookie_t dma_cookie;
> +	struct completion dma_complete;
> +};
> +
> +struct ls1x_nand {
> +	struct device *dev;
> +	struct nand_chip chip;
> +	struct nand_controller controller;
> +	struct ls1x_nfc nfc;
> +};
> +
> +static const struct regmap_config ls1x_nand_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static inline void ls1b_nand_parse_address(struct nand_chip *chip,
> +					   const u8 *addrs,
> +					   unsigned int naddrs, int cmd)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	unsigned int page_shift =3D chip->page_shift + 1;
> +	int i;
> +
> +	nfc->addr1_reg =3D 0;
> +	nfc->addr2_reg =3D 0;
> +
> +	if (cmd =3D=3D CMD_ERASE) {
> +		page_shift =3D chip->page_shift;
> +
> +		for (i =3D 0; i < min(MAX_ADDR_CYC - 2, naddrs); i++)
> +			nfc->addr1_reg |=3D
> +			    (u32)addrs[i] << (page_shift + BITS_PER_BYTE * i);
> +		if (i =3D=3D MAX_ADDR_CYC - 2)
> +			nfc->addr2_reg |=3D
> +			    (u32)addrs[i] >> (BITS_PER_WORD - page_shift -
> +					      BITS_PER_BYTE * (i - 1));
> +
> +		return;
> +	}

I don't see the point in having this if, can you try to make it a
single generic logic? Same below.

> +
> +	for (i =3D 0; i < min(2U, naddrs); i++)
> +		nfc->addr1_reg |=3D (u32)addrs[i] << BITS_PER_BYTE * i;
> +	for (i =3D 2; i < min(MAX_ADDR_CYC, naddrs); i++)
> +		nfc->addr1_reg |=3D
> +		    (u32)addrs[i] << (page_shift + BITS_PER_BYTE * (i - 2));
> +	if (i =3D=3D MAX_ADDR_CYC)
> +		nfc->addr2_reg |=3D
> +		    (u32)addrs[i] >> (BITS_PER_WORD - page_shift -
> +				      BITS_PER_BYTE * (i - 1));
> +}
> +
> +static inline void ls1c_nand_parse_address(struct nand_chip *chip,
> +					   const u8 *addrs,
> +					   unsigned int naddrs, int cmd)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	int i;
> +
> +	nfc->addr1_reg =3D 0;
> +	nfc->addr2_reg =3D 0;
> +
> +	if (cmd =3D=3D CMD_ERASE) {
> +		for (i =3D 0; i < min(MAX_ADDR_CYC, naddrs); i++)
> +			nfc->addr2_reg |=3D (u32)addrs[i] << BITS_PER_BYTE * i;
> +
> +		return;
> +	}
> +
> +	for (i =3D 0; i < min(MAX_ADDR_CYC, naddrs); i++) {
> +		if (i < 2)
> +			nfc->addr1_reg |=3D (u32)addrs[i] << BITS_PER_BYTE * i;
> +		else
> +			nfc->addr2_reg |=3D
> +			    (u32)addrs[i] << BITS_PER_BYTE * (i - 2);
> +	}
> +}
> +
> +static int ls1x_nand_set_controller(struct nand_chip *chip,

The function name is misleading

> +				    const struct nand_subop *subop, int cmd)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	unsigned int op_id;
> +
> +	nfc->buf =3D NULL;
> +	nfc->len =3D 0;
> +	nfc->rdy_timeout =3D 0;
> +
> +	for (op_id =3D 0; op_id < subop->ninstrs; op_id++) {
> +		const struct nand_op_instr *instr =3D &subop->instrs[op_id];
> +		unsigned int offset, naddrs;
> +		const u8 *addrs;
> +
> +		switch (instr->type) {
> +		case NAND_OP_ADDR_INSTR:
> +			offset =3D nand_subop_get_addr_start_off(subop, op_id);
> +			naddrs =3D nand_subop_get_num_addr_cyc(subop, op_id);
> +			addrs =3D &instr->ctx.addr.addrs[offset];
> +
> +			nfc->data->parse_address(chip, addrs, naddrs, cmd);
> +			/* set NAND address */
> +			nand_writel(nfc, NAND_ADDR1, nfc->addr1_reg);
> +			nand_writel(nfc, NAND_ADDR2, nfc->addr2_reg);
> +			break;
> +		case NAND_OP_DATA_IN_INSTR:
> +		case NAND_OP_DATA_OUT_INSTR:
> +			offset =3D nand_subop_get_data_start_off(subop, op_id);
> +			nfc->len =3D nand_subop_get_data_len(subop, op_id);
> +			if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR)
> +				nfc->buf =3D
> +				    (void *)instr->ctx.data.buf.in + offset;
> +			else if (instr->type =3D=3D NAND_OP_DATA_OUT_INSTR)
> +				nfc->buf =3D
> +				    (void *)instr->ctx.data.buf.out + offset;

The buf pointer feels clunky. You don't know for how long the buffer
you point to will be valid, please don't do that.

> +
> +			if (cmd & (CMD_READID | CMD_STATUS))
> +				break;
> +
> +			if (!IS_ALIGNED((u32)nfc->buf, chip->buf_align)) {
> +				dev_err(ls1x->dev,
> +					"nfc->buf %px is not aligned!\n",
> +					nfc->buf);
> +				return -EOPNOTSUPP;
> +			} else if (!IS_ALIGNED(nfc->len, chip->buf_align)) {
> +				dev_err(ls1x->dev,
> +					"nfc->len %u is not aligned!\n",
> +					nfc->len);
> +				return -EOPNOTSUPP;
> +			}
> +
> +			/* set NAND data length */
> +			nand_writel(nfc, NAND_OP_NUM, nfc->len);
> +
> +			if (nfc->data->op_scope_field) {
> +				int op_scope =3D nfc->len << ffs(nfc->data->op_scope_field);
> +
> +				regmap_update_bits(nfc->regmap, NAND_PARAM,
> +						   nfc->data->op_scope_field,
> +						   op_scope);
> +			}
> +
> +			break;
> +		case NAND_OP_WAITRDY_INSTR:
> +			nfc->rdy_timeout =3D instr->ctx.waitrdy.timeout_ms;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	/* set NAND erase block count */
> +	if (cmd & CMD_ERASE)
> +		nand_writel(nfc, NAND_OP_NUM, 1);
> +	/* set NAND operation region */
> +	if (nfc->buf && nfc->len)
> +		cmd |=3D OP_SPARE | OP_MAIN;
> +
> +	/* set NAND command */
> +	nand_writel(nfc, NAND_CMD, cmd);
> +	/* Trigger operation */
> +	regmap_write_bits(nfc->regmap, NAND_CMD, CMD_VALID, CMD_VALID);
> +
> +	return 0;
> +}
> +
> +static void ls1x_nand_dma_callback(void *data)
> +{
> +	struct ls1x_nand *ls1x =3D (struct ls1x_nand *)data;
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	enum dma_status status;
> +
> +	status =3D dmaengine_tx_status(nfc->dma_chan, nfc->dma_cookie, NULL);
> +	if (likely(status =3D=3D DMA_COMPLETE))
> +		dev_dbg(ls1x->dev, "DMA complete with cookie=3D%d\n",
> +			nfc->dma_cookie);
> +	else
> +		dev_err(ls1x->dev, "DMA error with cookie=3D%d\n",
> +			nfc->dma_cookie);
> +
> +	complete(&nfc->dma_complete);
> +}
> +
> +static int ls1x_nand_dma_transfer(struct ls1x_nand *ls1x, bool is_write)
> +{
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	struct dma_chan *chan =3D nfc->dma_chan;
> +	struct dma_async_tx_descriptor *desc;
> +	enum dma_data_direction data_dir =3D
> +	    is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +	enum dma_transfer_direction xfer_dir =3D
> +	    is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
> +	dma_addr_t dma_addr;
> +	int ret;
> +
> +	dma_addr =3D dma_map_single(chan->device->dev, nfc->buf, nfc->len,
> +				  data_dir);
> +	if (dma_mapping_error(chan->device->dev, dma_addr)) {
> +		dev_err(ls1x->dev, "failed to map DMA buffer!\n");
> +		return -ENXIO;
> +	}
> +
> +	desc =3D dmaengine_prep_slave_single(chan, dma_addr, nfc->len, xfer_dir,
> +					   DMA_PREP_INTERRUPT);
> +	if (!desc) {
> +		dev_err(ls1x->dev, "failed to prepare DMA descriptor!\n");
> +		ret =3D PTR_ERR(desc);
> +		goto err;
> +	}
> +	desc->callback =3D ls1x_nand_dma_callback;
> +	desc->callback_param =3D ls1x;
> +
> +	nfc->dma_cookie =3D dmaengine_submit(desc);
> +	ret =3D dma_submit_error(nfc->dma_cookie);
> +	if (ret) {
> +		dev_err(ls1x->dev, "failed to submit DMA descriptor!\n");
> +		goto err;
> +	}
> +
> +	dev_dbg(ls1x->dev, "issue DMA with cookie=3D%d\n", nfc->dma_cookie);
> +	dma_async_issue_pending(chan);
> +
> +	ret =3D wait_for_completion_timeout(&nfc->dma_complete,
> +					  msecs_to_jiffies(nfc->rdy_timeout));
> +	if (ret <=3D 0) {
> +		dev_err(ls1x->dev, "DMA timeout!%u\n", nfc->rdy_timeout);
> +		dmaengine_terminate_all(chan);
> +		ret =3D -EIO;
> +	}
> +	ret =3D 0;
> +err:
> +	dma_unmap_single(chan->device->dev, dma_addr, nfc->len, data_dir);
> +
> +	return ret;
> +}
> +
> +static inline int ls1x_nand_wait_for_op_done(struct ls1x_nfc *nfc)
> +{
> +	unsigned int val;
> +	int ret =3D 0;
> +
> +	/* Wait for operation done */
> +	if (nfc->rdy_timeout)
> +		ret =3D regmap_read_poll_timeout(nfc->regmap, NAND_CMD, val,
> +					       val & OP_DONE, 0,
> +					       nfc->rdy_timeout * 1000);
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_reset_exec(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	int ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_RESET);
> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret)
> +		dev_err(ls1x->dev, "CMD_RESET failed! %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_read_id_exec(struct nand_chip *chip,
> +				  const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	long long idl =3D 0;
> +	int i, ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_READID);
> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret) {
> +		dev_err(ls1x->dev, "CMD_READID failed! %d\n", ret);
> +		print_hex_dump_debug("REG: ", DUMP_PREFIX_OFFSET, 16, 4,
> +				     nfc->reg_base, MAX_DUMP_REGS, false);
> +		return ret;
> +	}
> +
> +	idl =3D __be32_to_cpu(nand_readl(nfc, NAND_IDL));
> +	memset(nfc->buf, 0x0, nfc->len);
> +
> +	for (i =3D 0; i < nfc->len; i++) {
> +		if (i > 0)
> +			nfc->buf[i] =3D (char)(idl >> (i - 1) * BITS_PER_BYTE);
> +		else
> +			nfc->buf[i] =3D (char)nand_readl(nfc, NAND_IDH_STATUS);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_erase_exec(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	int ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_ERASE);

No, you don't know what the command is gonna be, so if your controller
forces the command opcodes, you need to go through this:

https://elixir.bootlin.com/linux/v6.8.9/source/drivers/mtd/nand/raw/arasan-=
nand-controller.c#L819
and
https://elixir.bootlin.com/linux/v6.8.9/source/drivers/mtd/nand/raw/arasan-=
nand-controller.c#L940

> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret) {
> +		dev_err(ls1x->dev, "CMD_ERASE failed! %d\n", ret);
> +		print_hex_dump_debug("REG: ", DUMP_PREFIX_OFFSET, 16, 4,
> +				     nfc->reg_base, MAX_DUMP_REGS, false);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_read_exec(struct nand_chip *chip,
> +			       const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	bool is_write =3D false;
> +	int ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_READ);
> +
> +	ret =3D ls1x_nand_dma_transfer(ls1x, is_write);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret) {
> +		dev_err(ls1x->dev, "CMD_READ failed! %d\n", ret);
> +		print_hex_dump_debug("REG: ", DUMP_PREFIX_OFFSET, 16, 4,
> +				     nfc->reg_base, MAX_DUMP_REGS, false);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_write_exec(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	bool is_write =3D true;
> +	int ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_WRITE);
> +
> +	ret =3D ls1x_nand_dma_transfer(ls1x, is_write);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret) {
> +		dev_err(ls1x->dev, "CMD_WRITE failed! %d\n", ret);
> +		print_hex_dump_debug("REG: ", DUMP_PREFIX_OFFSET, 16, 4,
> +				     nfc->reg_base, MAX_DUMP_REGS, false);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_read_status_exec(struct nand_chip *chip,
> +				      const struct nand_subop *subop)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	int val, ret;
> +
> +	ls1x_nand_set_controller(chip, subop, CMD_STATUS);
> +
> +	ret =3D ls1x_nand_wait_for_op_done(nfc);
> +	if (ret) {
> +		dev_err(ls1x->dev, "CMD_STATUS failed! %d\n", ret);
> +		return ret;
> +	}
> +
> +	val =3D nand_readl(nfc, NAND_IDH_STATUS) & ~nfc->data->status_field;
> +	nfc->buf[0] =3D val << ffs(nfc->data->status_field);
> +
> +	return ret;
> +}
> +
> +static const struct nand_op_parser ls1x_nand_op_parser =3D NAND_OP_PARSE=
R(
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_reset_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_read_id_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_erase_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_read_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_write_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_read_status_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
> +	);
> +
> +static int ls1x_nand_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op, bool check_only)
> +{
> +	return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op,
> +				      check_only);
> +}
> +
> +static int ls1x_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct ls1x_nand *ls1x =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	u64 chipsize =3D nanddev_target_size(&chip->base);
> +	int cell_size =3D 0;
> +
> +	switch (chipsize) {
> +	case SZ_128M:
> +		cell_size =3D 0x0;
> +		break;
> +	case SZ_256M:
> +		cell_size =3D 0x1;
> +		break;
> +	case SZ_512M:
> +		cell_size =3D 0x2;
> +		break;
> +	case SZ_1G:
> +		cell_size =3D 0x3;
> +		break;
> +	case SZ_2G:
> +		cell_size =3D 0x4;
> +		break;
> +	case SZ_4G:
> +		cell_size =3D 0x5;
> +		break;
> +	case (SZ_2G * SZ_4G):	/* 8G */
> +		cell_size =3D 0x6;
> +		break;
> +	case (SZ_4G * SZ_4G):	/* 16G */

Why not SZ_8G and SZ_16G?

> +		cell_size =3D 0x7;
> +		break;
> +	default:
> +		dev_err(ls1x->dev, "unsupported chip size: %llu MB\n",
> +			chipsize);

You should error out.

> +		break;
> +	}
> +
> +	/* Set cell size */
> +	regmap_update_bits(nfc->regmap, NAND_PARAM, CELL_SIZE_MASK,
> +			   FIELD_PREP(CELL_SIZE_MASK, cell_size));
> +
> +	regmap_update_bits(nfc->regmap, NAND_TIMING, HOLD_CYCLE_MASK,
> +			   FIELD_PREP(HOLD_CYCLE_MASK, nfc->data->hold_cycle));
> +	regmap_update_bits(nfc->regmap, NAND_TIMING, WAIT_CYCLE_MASK,
> +			   FIELD_PREP(WAIT_CYCLE_MASK, nfc->data->wait_cycle));
> +
> +	chip->ecc.read_page_raw =3D nand_monolithic_read_page_raw;
> +	chip->ecc.write_page_raw =3D nand_monolithic_write_page_raw;

I need to further understand this, see other thread.

> +	chip->options |=3D NAND_MONOLITHIC_READ;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops ls1x_nfc_ops =3D {
> +	.exec_op =3D ls1x_nand_exec_op,
> +	.attach_chip =3D ls1x_nand_attach_chip,
> +};
> +
> +static void ls1x_nand_controller_cleanup(struct ls1x_nand *ls1x)
> +{
> +	if (ls1x->nfc.dma_chan)
> +		dma_release_channel(ls1x->nfc.dma_chan);
> +}
> +
> +static int ls1x_nand_controller_init(struct ls1x_nand *ls1x,
> +				     struct platform_device *pdev)
> +{
> +	struct ls1x_nfc *nfc =3D &ls1x->nfc;
> +	struct dma_slave_config cfg;
> +	int ret;
> +
> +	nfc->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nfc->reg_base))
> +		return PTR_ERR(nfc->reg_base);
> +
> +	nfc->regmap =3D devm_regmap_init_mmio(ls1x->dev, nfc->reg_base,
> +					    &ls1x_nand_regmap_config);
> +	if (IS_ERR(nfc->regmap))
> +		return dev_err_probe(ls1x->dev, PTR_ERR(nfc->regmap),
> +				     "failed to init regmap\n");
> +
> +	nfc->dma_chan =3D dma_request_chan(ls1x->dev, "rxtx");
> +	if (IS_ERR(nfc->dma_chan))
> +		return dev_err_probe(ls1x->dev, PTR_ERR(nfc->dma_chan),
> +				     "failed to request DMA channel\n");
> +	dev_info(ls1x->dev, "got %s for %s access\n",
> +		 dma_chan_name(nfc->dma_chan), dev_name(ls1x->dev));

Might be lowered to debug maybe?

> +
> +	cfg.src_addr =3D CPHYSADDR(nfc->reg_base + NAND_DMA_ADDR);
> +	cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cfg.dst_addr =3D CPHYSADDR(nfc->reg_base + NAND_DMA_ADDR);

Doesn't feel right. That shall be a dma_addr_t, not a virtual pointer.

> +	cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +
> +	ret =3D dmaengine_slave_config(nfc->dma_chan, &cfg);
> +	if (ret) {
> +		dev_err(ls1x->dev, "failed to config DMA channel\n");
> +		dma_release_channel(nfc->dma_chan);
> +		return ret;
> +	}
> +
> +	init_completion(&nfc->dma_complete);
> +
> +	return 0;
> +}
> +
> +static int ls1x_nand_chip_init(struct ls1x_nand *ls1x)
> +{
> +	int nchips =3D of_get_child_count(ls1x->dev->of_node);
> +	struct device_node *chip_np;
> +	struct nand_chip *chip =3D &ls1x->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int ret =3D 0;
> +
> +	if (nchips !=3D 1)
> +		return dev_err_probe(ls1x->dev, -EINVAL,
> +				     "Currently one NAND chip supported\n");
> +
> +	chip_np =3D of_get_next_child(ls1x->dev->of_node, NULL);
> +	if (!chip_np)
> +		return dev_err_probe(ls1x->dev, -ENODEV,
> +				     "failed to get child node for NAND chip\n");
> +
> +	chip->controller =3D &ls1x->controller;
> +	chip->options =3D NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_X=
D;
> +	chip->buf_align =3D 4;
> +	nand_set_controller_data(chip, ls1x);
> +	nand_set_flash_node(chip, chip_np);
> +
> +	mtd->dev.parent =3D ls1x->dev;
> +	mtd->name =3D "ls1x-nand";
> +	mtd->owner =3D THIS_MODULE;
> +
> +	ret =3D nand_scan(chip, 1);
> +	if (ret) {
> +		of_node_put(chip_np);
> +		return ret;
> +	}
> +
> +	ret =3D mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(ls1x->dev, "failed to register MTD device! %d\n", ret);
> +		nand_cleanup(chip);
> +		of_node_put(chip_np);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct ls1x_nfc_data *data;
> +	struct ls1x_nand *ls1x;
> +	int ret;
> +
> +	data =3D of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	ls1x =3D devm_kzalloc(dev, sizeof(*ls1x), GFP_KERNEL);
> +	if (!ls1x)
> +		return -ENOMEM;
> +
> +	ls1x->nfc.data =3D data;
> +	ls1x->dev =3D dev;
> +	ls1x->controller.ops =3D &ls1x_nfc_ops;
> +	nand_controller_init(&ls1x->controller);

It would feel more natural to perform the init and then add the ops.

> +
> +	ret =3D ls1x_nand_controller_init(ls1x, pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ls1x_nand_chip_init(ls1x);
> +	if (ret)
> +		goto err;
> +
> +	platform_set_drvdata(pdev, ls1x);
> +
> +	return 0;
> +err:
> +	ls1x_nand_controller_cleanup(ls1x);
> +	return ret;
> +}
> +
> +static int ls1x_nand_remove(struct platform_device *pdev)
> +{
> +	struct ls1x_nand *ls1x =3D platform_get_drvdata(pdev);
> +	struct nand_chip *chip =3D &ls1x->chip;
> +	int ret;
> +
> +	ret =3D mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);
> +	nand_cleanup(chip);
> +	ls1x_nand_controller_cleanup(ls1x);
> +
> +	return 0;
> +}
> +
> +static const struct ls1x_nfc_data ls1b_nfc_data =3D {
> +	.status_field =3D GENMASK(15, 8),
> +	.hold_cycle =3D 0x2,
> +	.wait_cycle =3D 0xc,
> +	.parse_address =3D ls1b_nand_parse_address,
> +};
> +
> +static const struct ls1x_nfc_data ls1c_nfc_data =3D {
> +	.status_field =3D GENMASK(23, 16),
> +	.op_scope_field =3D GENMASK(29, 16),
> +	.hold_cycle =3D 0x2,
> +	.wait_cycle =3D 0xc,
> +	.parse_address =3D ls1c_nand_parse_address,
> +};
> +
> +static const struct of_device_id ls1x_nfc_match[] =3D {
> +	{ .compatible =3D "loongson,ls1b-nfc", .data =3D &ls1b_nfc_data },
> +	{ .compatible =3D "loongson,ls1c-nfc", .data =3D &ls1c_nfc_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ls1x_nfc_match);
> +
> +static struct platform_driver ls1x_nand_driver =3D {
> +	.probe	=3D ls1x_nand_probe,
> +	.remove	=3D ls1x_nand_remove,
> +	.driver	=3D {
> +		.name	=3D KBUILD_MODNAME,
> +		.of_match_table =3D ls1x_nfc_match,
> +	},
> +};
> +
> +module_platform_driver(ls1x_nand_driver);
> +
> +MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
> +MODULE_DESCRIPTION("Loongson-1 NAND Controller driver");
> +MODULE_LICENSE("GPL");
>=20


Thanks,
Miqu=C3=A8l

