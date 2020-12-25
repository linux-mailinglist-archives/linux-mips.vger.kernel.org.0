Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775D02E2BF5
	for <lists+linux-mips@lfdr.de>; Fri, 25 Dec 2020 18:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgLYRGb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 12:06:31 -0500
Received: from mout.gmx.net ([212.227.15.19]:33979 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726173AbgLYRGb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 12:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608915856;
        bh=8sqysg24Twon1ure06Vi/XTwVjLm2/Kn5QjN/CF3k34=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=kFMdl+zFLR0mffbrwsJp0syKzHsX5GNAA3rQG7bf4pbTW6LyD8KkFOQ3zCgq7CKNB
         pL2vP6aXlyN1sjMUviiCIC9GSL4PkeV4neIXRSdGm2YaNMtW680IPjHyUfi1BcI4RT
         SBCcCCwvz6XTbex7UU82E+TVTwpIriTSf7kVYvkU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MV63g-1kQu4X3CQ2-00S9VA; Fri, 25
 Dec 2020 18:04:16 +0100
Date:   Fri, 25 Dec 2020 19:05:03 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [RFC 0/6] Nintendo 64 Linux port
Message-Id: <20201225190503.12353218812e1655f56f0bf8@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4VR9zDtYwQ5anTfs9EN4Lqs3gXpzamfGOhNK8Ko/UhSdgE7ImV8
 mBisYgUb18WxpvstN1MRrig66g684L2YDb2X585g0vp1nDRmrjECzRgqlguZkdcN7ctaRZM
 SgRxFL0iD348zH/aD16MQFfwNhsvLE0shN83/XCXwA+TL10K+Uo137+dTDvbR4O6iHoVQ0p
 X8CHy+6dGSH6bHyrYZQyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OCdsSxj9Qok=:N3d3RaJxkVytVOYPnWPpu3
 gRJ/cG/vnNEkeiKVsZd81b8VPDIxsMDgsLUBvPjz7m+bJjHQSuIrTyNKkjjpES0Lx/rEMxbqg
 Y18fRSK5YKd0mmxkSIkyyyAWU0gmr9FN4XCV+wFUHT4vRJriQbSsDMMr1R//UEf+tkbMHua3b
 4HBrYMViY6HJi7m8o4WI/2eKeyJy+0X333hkmnd5R2VK72Mx3rjykJWcTn2LPtYTHeOFjI9+O
 +xbHQYAWh3ZYNY2Rln/r76Gb/RQtNReHgTJWOQMGWVE/dIA0nBgA3GpYWhZ0VT/GqSHg4l3de
 I/7zG1vIYGZHG4VPQ0+Mz5WbuMzNS/J8y5blDB2/Y/XQSP6HhR5etY+PciK9fknuGSjn0DUp9
 +CkMDgiuufMrEpUhjs2XL6VzbUNc1LZuntxlDf3psHcvY15JgIvnnzwggHAUlbSYyyj31LZcv
 FJLPV95rbdonO5PWop77Vi2fqRyxmcDnY0iOp/nGewCUqQRqSBbeBevywMnL1kQcdj9pYxvDm
 FGr1RrCyk65cRArlRF5nPeAzC++sjvunJJNbLhmj6I3rC6LrDvnBkn3gK96Y6ZUp1DgDR+c9N
 n3/SqlP63mSsFBafMQzKUkh86lDJZVY6hYxqYT7mPkIcczzWsXKfCG2Bd1qnUQzkLSIORmIm8
 MbfZMXnAtGqBw+JqYDDnb8qJw59Xa6DEgB1iqN7208d8gF9eLFrxWj+uLimAgIq+Cw3jHoDwE
 TDEaMP05ofWxbGla+Fm+hevzvBPHXiP8lJk3t4QhCy5DSvYvlgjaO9vJ6XPtixpm7xvA8/Dyb
 kjA6fwZ2xDAnCjmVIs0PF1wwGfm1AjMPIhupIO6MrW8Ogrfcw4Ivg3aqc3TWvBGZvDDbsjpVd
 jrqTvUSp0gOS5xvG5VeA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

Here's a port for the Nintendo 64.

At least two people have done such a port before, but didn't submit.
This is not based on either.

RFC because I'm not sure if it's useful to have this merged. Old,
niche, and limited platform.

"But why", I hear from the back. Having Linux available makes it easier
to port emulators and fb or console games.
www.linux-mips.org/wiki/Nintendo_64 can be edited to no longer say
"vaporware".
Most importantly, because I can.

There's a ready ROM at https://github.com/clbr/n64bootloader/releases
for folks with a flashcart to play with.

- Lauri
