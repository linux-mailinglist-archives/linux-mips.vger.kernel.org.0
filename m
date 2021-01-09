Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231FC2EFE45
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 08:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbhAIHXH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 02:23:07 -0500
Received: from mout.gmx.net ([212.227.15.15]:44353 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbhAIHXH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Jan 2021 02:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610176889;
        bh=5vdPI0V+NcMNmHNuS0YWvFZNaHqGWOhLCSzHFqUiyDs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=In1PPzykFYJhc5kp0R9W7sEH+rfJXS7peOUjIYMk/l2GhdjxYrIuZWCp+TpAxo8JA
         ZfWu+in12RFs8CjZzv78VqDLKX0jprr6Mny7v8RwAyHbX0+2tVuDPFHmvbmHk/c3UH
         nUZ8FZm8WARYJM1FIzlPrUkxXd6lOLAWUYzueWdk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N7R1T-1jsqZx2TIz-017pqs; Sat, 09
 Jan 2021 08:21:28 +0100
Date:   Sat, 9 Jan 2021 09:23:03 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
In-Reply-To: <s5hsg7byezb.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x0HV7yJcImTUqFGwE9PWMEUYeuWK8Sl4nP0Xk2WyIAT93XIuRsm
 yxIkXAl+ko9gQs0z0vTkSQCtWF5d0MTi+xwlarCEJfhIAaOp7QgPuY+TLxI1KLLfzpMosP1
 Smo1Ay5zMquXMIIwierjn4DQapwXMcTlH+cpWGpt77OKhSZVgHDo9z+pAynQm13VsyAvSMW
 zTVSvvwPNv0xaG1nntLBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6YG+28KKhfw=:66C48Pm4Mnm+CwR7MhWe5d
 M2W5UsRhpGMtI3kQkOEPxSYao3MtIh6lSTIJ7f8OOAp3scSmj8kQ/pnLoYdXMrlz02XiAJG7P
 n5fQQh8rdccKVfSGyG+MXsb1vhmJnVfxpKdtjdgrvXiN47jJqF6LAvbkTr0fQEi9jQbSfMoLq
 2hgZC9gc3hIzcYFPgEfBA+QAmJ9ota48qZooL/kqKyIxsVl1Rw8UuolNHHffsf410PawyqW1v
 C7+PjEc0P6/zvwpJ7gA9c8Rlr8sF8YK2tSGmgcMuJaybReg7UmwH17I/QXyXnJgVs1ChHUTOe
 wOl1QTzPzSMMzSuA7W9KvFnQt5edhRVzlc4qY2Gd17LLoHvV3U5CR0gh3bLe+DfRiYEs34N2R
 Mn/ycfFZbGLvAGX9gE8ep4nk4vytSwUDbL1EwgUmzi3CsYSHLACgRgTNPJQQBxnYy5MRqngo0
 NDWMng85UdFaz0edPOJQP1OqQIcP1JW0WaGrXfTN0QmEn9HzYuiNQcFOxeoUGRfSP6CI12hci
 ftSPFKuQfyB7btU1VE6E9mQhCQpc/MSLzEg/LEXSomA4pVz9BtyYA8PUWRh0fbTfQ7uv1x8dw
 RSJ0Gy4GY1DlnreCYn4JWeBxjIYaQgLdg82Vik4q9esid4XFGIsudBo695exVMRRPJp0BeuNN
 MJ3P7X0sWM5krrDLHIrgzRncG6c20qK87ZZgol5sqAtMbP0Mnh6DeopepJ8lXo3erhzxXAmEc
 oP+cFLpJLyHa23+Q1DwPUKjbmDCn8JlA3yhX+Ty+APJhCojLhKsfNHFWlOKfUs+Ymf8EDnh1R
 ErkgE6uOFyhc2sDcSY59os4SA6nhGr+NRYT4UYzrthpIU6URaweBnnDvTcD1snmJnq+vjaEq+
 jr4O3jOS/js3mdjr08Cw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, 08 Jan 2021 10:06:48 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > +static const struct snd_pcm_hardware n64audio_pcm_hw =3D {
> > +	.info =3D (SNDRV_PCM_INFO_MMAP |
> > +		 SNDRV_PCM_INFO_MMAP_VALID |
> > +		 SNDRV_PCM_INFO_INTERLEAVED |
> > +		 SNDRV_PCM_INFO_BLOCK_TRANSFER),
> > +	.formats =3D          SNDRV_PCM_FMTBIT_S16_BE,
> > +	.rates =3D            SNDRV_PCM_RATE_8000_48000,
> > +	.rate_min =3D         8000,
> > +	.rate_max =3D         48000,
> > +	.channels_min =3D     2,
> > +	.channels_max =3D     2,
> > +	.buffer_bytes_max =3D 32768,
> > +	.period_bytes_min =3D 1024,
> > +	.period_bytes_max =3D 32768,
> > +	.periods_min =3D      1,
>
> periods_min=3D1 makes little sense for this driver.

I have some questions about this.

When I had periods_min =3D 128, OSS apps were broken. I mean simple ones,
open /dev/dsp, ioctl the format/rate/stereo, write data. They got an IO
error errno IIRC, and no clarifying error in dmesg.

I tried following the error with printks, several levels deep. I gave
up when it got to the constraint resolving function, and there was no
good way to print and track which constraint failed, why, and who set
the constraint.

Only through blind guessing did I stumble upon periods_min.

- why did it break OSS apps?
- how does the OSS layer interact with periods? I didn't find any "set
period" ioctl
- why was there no clarifying error in dmesg? Just an errno that means
a million things makes it impossible for the userspace app writer to
know why it's not working

- Lauri
