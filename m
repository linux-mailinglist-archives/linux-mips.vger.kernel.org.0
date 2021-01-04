Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B092E9950
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbhADP4y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:56:54 -0500
Received: from mout.gmx.net ([212.227.17.20]:48979 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727608AbhADP4y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 10:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609775721;
        bh=8NEdpocCLqWu8a3zbI69ejxOfUQa2RG9d9K1rq/1J7A=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=W8TKWXt4mu4rbGIV4KLEC/JU6DQatHce47WJw9Ttm8r+WS/E48fH+8MsUFAfKrsQa
         iI/jlGGu60CWft5V5Ad9onA8uw72OenD6IUH7VEWLBxcqV+x2HtxkvY1HJ96vlJyCj
         5HNfPoBLJe+CBPYUxWCvABlXaOsYvnyEr/3Yxgj8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MV67y-1kWdqR1dBe-00SAEf; Mon, 04
 Jan 2021 16:55:21 +0100
Date:   Mon, 4 Jan 2021 17:56:59 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20210104175659.f5433d55d8e41b3c8b620894@gmx.com>
In-Reply-To: <db1936b0-a1ab-41b3-be09-ec301ea7ebc3@kernel.dk>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
        <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
        <20210104174348.cda010a3af0ec3d989732b37@gmx.com>
        <db1936b0-a1ab-41b3-be09-ec301ea7ebc3@kernel.dk>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3cUFM11+xIOsWHgU9xBN/+reAhgw4yCf1tkxisO4e1K1GZpLocm
 xMJboZWTfkCI7+wbX9qnpY9xbKXp4MWDbSppVe6CYHy93rqgt9i5gZ+lzgyGxK6UrBcKzmT
 cN4421ayY599nwWUAQci7mtz0oMcwdmuTSjKQ2uGQomIJHMHonWra16+JR0I4CsOFlMwfM0
 /2xAIZUPSBF371lDSupuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvMzhEPuJNI=:44iBeErXwDarRHzJ81DYrH
 xLlrcjTvZE3YrxnZGjIokk78rX9Glo/iQGHepaDMXkkuvypcn5sY65TvlScDHveSO7ZJVl2wr
 Y2qXV07AULBcGPj2QmS63fedmGGAqlIGHHQWeX/xgf6J6ki1CmOGuicvgWGbw6ZMj+/tHD688
 4Iwx4fxuvBdeJY5Fr2deyHrJoRCV+Ca7crrcibm4D1Ga1In2W6IJfh1q/d3L5gGHo38IOa1t7
 dvtkQAcB6EgK+WvI+LFpxppAxu//hskIndtIDzRpoepW9gyinSmc3uiVpOizFfNaGfWeClLu0
 XXlerI4UdUMSksW5yjnLgcm6J/PJ9SMuU6Lg4fy34zf9RJxa+rvw+ZfJDqLB8bX0PHLOOhlHT
 nKmWWL0/ds7bZmIsqX0O48GuvcvMQO8A3rK7VWf2RKUILB0lo9hdD+3Ngz6hAPKU/auruoD1+
 BlPxOmmc+gNyydn0xeH/NQnvA0Nz3T+dj86Ivahb920hwDj4sKkLYcuGedKpLlFnjM7y2gPQS
 gnR6Yz8+WiWfKycw6W5giUGds/kQJEJavGbh1mzuTUyaOawYEoGFWI586p8d4xQF9sNYRiHiV
 FWP6rz6ZRr0woXRJkT3ZlUJZ3uyfkBldFfIW0UckfLYqP82dwLFIAXqo8PBek/Yj21iZdNZID
 kUWp507YqCdEKp6b4TInZtsbF6ohal13rwgqcXXbLsGzh60KxOMSptLkf6GOUXFJkuE8bVkMO
 h3Hd3xBrpMF2ZlyOgkgHdLxFFU2A3s70fcg5JgSOK0Yatxfs1nAQi3fNyz9D9+iJbIltlQveg
 xNlU/G+wY2+rh8YCBEJ8q59RM8VB2odarg3ukv5bJwMG6PMkswtbsLeysdOaIDE1hRjUtQ/e5
 nwG+pm7TcovFWLduzNlA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 08:49:55 -0700
Jens Axboe <axboe@kernel.dk> wrote:

> On 1/4/21 8:43 AM, Lauri Kasanen wrote:
> > On Mon, 4 Jan 2021 08:40:10 -0700
> > Jens Axboe <axboe@kernel.dk> wrote:
> >> It should definitely get reviewed first. One easy question - there's =
no
> >> commit message in this one. It's a new driver, it should include some
> >> documentation on what it is, etc.
> >
> > It's already had one (rfc) round on linux-mips. Or do you mean by
> > others (who?)
>
> I mean the actual block driver from the block point of view. From
> a quick look, looks like there's no irq or anything, so it's
> strictly polled mode? Probably would make sense to push this out
> of the app path then, by using BLK_MQ_F_BLOCKING.

It's very unclear to me what that flag does. I read all the docs
available, but nothing made it clear (same applies for almost all
BLK_MQ_*).

- Lauri
