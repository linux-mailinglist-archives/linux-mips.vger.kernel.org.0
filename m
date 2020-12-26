Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9B62E2D9D
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 08:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgLZHlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 02:41:35 -0500
Received: from mout.gmx.net ([212.227.15.19]:50979 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgLZHle (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Dec 2020 02:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608968400;
        bh=aJ029Kf/BwD1o5JDn4C3BBQIw3TZg8P2sPjSc5XidwA=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=ERma6e+iPeeWg6UuoAL0wa3yCjtBQaJ8z8QEoKHkaVM6bFYDPcvVhvPEJt2t42jHo
         FApYiaUM8r1V0zzRX5DIvJAGeFp/b/vZtaWgnNToSQylYes/Kzz8yngdIfsce1pU8M
         a0q515NUKY4zfCesvWkbhZBtMZeqWgvLISyHRBuY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MQ5rO-1kfoch3xEO-00M5aQ; Sat, 26
 Dec 2020 08:40:00 +0100
Date:   Sat, 26 Dec 2020 09:41:36 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: [PATCH 4/6] input: Add N64 controller driver
Message-Id: <20201226094136.0559ef9741d95bab38da04f6@gmx.com>
In-Reply-To: <c1d5fdff-cfee-5252-a9f4-7ea6806a1113@flygoat.com>
References: <20201225190115.efa38e5a0107bec09f993ed6@gmx.com>
        <c1d5fdff-cfee-5252-a9f4-7ea6806a1113@flygoat.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7YQwsBx/KHl2BYzesc8dTVcFqzVecjpKYj3TvVY15fzKAOHhQXC
 NrIp/wKEV16UDJ+ynbEVjxwGddJP+nvpgcaRzi5pjVz5aowdkZxmqjlbQBh7eVCPzQ4YGvk
 Gdm88POUsLvo1pG5Ucoh6Ay3y/bAqt0gD0t414aLHLEV6sTMIDqI8SD1SG6nAVUVYzSEev/
 rML4SyOWGlR+Z4o/dV2lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u472f+5Mau0=:1sWB+IdUdnNkwdZw94TWQf
 5h8VZN+run0fmT8pD6CTpc17v4GCM2dyKeyWWRIjhgXNey5CceImoBvlcVDnzpiyg1rnI0TVV
 miiELbW0EnFQwOFF357ShlaxOWrRhqtSezxhu7WH4+ZZ7O8tg3SywtfVWPmvFnDBw1S7ZzQnN
 AUXi+3pWjn9OFujybF6gIhoG7DDYjgIqRgKjSIatFAAD9APV40KNABChkzK3LcwoIBxdOxc8w
 4CnRhJnxwO9KFA2enXai8qwnWAggi6vLWpcHGdiNxCrMhGkvrmeNmrKNdMB/AFrKHW54PZgqi
 PEquPk9UcdlvsTo+ZdBvGTj14lz9hBqMC7psqq8xQrnhw5t0FVXAAE2l1vR8AeWktEufL1WyT
 OFproIrvsEXOR1GImKMcb4UVz79JOXpEaEdVu9IOQU2dDwgfNb0FgHUlC3QW3m+k3vBaGB5Ng
 OOB1ND1WoxmDRuNj8mFf7zKkbFdU/rWYZftIQ4nuXtMUZWX5tOuIq6p7/gaiT16BLmunEqKsA
 ryCfwIN8yqiu+eoippxsp4sr4gyXU72S9emAGj+2e0GH3ATptGlm743hkyoee6XRAj+E1Lawv
 w3u6sN/N3Hg2FpPsn1DfDENeJb8cmHfdHrsyMxEWBbYk+p2jQQlL0L0peB0v97rRlWTqrsbVl
 ov5Q1nxvsUoDC1ezj/LvPH7YUKaHflWJLxk2nW61rtgEzQU6yMcDcH49WUieS6te060R9IC1O
 yQ40/mDob7+vS1/kih6timFikkIhf9rsDzp+YF0mBS8HuL8E2VZUmScvkiH8o2hVUdStBjGgr
 A+09ik9kCPo3FVGPkxzPkGWtM/3DXinyOQQgoX+CdtF8PB9IuY3zQtJcP8j/SaFJdsdEDz+5x
 4J0JkaVNPMwai+ScTjZA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 26 Dec 2020 11:25:49 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> > +#define PIF_RAM 0x1fc007c0
> > +#define REG_BASE ((u32 *) CKSEG1ADDR(0xa4800000))
>
> 0xa4800000 sounds like a KSEG1 addr, I think phys should be 0x14800000?
> For driver it is common to use ioremap, or at least TO_UNCAC.

TO_UNCAC looks like it wouldn't work for vr4300, the manual says
uncached 64-bit space is 0xffff ffff a000 0000, when
include/asm/mach-generic/spaces.h puts the 64bit space start at
0x9000 0000 0000 0000.

ioremap - it looked like needless overhead. Is this a blocker?

The 0xa uncached prefix being in the address already is harmless, it is
the same on both 32-bit and 64-bit on this cpu. I left it in because it
makes it clear to me what kind of address it is, coming from the N64
side.

- Lauri
