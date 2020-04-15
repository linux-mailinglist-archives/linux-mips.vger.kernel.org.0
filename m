Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B5E1A98D3
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 11:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895507AbgDOJ05 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895494AbgDOJ04 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 05:26:56 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B167EC061A0C;
        Wed, 15 Apr 2020 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586942812;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QSUY1yUiWe9X6ZGNIO1eH3insGRwBB0CwHRK6fHg7uQ=;
        b=qlAD48FijIaBoAx9ezb9opMkPMPwJpEBYm7kVCbfB14p09Yq5qj0+PrIOI7a5QHsgS
        A6f7DumiHE8MZ4Bo5cP5+BCuQgzTgomwBDVFdtGkDE5Cas7onZSDZ85F05pGoTMlAxyr
        o1LOgQmVrSwLM4o0aG4m39+j+V2AbyNlWeebGdnWol/VOo2Xw3gDGvmqBE03mzYFR4Yz
        9+vSGEkqV1JQuahiBJ/M3qTRyW4OT9CgiNG5DWNJKMWUWl/KL4Ab3LCzpg3nngAb6skv
        eBcjdzHVUAChMfWwzgBgWVFfWTgedno9mf8idJn84ToAR47waXQBwCu0Zd+LNHYRY+O7
        XlGQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F9Qa0oW
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 11:26:36 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
Date:   Wed, 15 Apr 2020 11:26:35 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1E898A7-73BB-4C20-98D2-2D32F0DC170F@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com> <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergei and Jonathan,

> Am 15.04.2020 um 11:15 schrieb Sergei Shtylyov =
<sergei.shtylyov@cogentembedded.com>:
>=20
> Hello!
>=20
> On 15.04.2020 11:35, H. Nikolaus Schaller wrote:
>=20
>> From: Jonathan Bakker <xc-racer2@live.ca>
>> to add support for SGX540 GPU.
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi =
b/arch/arm/boot/dts/s5pv210.dtsi
>> index 2ad642f51fd9..e7fc709c0cca 100644
>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>  			#interrupt-cells =3D <1>;
>>  		};
>>  +		g3d: g3d@f3000000 {
>=20
>   Should be named generically, "gpu@f3000000", according to the DT =
spec 0.2, section 2.2.2. It's either "gpu" or "display" TTBOMK...

Yes, you are right and we have named it such for all other
devices in this series. I just missed that.

Jonathan, if you are ok, I'll fix that.

>=20
> [...]
>=20
> MBR, Sergei

BR and thanks,
Nikolaus

