Return-Path: <linux-mips+bounces-8241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAEA69E1F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 03:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2057419C429F
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 02:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFE71B81DC;
	Thu, 20 Mar 2025 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTbi9a53"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8C40BF5;
	Thu, 20 Mar 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436805; cv=none; b=RsTmYMMyg3m2MvWyMlJtzVo0ClGluryTM/nkq755Q6FsTy1ud8L4MncKaZRbYuHjAIDAKH8CrasA221yDTvgHs5XoSiC1EtXeyQpqZa/Xpz/LhPXfgCDIU8lbh9sYslPU1LlyuVOd3fa+hxn0qdDDLtWcliqL964Rj3hXqnO18s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436805; c=relaxed/simple;
	bh=gfZWRj+lQIeSsYAykqLC8g46kCLMqNUiLBNF3M7AY14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8ZNKTcc3svv2t4o3S69iki8quYNTv/9oQa+NMA2ta4PB8/TEPyfg6pnUxmXhUKMM6jIUy7zIAE2fl3v+5fyKn4l1vQ4Rd7wFbUtmAagehjL/hQuVwzyryB2LHiIQ9jcK7toN3uUnHL/lfpzTUtbYndL/6Njp2VXZh+bbnFbGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTbi9a53; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso447474a12.1;
        Wed, 19 Mar 2025 19:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742436801; x=1743041601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JLMbAgAgKeidie/Ke22eutDzyQShCbri+q1n+qcSFI=;
        b=kTbi9a539k/ivriMUv/cFdWkeiGlDQqpHd6eakfxcfN+i5Ean+LIJzj+FzccHQBy/7
         R8+AyBpG87hXChQvT/rlQPzGHG03kexxJUH5m5u1kaiVVOkfclv/7m/62r2QDsUvUbSp
         hyn0SxsT+RyZuPL2nSswo375qUJNg00jlsUAYe5EJBJdnKewf9TY/W3edRjWCCXyuXqf
         CJY1s8GQfGnGa5+UdUfN1C8p0m/mXqW8B4RBHhJzqHAB/p8gLHdwebC2NNUp4SJpkOI9
         jh+zKe3zoSfBUGG9OWeO2mmxAQBtzcWLpY8nR0IbYH27MAGE7LXGW82pUp2d+7ZyvKsf
         UtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436801; x=1743041601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JLMbAgAgKeidie/Ke22eutDzyQShCbri+q1n+qcSFI=;
        b=RofRI360VURd69/BqZzvOXnQauJtcOLMW9o9g19AHYsWlTpsaSlksg9LuWI2viopfL
         UJehIksIY33/erUylLKkMNHMxqzgmrcFIouuewqQEvmqQP/thYeSpca39f7uzhEcr0+1
         8/R7p85lr88fRsuF1pbgt0OsSxA2QaxJ7PcZvZ11+V8gjY3xt8v4Pf3MMW6kjxAHUK2A
         UxWLF85SnIwLCzbbkXhV4MIDyH7p7RLQ9JkgEGoWSS6pjMweZ2lvlQfBNVA0tdorF8qR
         DCkndz7ARmIo7Dv7D5+YsPNkrqtl7xOmHNjodtnHBsTjTq62P1U97D5aLzZ7XmRtY0yZ
         Zu2A==
X-Forwarded-Encrypted: i=1; AJvYcCUFruh9iIus/G52gXfLFb6AUocGVtrgU6vauitgn8QwzD/WqLA0k/Ut/pxrUKKuUYXwOkrGmFpas9VMAty/@vger.kernel.org, AJvYcCWt+bequTk05VaKrXadAYt5o5FRv9G7jLLiJwnkXu7MLT+gw+7QwBkzp8scao3gkiwvAvf+Rs7vmsSFJg==@vger.kernel.org, AJvYcCXcw7CEHcvYQP8s8oeTQU3LGDjxIihoaRI5qDqaTefKQynnAmsBaQvgqRLgztF9RSP9kZ6sJPwWNbMd@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBLis3XLOOGIVv59ny6DitiYUEe6jsPshOZV7GFDCzXTIVG0u
	F1AYSnd/0pkMtSWmnAhmXo1GYHoY4dSnp1aitC7OE1IXKH+iznUhcazWhTwycdZMDOMokWxyOK4
	8UuYGVd1Pksija7UyIHQBlxUnBtmeT6K1BLk=
X-Gm-Gg: ASbGncvBPReIJJP+sozRpkCeQfyfoWAYCMcnA2dvgn4nhUZ6GCWPYLUiXX69bYK3lm0
	rMBpVnsGNfvrK2UbqVmpV5AeHNnSExutImzEmHT+uWOxG4HPTT6QVfwOYXfvVuacFFuosZoPH9J
	uYyE+T5YApNgHkNIqCZa11IQhCYZI=
X-Google-Smtp-Source: AGHT+IGs6yxd4PScR0k0nCesuh/nz5UOHksdot2GQtn9eGg4JR4M0cdphOjb338WAb/zo3BUu9AUpoe9kKqCszgARgU=
X-Received: by 2002:a05:6402:51cb:b0:5e5:4807:5441 with SMTP id
 4fb4d7f45d1cf-5eb80fcc869mr5381744a12.30.1742436801190; Wed, 19 Mar 2025
 19:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com>
 <20250305-loongson1-nand-v13-2-a5bac21631cd@gmail.com> <877c4m71t3.fsf@bootlin.com>
In-Reply-To: <877c4m71t3.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 20 Mar 2025 10:12:45 +0800
X-Gm-Features: AQ5f1Jq3Owow7wsMY7233_XlWFTLRACwr0fbC50m5J26NbmVVS4ilWegUzEKxhw
Message-ID: <CAJhJPsWX0-3XkTU98d_ZGfkPiG=2294WHnULdaQWVOx7dkJP-Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 12:15=E2=80=AFAM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hello Keguang,
>
> I guess I am mostly fine with the driver, it's probably time to merge
> it. Just a few final changes below, I plan on merging it at -rc1.
>

Great!
I will fix the following lines ASAP.
Thanks!

> > +     case NAND_CMD_READSTART:
> > +             if (!op->is_read)
> > +                     return -EOPNOTSUPP;
> > +             op->cmd_reg =3D LS1X_NAND_CMD_READ;
> > +             break;
> > +     case NAND_CMD_RNDOUT:
> > +             op->is_change_column =3D true;
> > +             break;
> > +     case NAND_CMD_RNDOUTSTART:
> > +             if (!op->is_change_column)
> > +                     return -EOPNOTSUPP;
> > +             op->cmd_reg =3D LS1X_NAND_CMD_READ;
> > +             break;
> > +     default:
> > +             dev_err(host->dev, "unsupported opcode: %u\n", opcode);
>
> No error message in the normal path. This should be a debug log at
> most. This function is called in the check_only path.
>
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const s=
truct nand_subop *subop)
> > +{
> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> > +     struct ls1x_nand_op op =3D {};
> > +     int i, ret;
> > +     union {
> > +             char ids[5];
> > +             struct {
> > +                     int idl;
> > +                     char idh;
> > +             };
> > +     } nand_id;
> > +
> > +     ret =3D ls1x_nand_misc_type_exec(chip, subop, &op);
> > +     if (ret) {
> > +             dev_err(host->dev, "failed to read ID! %d\n", ret);
>
> No print here, it's not useful.
>
> > +             return ret;
> > +     }
> > +
> > +     nand_id.idl =3D readl(host->reg_base + LS1X_NAND_IDL);
> > +     nand_id.idh =3D readb(host->reg_base + LS1X_NAND_IDH_STATUS);
> > +
> > +     for (i =3D 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
> > +             op.buf[i] =3D nand_id.ids[sizeof(nand_id.ids) - 1 - i];
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +static int ls1x_nand_is_valid_cmd(struct device *dev, u8 opcode)
> > +{
> > +     if (opcode =3D=3D NAND_CMD_STATUS || opcode =3D=3D NAND_CMD_RESET=
 || opcode =3D=3D NAND_CMD_READID)
> > +             return 0;
> > +
> > +     dev_err(dev, "unsupported opcode: %x", opcode);
>
> Ditto
>
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static int ls1x_nand_is_valid_cmd_seq(struct device *dev, u8 opcode1, =
u8 opcode2)
> > +{
> > +     if (opcode1 =3D=3D NAND_CMD_RNDOUT && opcode2 =3D=3D NAND_CMD_RND=
OUTSTART)
> > +             return 0;
> > +
> > +     if (opcode1 =3D=3D NAND_CMD_READ0 && opcode2 =3D=3D NAND_CMD_READ=
START)
> > +             return 0;
> > +
> > +     if (opcode1 =3D=3D NAND_CMD_ERASE1 && opcode2 =3D=3D NAND_CMD_ERA=
SE2)
> > +             return 0;
> > +
> > +     if (opcode1 =3D=3D NAND_CMD_SEQIN && opcode2 =3D=3D NAND_CMD_PAGE=
PROG)
> > +             return 0;
> > +
> > +     dev_err(dev, "unsupported opcode sequence: %x %x", opcode1,
> > opcode2);
>
> Ditto
>
> > +
> > +     return -EOPNOTSUPP;
> > +}
>
> ...
>
> > +static int ls1x_nand_attach_chip(struct nand_chip *chip)
> > +{
> > +     struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> > +     u64 chipsize =3D nanddev_target_size(&chip->base);
> > +     int cell_size =3D 0;
> > +
> > +     switch (chipsize) {
> > +     case SZ_128M:
> > +             cell_size =3D 0x0;
> > +             break;
> > +     case SZ_256M:
> > +             cell_size =3D 0x1;
> > +             break;
> > +     case SZ_512M:
> > +             cell_size =3D 0x2;
> > +             break;
> > +     case SZ_1G:
> > +             cell_size =3D 0x3;
> > +             break;
> > +     case SZ_2G:
> > +             cell_size =3D 0x4;
> > +             break;
> > +     case SZ_4G:
> > +             cell_size =3D 0x5;
> > +             break;
> > +     case SZ_8G:
> > +             cell_size =3D 0x6;
> > +             break;
> > +     case SZ_16G:
> > +             cell_size =3D 0x7;
> > +             break;
> > +     default:
> > +             dev_err(host->dev, "unsupported chip size: %llu MB\n", ch=
ipsize);
> > +             return -EOPNOTSUPP;
>
> EINVAL
>
> > +     }
> > +
> > +     switch (chip->ecc.engine_type) {
> > +     case NAND_ECC_ENGINE_TYPE_NONE:
> > +             dev_info(host->dev, "No ECC\n");
>
> Please drop
>
> > +             break;
> > +     case NAND_ECC_ENGINE_TYPE_SOFT:
> > +             dev_info(host->dev, "using SW ECC\n");
>
> Drop
>
> > +             break;
> > +     default:
> > +             dev_err(host->dev, "ECC mode %d not supported\n",
> > chip->ecc.engine_type);
>
> Drop
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* set cell size */
> > +     regmap_update_bits(host->regmap, LS1X_NAND_PARAM, LS1X_NAND_CELL_=
SIZE_MASK,
> > +                        FIELD_PREP(LS1X_NAND_CELL_SIZE_MASK, cell_size=
));
> > +
> > +     regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_HOLD=
_CYCLE_MASK,
> > +                        FIELD_PREP(LS1X_NAND_HOLD_CYCLE_MASK, host->da=
ta->hold_cycle));
> > +
> > +     regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_WAIT=
_CYCLE_MASK,
> > +                        FIELD_PREP(LS1X_NAND_WAIT_CYCLE_MASK, host->da=
ta->wait_cycle));
> > +
> > +     chip->ecc.read_page_raw =3D nand_monolithic_read_page_raw;
> > +     chip->ecc.write_page_raw =3D nand_monolithic_write_page_raw;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct nand_controller_ops ls1x_nand_controller_ops =3D {
> > +     .exec_op =3D ls1x_nand_exec_op,
> > +     .attach_chip =3D ls1x_nand_attach_chip,
> > +};
> > +
> > +static void ls1x_nand_controller_cleanup(struct ls1x_nand_host *host)
> > +{
> > +     if (host->dma_chan)
> > +             dma_release_channel(host->dma_chan);
> > +}
> > +
> > +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
> > +{
> > +     struct device *dev =3D host->dev;
> > +     struct dma_chan *chan;
> > +     struct dma_slave_config cfg =3D {};
> > +     int ret;
> > +
> > +     host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &ls1x=
_nand_regmap_config);
> > +     if (IS_ERR(host->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(host->regmap), "failed =
to init regmap\n");
> > +
> > +     chan =3D dma_request_chan(dev, "rxtx");
> > +     if (IS_ERR(chan))
> > +             return dev_err_probe(dev, PTR_ERR(chan), "failed to reque=
st DMA channel\n");
> > +     host->dma_chan =3D chan;
> > +
> > +     cfg.src_addr =3D host->dma_base;
> > +     cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +     cfg.dst_addr =3D host->dma_base;
> > +     cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +     ret =3D dmaengine_slave_config(host->dma_chan, &cfg);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to config DMA chan=
nel\n");
> > +
> > +     init_completion(&host->dma_complete);
> > +
> > +     dev_dbg(dev, "got %s for %s access\n",
> > dma_chan_name(host->dma_chan), dev_name(dev));
>
> You can drop this one as well
>
> > +
> > +     return 0;
> > +}
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

