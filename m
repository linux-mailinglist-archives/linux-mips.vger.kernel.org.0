Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A0C73633
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 19:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfGXR7D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 13:59:03 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56258 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbfGXR7C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Jul 2019 13:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563991140; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w7Ss6sBrQHMupDimQWwO95AVN89e91bf3yXBxmdm6jE=;
        b=HMBUm4xr7tlEhCFt6PaX05OQdnJDOsbf+iiPbQaNv1FdSBMsmng4rvUDmmTlD+MLO72MTL
        DodO/fj1dgfM302yjBbdgbKtmEYQolb7xmcXXccoIG6t6rmVAze60NJwKwJ0DH9SD10Knd
        8s105L0qFYLSPN33HG9+U4UziLhHpcs=
Date:   Wed, 24 Jul 2019 13:58:46 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] MIPS: dts: ingenic: Add 'cpus' node
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <1563991126.1918.0@crapouillou.net>
In-Reply-To: <20190722222858.4nmhyzi45dg7u67u@pburton-laptop>
References: <20190722175548.18434-1-paul@crapouillou.net>
        <20190722175548.18434-2-paul@crapouillou.net>
        <20190722222858.4nmhyzi45dg7u67u@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le lun. 22 juil. 2019 =E0 18:28, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul,
>=20
> On Mon, Jul 22, 2019 at 01:55:48PM -0400, Paul Cercueil wrote:
>>  Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi files.
>=20
> What's the motivation for this?
>=20
> If it's to silence the "cacheinfo: Unable to detect cache hierarchy"
> messages, does commit b8bea8a5e5d9 ("mips: fix cacheinfo") from
> mips-fixes work for you instead?
>=20
> I'm not seeing much point listing cache setup in DT when we already
> detect it from cop0 anyway.

Ok, just drop this patchset then.

>=20
> Thanks,
>     Paul
>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/boot/dts/ingenic/jz4740.dtsi | 19 +++++++++++
>>   arch/mips/boot/dts/ingenic/jz4770.dtsi | 29 ++++++++++++++++
>>   arch/mips/boot/dts/ingenic/jz4780.dtsi | 47=20
>> ++++++++++++++++++++++++++
>>   3 files changed, 95 insertions(+)
>>=20
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi=20
>> b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  index 2beb78a62b7d..14d777dae87d 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
>>  @@ -6,6 +6,25 @@
>>   	#size-cells =3D <1>;
>>   	compatible =3D "ingenic,jz4740";
>>=20
>>  +	cpus {
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		cpu0: cpu@0 {
>>  +			device_type =3D "cpu";
>>  +			compatible =3D "ingenic,xburst-d0";
>>  +			reg =3D <0>;
>>  +			clocks =3D <&cgu JZ4740_CLK_CCLK>;
>>  +			clock-names =3D "cpu";
>>  +
>>  +			i-cache-size =3D <0x4000>;
>>  +			i-cache-block-size =3D <32>;
>>  +
>>  +			d-cache-size =3D <0x4000>;
>>  +			d-cache-block-size =3D <32>;
>>  +		};
>>  +	};
>>  +
>>   	cpuintc: interrupt-controller {
>>   		#address-cells =3D <0>;
>>   		#interrupt-cells =3D <1>;
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi=20
>> b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  index 49ede6c14ff3..83ee526fbe10 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
>>  @@ -7,6 +7,35 @@
>>   	#size-cells =3D <1>;
>>   	compatible =3D "ingenic,jz4770";
>>=20
>>  +	cpus {
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		cpu0: cpu@0 {
>>  +			device_type =3D "cpu";
>>  +			compatible =3D "ingenic,xburst-d1";
>>  +			reg =3D <0>;
>>  +			clocks =3D <&cgu JZ4770_CLK_CCLK>;
>>  +			clock-names =3D "cpu";
>>  +
>>  +			i-cache-size =3D <0x4000>;
>>  +			i-cache-block-size =3D <32>;
>>  +
>>  +			d-cache-size =3D <0x4000>;
>>  +			d-cache-block-size =3D <32>;
>>  +
>>  +			next-level-cache =3D <&L2_cache>;
>>  +
>>  +			L2_cache: cache-controller {
>>  +				compatible =3D "cache";
>>  +				cache-unified;
>>  +				cache-level =3D <2>;
>>  +				cache-size =3D <0x40000>;
>>  +				cache-block-size =3D <32>;
>>  +			};
>>  +		};
>>  +	};
>>  +
>>   	cpuintc: interrupt-controller {
>>   		#address-cells =3D <0>;
>>   		#interrupt-cells =3D <1>;
>>  diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
>> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  index b03cdec56de9..3339b37101c0 100644
>>  --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>  @@ -7,6 +7,53 @@
>>   	#size-cells =3D <1>;
>>   	compatible =3D "ingenic,jz4780";
>>=20
>>  +	cpus {
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		cpu0: cpu@0 {
>>  +			device_type =3D "cpu";
>>  +			compatible =3D "ingenic,xburst-e1";
>>  +			reg =3D <0>;
>>  +
>>  +			clocks =3D <&cgu JZ4780_CLK_CPU>;
>>  +			clock-names =3D "cpu";
>>  +
>>  +			i-cache-size =3D <0x8000>;
>>  +			i-cache-block-size =3D <32>;
>>  +
>>  +			d-cache-size =3D <0x8000>;
>>  +			d-cache-block-size =3D <32>;
>>  +
>>  +			next-level-cache =3D <&L2_cache>;
>>  +
>>  +			L2_cache: l2-cache {
>>  +				compatible =3D "cache";
>>  +				cache-unified;
>>  +				cache-level =3D <2>;
>>  +				cache-size =3D <0x80000>;
>>  +				cache-block-size =3D <32>;
>>  +			};
>>  +		};
>>  +
>>  +		cpu1: cpu@1 {
>>  +			device_type =3D "cpu";
>>  +			compatible =3D "ingenic,xburst-e1";
>>  +			reg =3D <1>;
>>  +
>>  +			clocks =3D <&cgu JZ4780_CLK_CORE1>;
>>  +			clock-names =3D "cpu";
>>  +
>>  +			i-cache-size =3D <0x8000>;
>>  +			i-cache-block-size =3D <32>;
>>  +
>>  +			d-cache-size =3D <0x8000>;
>>  +			d-cache-block-size =3D <32>;
>>  +
>>  +			next-level-cache =3D <&L2_cache>;
>>  +		};
>>  +	};
>>  +
>>   	cpuintc: interrupt-controller {
>>   		#address-cells =3D <0>;
>>   		#interrupt-cells =3D <1>;
>>  --
>>  2.21.0.593.g511ec345e18
>>=20

=

