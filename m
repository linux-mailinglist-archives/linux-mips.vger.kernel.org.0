Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D604E2F08D2
	for <lists+linux-mips@lfdr.de>; Sun, 10 Jan 2021 18:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbhAJRlm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Jan 2021 12:41:42 -0500
Received: from mout.gmx.net ([212.227.17.21]:40705 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJRlm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 10 Jan 2021 12:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610300407;
        bh=/GKqTtVe9Omv5mIKJkRlUkipy9GJNWVZY1e4L4ooI2k=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=U0utmq2eDeR7Tejq3vnaDO8N2DBj36VbG3yZBLauwRabGh11fLECAMKRAd5MeQ+1z
         ns4rT7tc9WCN4cheYluZpIrCl5SvYqmoQk1PbMcpHlKJOuxIgUVQNNfakcOxyW/9LB
         lwLmKaF1E8KLjGNdXWJJEZmZfTMTe85roInnM0Gk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MTiTt-1kWuWw1NCn-00U5Zo; Sun, 10
 Jan 2021 18:40:07 +0100
Date:   Sun, 10 Jan 2021 19:41:46 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210110194146.58cf1d6d64a7fbc6d5336210@gmx.com>
In-Reply-To: <s5ho8hwvh91.wl-tiwai@suse.de>
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
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2pgpYqU51NTFay6xuSyNTqUrSK58P503y6N50L5SZMZw5jMkwZg
 kIVv15NcGrAeYbKUFScHRWyNmwu5QhDn3Pf91raRlm4lk2sgxxRsfMNOrz1w24hR9u1gySh
 pnRGT0Eo5aSQciprJbq91b7T/2aCOLuZjFoyWDhh4cus6aPtVXNud33P61CO4KIHlZVH5vn
 Hvli5et6Q6F4qb99tFrAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E7HmkjO1DPA=:IyVAVgwc+JZDZZRLALqBiA
 ybi8AuGW6qhYeuarqK1Ukbgb0yjvMKbPyeXRLlff+FwimqnC4lcZdOVM/PgkD6C/EQC9lStqr
 QnJ+m5Ly57A1eClOUmxRzcHkpGF1MN/tZvg4ltiGVVWhVxNBxOrehBYG4/jyyELyjJLQvNS8F
 ep1s2t0w8ixCsdtNLtyofu3IvjpPv2MJmG6X1ceaF/7TvyQ8IowOMZmaSpn/Hydb8r2SQQl3H
 1UzmI99Ej8oRz1pPOcfTZ4Z499uReu2sjF+hoIIBW9yrzWAunu4iXe7QsxF8xXVCOncowCyqr
 +VuzQPXXwgGEDK40sg7pWy5J5/NJF6tH0eZocIcTuH7RG3Jr5KbuYVzj0kadkl2EJaOd1wSI6
 I62V//2NOIhQ0+G3ncEeLu2Jih057fa6om3vQSS7gXI3uJlW6jSNqquBwQsP/yp3YvB+F8nd9
 GWg/zd/3RJz3W7guLoOMN00lLnQFTbU0AlCAJcXKpC8UrLQ+73JDCAOyRPOzBw0N9/ZxlFAWv
 hIgmYHQsYWaBKYRBVPchQhnV7snEvgf39D6OEYkJhe6s+bFICrnUEHgMqr15YFvIrktRGBY2V
 RMuEU/J0sY9lVIETmOEDbnp3Ovd8B/D8zcv75pT7rBenCmqR0JOGEbjeQciV0qqzPeRawu+/n
 gYYE/fg9U3REdU+/Rgk5XFK4RqmivgfN25iazp/MezEDz7/9jasrwG32p3Wu1lu8cI8jpjHWY
 k/cfnDNRLSSmkDTYCDhJroO5fqhtMQmS7gfi/fNnt+lqWbXU5zuJ8ibNDO+GiiWUY2+qMjA97
 1vQHTx9YUYTcRih7jlyDVqklTOd5D5cKavEJ9DDqbKihT29cyCeLHcpypm0MK76thCUX6DnsD
 BE+HShx3sQlPJkior9zQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 Jan 2021 18:22:50 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 10 Jan 2021 18:03:32 +0100,
> Lauri Kasanen wrote:
> > On Sun, 10 Jan 2021 11:24:22 +0100
> > Takashi Iwai <tiwai@suse.de> wrote:
> >
> > > > At first there was no nextpos, and _pointer() always reported pos.=
 This
> > > > didn't work, the core played through the audio at chipmunk speed. =
So
> > > > there must be more that I don't understand here.
> > >
> > > Try to set the periods_min=3D2 and the integer periods hw constraint=
 at
> > > first, and change the pointer callback to return nextpos.  Also, at
> > > the push function, set runtime->delay =3D period_size as well.
> >
> > When I do all this, it still causes the chipmunk speed. Several second=
s
> > of audio gets played in 0.3s or so. Sorry if this is taking too much o=
f
> > your time, I'm a bit lost here at what the alsa core is expecting.
> >
> > Printks show the following repeats:
> > start, period size 1024
> > push, bool irq=3D0
> > irq fired
> > push, bool irq=3D1
> > pointer at 8192
> > stop
>
> Hm, is the above about the result with the pointer callback returning
> pos, not nextpos?  If so,

It was returning nextpos, but the pointer printk was in bytes. 8192
bytes =3D 2048 frames.

> > start, period size 1024
> > push, bool irq=3D0
>
> At this moment, nextpos is 1024, and it should take some time until
>
> > irq fired
>
> ... this IRQ is triggered; it must be the period time.
> Was the reported timing as expected?

It's roughly correct, but timing is not very precise, as printk itself
has heavy overhead for the 93 MHz cpu.

- Lauri
