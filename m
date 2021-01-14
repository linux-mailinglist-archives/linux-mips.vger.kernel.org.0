Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8722F65EF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 17:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbhANQ2w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 11:28:52 -0500
Received: from mout.gmx.net ([212.227.17.21]:37121 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbhANQ2w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Jan 2021 11:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610641604;
        bh=grW9sIeOPQnSENayaz5a2F4DqW1o6JFSHP2XcA+Q+Jw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=YXqt/iqnwj5csib9ukuCi1Q9vRSdnR4p6WHDsb1+XaIuXodZzE8/4C1vNPLOK93Im
         zKFSOsLNODbjGMso5hlKoQMWxikhaSP0z8MBtHDfZmleHC6frGy7XVJdQbwPfKFCPp
         eDib6jo6VBi6vBrLZLw/8Uqic+l3XBa7F8co1kzo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MMXQF-1lJY7H2CwR-00JdSc; Thu, 14
 Jan 2021 17:26:44 +0100
Date:   Thu, 14 Jan 2021 18:28:24 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v6] sound: Add n64 driver
Message-Id: <20210114182824.e46c32bea380ecabd138d29f@gmx.com>
In-Reply-To: <20210114161759.GA14146@alpha.franken.de>
References: <20210113171322.77105fa8f92826e6b716631a@gmx.com>
        <20210114161759.GA14146@alpha.franken.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MWvAZPdpbZ+7155NrdT58q3RhBctA2PyiJFD8Gmn637OLAYmj+T
 +91+1ezv8Uxdh5qxFVjyxXJtDvrihNR9rebg8zvFjCb6wxgu5C6zggAAXGSkgn80PWRwBVT
 91EiKqAkMdqIz10pmz53QRlShwCLZTagYJt3vkUsDqWO32YZBUzdJoEtckBoEWxk8/IM+tM
 gHkC9stJh/g4r78qPW3mA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tL+BM9QJy98=:U5nn8AmzVqX0scKtqrSeLB
 le75j+I1MTT/TkmLzBoBdniIvElvta2E7jbBawbG82jZIBTdzBHMcX/Ffta3z3Fi7JRfgubqn
 f4XY3Dgl5ruS+haJh13swVOpcZtSqi/jb4Tyv0nVxo81bp44taAzBNX1DvXyxzE/uwgV+SLGS
 cSvYuroY5TPDOl2m9Iq9nm2/z6gS8rH6RjaydGdZR3W9hhldz8k7tzEONw9LyrJQW6PU8PnRw
 4vyFR/iduDmclPzRrnP8oM37gfIPxiGTevWsja7u6UJrXsS7DfIWgl4jbd8QZa/58BWiQGUm0
 usbC+1G0yyz8p5bBTb7xjDrQeSbq2FRYmN/ayEIiO74CR7V99iMJ+ySTo1Eig2PM6p1xM2uo5
 Fe/WYlJmtVJwLjPpdRvPPs+xk1JKnXVt83QQzJKMIwbkXZ4dSXaVpaplXyVV/HK3WJJn7Hawx
 H8tFSMIdEG6cLaXH544CguRsHHhF2mEezf5ovQcuk24k2WP36T6mJhNUjsruUSOu0GsA+HNS0
 rbhEYOT8Gn4AM0qHUEzOMF7K8YGmqrZZttV4nE7dCqMSbLQ0tTAZUxYLoHxUyJeuw+Wr8Vp4j
 UA+74ZDrFDY093jlbu8+k8/PIDcQzexOGafEMVoZ6ZqeQuh+oALmFAbU9W37GbnwrFVHDQKVu
 Ne2d3XVdoyZ/gtqKtRKZPAvNVQbO2KWWaSvyRYBU+SCXFx7hWsF2eSN6WORKoYs+Du4DvDECS
 M4y/QyhHmYSUOuGYgUcB2EiounsxaeV7564/Bpm9uybkOw1XqoDUdI22V8zqnoRQDgAf4hmAY
 DKaxgdjeEl0lrfxJQDnMb13BeDsj7B+1Sgb0SPSBJBlstTujCk5IfvN+3sZLDVTFhM2CzrCZB
 UGMY6ArHFVpypFd72omg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 14 Jan 2021 17:17:59 +0100
Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> > +				IRQF_SHARED, "N64 Audio", priv)) {
>
> is it really shared ? Looking at n64/init.c there is no other device
> using this interrupt.

No other driver shares it currently, but on the hw side it has many
other uses. Vblank irq, PI, SI, SP and DP all use the same irq.

- Lauri
