Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF50A2F4AC7
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 12:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbhAML5P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 06:57:15 -0500
Received: from mout.gmx.net ([212.227.17.22]:41729 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbhAML5P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 06:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610538937;
        bh=2hjFwso+vV5uOQs/Uko8I56jh0WPMKBm1mRSyB5ay4U=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=hCR1GvOvkPDXXFkPia6APeKBZMp4gDlPgdOqmvc5tLxwD2tKmhmYIZJfjSZMX44G7
         n3Qi/Smd/zMniu1R5rf0JspZ2ozYV4nQXWB+x54A7iI50c6icyq14cfSniaz1Rgvw4
         Tt6YGiexxAjnRza9xSiZoMsbxl12LHkvBv1rDZGs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MaJ3t-1kTybE0u2P-00WIsu; Wed, 13
 Jan 2021 12:55:37 +0100
Date:   Wed, 13 Jan 2021 13:57:16 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210113135716.b8cb71c94edb7c7605002068@gmx.com>
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
X-Provags-ID: V03:K1:1nyZFOOGDkUcgmwTt/9CQShSU3KUsaOGavIhOFf5S4xNyUNFfJV
 yX+ufWEEz+WqP23xDM81E7pmAx20YxTIAG/qNaQnVmiZFbE8xL7YB49kYMxEgf5c/wnWWen
 byPKFk+KIumXs3XJ0WEOFD639uYaBQuN6jOZBZ5nEkLu8QpOrjNnhVUoh6TJFA/Jf5PFaUC
 jqr3ykgKpDOFC6Fpq5Prw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2xnTeYeytkM=:C/V7nJMUhlQoX4FC6OGs0m
 SQsYxQy60TYmy5B371CCUntkUE9M7SInTHlu7fGD3WKRKuQj8tE/JgDZ/+/zggd1k6c/CeHx3
 F92d48KeXj2kYAglhORlaHpzlrmgy3VmsrridQ+kJA2AibuOs6asEJxaB0YAD+Fa/IsCZjNIe
 AcNnwu9bHUs05ZyB9NIvaZfDEs4fiDkCZ0xDqrslT2AMYXIQIGRGCXhMAi/byCgW2S9Of6hQ2
 e+pM8jgtjjfWYOZGVzWZtzIma0NP/UITLzxPdE3dW8O67Y2yxMDrEz5sTl5x5bKV3W9Q3Cu+6
 b3TQJgojA/ix26IbyDatzMAPb26O/ofpFF9QC2gyaFwksoDMT7qwcRUYsJH1UuFpXwdjMTDdL
 lqiIVULTG2umTfyhBZpyRzlD7aYkcx2nH5tLv+YKG0pK9jUIxyoXBGGQXtxY9kjADgWiuigBq
 r4bg1272qqRfXX65OKersTa4NIykstwJXNUxV3/T3uioRO088YcE0JTPAZTnFub95t5RUAR8k
 Gjea9ILJgz+Z4+KlXmYJSyPZbyC7fKwijreDAH5X39QZbTmYFBWnCm0SWEmfHO+IuNrq4pOLX
 A2hxAVBqdEo26ULZI6TXcxYMI7ZEry5J6yHpuviQ7pTZyJaoGdgksO5gTtyO1n+Cgwt+MmxnL
 it2PIAEaYMpuLR4gAaNvgn9ft1kCsTh61aGstYbqTWXhwsoMUjOWMKPfkKgLqvkPb5pFOaY5q
 2wiV6SDQ6ZDKHbrKn/rRayQOyzmEkTVohOHsSGWUxi572bs6vr9llwkqd75xGUDh/4oeJCEGA
 QhvIH/V017VPZ6qFdmLNT9NyeyG+hBVzJ/kaLpuV5ul5Vo7W4Y4c+OtDWtBrUHVzeEVRhJfMu
 OGE0OxSaKXHxw+JgkZWA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Jan 2021 16:25:08 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 11 Jan 2021 13:02:22 +0100,
> Lauri Kasanen wrote:
> > This order gives correct pointer advancing etc, but now it's hitting a
> > new problem: the pcm core is reusing the buffer from under the audio
> > card. It's writing new data to the area that is currently being read b=
y
> > DMA.
>
> Could you elaborate?  I still don't get what's going on there.

I figured it out. Turns out the hw registers were double-buffered in a
way that requires two periods' worth of buffers. The IRQ fires when one
buffer is finished and another is queued, not when everything is
finished as I first thought.

There doesn't seem to be a way to request the PCM core to keep two
periods' distance instead of one? I will deploy memcpy then.

- Lauri
