Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09C52F4B1C
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 13:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhAMMPU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 07:15:20 -0500
Received: from mout.gmx.net ([212.227.17.20]:58799 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbhAMMPU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 07:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610539993;
        bh=MD95CF3BbCHm+ntQpAn/xsINIr4T/Gn3dLHyUg3xnEA=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Dht8D7gUm8lZ49vOiR70WHsMeTTAZkEn0cov1Ljybc/r3tCiZ9l5fgS7wUeJ6cX3c
         LRBYxqMOZDWXFQSt58o26E+Z8fX5pEAoxVY9+46HSkRxb787g1gydWHUbXKGwBlke3
         KHeup/gpmSi1zFKQTbQNQliujHKDnYfl87x5SA34=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MhD2Y-1kLOFn2J1O-00eP9z; Wed, 13
 Jan 2021 13:13:13 +0100
Date:   Wed, 13 Jan 2021 14:14:53 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210113141453.1800fdc028fffcd232bb12e8@gmx.com>
In-Reply-To: <s5hlfcxniu5.wl-tiwai@suse.de>
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
        <20210113135716.b8cb71c94edb7c7605002068@gmx.com>
        <s5hlfcxniu5.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CjnTJbIgfVCFoetXqJj09LkCVrQEcNNjaA57oqfVsXo5z5lEhYO
 48tFXkb9IGaTyI3kkUJSsdOzJ4/CwJ2KN+sxGMdRkV10fLDkMjzBbIZzpQhO/idcqnuT1vt
 oBHi2fpBC9kHn+kRPQwuEzcVTvUe46/T8MZUZRlWqlbkBRmtiMZF+1ELKyfH5fRlWeYQYWV
 ZS5Mw0anyK5BTGEN7bk2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6u1AfJzaROo=:Db6Ifj2NnT/94a+snb5TWV
 NCONTj946U0K9Fjc6MvZZyzDDx8vN9PQf9Ii9k6TEZXGfPBHOewpwE734nVzjrs8NL7eVw3/z
 A2pZ3WJPYo41HhFus8kxPWM+Sl+ZFwmyGpbb2c7oVwWoaDxjx0OkeX3HzcvKP72BCCWka7d7V
 aNyRHpJ7TqkMxYOV0qYO2cAMMzEpYunmuzN/xJtpKWQ4MuA9R1s5vIy8tJXbUKNQnnMq4ILvI
 Wl0LtodzFdiHA5hqZ60iYcaHqrUZSF/DMlEbwrKqmTlTLrro1orCm7itYAoH+HBF+DdGA4E+S
 HVwHjiSDnC2ywXL9qGUjwad+rT3biVlv7Pa3ZJT4opeEdziCfVI5WsEpODMlAYQgqWs7V7pMl
 C4k9o/gKyQQYrwdHfrfPW5+ZwDAiSjr5g8sH50CrNAFPKYs4FGEW77rUpCe4W59bzHyVPkThN
 Ucj8L/MPZb071YC4mJ9FqIOD8yvmv4wnOckO6nK7vzeuQNc9lLHL6fHlJIe6HYQGf+z+agVc7
 s19mssDs7u+g/4c6e6fNpXfyWMdsdYjsPkbuZJ4UKf7gsY7WbHXYmk8s0E7PeBvlaaMww4mxj
 ZOTqB4JU7+F35zwBdt3wJh5uGi1shqfLmOb6nxdvOVuSHH5/j6hOYl/PHK9cW2fMQ51i4p64N
 otNL43N5N65hfkA5q1Mbrs+X4DUJeQ31cHKAoBDkj5aaYTeb/htCviwAsYanh6+lhnX+7phAg
 rD/HkIqXxl9d1FhAGvGHRAdxCbGlPO8o7ZwMqw4ygUrH9Lxom0wl49RfYqXjB9BNN72og3dCW
 G2jFCvxZp9LmXUa1ccPt31MII2aFjgMvsoIVO6QSlXQMVaTTypvTukBsBFOev6QJQO86FTRxM
 zULJBQnxyXajKgvbxvww==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 13 Jan 2021 13:04:50 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 13 Jan 2021 12:57:16 +0100,
> Lauri Kasanen wrote:
> > I figured it out. Turns out the hw registers were double-buffered in a
> > way that requires two periods' worth of buffers. The IRQ fires when on=
e
> > buffer is finished and another is queued, not when everything is
> > finished as I first thought.
> >
> > There doesn't seem to be a way to request the PCM core to keep two
> > periods' distance instead of one? I will deploy memcpy then.
>
> We may return to the first approach, i.e. just use nextpos.  But then
> snd_pcm_period_elapsed() has to be called right after the trigger
> callback without the IRQ, because the trigger START already queued the
> full period and the position advances.  So the first period-elapsed
> has to be called from a work or such offload instead of IRQ.
> In anyway, it's a bit tricky, yeah.

I don't think that would work? When I printed out where
__snd_pcm_lib_xfer wrote data, it only steered clear of the current
period (pointer up to next period size). It wrote in every other part
of the buffer. This means the currently playing period would be racy.

The other point is that memcpy doesn't have a downside now - it doesn't
crackle when properly double-buffered. It's simpler this way vs
workqueues/etc.

- Lauri
