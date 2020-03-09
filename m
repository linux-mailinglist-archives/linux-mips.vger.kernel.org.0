Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0EE17DA3D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2020 09:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCIIHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Mar 2020 04:07:16 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38331 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIIHQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Mar 2020 04:07:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id h5so597802edn.5
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2020 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jU5HCNu5LHJBqwf2FDExKyf/PsGf9srZP9iBKSdcsuA=;
        b=tRsvTPt9SW8jhfiFmi8uPEQCB+A+CI/oGpQlKbMft+hAFfBApms0FdY71pS7nIyUbl
         m/fTtu12ROh5wPRHzymd6jGlFW8teGwJXZN75P42Zfq0hRei+8UFf8GU7+/ce3sTMs/4
         GaRlObyhbRc5eNvET384aLmqkujipnj8RfOEfQnwhCaQcL6ckR7YdAwxdcpRlytSRsVv
         n10G+X7aL5asmy58eCa7R3SKCWQrt++A6ngjnSolaWH9FALP5k5LUiFfASCm315/BQvF
         QUkoAoMJ5JWOR4lsnQS2iVhgIABLNEhh7r/TgzwqIsiP0knN+Il59cAaz0jyCU4GNxoo
         DKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jU5HCNu5LHJBqwf2FDExKyf/PsGf9srZP9iBKSdcsuA=;
        b=LJ+CNLAw31iz3icVO2E0/WKw75CeSx972uKOrpAPefNcQ7pi5Kh/1TyE1cs711Ro3M
         M0WqirSBzNGxn1KTg/5uJIj4Svu4QgG3tudfdSbvzZ6KVf5aGjMNc/koImj4SjjgHk8I
         B1Lv5/xTYaIKvMpC/TmLuYGxg04rPXFc/6cakn76SlB+huV3Mdds0AdHD0NOX+Eb3Zvg
         rtsrcbDABzUOn0Adzruqm38lgj3ck28Y6zt/HTC4poq5rVBHyzplNL6PPRcHQHyKnv85
         Ulx1TFJumqTQRyIjT4EhnTI3AU9eicyD/nllkzII4P/xtB8caB/XhP3mMoOG70tYHhpC
         m5RA==
X-Gm-Message-State: ANhLgQ2s3Rps2Fku8xkuQdEo4t/+WRsBCMQvgisOLpVs6DQOrnjj1QWS
        NO0vR3XrkAB8gmSQKJp4HJr1AzSWG2sJLh91rOGuB1Ue
X-Google-Smtp-Source: ADFU+vuOxSNdQ4/wNNRNiao8BRAEnw5xZdg+DXhlJFwkh0zRlF13zL9C6bSSeRAtIXkJVqyMWzUcfrcyQQn91de0gN4=
X-Received: by 2002:a50:9ac3:: with SMTP id p61mr565106edb.107.1583741233708;
 Mon, 09 Mar 2020 01:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAD4NMubBz2HP3CaS3F+sNPa_K8TvfZe3r8zz-ynsXy7tWH4PLQ@mail.gmail.com>
In-Reply-To: <CAD4NMubBz2HP3CaS3F+sNPa_K8TvfZe3r8zz-ynsXy7tWH4PLQ@mail.gmail.com>
From:   Cye Borg <cyborgyn@gmail.com>
Date:   Mon, 9 Mar 2020 09:07:06 +0100
Message-ID: <CAD4NMubNZO8DD3C39pHvp5r8pTbm9bqqgn_7kqd3EzyZoPAE_g@mail.gmail.com>
Subject: Re: [PATCH 4.19] sound/mips/hal2.c seg fault fix for Indigo2 Impact10k
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Forgot the Signed-off-by, added


On Sun, Mar 8, 2020 at 9:37 PM Cye Borg <cyborgyn@gmail.com> wrote:
>
> With kernel 4.19.79, the hal2 sound driver on real SGI Indigo2 Impact
> 10000, the sound driver segmentation faulted like "CPU 0 Unable to
> handle kernel paging request at virtual address..." due to improper
> usage of dma_alloc_attrs, with dev =3D=3D NULL.
>
> The patch back ports 5.6 hal2.c aligning to 4.19 ALSA API.
>
Signed-off-by: Barnab=C3=A1s Vir=C3=A1g <cyborgyn@gmail.com>

> Index: hal2.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- hal2.c    (revision 70)
> +++ hal2.c    (revision 72)
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   *  Driver for A2 audio system used in SGI machines
>   *  Copyright (c) 2008 Thomas Bogendoerfer <tsbogend@alpha.fanken.de>
> @@ -4,20 +5,6 @@
>   *
>   *  Based on OSS code from Ladislav Michl <ladis@linux-mips.org>, which
>   *  was based on code from Ulf Carlsson
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License version 2 as
> - *  published by the Free Software Foundation.
> - *
> - *  This program is distributed in the hope that it will be useful,
> - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *  GNU General Public License for more details.
> - *
> - *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, write to the Free Software
> - *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> - *
>   */
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> @@ -454,21 +441,24 @@
>      hal2->adc.pbus.pbus->pbdma_ctrl =3D HPC3_PDMACTRL_LD;
>  }
>
> -static int hal2_alloc_dmabuf(struct hal2_codec *codec)
> +static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *c=
odec)
>  {
> +    struct device *dev =3D hal2->card->dev;
>      struct hal2_desc *desc;
>      dma_addr_t desc_dma, buffer_dma;
>      int count =3D H2_BUF_SIZE / H2_BLOCK_SIZE;
>      int i;
>
> -    codec->buffer =3D dma_alloc_attrs(NULL, H2_BUF_SIZE, &buffer_dma,
> +    dev->coherent_dma_mask =3D DMA_BIT_MASK(32) & ~0x3f;
> +    dev->dma_mask =3D &dev->coherent_dma_mask;
> +    codec->buffer =3D dma_alloc_attrs(dev, H2_BUF_SIZE, &buffer_dma,
>                      GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
>      if (!codec->buffer)
>          return -ENOMEM;
> -    desc =3D dma_alloc_attrs(NULL, count * sizeof(struct hal2_desc),
> +    desc =3D dma_alloc_attrs(dev, count * sizeof(struct hal2_desc),
>                     &desc_dma, GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
>      if (!desc) {
> -        dma_free_attrs(NULL, H2_BUF_SIZE, codec->buffer, buffer_dma,
> +        dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, buffer_dma,
>                     DMA_ATTR_NON_CONSISTENT);
>          return -ENOMEM;
>      }
> @@ -482,17 +472,19 @@
>                desc_dma : desc_dma + (i + 1) * sizeof(struct hal2_desc);
>          desc++;
>      }
> -    dma_cache_sync(NULL, codec->desc, count * sizeof(struct hal2_desc),
> +    dma_cache_sync(dev, codec->desc, count * sizeof(struct hal2_desc),
>                 DMA_TO_DEVICE);
>      codec->desc_count =3D count;
>      return 0;
>  }
>
> -static void hal2_free_dmabuf(struct hal2_codec *codec)
> +static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *c=
odec)
>  {
> -    dma_free_attrs(NULL, codec->desc_count * sizeof(struct hal2_desc),
> +    struct device *dev =3D hal2->card->dev;
> +
> +    dma_free_attrs(dev, codec->desc_count * sizeof(struct hal2_desc),
>                 codec->desc, codec->desc_dma, DMA_ATTR_NON_CONSISTENT);
> -    dma_free_attrs(NULL, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
> +    dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
>                 DMA_ATTR_NON_CONSISTENT);
>  }
>
> @@ -500,7 +492,8 @@
>      .info =3D (SNDRV_PCM_INFO_MMAP |
>           SNDRV_PCM_INFO_MMAP_VALID |
>           SNDRV_PCM_INFO_INTERLEAVED |
> -         SNDRV_PCM_INFO_BLOCK_TRANSFER),
> +         SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +         SNDRV_PCM_INFO_SYNC_APPLPTR),
>      .formats =3D          SNDRV_PCM_FMTBIT_S16_BE,
>      .rates =3D            SNDRV_PCM_RATE_8000_48000,
>      .rate_min =3D         8000,
> @@ -515,20 +508,20 @@
>  };
>
>  static int hal2_pcm_hw_params(struct snd_pcm_substream *substream,
> -                  struct snd_pcm_hw_params *params)
> +                             struct snd_pcm_hw_params *params)
>  {
> -    int err;
> +       int err;
>
> -    err =3D snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(para=
ms));
> -    if (err < 0)
> -        return err;
> +       err =3D snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(p=
arams));
> +       if (err < 0)
> +               return err;
>
> -    return 0;
> +       return 0;
>  }
>
>  static int hal2_pcm_hw_free(struct snd_pcm_substream *substream)
>  {
> -    return snd_pcm_lib_free_pages(substream);
> +       return snd_pcm_lib_free_pages(substream);
>  }
>
>  static int hal2_playback_open(struct snd_pcm_substream *substream)
> @@ -539,7 +532,7 @@
>
>      runtime->hw =3D hal2_pcm_hw;
>
> -    err =3D hal2_alloc_dmabuf(&hal2->dac);
> +    err =3D hal2_alloc_dmabuf(hal2, &hal2->dac);
>      if (err)
>          return err;
>      return 0;
> @@ -549,7 +542,7 @@
>  {
>      struct snd_hal2 *hal2 =3D snd_pcm_substream_chip(substream);
>
> -    hal2_free_dmabuf(&hal2->dac);
> +    hal2_free_dmabuf(hal2, &hal2->dac);
>      return 0;
>  }
>
> @@ -563,6 +556,8 @@
>      dac->sample_rate =3D hal2_compute_rate(dac, runtime->rate);
>      memset(&dac->pcm_indirect, 0, sizeof(dac->pcm_indirect));
>      dac->pcm_indirect.hw_buffer_size =3D H2_BUF_SIZE;
> +    dac->pcm_indirect.hw_queue_size =3D H2_BUF_SIZE / 2;
> +    dac->pcm_indirect.hw_io =3D dac->buffer_dma;
>      dac->pcm_indirect.sw_buffer_size =3D snd_pcm_lib_buffer_bytes(substr=
eam);
>      dac->substream =3D substream;
>      hal2_setup_dac(hal2);
> @@ -575,9 +570,6 @@
>
>      switch (cmd) {
>      case SNDRV_PCM_TRIGGER_START:
> -        hal2->dac.pcm_indirect.hw_io =3D hal2->dac.buffer_dma;
> -        hal2->dac.pcm_indirect.hw_data =3D 0;
> -        substream->ops->ack(substream);
>          hal2_start_dac(hal2);
>          break;
>      case SNDRV_PCM_TRIGGER_STOP:
> @@ -606,7 +598,7 @@
>      unsigned char *buf =3D hal2->dac.buffer + rec->hw_data;
>
>      memcpy(buf, substream->runtime->dma_area + rec->sw_data, bytes);
> -    dma_cache_sync(NULL, buf, bytes, DMA_TO_DEVICE);
> +    dma_cache_sync(hal2->card->dev, buf, bytes, DMA_TO_DEVICE);
>
>  }
>
> @@ -615,7 +607,6 @@
>      struct snd_hal2 *hal2 =3D snd_pcm_substream_chip(substream);
>      struct hal2_codec *dac =3D &hal2->dac;
>
> -    dac->pcm_indirect.hw_queue_size =3D H2_BUF_SIZE / 2;
>      return snd_pcm_indirect_playback_transfer(substream,
>                            &dac->pcm_indirect,
>                            hal2_playback_transfer);
> @@ -630,7 +621,7 @@
>
>      runtime->hw =3D hal2_pcm_hw;
>
> -    err =3D hal2_alloc_dmabuf(adc);
> +    err =3D hal2_alloc_dmabuf(hal2, adc);
>      if (err)
>          return err;
>      return 0;
> @@ -640,7 +631,7 @@
>  {
>      struct snd_hal2 *hal2 =3D snd_pcm_substream_chip(substream);
>
> -    hal2_free_dmabuf(&hal2->adc);
> +    hal2_free_dmabuf(hal2, &hal2->adc);
>      return 0;
>  }
>
> @@ -655,6 +646,7 @@
>      memset(&adc->pcm_indirect, 0, sizeof(adc->pcm_indirect));
>      adc->pcm_indirect.hw_buffer_size =3D H2_BUF_SIZE;
>      adc->pcm_indirect.hw_queue_size =3D H2_BUF_SIZE / 2;
> +    adc->pcm_indirect.hw_io =3D adc->buffer_dma;
>      adc->pcm_indirect.sw_buffer_size =3D snd_pcm_lib_buffer_bytes(substr=
eam);
>      adc->substream =3D substream;
>      hal2_setup_adc(hal2);
> @@ -667,9 +659,6 @@
>
>      switch (cmd) {
>      case SNDRV_PCM_TRIGGER_START:
> -        hal2->adc.pcm_indirect.hw_io =3D hal2->adc.buffer_dma;
> -        hal2->adc.pcm_indirect.hw_data =3D 0;
> -        printk(KERN_DEBUG "buffer_dma %x\n", hal2->adc.buffer_dma);
>          hal2_start_adc(hal2);
>          break;
>      case SNDRV_PCM_TRIGGER_STOP:
> @@ -697,7 +686,7 @@
>      struct snd_hal2 *hal2 =3D snd_pcm_substream_chip(substream);
>      unsigned char *buf =3D hal2->adc.buffer + rec->hw_data;
>
> -    dma_cache_sync(NULL, buf, bytes, DMA_FROM_DEVICE);
> +    dma_cache_sync(hal2->card->dev, buf, bytes, DMA_FROM_DEVICE);
>      memcpy(substream->runtime->dma_area + rec->sw_data, buf, bytes);
>  }
