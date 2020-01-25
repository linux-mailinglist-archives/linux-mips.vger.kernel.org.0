Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 737FA149318
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jan 2020 04:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387699AbgAYDbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 22:31:34 -0500
Received: from forward105o.mail.yandex.net ([37.140.190.183]:57143 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387685AbgAYDbe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jan 2020 22:31:34 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id B81154200869;
        Sat, 25 Jan 2020 06:31:30 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id B110CCF40005;
        Sat, 25 Jan 2020 06:31:30 +0300 (MSK)
Received: from vla3-4c649d03f525.qloud-c.yandex.net (vla3-4c649d03f525.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:4c64:9d03])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id YGif5pMyK6-VUDqJquG;
        Sat, 25 Jan 2020 06:31:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579923090;
        bh=rUlyNvljBdCjkYu35RmmYwvqN2tBKCJRMe6BpvB/5Q0=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=cjn8Q6oq38+pdhcwqDXwXphBA1/onoHk0mUEmnBuVel7ln8j1v3ic82WuXkHj04Y8
         6ZVQImYcyVEpkZaR611e9r8S4ta3OoWmemQRLvvFi/63dupbJwzfKk887ooNH2A/Vg
         PWEfufBBooxU+o/RLhJ1Lb0rFmmTeYNDQBg9g3Xg=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-4c649d03f525.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 1iJhSA3EGT-VS1WBnYX;
        Sat, 25 Jan 2020 06:31:28 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Sat, 25 Jan 2020 11:31:00 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200124140751.GA17030@alpha.franken.de>
References: <20200114122343.163685-1-jiaxun.yang@flygoat.com> <20200122184506.7zbzetn5xturxamj@pburton-laptop> <20200124140751.GA17030@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Introduce aligned IO memory operations
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <41DEDE07-DBA6-4397-A6F5-07D650436A6A@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:07:51, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>On Wed, Jan 22, 2020 at 10:45:06AM -0800, Paul Burton wrote:
>> Hi Jiaxun,
>>=20
>> On Tue, Jan 14, 2020 at 08:23:43PM +0800, Jiaxun Yang wrote:
>> > Some platforms, such as Loongson64 or QEMU/KVM, don't support
>unaligned
>> > instructions like lwl or lwr in IO memory access=2E However, our
>current
>> > IO memcpy/memset is wired to the generic implementation, which
>leads
>> > to a fatal result=2E
>>=20
>> Hmm, I wonder if we should just do this unconditionally on all
>systems=2E
>> I can't think of a reason it'd ever be a good idea to use lwl/lwr on
>an
>> MMIO device=2E Any thoughts on that?
>
>depends on the type of device=2E I can see benefits for framebuffers
>and memory devices since memset/memcpy are more optimised than the
>function in this patch=2E

lwl/lwr is slower than this implementation on your system?
I thought that other platforms support unaligned request can be benefited =
from speed up of these instructions=2E

>
>Thomas=2E

--=20
Jiaxun Yang
