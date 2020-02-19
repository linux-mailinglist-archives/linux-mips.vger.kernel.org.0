Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86AF4163CCD
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 06:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgBSFtI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 00:49:08 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:11182 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgBSFtI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 00:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582091344;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=alpNl+QogLXB42TE03qgaGa0z0wDQj+d62gUywp3S5A=;
        b=gUDoMSdW6YuIkmZ1jMtThaM78Tob0DWmoyyzqlDnevMz5t8SNbCVClfVXfAH11WihO
        PpDjA4HRPc2U2ua1q4/Q6PTwI0Hdzvpziq6MgEoiNDvJkhFuFfTQ6EOu1ZkYfphIud7w
        08eNoGYbNp0O731QDLTK+CBQZO7INRXmfLHajgvrF0z/GrUuBgavlV5ax2OW5pIeAptq
        U2/AkE/s7/fjhLh+XykUEmVwuByJCcbbSju/BlW7oE1uFOW84ksd4EH73LV0b7FQ8ATp
        DpJ29TpFG9cRlw+qKhIV1zrJ9bPl9ZncIDdmT4d9X9TR5kEN40JML91XPV9tlHqPdlbY
        Qglw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSZXA4LLQg="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1J5mvVzS
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Feb 2020 06:48:57 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC v4 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200218212609.GA30081@bogus>
Date:   Wed, 19 Feb 2020 06:48:56 +0100
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CFE9AEF5-FFF9-44A9-90D8-DE6AC7E7DD4F@goldelico.com>
References: <cover.1581958529.git.hns@goldelico.com> <86b78db4d607e0bdda6def018bc7f73207ce82e8.1581958529.git.hns@goldelico.com> <20200218212609.GA30081@bogus>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 18.02.2020 um 22:26 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Mon, Feb 17, 2020 at 05:55:26PM +0100, H. Nikolaus Schaller wrote:
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>=20
>> This patch brings support for the JZ4780 efuse. Currently it only =
expose
>> a read only access to the entire 8K bits efuse memory.
>>=20
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../bindings/nvmem/ingenic,jz4780-efuse.txt     | 17 =
+++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>=20
> Please convert to a DT schema.

Is there someone of you who can help to do that?

DT schemas are still like a Chinese dialect for me (i.e. I can decipher =
with help but neither speak nor write).

BR and thanks,
Nikolaus

>=20
>> diff --git =
a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>> new file mode 100644
>> index 000000000000..339e74daa9a9
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>> @@ -0,0 +1,17 @@
>> +Ingenic JZ EFUSE driver bindings
>> +
>> +Required properties:
>> +- "compatible"		Must be set to "ingenic,jz4780-efuse"
>> +- "reg"			Register location and length
>> +- "clocks"		Handle for the ahb clock for the efuse.
>> +- "clock-names"		Must be "bus_clk"
>=20
> 'clk' is redundant. How about 'ahb'?
>=20
>> +
>> +Example:
>> +
>> +efuse: efuse@134100d0 {
>> +	compatible =3D "ingenic,jz4780-efuse";
>> +	reg =3D <0x134100d0 0x2c>;
>> +
>> +	clocks =3D <&cgu JZ4780_CLK_AHB2>;
>> +	clock-names =3D "bus_clk";
>> +};
>> --=20
>> 2.23.0
>>=20

