Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A6570C8E
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfGVW3C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 18:29:02 -0400
Received: from mail-eopbgr780101.outbound.protection.outlook.com ([40.107.78.101]:19856
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727391AbfGVW3B (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 18:29:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy5H+VowwYYSJXlNIkEw5T5ONRjAtgFkCRxqzv3KAFlHom5IYQjA1WeV5qyNKiliOahj8xzx0jBN9M0vYX60EqhNlYH+n/A7DfcN3mZPytxG8H1muGkfixsEG+VahO4ykqoJFK9tNjmhd0IjCjJdhtHVOh4xEXedtHPVrzF7yY6ZD6jM9GVwVDy7RpONzdkkSHxrC0kNwZs3lTTOVV3HNOK045I7+Q6h06lAaxPtFIL3XK4nvv1Memn5HU1pkvO5cZf9iDb0gGrS8UnYXwzvWDpl4DhlIPD3WbppKxUF/rc8MRJi7i5SEB3FsCTIDRd1/IqZ/lX2+xYKJPC6BYcgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2Rw9bmqKLvsAd/KDNSUcYfx06+b/oOFs02KrIPyMgI=;
 b=UvcBxLCw73BjvqXm1ONPdkOJE4cFLMkqoGOqwGAO3VZumZOFAYgVtvbHPH658U2kkkBiEv5XPs3oVSSaZW0nYtxIG/ubm2zPorXo4hLOXfj1Bh4Tw0LwtmWf+4BLWOsns33293gGSm0ul+UpaUkamkYDKQBPAg8ykvl9ODnbeUg79XxuqyN3JdpB0ftPAUN8vaKtmFFMmmFfMU8dyzZaNU3G3jX2pn0+o/nYKbcMxqPRU4yt5bTSPNiLmA7HlPIjZvESQl497IhDcbYZNB7KGVgwS7e3SiYVeOYcDRlYS4riWk6CMErZB4s9byLtk6Ux8Ri4falsVC6WZx25SkHMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2Rw9bmqKLvsAd/KDNSUcYfx06+b/oOFs02KrIPyMgI=;
 b=VtDOrfEyenUbvIg62HmpFqe3QSnvGKJIoJyaFzOh0fSfUDI4isJ9ytxHYO4LIT6jhnMNnDXu8NdWFm8eXFfeCJg1XP/t1gzg962vVRrJKUQMAHdF1ryhCZsoVBgUVfgNSPEuibqGCHnTk6nu+piA/vqJ4DO/R32lI0bttlstQsc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1263.namprd22.prod.outlook.com (10.172.62.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 22:28:59 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 22:28:59 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] MIPS: dts: ingenic: Add 'cpus' node
Thread-Topic: [PATCH 2/2] MIPS: dts: ingenic: Add 'cpus' node
Thread-Index: AQHVQLa+ICa8F+xhF0aMrnqoJdCEV6bXOEcA
Date:   Mon, 22 Jul 2019 22:28:59 +0000
Message-ID: <20190722222858.4nmhyzi45dg7u67u@pburton-laptop>
References: <20190722175548.18434-1-paul@crapouillou.net>
 <20190722175548.18434-2-paul@crapouillou.net>
In-Reply-To: <20190722175548.18434-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 000de6c1-3b49-4cf0-b3b6-08d70ef3fdba
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1263;
x-ms-traffictypediagnostic: MWHPR2201MB1263:
x-microsoft-antispam-prvs: <MWHPR2201MB12634FA078BD8AB8305E54D0C1C40@MWHPR2201MB1263.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(396003)(346002)(366004)(136003)(376002)(39840400004)(199004)(189003)(76176011)(8676002)(4326008)(71190400001)(71200400001)(476003)(305945005)(7736002)(33716001)(102836004)(316002)(81166006)(8936002)(81156014)(54906003)(2906002)(58126008)(99286004)(486006)(11346002)(446003)(52116002)(44832011)(26005)(186003)(6506007)(386003)(42882007)(68736007)(6116002)(3846002)(256004)(14444005)(1076003)(6486002)(6916009)(14454004)(478600001)(6436002)(6512007)(66476007)(66556008)(6246003)(66946007)(64756008)(66446008)(25786009)(5660300002)(9686003)(53936002)(229853002)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1263;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jLkHhHjDY2MRc3ZwFpzN0xza13Srlm0UFhRTgbZCyXt3jT9DkhUZXV8T7Y4c3UKZYQgue2PnfdeBjaFHcDCNuT9ou3OT1777mgcJ3rcHgh+BF9ILNGdq9iCUrIgD0eT76Pd39pkgHm2PnHlSoWYL69eJwfKm7QUbRr87C7pOvRKRBnFHpUXRv2MsK3TawcyVRbKdxl3LDopjqiSOFWb6KD1kbowztFagEloMB9QU/SXbIMruLEXZmrC8C/y/YWtQxJAkMBcnnNvSA+Uvq79B6NpGHiLgv3SycZaK0L1zwQf0C3DX0D6DufDUByiZ8fu2XbLU+iyi85w/l8ce2mxqXev6nFnyjpcqsTk9FMYyeC5FcZOIJ+9pz/+dGeY6QOri/7xD4s46qcaIypdnUcDfbtbHVYwsTmYhJ/0BJHxZFSk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9D7FBF6755D398489D4BA22B0396FC5E@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000de6c1-3b49-4cf0-b3b6-08d70ef3fdba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 22:28:59.4759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1263
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On Mon, Jul 22, 2019 at 01:55:48PM -0400, Paul Cercueil wrote:
> Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi files.

What's the motivation for this?

If it's to silence the "cacheinfo: Unable to detect cache hierarchy"
messages, does commit b8bea8a5e5d9 ("mips: fix cacheinfo") from
mips-fixes work for you instead?

I'm not seeing much point listing cache setup in DT when we already
detect it from cop0 anyway.

Thanks,
    Paul

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 19 +++++++++++
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 29 ++++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 47 ++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/=
ingenic/jz4740.dtsi
> index 2beb78a62b7d..14d777dae87d 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -6,6 +6,25 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4740";
> =20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-d0";
> +			reg =3D <0>;
> +			clocks =3D <&cgu JZ4740_CLK_CCLK>;
> +			clock-names =3D "cpu";
> +
> +			i-cache-size =3D <0x4000>;
> +			i-cache-block-size =3D <32>;
> +
> +			d-cache-size =3D <0x4000>;
> +			d-cache-block-size =3D <32>;
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/=
ingenic/jz4770.dtsi
> index 49ede6c14ff3..83ee526fbe10 100644
> --- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
> @@ -7,6 +7,35 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4770";
> =20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-d1";
> +			reg =3D <0>;
> +			clocks =3D <&cgu JZ4770_CLK_CCLK>;
> +			clock-names =3D "cpu";
> +
> +			i-cache-size =3D <0x4000>;
> +			i-cache-block-size =3D <32>;
> +
> +			d-cache-size =3D <0x4000>;
> +			d-cache-block-size =3D <32>;
> +
> +			next-level-cache =3D <&L2_cache>;
> +
> +			L2_cache: cache-controller {
> +				compatible =3D "cache";
> +				cache-unified;
> +				cache-level =3D <2>;
> +				cache-size =3D <0x40000>;
> +				cache-block-size =3D <32>;
> +			};
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/=
ingenic/jz4780.dtsi
> index b03cdec56de9..3339b37101c0 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -7,6 +7,53 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4780";
> =20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-e1";
> +			reg =3D <0>;
> +
> +			clocks =3D <&cgu JZ4780_CLK_CPU>;
> +			clock-names =3D "cpu";
> +
> +			i-cache-size =3D <0x8000>;
> +			i-cache-block-size =3D <32>;
> +
> +			d-cache-size =3D <0x8000>;
> +			d-cache-block-size =3D <32>;
> +
> +			next-level-cache =3D <&L2_cache>;
> +
> +			L2_cache: l2-cache {
> +				compatible =3D "cache";
> +				cache-unified;
> +				cache-level =3D <2>;
> +				cache-size =3D <0x80000>;
> +				cache-block-size =3D <32>;
> +			};
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type =3D "cpu";
> +			compatible =3D "ingenic,xburst-e1";
> +			reg =3D <1>;
> +
> +			clocks =3D <&cgu JZ4780_CLK_CORE1>;
> +			clock-names =3D "cpu";
> +
> +			i-cache-size =3D <0x8000>;
> +			i-cache-block-size =3D <32>;
> +
> +			d-cache-size =3D <0x8000>;
> +			d-cache-block-size =3D <32>;
> +
> +			next-level-cache =3D <&L2_cache>;
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> --=20
> 2.21.0.593.g511ec345e18
>=20
