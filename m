Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E02C4437
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 01:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbfJAXUg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 19:20:36 -0400
Received: from mail-eopbgr790133.outbound.protection.outlook.com ([40.107.79.133]:4224
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727078AbfJAXUg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 19:20:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgWHq0zh/fM/R4ZBcQxlOuDTgQIpW/99SZYD5+5+ZjJY1RbUKmHFc/Zthx7Cy2WUVVcpZoEf0UOqhvIRXHsRK7g49eDfj1qKyvHhsaxI1CA7R4T4xuxl81ObcJMKhVEH9N7aif4xGdDzlP3h4a28SVIVRJFcyu19aUJR4DzOs7LMOLKGhxPG7hxiVAxIq0rD7ZVdVIQOEwaR0YFXqZio81JohimR+lyz6odm+RU3+Fk1Qh/Zw4dazt2OiIOsyIx9z6/It1SeHghhJaUC15EfMO+X4nHypRxRXAHVmZUoAlTet8wtLRdskiCZfrSf1pPLOO3bRW72l/JWKi4b2AV83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+SHZ+9RL3PQu9l1BZOG60bbBV4cOli8PNTI/O5vfjM=;
 b=kLou9XVFthWq0FjynLDfN5O2DTkqPTvYymHIs7GNhqm8oUbGdOMd2TZ42kioifl1DKm2bEf2sqLmVemhtMa+CwplqYkuKO73dzzzbPeaMGP8cdLy4yjtwYdJKT4YxrPWF3nrMnGKW9/ywdAtVjKjfmxcB5nj8scg++MgOHMQgQFk5Yb8ns4smJbh/GoTq47mUVv2CfXBajLnwE4xjbwHL5R/EJVyEvhCHHljeyve/iPugO8b3EIZHEWIOh2cY4gnJkWgY3chi56/kUtLvYTZR65lm/qcYsKvruf/5w3TGM5WQV+BfsrKbNNodiqAzvE0gT6A+w+Ezw/1y4h6H7jhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+SHZ+9RL3PQu9l1BZOG60bbBV4cOli8PNTI/O5vfjM=;
 b=ZlY5Xbf/VCBHjoc2b9h6PE9S1ykOOK2oFuibOtFKYbJACx9Kv3I+rf0mXBMGaneIJlafPa+BO+8poH8okZQHCalXQFp8b7EUdQQPBrbw/sBWQE9G6VrLmoKwVzSH5olgdGbmgoiFILKGWLoN5Lovyniqpn1eGnRbo1j48oI3V+w=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1328.namprd22.prod.outlook.com (10.172.63.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 23:20:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 23:20:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] MIPS: JZ4780: DTS: Add CPU nodes
Thread-Topic: [PATCH v2 5/5] MIPS: JZ4780: DTS: Add CPU nodes
Thread-Index: AQHVeK7SbV2C0qqRJUuqS/aXvoANpw==
Date:   Tue, 1 Oct 2019 23:20:33 +0000
Message-ID: <20191001232031.qaci6hk5tjo652mi@pburton-laptop>
References: <cover.1569955865.git.agriveaux@deutnet.info>
 <0dbd1986be4ee50bdd9f45c140aded7c49fddb8a.1569955865.git.agriveaux@deutnet.info>
In-Reply-To: <0dbd1986be4ee50bdd9f45c140aded7c49fddb8a.1569955865.git.agriveaux@deutnet.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.153.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73069e43-4224-4781-d46f-08d746c5f557
x-ms-traffictypediagnostic: MWHPR2201MB1328:
x-microsoft-antispam-prvs: <MWHPR2201MB1328E3607528D1C224A8A8E0C19D0@MWHPR2201MB1328.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(136003)(396003)(376002)(39840400004)(346002)(199004)(189003)(81156014)(99286004)(6506007)(386003)(76176011)(52116002)(81166006)(6916009)(8676002)(42882007)(25786009)(478600001)(26005)(186003)(102836004)(446003)(66556008)(64756008)(66446008)(66476007)(66946007)(71200400001)(33716001)(14454004)(66066001)(44832011)(476003)(486006)(11346002)(71190400001)(256004)(6486002)(6246003)(6116002)(3846002)(316002)(305945005)(7736002)(5660300002)(229853002)(9686003)(4326008)(1076003)(6512007)(54906003)(58126008)(2906002)(6436002)(8936002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1328;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZJtlPmOTGH1l/nazmseu2R1dAGYK9rIx89xk5x6J1WoEC9WGdOyUzPlRXEDCp8jEhZtP5BzRLnqtxytnuD1aGr6U2opmuZUFXYn0lYZppBoEvhoD7FJnpSvbsEIQ4FeDYHXusBsqqJd+L+cK0jUR+O5PhP63o+vFZCjG1wPA3ik06vMvyAs9UZ+Z2GYExotUiOS+UO6h+S7n6KMlBWANmkBblf7NfPTdgg1SSZa23gZ5zXUMxvuABNVzxiwVYE8++yCIMfz+9ULJ1U3M61/8h7AadpvPLGTa9/p2urXkZM9TDXluI+4+/3siZ1iOSWRr3LPOIXBB2lV1B23uHAfjUxoaQgUUYErPw9AFFNG631AgjUwtvrebewvGLBF0xQM574dHC7KgCpqZ45X66yc1JhnEiU+/jvQnxN1bx6HfpOM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9529F98D2530BE4ABE646708C200EF09@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73069e43-4224-4781-d46f-08d746c5f557
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 23:20:33.6799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D83YB6x2kmJifw6mk9bAJR4aDXTh2mYfmsj/826goi/KPkrmXfXoV8QRCrlL3WrdhnO6UpyM6hiEoT2nEoHLNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1328
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,

On Tue, Oct 01, 2019 at 09:09:48PM +0200, Alexandre GRIVEAUX wrote:
> The JZ4780 have 2 core, adding to DT.
>=20
> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/=
ingenic/jz4780.dtsi
> index f928329b034b..9c7346724f1f 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -7,6 +7,23 @@
>  	#size-cells =3D <1>;
>  	compatible =3D "ingenic,jz4780";
> =20
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			compatible =3D "ingenic,jz4780";

This should probably be something like ingenic,xburst2. JZ4780 is the
SoC. It also should be a documented binding, but I think it would be
worth holding off on the whole thing until we actually get SMP support
merged - just in case we come up with a binding that doesn't actually
work out.

So I expect I'll just apply patches 1-4 for now.

Thanks for working on it!

    Paul

> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible =3D "ingenic,jz4780";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +		};
> +	};
> +
>  	cpuintc: interrupt-controller {
>  		#address-cells =3D <0>;
>  		#interrupt-cells =3D <1>;
> --=20
> 2.20.1
>=20
