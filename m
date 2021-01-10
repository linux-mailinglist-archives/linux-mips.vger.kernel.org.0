Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD70A2F0885
	for <lists+linux-mips@lfdr.de>; Sun, 10 Jan 2021 18:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbhAJREE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Jan 2021 12:04:04 -0500
Received: from mout.gmx.net ([212.227.17.21]:43983 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbhAJREE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 10 Jan 2021 12:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610298118;
        bh=5gp6btl/aH+ozhcnM4PBfz1pn8PAT3DW4OWR9uijGO4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=OwudYMW++NtJZM4+eYmGZcAoSYL3tpX4KIioU/KJjOgJ4DoXQhqkv6SVZEJ4YvxAO
         pckK+NHcCSSPZ5QBWGs+UWmEVNr/oCixxHWlCRNeDJiL2sbC8IIi31oNg0bdSm684+
         isCaJyfI0nCwdcBCwu+nfaf4JoIt/5FMGOvtdXTU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MybGX-1k2HBw3kkP-00yztC; Sun, 10
 Jan 2021 18:01:58 +0100
Date:   Sun, 10 Jan 2021 19:03:32 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210110190332.8a818e931975f02b8f3d3881@gmx.com>
In-Reply-To: <s5hwnwlum21.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
        <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
        <s5hwnwlum21.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:royp4Js8SICAGkZ7+4+dn4AuS9hXY687xBh7gj5JMIBKkAL/vg0
 XP4j2DMdZFnWzfWQwzTCkfzyx828fIRNfzrb8sU8Gxdn+0LrIMuxtNBMwC18lmDc4MvL6MY
 WMzxnbsRiaEMo9gvaTIsxeUZQ3oeweaaaJlWpW9uXjGMkR4wWJNS1yG1FppBN3NlXsJUi05
 H3Nm1bQiM85YBDL2yhP7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JfDh0W56YxA=:V0xYjJPW+zUW3NLIg0dVUq
 iekivMDS+N19OeKviKP3H2KTjdWc09nFR0cHHlQpCQuK1d3Bzqg77pzyaTfiG1XfxvSD9G5I2
 cbPQS2GT/+QwF+kGuMAlo00BEtWuEAJCsOQSdInjXOdODGVIVjD4jjfgxC+LuN2OvGTSaaVVG
 v9/spkuiptcxOhykvPFJXWXYxP72hGcc/u5as43Y9fiW++P3/KVCmsrrKPyKYOxVPP1fpSreM
 8XGChD+DDvDNDbLYBym+j7Le+4shFd9zA+j0LHt6Fq49bIEankEtLTOkb4s9g64M+feaVKwY9
 tJli5PNbQiBM1MwDN+hk6VV9qbyO9UyUNR3eN7t6eMZAq/2b2huSnRTucnTs+yGVNN3bamcGe
 7+q4DLwJi+DJIbOrJxoFCl14I+F2toowJ60AJQaWVfXwlyo9y/esBXUnNVE9l0HQZrtekSz+r
 fjjtLzXbwdjQDg29X3dZ+gyLjwHtG/K6IAoCPBqcCoPOHZjlOX2wMJl5QwrSXWrQoVoD6s3O1
 CDnikaYZaOD544rafF/x1+87GN1c7nFaV5fQT9ruLGf5QP9VPRPyG8tQMwRREqyANWLEV3Mdd
 sSOud8hgd/BbCulCYJeU68IGezlykxnoetz10oMSR61qh4R3ovCtOMvg8OP2HJKiWgYbaGMNW
 V5s8D7A/XpHm2iXPd40FGzugOAWZrtF8boRQvrVOrmjPJHXRI5FFxRt5CNtpO+GNI8HGOZi72
 23zYujVDb9yKlDSfDK3850pl9datfXncQ+x39RJhwTAXGK/U5RWkgT19aVURk38F/k6ebS9Ol
 wOLS8YAXuAk+oA/gQODp6TjzxTGzmJrsObaJKhF2SWUNHFJv4zLfCo6sNATShs5xxEsLJHA6w
 Q66iLt5BHKzztm7oq8/A==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 Jan 2021 11:24:22 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > At first there was no nextpos, and _pointer() always reported pos. Thi=
s
> > didn't work, the core played through the audio at chipmunk speed. So
> > there must be more that I don't understand here.
>
> Try to set the periods_min=3D2 and the integer periods hw constraint at
> first, and change the pointer callback to return nextpos.  Also, at
> the push function, set runtime->delay =3D period_size as well.

When I do all this, it still causes the chipmunk speed. Several seconds
of audio gets played in 0.3s or so. Sorry if this is taking too much of
your time, I'm a bit lost here at what the alsa core is expecting.

Printks show the following repeats:
start, period size 1024
push, bool irq=3D0
irq fired
push, bool irq=3D1
pointer at 8192
stop

It stops and starts again for some reason. This does not happen in the
current pos/nextpos implementation.

> > - the DMA unit has errata if (start + len) & 0x3fff =3D=3D 0x2000, thi=
s
> > must never happen
>
> Ditto.

Can it really handle a constraint this complex? That'd be impressive.
It'd remove the memcpy need if so.

> > - the audio IRQ is not a timer, it fires when the card's internal
> > buffers are empty and need immediate refill
>
> It's the current implementation, right?

Yes, but I was wondering if a different setup would work better. The
alsa setup is a bit confusing to me still.

- Lauri
