Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F292F0269
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 18:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbhAIRqg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 12:46:36 -0500
Received: from mout.gmx.net ([212.227.15.15]:56001 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbhAIRqf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Jan 2021 12:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610214266;
        bh=msmOpBORuqIJvC5jhg413HudLtoM7m9IazyZ6wQd/C8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=QZfveYwItuhlCFAUFHkqjloszktbvKIIz7VIcJwNrkx32Wt+ISTUwU0kZaI3q6CkM
         /xC5LMNzSNxJe4LKZdY0AVNuLy1kOBVV5FwifpN8nF15OnXKzu2bsynoVax6naknbz
         CFXgNRn+FAXbaX2WzIcAg8pv6XK+s2d/+c/dgg74=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MQMuR-1kby2d2POj-00MNTp; Sat, 09
 Jan 2021 18:44:26 +0100
Date:   Sat, 9 Jan 2021 19:46:01 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
In-Reply-To: <s5him86wmnr.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Aa/YQnpZr2O2WHP454OSlkVajkRN1QjT5XEFg/ejOEXadLeDbMA
 J/achbtwUMcTMIZVE/HsQ/DYLnM8i4uXlQG3+Ci7cLJGwzRyXlCND22uAZXXtHU1KUZbelC
 UQlNFcW0dXojvaJjSAl1/aphDQXCQmTSJDcVdtfPDWhQKHnOPHfLGHopPd77s6EmKoD/+7V
 IIWhHGpVzs9O/9zyQMN7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VUQ8CKBjdF4=:VkeI7+lE2yis7F4GPFFnNy
 KUDZpvxF3DeVXQXuvCpt9vxBegtG0jHbJsy4yIyvuzEN1OgO8a9fqDDJmZaxAupo9tUdBuALm
 T3Rmk275vrMhZyv+1rvtOdXjW3R7SOrWSYlD8hJh3WZcxvpBPQWitBllp4VQuZmJVvIQ7YXj5
 kbi52hz2z9yUVn7HSJUz0Ozkt2FzSD+k7t913gwGLvKKi7EVcQySqUejjM4VJlcLXzm/aCCrd
 sKfygtpWJ1B6JaKgsQYPQxIDRcdnMuf2/xvyrvv3YXJe7E2MZZr1TYd7fx4/i9YkZNGp2ZP+s
 oajNZ6YO8jaGHKTlewCzh4e7eU+lL+KxvRdZdy+o2i3h+V2FNp/7aF7jBkuLZ1ckJu+V4/wWr
 XmVEOvRtbsibO97ZPhZrCxQQ41zvLBYd7h5RdzARuV+EMr5CCGATXTUPAVvmd8APjI+olJ0H5
 f/GtFxRfooyyUgBwmQopEeWrwPBc0D2Yi8GTX1w2jGC02aHUKhX3ghcgy4vC8UmMUQ0x6NYA6
 c2LozF3BrkSjss4eDLYU4jBJ3EMx354LKXKCJgitpMWhx2drih2AINSwykgcNTioHmRSAj/Rx
 9SapVVb+nE6n94teTFDyEql9R4WoZ+HzJpDQwppD2BGttYViudDhmdRweub77U1BCSDOROP6D
 Jh4z3fKPccu9rUBB+vosa97YfKQTq6eK8s185fQ26I+w1rV0w7T+z2D4dURuXzsKhFSqF9VMd
 ZDF7cgsyqbGi370gpFkQe7iP+SNV5eRJ7o2Z+0FXdVJqRmFRmzDFoN4Nij8L23RhNKQBayKqZ
 rPcdswzFd1oxoNle1ClA+8InZBV9ysYUJ6I4Vef2dxhBhS1mnm1WuyS0Q/bRDO8AOtYxlYNYV
 pv3b3IhnMAZfJmyPBhxw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 09 Jan 2021 09:16:08 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > > > +static const struct snd_pcm_hardware n64audio_pcm_hw =3D {
> > > > +	.info =3D (SNDRV_PCM_INFO_MMAP |
> > > > +		 SNDRV_PCM_INFO_MMAP_VALID |
> > > > +		 SNDRV_PCM_INFO_INTERLEAVED |
> > > > +		 SNDRV_PCM_INFO_BLOCK_TRANSFER),
> > > > +	.formats =3D          SNDRV_PCM_FMTBIT_S16_BE,
> > > > +	.rates =3D            SNDRV_PCM_RATE_8000_48000,
> > > > +	.rate_min =3D         8000,
> > > > +	.rate_max =3D         48000,
> > > > +	.channels_min =3D     2,
> > > > +	.channels_max =3D     2,
> > > > +	.buffer_bytes_max =3D 32768,
> > > > +	.period_bytes_min =3D 1024,
> > > > +	.period_bytes_max =3D 32768,
> > > > +	.periods_min =3D      1,
> > >
> > > periods_min=3D1 makes little sense for this driver.
> >
> > I have some questions about this.
> >
> > When I had periods_min =3D 128, OSS apps were broken. I mean simple on=
es,
> > open /dev/dsp, ioctl the format/rate/stereo, write data. They got an I=
O
> > error errno IIRC, and no clarifying error in dmesg.
> >
> > I tried following the error with printks, several levels deep. I gave
> > up when it got to the constraint resolving function, and there was no
> > good way to print and track which constraint failed, why, and who set
> > the constraint.
>
> Did you try to set up the hw constraint for the integer PERIODS like
> below at open?
>   snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)
>
> Without this, it'd allow inconsistent buffer/period set up in your
> case.

No, not yet. But surely an inconsistent buffer size would still play
something, instead of immediately erroring out?

> > Only through blind guessing did I stumble upon periods_min.
>
> The periods_min usually defines the hardware/software limit of the
> interrupt transfer.

Why do you say periods_min=3D1 makes little sense? At 44.1 khz, that'd be
172 interrupts per second, which is a lot but workable? There is no hw
limit against 172 irqs/s.

> > - why was there no clarifying error in dmesg? Just an errno that means
> > a million things makes it impossible for the userspace app writer to
> > know why it's not working
>
> Did you check the debug messages with dyndbg enabled?

No, CONFIG_DYNAMIC_DEBUG, CONFIG_DEBUG_FS and CONFIG_SND_DEBUG are all
disabled because this is a memory-constrained platform. Surely "why my
app is not producing sound" is not something that needs several
different kernel debug options enabled (+ root perms b/c debugfs).

- Lauri
