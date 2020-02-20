Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 764BE165F59
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 14:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgBTN6r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 08:58:47 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17856 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727943AbgBTN6r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 08:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582207017;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=7yL9Udn53NkbbgUNkqIPdZQE2bNWaYqwiXCqgYxMS5Y=;
        b=NNkK0BjfSIAsfOgAsMzTkc55olp44bNnAHJOPTOovKNX/ufBvPqYla7q3fYpkKSG
        3BnepCcG8wGsfC3D4rIF9/DyZN//NIrL8K+M5GhB61KA7ZhYJky5aMdq/cTQdBxSr/7
        I2bMmzxm/KpElJgRlcQUYZ2+xr3zTuWx0tgTMdSE=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 158220701284843.8168629100137; Thu, 20 Feb 2020 21:56:52 +0800 (CST)
Date:   Thu, 20 Feb 2020 21:56:52 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     "PrasannaKumar Muralidharan" <prasannatsmkumar@gmail.com>,
        "Paul Cercueil" <paul@crapouillou.net>,
        "Mathieu Malaterre" <malat@debian.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-mips" <linux-mips@vger.kernel.org>,
        "Discussions about the Letux Kernel" <letux-kernel@openphoenux.org>
Message-ID: <17062e30fec.12ef478cf6311.3456058528169872039@flygoat.com>
In-Reply-To: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
References: <cover.1581958529.git.hns@goldelico.com> <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com> <20200218212609.GA30081@bogus> <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
Subject: Re: [RFC v4 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
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



--
Jiaxun Yang

 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=B8=89, 2020-02-19 13:48:56 H. Nikolau=
s Schaller <hns@goldelico.com> =E6=92=B0=E5=86=99 ----
 >=20
 > > Am 18.02.2020 um 22:26 schrieb Rob Herring <robh@kernel.org>:
 > >=20
 > > On Mon, Feb 17, 2020 at 05:55:26PM +0100, H. Nikolaus Schaller wrote:
 > >> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
 > >>=20
 > >> This patch brings support for the JZ4780 efuse. Currently it only exp=
ose
 > >> a read only access to the entire 8K bits efuse memory.
 > >>=20
 > >> Tested-by: Mathieu Malaterre <malat@debian.org>
 > >> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com=
>
 > >> Signed-off-by: Mathieu Malaterre <malat@debian.org>
 > >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
 > >> ---
 > >> .../bindings/nvmem/ingenic,jz4780-efuse.txt     | 17 ++++++++++++++++=
+
 > >> 1 file changed, 17 insertions(+)
 > >> create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz=
4780-efuse.txt
 > >=20
 > > Please convert to a DT schema.
 >=20
 > Is there someone of you who can help to do that?
 >=20
 > DT schemas are still like a Chinese dialect for me (i.e. I can decipher =
with help but neither speak nor write).

I just had a try.

https://paste.ubuntu.com/p/xgDdmwnGsz/

Not sure if it's correct.

Thanks.

 --
Jiaxun Yang

