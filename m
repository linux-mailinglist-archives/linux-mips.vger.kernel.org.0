Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB2FDE2D2
	for <lists+linux-mips@lfdr.de>; Mon, 21 Oct 2019 05:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfJUDz7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 23:55:59 -0400
Received: from forward105p.mail.yandex.net ([77.88.28.108]:42319 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726819AbfJUDz6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 23:55:58 -0400
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net [IPv6:2a02:6b8:0:1619::113])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id A19134D405EE;
        Mon, 21 Oct 2019 06:55:56 +0300 (MSK)
Received: from myt3-372f9bf9bd7d.qloud-c.yandex.net (myt3-372f9bf9bd7d.qloud-c.yandex.net [2a02:6b8:c12:70e:0:640:372f:9bf9])
        by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ByAnOWj9vt-tuAOQEWl;
        Mon, 21 Oct 2019 06:55:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571630156;
        bh=DvFnsVlWrscYT7z3jtn14a7gUF8zHdPe5xVCgDgEQ9U=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=dmkHxERrDXI+z2jMbtrxobvd9f8Q/bicNrg4eyNff7xn524tnOYre3BBdPoTg4BjQ
         SbmzEOIO7m5FVteV2Q+QaZKQfmPJtj6yRKWV7hh3aLzJZ7tL9FoQMg0Gk3rZv6hof3
         RuaTJbBvGNZryCPwFXmFYO1GG/sw+fZH355PNzDk=
Authentication-Results: mxback10j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt3-372f9bf9bd7d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id bF6gIFGziN-tqq0h41d;
        Mon, 21 Oct 2019 06:55:52 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 21 Oct 2019 11:55:33 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H49Gx4RXz1ahDcxd6zrSgcj74UjwN=xopC_YYutojP_0Q@mail.gmail.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com> <CAAhV-H49Gx4RXz1ahDcxd6zrSgcj74UjwN=xopC_YYutojP_0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] MIPS: Loongson64: separate loongson2ef/loongson64 code
To:     Huacai Chen <chenhc@lemote.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B410=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
9:07:52, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun,
>
>Can we just "retire" the Loongson-2E/2F support? Let 5=2E4-lts be the
>last version which support Loongson-2E/2F=2E
Hi Huacai,

There are still a lot of Loongson-2F users=2E Please don't leave them alon=
e=2E

I'm still going to maintain these code=2E Although might not be very activ=
e=2E


>
>Huacai
>
--=20
Jiaxun Yang
