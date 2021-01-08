Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0502EEDAC
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 08:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbhAHHEb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 02:04:31 -0500
Received: from mout.gmx.net ([212.227.15.15]:44601 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbhAHHEb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 02:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610089379;
        bh=ALxGOY38SC/btV24j9G5wOy5dRcSUKokPaRRL6TPkVc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=SN7D6yazc4AOSniuNwSisLBTfkrEOk6oscbp5K3oyLc8qoCKfnmF6oJABSJp6VmT7
         1jPXWDnyRX6hstUiTL1HUKW64WqgvCZNHdZX/NkNkKW11TbcKz/zJF+F4wNA8aLRGO
         gGmxtOz8Bw2H/ZU5BxU3GRpeXKDoJU0kRJlZddPM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N2V0H-1jy9Hw0OMx-013xbA; Fri, 08
 Jan 2021 08:02:59 +0100
Date:   Fri, 8 Jan 2021 09:04:34 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
Message-Id: <20210108090434.d404fe2dfa604542d8c88a05@gmx.com>
In-Reply-To: <20210107171035.GA13117@alpha.franken.de>
References: <20210104154357.6cf126150407ba4839630177@gmx.com>
        <20210107171035.GA13117@alpha.franken.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O/CS1GXzG8PhRkQcSeGr/uA4YDEnz9miR4kXkKeonVAa+NWlH8R
 t60PC+fIxMHpq9mqDB3ICKFWBFL+RjBDavz6R2oxzvsvwZVF1mC8jyU1kaOguY0lyHVOjII
 wUq5h6ovX/JlFavNcCmHzipf2LOjkSp7iLAbdvnFyPUPiz9sDyzgRDtFoNs3/CZzdCBuzkK
 30MkH2ARyxyy/I3V05eWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IGHt9a6DjNE=:11Mv1hcMHCrMo1kjbszEoZ
 d9pohYx6Q9t3x5GDtfx1+a41EcEG47I0joeJtRBzmIBNnq09CnrBLkcGPRaPguSJSsi7nORN4
 lfkIZ0VWq4ZTyYc7LwJPknNiy3UzJ+QZ1SJRn3Lq62ldCgeKSEwJ993bB5xr3xcRykRk7739B
 jL0HTCAIImGz+iWNNBLR/TysnzRyuIZQPtKyKCxFDtK8hT1e79AY732o9JBdWp0r4syD3p53u
 KWm1Q4iLq/P6R0NFY6ckEnq2OsEFtEWFK91Z7XE0vuyKOz+vImn04/qnVlRklbi5mGHO146VA
 4yi2RFQj3TQxLpfCbJxJKvVnKbvZYDJL6zlBzDZgtoiXrQRO7pxCTKpT0kbxPDutLv0P2KhDF
 2Nq52ZiPKjhZ0qnWp+d1e2aTn2TSa3pIqab6TjYUlHQoGqVyhFPXCGv//kHcoJUk20jT3l18d
 chvPC9HNbdg8+2tn+LZlPQ3mppCJzJ9dhdDqrseDtMLXfDNBxNtVtRJB33ApfMiFIwC6qvQRz
 ks9ZD32emXrh4CnhTZQZvBpmUxvYPyE+Pfu8oB89bY6XOZYP7KpXPuZDQUkAjGTqlLyeP1ege
 knucmoMiHaVDXusP1XyMt61IWoFUgH4bCv5HaKNJwva/tUxhUKVqgLsLvi5EJ2U6UyALndGDB
 QbP8MlYlqzp50TLK+5zxRfqGq2BhXWcSQ7xGYDYnQbf1sx3ObWmUJ8Y/pNa2rtTRKu99RgX2c
 70IlQJQF45DtzOho+zgAHq4P3A1eSNnQEQo57S0uX+ZTbGfeA7/OUuOArFtqPvDwoirdsEZ3s
 2+8rwKxPeXytInmWzwoyNT4yuHUnyoKaQPSsGbfzmCdLFjayjIwjZxSMMg1KVd6JcDLLUYDAV
 SquaMiy836OGG/Q/sA2g==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 7 Jan 2021 18:10:35 +0100
Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> 32BIT kernel don't compile, because you use TO_UNCAC which only
> exists for 64bit kernels. One solution would be to use CKSEG1 to
> convert from physical to an uncached address. But I'd prefer if
> you add resources to your platform device and do ioremap in device
> drivers. This way there is also no need to export the interrupt
> defines outside.

:( Jiaxun told me to use TO_UNCAC because CKSEG1 was unclear to him...

I will change back to CKSEG1. ioremap seems much needless overhead.

> > +#define RCP_IRQ			MIPS_CPU_IRQ(2)
> > +#define CART_IRQ		MIPS_CPU_IRQ(3)
> > +#define PRENMI_IRQ		MIPS_CPU_IRQ(4)
> > +#define RDBR_IRQ		MIPS_CPU_IRQ(5)
> > +#define RDBW_IRQ		MIPS_CPU_IRQ(6)
> > +#define TIMER_IRQ		MIPS_CPU_IRQ(7)
>
> and this IMHO also unsed, so no need to define it.

The sound driver uses the RCP IRQ; the machine-specific names are
defined because they're much more clear.

- Lauri
