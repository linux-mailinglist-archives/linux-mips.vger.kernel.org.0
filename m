Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A5E140258
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 04:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgAQDgX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 22:36:23 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:57347 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726366AbgAQDgX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 22:36:23 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id 66D146740FD7;
        Fri, 17 Jan 2020 06:36:19 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 5F53D7080002;
        Fri, 17 Jan 2020 06:36:19 +0300 (MSK)
Received: from vla5-e763f15c6769.qloud-c.yandex.net (vla5-e763f15c6769.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:e763:f15c])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id a1MeNzqhuk-aHdai45h;
        Fri, 17 Jan 2020 06:36:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579232179;
        bh=o7C7QSp1tNndF9dhHqVnBtCm952xn76Pe6J9wt1IgLE=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=kWipAHvojJC7ky63S86/CHCuZ2KWqiyYeY++7GTfxJ0qvWhfFKmtX9M61/QKW4/3V
         QAPvjKGK5U8s8JOW2X3m48uxn//nthBXZWM51Mmo98jszuS3mV7jWZHh7/cvhHLhvv
         nRKQcMCsg4aU3n4Aldzd3JPkOQNEXv4NtfVTAGMU=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-e763f15c6769.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id BHG1m4ySsO-aEW427WJ;
        Fri, 17 Jan 2020 06:36:15 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Fri, 17 Jan 2020 11:36:04 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1579195429-59828-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com> <1579195429-59828-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/6] MIPS: JZ4780: Introduce SMP support.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mips-creator-ci20-dev@googlegroups.com, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com, hns@goldelico.com, paul@boddie.org.uk
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <D9108DBE-BA95-47C6-81B3-74FBC44E04FE@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8817=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
:23:44, "=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)" <zhouyanjie@wanyeetech=
=2Ecom> =E5=86=99=E5=88=B0:
>Forward port smp support from kernel 3=2E18=2E3 of CI20_linux
>to upstream kernel 5=2E5=2E
>
>Tested-by: H=2E Nikolaus Schaller <hns@goldelico=2Ecom>
>Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech=2Ecom>

Btw: I'm not clear with others attitude but personally I think we should a=
void non-ASCII
characters in kernel=2E

Many people work on kernel with command line tools and a lot of terminals =
didn't
configured to display CJK characters properly=2E

Pinyin or Wade=E2=80=93Giles of your name is enough for others to recogniz=
e or
credit you=2E

Thanks=2E

>---
>
>
--=20
Jiaxun Yang
