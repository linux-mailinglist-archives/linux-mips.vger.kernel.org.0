Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6859B2E2D9A
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 08:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgLZHdd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 02:33:33 -0500
Received: from mout.gmx.net ([212.227.15.18]:45331 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgLZHdd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Dec 2020 02:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608967919;
        bh=GKptkf0JkwWKAMtKxpxRn+DHyAVBmp8ocwHft54ngq4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=edGoIjbzc9jC6ArRixV24k9oTkS2apcG/kQCqKAsiDOJuqPl2vMvuxpVkbcyJGfhT
         zOAsi5Q09CxAKwK7t+Ia8ZXj5h8gDZgCW1x+F5qCtMP/YOYy4DJWWSx7AF9Zogs1dM
         2WDL5n6ENMlcRq5q7scHphU3Je81m3nvP7BpzVuo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MTRR0-1kTfOs2m7A-00Tlma; Sat, 26
 Dec 2020 08:31:58 +0100
Date:   Sat, 26 Dec 2020 09:33:35 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: [PATCH 3/6] fbdev: Add n64rdp driver
Message-Id: <20201226093335.b625b3a58a95c04d068e3109@gmx.com>
In-Reply-To: <06aad685-cea3-bfd3-2cba-492e5cbf322f@flygoat.com>
References: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
        <06aad685-cea3-bfd3-2cba-492e5cbf322f@flygoat.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L4GIyJP10v9x1znkw2k9jmCqXth6V4xlXE0wosgmK7IF93JGfhP
 zHwIzx+Lf6NoOxiP0fztK1D/hSGhG4aAJ7oUzPnf/fvXoD6G2tbw6b8C8amVp3lSexx0vWp
 aoYwEhmhggyDh6wWHoJhkHZUAwLW+aTNxev834eKvvk/QfNFTXestn44XsIOSRVy7hI+Ufm
 CS6ERolfk9qmZxa3KVetA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VyqhF6qFl/w=:VlBmzrkZK2Tt582Jp+5WBm
 Wnj6N4ccGIbHjZaDuVH018fdF+1SIfFEBiHyomhrQzZ5nCKtAlMPaoQG5HmDpB1/7X734Voho
 lgUnVmAF/pDlxJMuxIGlva5kK+F6hMSs0+8DFuWawXwq91o1kLqHpj77Lp8/nFKXkKTNfKQ6e
 4UEd3T2aR3XwPsXJ98shZ/mnMF80upXQgyIOWrPMC5QeuSOeAA6+jW+se89C4bgbi+3bHJYQ3
 yiQE5jeJ9GNvHe4Xrbl8XGtDZF4uCaka7VyAtQAzvdTMvlRFXYYfXHaEgW43FCVIZ55zNb78d
 +VabsmDs4PEUvnUfuih33yv25H0udHhNSaLlze1at8n9WwR5jIEjNnwLjgbJzwcf/1JPGSHb4
 /kaXi7ok4esG7PeT0XxfShi2faX2IUfzijQovwDsO2PcFpq3LDPWKAzK44zZYrL5KBVTljHUW
 zlkMjABQ/wdqJaBMDNiZOKyvgVv6dVJHr2eD2yhyNBR69JC69YJgvhPEMVbiuKUZwjnr3vxvf
 6/5AAs+0KKTxg/oxaf83XrhyiWfRURIFtUfX1oEJMJstBFy/IxQQv0bH7asG3i0xipvKlIEpR
 VI75JLmXYwAbVtWq5MvVUQlh0rfsucmx+kye3n8zQqoyWzhHjNAD9kUP/zMgcL52RBlKEYjZF
 DbvlguXenJ/X+or8Kxmgcyfv2AWq6ogypi1trCkpdDRr0gRlkxYFMmbERA07QzLWAWFlwSFP/
 36AkSJMNY73U9CKizNicXL1+n7UR7+PFmqerRLGlh+4qdfAHUO1ClpVJ1rux+KwpLIK0QjGMn
 cKufmlWTQ1qqnFIsQGGQ65PaotwiL8htZ+fqjryW9lkmNxb5MPUj4AZZnKu++wwyKbdN7Dz3w
 OTy59+qwGuhTtLp1TeZA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 26 Dec 2020 11:20:36 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> =E5=9C=A8 2020/12/26 =E4=B8=8A=E5=8D=881:00, Lauri Kasanen =E5=86=99=E9=
=81=93:
> > I'm aware of the drm-fbdev resolution, but CONFIG_DRM adds 100kb, whic=
h
> > is a complete blocker on a system with 8mb RAM.
>
> Hi Lauri,
>
> AFAIK it's impossible to have a new fbdev driver.
> However you can workaround it by setup fb memory in platform code or eve=
n
> bootloader and register a simplefb platform driver.

It may be that way, but that would preclude adding acceleration
(clears, blits...). With this driver, if someone finds it too slow,
it'd be easy to hook up gpu accel. So let's try at least, given DRM is
way too large.

- Lauri
