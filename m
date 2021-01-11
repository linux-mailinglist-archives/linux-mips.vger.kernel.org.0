Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C6B2F1A16
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 16:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731368AbhAKPvl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 10:51:41 -0500
Received: from mout.gmx.net ([212.227.17.21]:56859 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730628AbhAKPvk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Jan 2021 10:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610380203;
        bh=imbfgfeCouedOiwsppCRyQimaBAy12aZrb1vBmbg80k=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=gv7f1Fi0OwMVG8TyXqTkeH1WaKg6X7EQbJMVzN8kuTg9WEMV9lbt5JtENqKi7gkJB
         XeMDZT6jW281boFcE6u28Yjw9RSOd1HEQTcVFtxRuQUwKxJY7bANPPuWo4T52NODkz
         FrFdFiMuHObuMHtY0TXLDh1tj1GzXHXfPDfWL63Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MjjCF-1kFj4C35B5-00lFWB; Mon, 11
 Jan 2021 16:50:03 +0100
Date:   Mon, 11 Jan 2021 17:51:43 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210111175143.9cf93be4478eca67cf081649@gmx.com>
In-Reply-To: <s5hczybts17.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
        <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
        <s5hwnwlum21.wl-tiwai@suse.de>
        <20210110190332.8a818e931975f02b8f3d3881@gmx.com>
        <s5ho8hwvh91.wl-tiwai@suse.de>
        <20210110194146.58cf1d6d64a7fbc6d5336210@gmx.com>
        <s5hk0sjvqz3.wl-tiwai@suse.de>
        <20210111114323.d522f6e30a705d0731b41b93@gmx.com>
        <s5h8s8zvl44.wl-tiwai@suse.de>
        <20210111140222.bb15bb75657fbb8a5b6863dd@gmx.com>
        <s5hczybts17.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V+rsTsLSqrfbi634USiQ9JLSxRsM0w8Qfumrg5q54xFn7fUefj5
 ZCcy383x/Sf6T7B6VNmBoM8txxlHaC22RRuIElOE6mexfEgVEd9GpEa5z/8tUZPYX5lbVAS
 18TMSd8IpbIbKolWiBBaZsHKYnBNbSBns9RDIz77/mEwdgUVUY72RtRNx8qhxFbvZ/75P3z
 7j2bM3U6LSYffIlppDQsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DAeZNwMX/Mc=:TicLB64rjzLLvLY5Qg5d7A
 s8T3OFqicsQoXjciv2RKJgv1yzHU6/wiJpSaqdZSL39hUyTh23rVWLxS4/yXdTq/Qu+9g7did
 rdynF3WqiAi99AEKKsbf+4dMFZBN9ijW8h1G7r3eseWbR/yomculbt4dJrMhI8nVuHJL+pGA4
 +OeuwY7jhWX4BHGzzuxm71PZOHTINhIeJjTa3rC9PeioMbcX331R+K3SfuVxzlPEhiIxglctV
 6wHbbEHCC5yoHhjfVVw6jPH0sNdH9cT5nQDhdxtBrWg5AfZYNTHNM8ViZuJ47gSr2oA5JA6Ep
 VsgdTB88LhoUJm3UwgOiL2JEeTCbs1KF6JFnl6y1d2F5sqFgpF7Fnp725JclONxtd3XH9pAqB
 dVPt/ai5+UFRqE3PYe0fxZNWiDTPkW0lai7go14KHZQiOhERocunk7Nbnm8KkSzax4vVTlsE7
 f0VuQT6KbtwW0tdRf1MIPaTPSIP1s7wyQbbLq71sjIk23j0K9UqcGC4iiPk5P4gO0ES3IqVc3
 VuBi4KQBltGxawBZsR6rgnlGdqAnibnM4RESRUjrGMNDcICBYO1HB9Gnhmi9/IBMocz0ar1vA
 CJ0e7bF7YhDwGOMWR8bJ479oYoe8rb1edBuiU9uaS/hyvpXqwNs+c5QXmDjOeO2WjpEVhuhuB
 WicbTZ/Fb3Lb3YoSMs2C2H69Jkr+Gg08JSXYCU0Um0Ud+zr/cAbMIn9Ad+Dn7pNbFhwlX8BtU
 7KfKXbqjHeJ2D0BU8PutN6N+f7IMcdaB+5g8X3uuqzdWYHLT2EvWn9ASSNvuwdauVR4iF+SmK
 5/okOL/xkb8i1Er3YpEWw6LJNGNVeF71UW89w7BICjgFbg7HNyXvM4RBdfSJK+WnE0f6jq9YA
 aE5Qn5ztre0WJpoG2uvg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Jan 2021 16:25:08 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 11 Jan 2021 13:02:22 +0100,
> Lauri Kasanen wrote:
> >
> > On Mon, 11 Jan 2021 11:11:39 +0100
> > Takashi Iwai <tiwai@suse.de> wrote:
> > > Oh yes, at the last IRQ, the push should be avoided.
> > > I guess that the code order should be changed to the following way:
> > >
> > >   1. advance the position for a period size
> > >   2. call snd_pcm_period_elapsed()
> > >   3. check if the stream is still running
> > >   4. copy the next chunk and update nextpos
> >
> > This order gives correct pointer advancing etc, but now it's hitting a
> > new problem: the pcm core is reusing the buffer from under the audio
> > card. It's writing new data to the area that is currently being read b=
y
> > DMA.
>
> Could you elaborate?  I still don't get what's going on there.

The audio plays partially out of order. At the point when the IRQ
fires, the data for the next period is correct, but it becomes
incorrect during playing it.

This is clear because if I memcpy it in the isr, like in the first
patch, the playback is correct. When copied to a private buffer, the
pcm core can't overwrite it when the card is reading it.

However the playback speed is correct, and when I print out the events,
the pointer advances correctly, one period at a time, and there are no
continuous stops and restarts.

> > I assume the core expects DMA to be instant, but in this card's case
> > it's ondemand, reading bytes as needed.
>
> No, PCM core doesn't expect it.  The only expectation is that the data
> from the current pointer to the next period boundary will be
> transferred until the next period-elapsed call.

Curious. This problem shouldn't exist then if everything is correct.
I'm thankful for your help in solving these; I haven't done alsa
hacking before.

In the current code, everything should be in sync with how you wrote.

period size 1026 frames
irq fires for the first time, pos becomes 1026*4=3D4104 bytes
snd_pcm_period_elapsed gets called, pointer returns 4104/4 frames
stream is running, so we call push()
push() starts playing at 4104 bytes into alsa's dma buffer

So the driver is playing the second period, and the core shouldn't be
writing into it as the pointer points to the start of that period.

> > By restoring the memcpy buffer, I get good audio with this new order
> > (sans occasional crackling due to the memcpy taking too long).
>
> The overwriting problem has been already present in the original patch
> version as I already argued.  The driver copies the full next period
> to be updated, but this is never guaranteed to have been filled by the
> application.  Maybe this didn't surface obviously with the original
> version because it essentially gives one more period available on the
> buffer -- i.e. it might be a matter of number of periods.

Yes, this startup issue was present, but I believe it's different to
the current issue. I could be wrong though.

- Lauri
