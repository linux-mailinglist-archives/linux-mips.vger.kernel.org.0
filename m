Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF69317D628
	for <lists+linux-mips@lfdr.de>; Sun,  8 Mar 2020 21:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgCHUiB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Mar 2020 16:38:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46432 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgCHUiA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Mar 2020 16:38:00 -0400
Received: by mail-ed1-f66.google.com with SMTP id ca19so584291edb.13
        for <linux-mips@vger.kernel.org>; Sun, 08 Mar 2020 13:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=rAFasilENw0z5Ex1/dXflZpa4EQkd0E3+LERiA0sSYI=;
        b=LAlX0GzLxt6yjRvuiCyCPhf8VM9MYT2QSPrxPsdQrqWZ524rgO+Y8ExWfUsoF3/4ph
         V6AOmyg3Fb+2ouvrkSaSyNdSbM4HwltjiSLSvvOHRYAmHWY053MqcIpAgWCjAVEzWT3W
         7p6X5ujXuCq6Op5oOil/RLa64RJZ9FrXGQgWnKYjMLfopH5tN88YwxxtOojW6l+bedLo
         eUKRLg4aVM7YW1QGeF0Q+4TAwy45VKL1+AyaW9uaE9BkoXx86v9fLKwkVIH7C54BiZrC
         vWXKXXmkfF+8UsWl9tTKBAe2xY3aATAIxKpWNo3TgU4GnQUhIpcx6lBC/6GVgfh+aa9V
         1NFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rAFasilENw0z5Ex1/dXflZpa4EQkd0E3+LERiA0sSYI=;
        b=MgXvAXjasmVxu0dpvaYQBQMvXtrVdS4AlerJ6Kr1JpXLbRuhfh9JQf8WtwCZ3acKEJ
         dMFOgCDXdxh6u5grWaPk+TXbxs1D4RX0NCiruxjCf/s2MFTl1tKGVM+mHDsdX4pl5Df8
         SkKBjAGrGxdJYXUWT4cvZQWdsFdDq6GARiBOLtX5lvJnnBto60p8dg4yS5bvrIPVYQli
         G9aVpVdMS2ZmSvpeQFlnZW1KoC8rfnLI2SARK8RjuiQ9ysR99VanKiY4bGBFPOW4M5Fy
         3hpSRryW2K6j/EDOtt9n6JadKk68ideH3JIcqu5crJKcff1YT27fhbpBEFeMtJNWGNe1
         GTAQ==
X-Gm-Message-State: ANhLgQ0tU9QIiqRischj51WrpzKQ7+XC9cl376bgKAxPX4RJRTDC0lzI
        W7xjtmTdpC2l4I01EOV6RYbpwNMeDOUW7m2eO1NXT3q1
X-Google-Smtp-Source: ADFU+vvx7qjV0a4wrNUR1Hb+xQxjAHmTCeGFtD4ueMGpzBwgmS+kv7xu+fT7MdgHwKjnRchcTKEy0mUXOzD+Fnq4D9Y=
X-Received: by 2002:aa7:d452:: with SMTP id q18mr14477873edr.17.1583699877822;
 Sun, 08 Mar 2020 13:37:57 -0700 (PDT)
MIME-Version: 1.0
From:   Cye Borg <cyborgyn@gmail.com>
Date:   Sun, 8 Mar 2020 21:37:49 +0100
Message-ID: <CAD4NMubBz2HP3CaS3F+sNPa_K8TvfZe3r8zz-ynsXy7tWH4PLQ@mail.gmail.com>
Subject: [PATCH 4.19] sound/mips/hal2.c seg fault fix for Indigo2 Impact10k
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With kernel 4.19.79, the hal2 sound driver on real SGI Indigo2 Impact
10000, the sound driver segmentation faulted like "CPU 0 Unable to
handle kernel paging request at virtual address..." due to improper
usage of dma_alloc_attrs, with dev == NULL.

The patch back ports 5.6 hal2.c aligning to 4.19 ALSA API.

Index: hal2.c
===================================================================
--- hal2.c    (revision 70)
+++ hal2.c    (revision 72)
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  Driver for A2 audio system used in SGI machines
  *  Copyright (c) 2008 Thomas Bogendoerfer <tsbogend@alpha.fanken.de>
@@ -4,20 +5,6 @@
  *
  *  Based on OSS code from Ladislav Michl <ladis@linux-mips.org>, which
  *  was based on code from Ulf Carlsson
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  published by the Free Software Foundation.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- *
  */
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -454,21 +441,24 @@
     hal2->adc.pbus.pbus->pbdma_ctrl = HPC3_PDMACTRL_LD;
 }

-static int hal2_alloc_dmabuf(struct hal2_codec *codec)
+static int hal2_alloc_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 {
+    struct device *dev = hal2->card->dev;
     struct hal2_desc *desc;
     dma_addr_t desc_dma, buffer_dma;
     int count = H2_BUF_SIZE / H2_BLOCK_SIZE;
     int i;

-    codec->buffer = dma_alloc_attrs(NULL, H2_BUF_SIZE, &buffer_dma,
+    dev->coherent_dma_mask = DMA_BIT_MASK(32) & ~0x3f;
+    dev->dma_mask = &dev->coherent_dma_mask;
+    codec->buffer = dma_alloc_attrs(dev, H2_BUF_SIZE, &buffer_dma,
                     GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
     if (!codec->buffer)
         return -ENOMEM;
-    desc = dma_alloc_attrs(NULL, count * sizeof(struct hal2_desc),
+    desc = dma_alloc_attrs(dev, count * sizeof(struct hal2_desc),
                    &desc_dma, GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
     if (!desc) {
-        dma_free_attrs(NULL, H2_BUF_SIZE, codec->buffer, buffer_dma,
+        dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, buffer_dma,
                    DMA_ATTR_NON_CONSISTENT);
         return -ENOMEM;
     }
@@ -482,17 +472,19 @@
               desc_dma : desc_dma + (i + 1) * sizeof(struct hal2_desc);
         desc++;
     }
-    dma_cache_sync(NULL, codec->desc, count * sizeof(struct hal2_desc),
+    dma_cache_sync(dev, codec->desc, count * sizeof(struct hal2_desc),
                DMA_TO_DEVICE);
     codec->desc_count = count;
     return 0;
 }

-static void hal2_free_dmabuf(struct hal2_codec *codec)
+static void hal2_free_dmabuf(struct snd_hal2 *hal2, struct hal2_codec *codec)
 {
-    dma_free_attrs(NULL, codec->desc_count * sizeof(struct hal2_desc),
+    struct device *dev = hal2->card->dev;
+
+    dma_free_attrs(dev, codec->desc_count * sizeof(struct hal2_desc),
                codec->desc, codec->desc_dma, DMA_ATTR_NON_CONSISTENT);
-    dma_free_attrs(NULL, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
+    dma_free_attrs(dev, H2_BUF_SIZE, codec->buffer, codec->buffer_dma,
                DMA_ATTR_NON_CONSISTENT);
 }

@@ -500,7 +492,8 @@
     .info = (SNDRV_PCM_INFO_MMAP |
          SNDRV_PCM_INFO_MMAP_VALID |
          SNDRV_PCM_INFO_INTERLEAVED |
-         SNDRV_PCM_INFO_BLOCK_TRANSFER),
+         SNDRV_PCM_INFO_BLOCK_TRANSFER |
+         SNDRV_PCM_INFO_SYNC_APPLPTR),
     .formats =          SNDRV_PCM_FMTBIT_S16_BE,
     .rates =            SNDRV_PCM_RATE_8000_48000,
     .rate_min =         8000,
@@ -515,20 +508,20 @@
 };

 static int hal2_pcm_hw_params(struct snd_pcm_substream *substream,
-                  struct snd_pcm_hw_params *params)
+                             struct snd_pcm_hw_params *params)
 {
-    int err;
+       int err;

-    err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-    if (err < 0)
-        return err;
+       err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
+       if (err < 0)
+               return err;

-    return 0;
+       return 0;
 }

 static int hal2_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-    return snd_pcm_lib_free_pages(substream);
+       return snd_pcm_lib_free_pages(substream);
 }

 static int hal2_playback_open(struct snd_pcm_substream *substream)
@@ -539,7 +532,7 @@

     runtime->hw = hal2_pcm_hw;

-    err = hal2_alloc_dmabuf(&hal2->dac);
+    err = hal2_alloc_dmabuf(hal2, &hal2->dac);
     if (err)
         return err;
     return 0;
@@ -549,7 +542,7 @@
 {
     struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);

-    hal2_free_dmabuf(&hal2->dac);
+    hal2_free_dmabuf(hal2, &hal2->dac);
     return 0;
 }

@@ -563,6 +556,8 @@
     dac->sample_rate = hal2_compute_rate(dac, runtime->rate);
     memset(&dac->pcm_indirect, 0, sizeof(dac->pcm_indirect));
     dac->pcm_indirect.hw_buffer_size = H2_BUF_SIZE;
+    dac->pcm_indirect.hw_queue_size = H2_BUF_SIZE / 2;
+    dac->pcm_indirect.hw_io = dac->buffer_dma;
     dac->pcm_indirect.sw_buffer_size = snd_pcm_lib_buffer_bytes(substream);
     dac->substream = substream;
     hal2_setup_dac(hal2);
@@ -575,9 +570,6 @@

     switch (cmd) {
     case SNDRV_PCM_TRIGGER_START:
-        hal2->dac.pcm_indirect.hw_io = hal2->dac.buffer_dma;
-        hal2->dac.pcm_indirect.hw_data = 0;
-        substream->ops->ack(substream);
         hal2_start_dac(hal2);
         break;
     case SNDRV_PCM_TRIGGER_STOP:
@@ -606,7 +598,7 @@
     unsigned char *buf = hal2->dac.buffer + rec->hw_data;

     memcpy(buf, substream->runtime->dma_area + rec->sw_data, bytes);
-    dma_cache_sync(NULL, buf, bytes, DMA_TO_DEVICE);
+    dma_cache_sync(hal2->card->dev, buf, bytes, DMA_TO_DEVICE);

 }

@@ -615,7 +607,6 @@
     struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
     struct hal2_codec *dac = &hal2->dac;

-    dac->pcm_indirect.hw_queue_size = H2_BUF_SIZE / 2;
     return snd_pcm_indirect_playback_transfer(substream,
                           &dac->pcm_indirect,
                           hal2_playback_transfer);
@@ -630,7 +621,7 @@

     runtime->hw = hal2_pcm_hw;

-    err = hal2_alloc_dmabuf(adc);
+    err = hal2_alloc_dmabuf(hal2, adc);
     if (err)
         return err;
     return 0;
@@ -640,7 +631,7 @@
 {
     struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);

-    hal2_free_dmabuf(&hal2->adc);
+    hal2_free_dmabuf(hal2, &hal2->adc);
     return 0;
 }

@@ -655,6 +646,7 @@
     memset(&adc->pcm_indirect, 0, sizeof(adc->pcm_indirect));
     adc->pcm_indirect.hw_buffer_size = H2_BUF_SIZE;
     adc->pcm_indirect.hw_queue_size = H2_BUF_SIZE / 2;
+    adc->pcm_indirect.hw_io = adc->buffer_dma;
     adc->pcm_indirect.sw_buffer_size = snd_pcm_lib_buffer_bytes(substream);
     adc->substream = substream;
     hal2_setup_adc(hal2);
@@ -667,9 +659,6 @@

     switch (cmd) {
     case SNDRV_PCM_TRIGGER_START:
-        hal2->adc.pcm_indirect.hw_io = hal2->adc.buffer_dma;
-        hal2->adc.pcm_indirect.hw_data = 0;
-        printk(KERN_DEBUG "buffer_dma %x\n", hal2->adc.buffer_dma);
         hal2_start_adc(hal2);
         break;
     case SNDRV_PCM_TRIGGER_STOP:
@@ -697,7 +686,7 @@
     struct snd_hal2 *hal2 = snd_pcm_substream_chip(substream);
     unsigned char *buf = hal2->adc.buffer + rec->hw_data;

-    dma_cache_sync(NULL, buf, bytes, DMA_FROM_DEVICE);
+    dma_cache_sync(hal2->card->dev, buf, bytes, DMA_FROM_DEVICE);
     memcpy(substream->runtime->dma_area + rec->sw_data, buf, bytes);
 }
