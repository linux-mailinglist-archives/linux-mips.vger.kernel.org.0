Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A11A2D097
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 22:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfE1UnP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 16:43:15 -0400
Received: from mail-eopbgr810122.outbound.protection.outlook.com ([40.107.81.122]:59856
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726492AbfE1UnP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 May 2019 16:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01qTkcQblNJMZP/02m/65zmvJ0vMJM6kyOiC38S5+iU=;
 b=QonzlMpe45usap/yzGhCQvc5Tj4d6mOX0xf5QGHuhVrRTlYVwSyrE5hCgHJeYhUVCJhigPQuaxOv14dSyKStVZIzutNIzEYEDxs5aHB09D/SkTZPULBcbao1s77VX5j0AfQbJTRPhkb2zu2Qri9OIxxmiquqwJ5vicdSPcJhQww=
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com (10.174.80.14) by
 BN6PR2201MB1249.namprd22.prod.outlook.com (10.174.82.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.21; Tue, 28 May 2019 20:43:09 +0000
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de]) by BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de%3]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 20:43:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH 6/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPI controller DT
 node
Thread-Topic: [PATCH 6/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPI controller DT
 node
Thread-Index: AQHVFGx5JcpQD1LXTU67J09lWSp/OaaBAw4A
Date:   Tue, 28 May 2019 20:43:09 +0000
Message-ID: <20190528204306.r4mzjy7ytvvhfhnn@pburton-laptop>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-6-sr@denx.de>
In-Reply-To: <20190527091323.4582-6-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To BN6PR2201MB1266.namprd22.prod.outlook.com (2603:10b6:405:20::14)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e654e61d-018d-43c1-2d89-08d6e3ad17ee
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN6PR2201MB1249;
x-ms-traffictypediagnostic: BN6PR2201MB1249:
x-microsoft-antispam-prvs: <BN6PR2201MB12493A9A9178AA7E09F69F02C11E0@BN6PR2201MB1249.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(396003)(39850400004)(376002)(346002)(136003)(199004)(189003)(66476007)(386003)(6506007)(6246003)(66446008)(58126008)(54906003)(44832011)(6486002)(316002)(64756008)(11346002)(5660300002)(476003)(446003)(14444005)(42882007)(71190400001)(1076003)(6916009)(71200400001)(4744005)(486006)(25786009)(256004)(14454004)(6436002)(4326008)(186003)(229853002)(26005)(81156014)(76176011)(66066001)(305945005)(478600001)(7736002)(2906002)(3846002)(53936002)(66946007)(33716001)(73956011)(6512007)(9686003)(102836004)(68736007)(8936002)(99286004)(6116002)(66556008)(8676002)(81166006)(52116002);DIR:OUT;SFP:1102;SCL:1;SRVR:BN6PR2201MB1249;H:BN6PR2201MB1266.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xu9NomSNaha+8/c5qfyBswKw2CVN9LQVhJsvukyUoOeMwRqjob6V6xwBnVzTGarbIbOURj31sIUrkC+6TE6gkNce/KDUwTcHxHWGNd61ZFEHwFGh+RRUSupuluIqt+KvV2i8LBScRsL01ZiRGg8EGyux0Albg2kR3QxaECJzQZJq6g6piCPfmYTkaIEBBHk8qKmkr4UnyEMei/8r9CLH8odGHSWMn4a1xpSdizmqEeop99D5fcYXlNSNasfTPnF3aAxaweoDAAuynMkbYZw5R+w3xD3xSCmxpOZyfI8/FjHBgTcbbZwpcaqVCqRn+etdg5iQkKYouyeLjNHXfDpTNd2teoUM61Zn74IBZ2kPQlsRXK1wXBGcZGUSyWVBR9+Lc8E1xSppNShtZBnAH5+v9TjTL81doOdrfRxYMpP73sg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <354BBC0EC01121408FF5EA93E35B625C@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e654e61d-018d-43c1-2d89-08d6e3ad17ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 20:43:09.4170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1249
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stefan,

On Mon, May 27, 2019 at 11:13:21AM +0200, Stefan Roese wrote:
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/=
ralink/mt7628a.dtsi
> index 64a425c7d639..0895ae62782a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -186,6 +186,22 @@
>  			status =3D "disabled";
>  		};
> =20
> +		spi: spi@b00 {
> +			compatible =3D "ralink,mt7621-spi";
> +			reg =3D <0xb00 0x100>;

Same here as for the I2C controller - I don't see this compatible string
documented.

Thanks,
    Paul
