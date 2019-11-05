Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B23EFF0D
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2019 14:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389326AbfKENy0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 08:54:26 -0500
Received: from forward105j.mail.yandex.net ([5.45.198.248]:39976 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388000AbfKENy0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Nov 2019 08:54:26 -0500
Received: from mxback21g.mail.yandex.net (mxback21g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:321])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id 9D17AB21B40;
        Tue,  5 Nov 2019 16:54:24 +0300 (MSK)
Received: from iva6-6f4302ae52e5.qloud-c.yandex.net (iva6-6f4302ae52e5.qloud-c.yandex.net [2a02:6b8:c0c:9a82:0:640:6f43:2ae])
        by mxback21g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ZBm7sbOyma-sNBGlT5G;
        Tue, 05 Nov 2019 16:54:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1572962064;
        bh=TQqa08jA/tSCsuSUfu/tQBywDWyXH7Wco/2dW4hQIfI=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=mEgXY4UmNSpGOjX2cEnZE9/Z+R5UT8O2qBhRXGjgVznI6EaTcqkX7LUPHsdg/0ZGV
         yKB+W3b6mPQUL6BeszY7V7c7g4AfD78akoxAN5I8ua3F5FU9XhGideSdCJeCjHprLS
         2nhYIn61BYsF0ayHe+p5rxBPtkhqsjWWEzebH8yM=
Authentication-Results: mxback21g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva6-6f4302ae52e5.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id iP7fy47uYU-sMVCFrTe;
        Tue, 05 Nov 2019 16:54:22 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Tue, 05 Nov 2019 21:54:05 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.LFD.2.21.1911032301160.367459@eddie.linux-mips.org>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com> <alpine.LFD.2.21.1911032301160.367459@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] MIPS: Loongson: Remove Loongson-2E/2F support
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0279E7A7-197D-4D6B-9A4B-26E6791372E0@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B411=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=887=
:08:26, "Maciej W=2E Rozycki" <macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>On Sun, 3 Nov 2019, Huacai Chen wrote:
>
>> Loongson-2E/2F is old, inactive and a bit ugly, so let's remove them
>> and the world will be more comfortable=2E
>
> People still use them, e=2Eg=2E I do, and upstream removal causes an iss=
ue
>with the need to backport changes not specific to the platform=2E
>
>If you don't want to maintain the code, then just mark it orphan and
>rely=20
>on the community to maintain it=2E  If it starts breaking and nobody
>picks=20
>it to make fixes, then it can be removed=2E  There's no need to rush IMO=
=2E
>
>BTW, there used to be a patch somewhere to support more than 512MiB of=20
>DRAM with the 2E, but I can't find it -- can you help me tracking it

Hi Maciej

It seems like DRAM size issue is a firmware issue rather than kernel issue=
, some early versions of PMON don't pass highmem size correctly to the Kern=
el=2E
Probably you can manually set it in loongson-2ef/common/mem=2Ec=EF=BC=9F

Currently I can't find any working Fuloong-2E to test but the newest known=
 PMON can be found here[1]=2E

Thanks

[1] https://mirrors4=2Etuna=2Etsinghua=2Eedu=2Ecn/loongson/pmon/pmon_2e=2E=
bin
https://mirrors4=2Etuna=2Etsinghua=2Eedu=2Ecn/loongson/pmon/pmon_2e=2Ebin=
=2Emd5

--=20
Jiaxun Yang
