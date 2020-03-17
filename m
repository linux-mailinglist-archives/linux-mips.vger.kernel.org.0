Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E9A18787B
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 05:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgCQEfe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Mar 2020 00:35:34 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17910 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726637AbgCQEfd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Mar 2020 00:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584419709;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=APZWF4UvNayR28XTnIKoyV1DJsIdBG0qY1RSGMuczMc=;
        b=EVCcFgYdGH0V5x0ke6s3tZlzGdrHn88mC2Iq4w6vpMVH2eX4G1Bnd3TbYdj1+HnF
        bzffHSyeLvf9P2DBpGXq1+iTgQ7/d/Y99vN0oIIej1BLEoVA6FOYebqhxvHExe5gVuM
        BYymB/Qi0qZM8h3gCCD3WuheG6j9eALlNvRZhd+M=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1584419706447930.0665493868482; Tue, 17 Mar 2020 12:35:06 +0800 (CST)
Date:   Tue, 17 Mar 2020 12:35:06 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Timothy J Massey" <tmassey@modernmerchant.com>
Cc:     "linux-mips" <linux-mips@vger.kernel.org>
Message-ID: <170e6c6164b.12e21737310729.5218808239962309753@flygoat.com>
In-Reply-To: <OF26152112.986B2B0A-ON8525852A.000582FC-1584061212143@modernmerchant.com>
References: <OF26152112.986B2B0A-ON8525852A.000582FC-1584061212143@modernmerchant.com>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:Recommended_soft_CPU_?=
 =?UTF-8?Q?for_FPGA_for_Linux-mips=3F?=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=BA=94, 2020-03-13 09:00:12 Timothy J =
Massey <tmassey@modernmerchant.com> =E6=92=B0=E5=86=99 ----
 >=20
 > Hello
 >=20
 > I=E2=80=99m trying to find a recommendation for a soft CPU to run Linux-=
mips.
 > Ideally, I have a Terasic De0-nano board and I would like to use it to
 > synthesize a MIPS CPU I could use to boot a mainline MIPS kernel with.  =
I
 > originally purchased this to use with OpenRISC, but that seems to have
 > stalled: I=E2=80=99d rather work with something more mainstream if I can=
.  MIPS
 > seemed like a great intersection of simplicity and real-world practicali=
ty.
 > If another (affordable) board would be a better fit, I=E2=80=99m certain=
ly open.
 > But I would like to use a fully synthesized open CPU if at all possible.
 >=20
 > I=E2=80=99ve tried Googling for recommendations, but this is made diffic=
ult by a
 > few things:  proprietary soft cores provided by FPGA makers and tied to
 > their FPGA=E2=80=99s; =E2=80=9CMIPS-like=E2=80=9D cores that are vague a=
bout what =E2=80=9CMIPS-like=E2=80=9D
 > really means; and the confusion around the presence or absence of unalig=
ned
 > load/store and what impact that has.  (My understanding is the patents h=
ave
 > expired, so it shouldn=E2=80=99t be necessary to avoid them anymore?).
 >=20
 > MIPS Open hasn=E2=80=99t made this any easier.  They trumpet their openn=
ess, but
 > wrap everything up into a confusing mess of =E2=80=9Cproducts=E2=80=9D t=
hat are more sales
 > information than anything else.
 >=20
 > And while the Linux-MIPS website lists compatible computers, SoC, etc., =
I
 > didn=E2=80=99t see any listings for any FPGA / soft CPU environments.

mipsfpga-soc from wavecomp is supported but it's only for university
teaching purpose and I'm not sure if you can still apply for it.
=20
>=20
 > Do you have any suggestions for a recommended soft CPU to use with
 > Linux-mips?  Any information would be appreciated.
 >=20
 > Thank you!
 >=20
 > Timothy Massey

Thanks.


--
Jiaxun Yang
