Return-Path: <linux-mips+bounces-8215-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEBA678E1
	for <lists+linux-mips@lfdr.de>; Tue, 18 Mar 2025 17:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66D267AC628
	for <lists+linux-mips@lfdr.de>; Tue, 18 Mar 2025 16:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112CC210F6D;
	Tue, 18 Mar 2025 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S9bzmef5"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7E2101BD;
	Tue, 18 Mar 2025 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314525; cv=none; b=UY9Ax/EIDpB6JXL2hlqUosRkp8XXIRRoFfK30dzjhcKiRGd9eQmYyIdU+jwcNTrBwl8gV7D8Wu83kZnXNbPphar4qxWSxatPWlEdXpXIRhNLS0T/49EMGR54etT4cpfFjiRjIRhSp0qykbwp7CcESZt50cePhZmpqZ7nWST1bLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314525; c=relaxed/simple;
	bh=EEXljvhtVt4NquJkiacHlv2cq1fWsIOc1LCYRRtxPas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kDbDbpxGyHy7WDXYjjcBrI9Qje0rLBUe4ISfugq2GreDhH/uu2Mh1EeyPMfeO5oK4Tr/vzVT0+s2lBzXj5Had5V64q4mjh/MCsS7O9LAPQKCSBxKKLxQA3PYqO3jzFPZ3e2E6lBsPf8Q+OMMNBF0u69qJIQHCkADKcc/N1lUP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S9bzmef5; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82D0244334;
	Tue, 18 Mar 2025 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742314521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49feSNemOU7EPSuBa47yi8C389AMdSk2iptgVd3hTsg=;
	b=S9bzmef5hK8s+597uaNPicvHWx+7YzIQzyU/tmdUJVb4wNbYMxEwtv87JYbeJacLC5gcFa
	ZKkW+7x1V2/OwJImVfvVqhjEWaah3uH5DIeQArDkzodmJzrpO77YAAAgxrRDTOa8Cx7kb/
	xqWRThVIqC2wKMc8AxZJv+4x5l9poN0zYiHLlT0cmY+nzk48rLf4j+aMUThwqHEeRyorse
	JtmaSQaXaTc9iXpX/HJzSkmWPC2DhJwDvY7G57Zf0/Thdfo80H9Ts1lChJgevFPbZLwNsb
	+d0UExwEO4cnf0hE76Ydko9ANuYqYg+NZjSePeLwsVTv7Ozrp6QjdUMyBPT8BQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  keguang.zhang@gmail.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-mips@vger.kernel.org
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <20250305-loongson1-nand-v13-2-a5bac21631cd@gmail.com> (Keguang
	Zhang via's message of "Wed, 05 Mar 2025 19:05:05 +0800")
References: <20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com>
	<20250305-loongson1-nand-v13-2-a5bac21631cd@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 17:15:20 +0100
Message-ID: <877c4m71t3.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeguvghvnhhulhhlodhkvghguhgrnhhgrdiihhgrnhhgrdhgmhgrihhlrdgtohhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvghhurghnghdriihhrghnghesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Keguang,

I guess I am mostly fine with the driver, it's probably time to merge
it. Just a few final changes below, I plan on merging it at -rc1.

> +	case NAND_CMD_READSTART:
> +		if (!op->is_read)
> +			return -EOPNOTSUPP;
> +		op->cmd_reg =3D LS1X_NAND_CMD_READ;
> +		break;
> +	case NAND_CMD_RNDOUT:
> +		op->is_change_column =3D true;
> +		break;
> +	case NAND_CMD_RNDOUTSTART:
> +		if (!op->is_change_column)
> +			return -EOPNOTSUPP;
> +		op->cmd_reg =3D LS1X_NAND_CMD_READ;
> +		break;
> +	default:
> +		dev_err(host->dev, "unsupported opcode: %u\n", opcode);

No error message in the normal path. This should be a debug log at
most. This function is called in the check_only path.

> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}

...

> +static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const str=
uct nand_subop *subop)
> +{
> +	struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> +	struct ls1x_nand_op op =3D {};
> +	int i, ret;
> +	union {
> +		char ids[5];
> +		struct {
> +			int idl;
> +			char idh;
> +		};
> +	} nand_id;
> +
> +	ret =3D ls1x_nand_misc_type_exec(chip, subop, &op);
> +	if (ret) {
> +		dev_err(host->dev, "failed to read ID! %d\n", ret);

No print here, it's not useful.

> +		return ret;
> +	}
> +
> +	nand_id.idl =3D readl(host->reg_base + LS1X_NAND_IDL);
> +	nand_id.idh =3D readb(host->reg_base + LS1X_NAND_IDH_STATUS);
> +
> +	for (i =3D 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
> +		op.buf[i] =3D nand_id.ids[sizeof(nand_id.ids) - 1 - i];
> +
> +	return ret;
> +}

...

> +static int ls1x_nand_is_valid_cmd(struct device *dev, u8 opcode)
> +{
> +	if (opcode =3D=3D NAND_CMD_STATUS || opcode =3D=3D NAND_CMD_RESET || op=
code =3D=3D NAND_CMD_READID)
> +		return 0;
> +
> +	dev_err(dev, "unsupported opcode: %x", opcode);

Ditto

> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ls1x_nand_is_valid_cmd_seq(struct device *dev, u8 opcode1, u8=
 opcode2)
> +{
> +	if (opcode1 =3D=3D NAND_CMD_RNDOUT && opcode2 =3D=3D NAND_CMD_RNDOUTSTA=
RT)
> +		return 0;
> +
> +	if (opcode1 =3D=3D NAND_CMD_READ0 && opcode2 =3D=3D NAND_CMD_READSTART)
> +		return 0;
> +
> +	if (opcode1 =3D=3D NAND_CMD_ERASE1 && opcode2 =3D=3D NAND_CMD_ERASE2)
> +		return 0;
> +
> +	if (opcode1 =3D=3D NAND_CMD_SEQIN && opcode2 =3D=3D NAND_CMD_PAGEPROG)
> +		return 0;
> +
> +	dev_err(dev, "unsupported opcode sequence: %x %x", opcode1,
> opcode2);

Ditto

> +
> +	return -EOPNOTSUPP;
> +}

...

> +static int ls1x_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
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
> +	case SZ_8G:
> +		cell_size =3D 0x6;
> +		break;
> +	case SZ_16G:
> +		cell_size =3D 0x7;
> +		break;
> +	default:
> +		dev_err(host->dev, "unsupported chip size: %llu MB\n", chipsize);
> +		return -EOPNOTSUPP;

EINVAL

> +	}
> +
> +	switch (chip->ecc.engine_type) {
> +	case NAND_ECC_ENGINE_TYPE_NONE:
> +		dev_info(host->dev, "No ECC\n");

Please drop

> +		break;
> +	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		dev_info(host->dev, "using SW ECC\n");

Drop

> +		break;
> +	default:
> +		dev_err(host->dev, "ECC mode %d not supported\n",
> chip->ecc.engine_type);

Drop

> +		return -EINVAL;
> +	}
> +
> +	/* set cell size */
> +	regmap_update_bits(host->regmap, LS1X_NAND_PARAM, LS1X_NAND_CELL_SIZE_M=
ASK,
> +			   FIELD_PREP(LS1X_NAND_CELL_SIZE_MASK, cell_size));
> +
> +	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_HOLD_CYCLE=
_MASK,
> +			   FIELD_PREP(LS1X_NAND_HOLD_CYCLE_MASK, host->data->hold_cycle));
> +
> +	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_WAIT_CYCLE=
_MASK,
> +			   FIELD_PREP(LS1X_NAND_WAIT_CYCLE_MASK, host->data->wait_cycle));
> +
> +	chip->ecc.read_page_raw =3D nand_monolithic_read_page_raw;
> +	chip->ecc.write_page_raw =3D nand_monolithic_write_page_raw;
> +
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops ls1x_nand_controller_ops =3D {
> +	.exec_op =3D ls1x_nand_exec_op,
> +	.attach_chip =3D ls1x_nand_attach_chip,
> +};
> +
> +static void ls1x_nand_controller_cleanup(struct ls1x_nand_host *host)
> +{
> +	if (host->dma_chan)
> +		dma_release_channel(host->dma_chan);
> +}
> +
> +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
> +{
> +	struct device *dev =3D host->dev;
> +	struct dma_chan *chan;
> +	struct dma_slave_config cfg =3D {};
> +	int ret;
> +
> +	host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &ls1x_nand_=
regmap_config);
> +	if (IS_ERR(host->regmap))
> +		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regma=
p\n");
> +
> +	chan =3D dma_request_chan(dev, "rxtx");
> +	if (IS_ERR(chan))
> +		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channe=
l\n");
> +	host->dma_chan =3D chan;
> +
> +	cfg.src_addr =3D host->dma_base;
> +	cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cfg.dst_addr =3D host->dma_base;
> +	cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	ret =3D dmaengine_slave_config(host->dma_chan, &cfg);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to config DMA channel\n");
> +
> +	init_completion(&host->dma_complete);
> +
> +	dev_dbg(dev, "got %s for %s access\n",
> dma_chan_name(host->dma_chan), dev_name(dev));

You can drop this one as well

> +
> +	return 0;
> +}

Thanks,
Miqu=C3=A8l

