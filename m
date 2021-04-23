Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD2E368BC3
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 06:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhDWEDA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 00:03:00 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44525 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229454AbhDWEDA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 00:03:00 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2AA9F5C00BA;
        Fri, 23 Apr 2021 00:02:24 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Fri, 23 Apr 2021 00:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm2; bh=03/g2
        xB/0xYGPh0ut2C+Web+4rsnUfIFZ7I++jHdcLU=; b=ri0ZrUL+Xmgf47+zY/kEv
        8AWobWZff9EKRomXOpV+CE4nK5h4Dbxe5ztuV2+AQy+F5zAmT1bLMdRQ9HvK7D2/
        eZZ/LpvoRGIWmHvJEIB4IjtoFxnpd/G+tYM7tpgnzxLMF3MP2gUqPccDHGecZdrY
        48Sz/ANQZIG33emg3/MlU/ewVJoZFMJYrV/vAmDCTDWqYu5TAcqFesfn3rE6Qsrw
        HdDRWDVgqUNCbihaICi8eispkIpTA6HX7BVgGaRwWGc70PME4GpyyMZxUCeHuODC
        772KrJpWEmXr9+qfbFLF+XMc5G3EalZYOnk/zGlWu3RTcIAAE62BejYzxClV5I5j
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=03/g2xB/0xYGPh0ut2C+Web+4rsnUfIFZ7I++jHdc
        LU=; b=C8U0eC7iTodc6ivFPRSZVIvQcXPUXdXt4NAP9QI6CfTYJ/gujtbfLKBvx
        TGxEqBgEbG095UWdezP7qiXu826FNqmCbCzyH/0aLwuTXwu6GS6L+IPDaPPQkhIY
        8d363t0ua7QFXXtKYzGuxAgnRaCUU452tEbHHxONdHOCY2laR2bUlpgRg9TfVU1t
        5pffrgcLFctJsL40AgL0k2jotm2Yowq19RX4CLfuXZW+IlzRF4KFw7bqO2z5k3sy
        /ODl2HBZd3Qts8xbdh7dmvzbeTUbAyOM0nqg8T85Hv003Q9hJ96hAWI7BSd47baE
        92qWM0prMZ6cAN3yCw7SpsFbJ0/iw==
X-ME-Sender: <xms:zkaCYOIZPxSlBgK850lYIVrKyPLdYv7NAoqoVvlqjm87UAHZJzKUVw>
    <xme:zkaCYGItbXBhyT7e5DCXCRqk7G6M1dfp3YQUX_BZX-6WyK45GCQ7oQgowf2QJshPF
    RmRWFOji3NvY1pa1ik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnheptedtjedvvddthffgheeujedttddtgfektdeghfeltdek
    leefhffhleelvdejkeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:zkaCYOu2-r7BVvj1-_2sRPBY0DSIhqmO1lLou_1h8nNE4IcBLzCB2A>
    <xmx:zkaCYDZwnkCCnCY4m0UKcAZo7y1nT_62q0j9iCWu-IA8fENgnIWPcA>
    <xmx:zkaCYFYPUl6nvkakOLecgkZSZGiSTgJdIJ192myLsV_sBgC3lmv_pg>
    <xmx:0EaCYIzL5m6u3iZHEY5J1VjiETi9p3cNVRJ7my2uWmvbZP9M5MKUAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AB7A7130005F; Fri, 23 Apr 2021 00:02:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <6abcefbe-0e49-4e68-abc1-b9535d5467ea@www.fastmail.com>
In-Reply-To: <tencent_A816CB57EADAD19FD3FFC04C3598E81B5608@qq.com>
References: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
 <1053fddf-479a-6014-ca2c-110c19574f84@loongson.cn>
 <tencent_A816CB57EADAD19FD3FFC04C3598E81B5608@qq.com>
Date:   Fri, 23 Apr 2021 12:02:01 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     maoxiaochuan <maoxiaochuan-gz@loongson.cn>,
        "Qing Zhang" <zhangqing@loongson.cn>,
        "xiaochuan mao" <maoxiaochuan@loongson.cn>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_=E5=9B=9E=E5=A4=8D=EF=BC=9A_[PATCH]_MIPS:DTS:Fix_label_nam?=
 =?UTF-8?Q?e_and_interrupt_number_of_ohci_for_Loongson-2K?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Fri, Apr 23, 2021, at 10:47 AM, maoxiaochuan wrote:
> Ok, I will send a another patch for it.

Please correct your email client setup.


https://www.kernel.org/doc/html/latest/process/email-clients.html

> =20
> =E7=A5=9D=E5=A5=BD
> =20
>=20
>=20
> ------------------ =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 --------------=
----
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* "zhangqing"<zhangqing@loongson.cn>;=20
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2021=E5=B9=B44=E6=9C=8823=E6=97=
=A5(=E6=98=9F=E6=9C=9F=E4=BA=94) =E4=B8=8A=E5=8D=8810:37
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* "xiaochuan mao"<maoxiaochuan@loongson.c=
n>; "Rob=20
> Herring"<robh+dt@kernel.org>; "Thomas=20
> Bogendoerfer"<tsbogend@alpha.franken.de>; "Jiaxun=20
> Yang"<jiaxun.yang@flygoat.com>;=20
> *=E6=8A=84=E9=80=81:* "devicetree"<devicetree@vger.kernel.org>;=20
> "linux-mips"<linux-mips@vger.kernel.org>;=20
> "linux-kernel"<linux-kernel@vger.kernel.org>;=20
> *=E4=B8=BB=E9=A2=98:* Re: [PATCH] MIPS:DTS:Fix label name and interrup=
t number of ohci=20
> for Loongson-2K
>=20
>=20
> On 04/23/2021 09:52 AM, xiaochuan mao wrote:
> > from Loongson-2K1000 user manual know that under pci bus
> > the device num is 4, function number is 2 and register is 0x2200
> > is ohci. the ohci interrupt number is 51. because Loongson-2K1000 ha=
s
> > 64 interrupt sources, 0-31 correspond to the device tree liointc0 de=
vice
> >   node, and the other correspond to liointc1 node. so it should be
> > number 19 correspon to liointc1.
> >
> > Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
> >
> Hi, xiaozhuan
>=20
>=20
> Thanks for the patch, this is my mistake.
>=20
> Can you correct the GPL-3.0 of this file to GPL-2.0 by the way?
>=20
> Thanks
>=20
> -Qing


--=20
- Jiaxun
