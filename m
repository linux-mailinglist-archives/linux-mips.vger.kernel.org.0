Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A34DFC07
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 04:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730929AbfJVCri (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Oct 2019 22:47:38 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:47337 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730922AbfJVCrh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Oct 2019 22:47:37 -0400
Received: from mxback28j.mail.yandex.net (mxback28j.mail.yandex.net [IPv6:2a02:6b8:0:1619::228])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 0B3F36680A69;
        Tue, 22 Oct 2019 05:47:35 +0300 (MSK)
Received: from myt3-372f9bf9bd7d.qloud-c.yandex.net (myt3-372f9bf9bd7d.qloud-c.yandex.net [2a02:6b8:c12:70e:0:640:372f:9bf9])
        by mxback28j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id oal3fLJ3Zd-lYleFgrA;
        Tue, 22 Oct 2019 05:47:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571712455;
        bh=/Sq8/ifta0DKIvsP3US4g3qlMQt6dRVUKzZiBwRcEDk=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=QiLUHdunbbxBLisxaCyt0YQ495IVjjbSChS68nLU/zjmbUnxzWcc3ArSoPqPwhgae
         z+sP191f4l8R5Ot2S6k+dO7C+I7DEFiv2+q92Z8lswEjtGVhYAf/rdxYZxwWDzzZwN
         PTi6ZM8HRWf0RWafyyRef0SXKMmuzbANZnjxHdyw=
Authentication-Results: mxback28j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt3-372f9bf9bd7d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id yiRjd7UupG-lXVWKs9b;
        Tue, 22 Oct 2019 05:47:33 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Tue, 22 Oct 2019 10:47:20 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H6iCHprEHRa2Do2QEQD+UkML=X=UwemR3OELXCrBhwv7w@mail.gmail.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com> <CAAhV-H49Gx4RXz1ahDcxd6zrSgcj74UjwN=xopC_YYutojP_0Q@mail.gmail.com> <AF48876C-308C-46AD-B7B4-77BFA2413EDE@flygoat.com> <CAAhV-H6iCHprEHRa2Do2QEQD+UkML=X=UwemR3OELXCrBhwv7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] MIPS: Loongson64: separate loongson2ef/loongson64 code
To:     Huacai Chen <chenhc@lemote.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <B253D5C6-FA22-455A-8745-18A7D1E862B7@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B410=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
9:35:38, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun
>
>On Mon, Oct 21, 2019 at 11:56 AM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom=
>
>wrote:
>>
>>
>>
>> =E4=BA=8E 2019=E5=B9=B410=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=889:07:52, Huacai Chen <chenhc@lemote=2Ecom>
>=E5=86=99=E5=88=B0:
>> >Hi, Jiaxun,
>> >
>> >Can we just "retire" the Loongson-2E/2F support? Let 5=2E4-lts be the
>> >last version which support Loongson-2E/2F=2E
>> Hi Huacai,
>>
>> There are still a lot of Loongson-2F users=2E Please don't leave them
>alone=2E
>>
>> I'm still going to maintain these code=2E Although might not be very
>active=2E
>If Loongson-2E/2F block us to modernize Loongson64, let's just retire
>it; if it doesn't block us, we don't need to separate=2E

Let's get separate merged and see what are we going to do next=2E

Loongson 2F is only about ten years old=2E Still very young to other MIPS =
machines lie in kernel tree=2E

>
>Huacai
>>
>>
>> >
>> >Huacai
>> >
>> --
>> Jiaxun Yang

--=20
Jiaxun Yang
