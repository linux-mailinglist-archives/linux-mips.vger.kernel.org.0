Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6B52F4BA4
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 13:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbhAMMty (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 07:49:54 -0500
Received: from mout.gmx.net ([212.227.17.21]:43119 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbhAMMtx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 07:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610542098;
        bh=W7eFA7RQm4bQJQgBkbzIqJ07TjVGIN2gMfcvPSmaU2s=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Bub/AU5i+XjKkvUyaXDYtTQMBrQvXtZ0UCovunMRwAGFOZiCty0z/goJSRN2sK1Xe
         YhQHaFEcjaI1H4dUFTn5fgX+1RJtsKPBbd8FByRXVNdeuz2I5e22GdQd8DpsblgpNe
         UFBBpMhjW5CBXe/UfH47727DVvDJSHP8LoAqIFuM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MIdeX-1klcoh2vxN-00EdS6; Wed, 13
 Jan 2021 13:48:18 +0100
Date:   Wed, 13 Jan 2021 14:49:58 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210113144958.8445eec4e15c0376520646cd@gmx.com>
In-Reply-To: <s5him81nhac.wl-tiwai@suse.de>
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
        <20210113141453.1800fdc028fffcd232bb12e8@gmx.com>
        <s5him81nhac.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o/DD+F14IIlEu98TAgG93FHfCQDfcI4NcWgbDMcZ32F+1n4YH0B
 OOiUw/KJeEHmW1UqvZ/jsrXHz/qXG5uk93kcQ4CDk/cSFtGZYwC5BH+2C1ZjYztJUm851hj
 cyW/X/X9QbCTW9CSR4hXkVUMQ8rQuy7DiTgg7uZVTMhOrloQsFyeQe8lEFBHHi/+kqGj5UY
 HIQtCEGARFczd6UA3XW6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vuHs8thhwYA=:YS64APN2dRA9Ug7opxJYSA
 Eb42vRuQhBgkzrbqJ7qoj9EgiYMpqqyMn1xPd1jLNtso4esO9DWJUpSrQe2AY2ki2RoFYL1YX
 Wm/cpnJmY9GOO0GixN7pvJPA4SFJI8xu5DC8Kw1lEu6dy/1eJRcQjhAVbwRkgyFTK0cmJIhHB
 xhdEm4EKw5hV7/bZuBr3dA5mVdvE5ydtuBZ1Zz9egPu4S26pYhFQoM+ElysFBTLAiGUCbbgMy
 cHDlMJdy0P3PIoNT/0qOn7uFgB2AwonbGWQBjqQDVIoNIyUEAIRdi7JaBdzRb1KNYddTe9KIP
 /dqosBYa1IN1VDatkv4tR4CCSEk1NN4ege1RjO6Ktenp3S+YLXBDeLO+AjpHDl/UxhQt9xLTl
 /Za8MG1960mhS0KVv0GshT1txwhi0h+iqQEkI++0b7kORRPmRPTg7zSA2rchXEGUVvpbO+xiO
 Elr0mzImbCcVTZB3Orw+/g6eG8Q17CVsTe/oAoqNc1dfmKBgoKp5Lq0XYxyg011VudqlLafr6
 OyqLir9DON/aEKRQIANeQBf4Bb5Kw6hQoap3OpfRuHEhXbKCXC54WxZ3djlLqDzWCABwfVbAK
 ktRAp3Q5aOhXEQEcNFudyFO5ZDptDv6DjBiub1JNasug29C7fbFj2gy68CyAQozk/38crn3MU
 vysXfA4yMkf6LteifX+rPjcqIQyOk3d2XCzOiilJU4K0bQhPHIMRyyP2DTP4Lmr/RrMnILHVI
 OGnhaDnGDrZkyHXOrHrLcn47mRi/4t5wi75JWBeKGiB8uLhW6Ztl+wZahDlt8ZJ25xl4nodk5
 LbJ9zwwudjhF9mcQOHOqjd7n6/KFrPLWq+Wn37GnNLLbgT/j5bLsu6yKFQykRu/ccKjouXxon
 0yBFQoQ0p7v6Tu+Ua7yw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 13 Jan 2021 13:38:19 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > The other point is that memcpy doesn't have a downside now - it doesn'=
t
> > crackle when properly double-buffered. It's simpler this way vs
> > workqueues/etc.
>
> I'm fine with the other workaround as long as it works effectively.
> It needs more description in the code, though :)

v4 has a comment about that in push(). Can you review v4 and point out
where it needs more comments?

- Lauri
