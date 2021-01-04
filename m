Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1362E990C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbhADPnn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:43:43 -0500
Received: from mout.gmx.net ([212.227.15.15]:37107 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727166AbhADPnm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609774930;
        bh=FRmB1lcrJAP/pEZFGwDlULCix3fF+Jo/5C+FYatJ8nw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=TOvmoBfdyiDBHEwG2uY5+FKnn9hvKK1MUaXPuBMOy9iEa2xaB+sEP8AUpFXM+GaVO
         Rr9RjK3m1r7KzxV5fb7GPEERPGt74ril9Odbn3lpb5GakZBMSkWV5sDMw37p2n9PFk
         V9PoIuKb4n+GFwjjTO503Mkl3evG+FSOaFjnCTWg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MRTRH-1kbK4d17sj-00NTPi; Mon, 04
 Jan 2021 16:42:10 +0100
Date:   Mon, 4 Jan 2021 17:43:48 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20210104174348.cda010a3af0ec3d989732b37@gmx.com>
In-Reply-To: <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
        <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QzGaGxwZ4fq0LsWu3EYfTufwbnPeMnjmK2Izen2G/pHkzrCd2+G
 J64M42i2u5p4iUcaJV0yDKeE/vnVZq6U/SyJZiAlfwXK8RX4VKyfCVD9VtkBZT8RJymY0jE
 YU/9Lo9SmFJpM01s9IWkeVp1mRVdvqPzCnyW5J9KNyYt0Oa5LI2Pzm4dlS9/Qcz+T7NJJ4N
 ZJ5yInggJf33C3TRjrU6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d9ES2pwKw/0=:ibFDeBhvVRFztqhy75w6F8
 XADsMtIdnCPFdrt+Gjplh1ejWPoPc9c/y4PHRkg5w88Nm86bUZ4RdGxbtSN/anKYLef0H63zH
 lKCyjS/F88t2mJhbjW8Lx9eOjVUBfWKm5DARsGvpiO9pDKT4OOTPcncqh0SYhCcvoaNCptaWM
 70pKXKB4JhalzGHXqmqZ5dRIUIXBq5Oq4M6G3iajTYpt5Q/mTlR6wzEbQpbDKuNYQsHoPqYnk
 xCTF4RRRTTpvraHASRzH1251yY2uu1WcXnCMdwH72LvfpxjlxtE9o9lEKNZPZjJrm5Q6v4m3B
 8zMuQ0nx1M/RUco1ZtWh7acC0Rz5hxo6ZK6CTLT6cjv53rIcqHt1s9nVhCQW6yLqotvkPHRIx
 DIVSW26Wk44rYkdrOYi6prUZLWeL0ahZs2QUrQ2BfBYmQ2poC5ppurgza37hnFPNKAy9NqI7f
 VfMgHKYFlY+rX5qV0GMiTUHyHjb7IAir8P93XcfBg4M6DD4XJ+s/g58ziYEzYu2zeYa7fKXpo
 2dfppA/Et1br+VXA3pMWJZoRiJdIsUk0nzVZdjcoqkMJa2xAHxX7mFYQR4m0BP1IeiL8T378W
 mu2rXmHCS/cGfx/3yk0r8BXo0UKPii6HNipgX9adykCCTjUwfgzN+FurpBCUdijbuVEUw7Uvv
 siuwvYFTlunrh6D8wVNDwk0BdBn0BxLD0Yy9pG0HmFj4DJk3ZXt/6eYWuWO74AsybQYZ4WSYy
 muBh/A6am3QczJLcR2iOf3MlTF0RkJgCrmeDikUozUpEoSLrLNMwTQ4Ywl2E1Fn1RFYWbm3Os
 agtEEfeKDVi7WMtb/cBrViS+zCfvebZWkliQ7NMuxqMKvk1l6klpbbBljz3qZgmRJrQqhl4VM
 +U8o3hKme6KI+TORqShA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 08:40:10 -0700
Jens Axboe <axboe@kernel.dk> wrote:

> On 1/4/21 6:50 AM, Lauri Kasanen wrote:
> > Signed-off-by: Lauri Kasanen <cand@gmx.com>
> > ---
> >  drivers/block/Kconfig   |   6 ++
> >  drivers/block/Makefile  |   1 +
> >  drivers/block/n64cart.c | 203 +++++++++++++++++++++++++++++++++++++++=
+++++++++
> >  3 files changed, 210 insertions(+)
> >  create mode 100644 drivers/block/n64cart.c
> >
> > block folks: rest of the series is on linux-mips. Being a
> > mips-specific driver, not sure which tree it should go to.
>
> It should definitely get reviewed first. One easy question - there's no
> commit message in this one. It's a new driver, it should include some
> documentation on what it is, etc.

It's already had one (rfc) round on linux-mips. Or do you mean by
others (who?)

- Lauri
