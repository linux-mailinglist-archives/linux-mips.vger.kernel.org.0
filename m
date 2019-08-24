Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14529BE34
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2019 16:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfHXON6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Aug 2019 10:13:58 -0400
Received: from mail-eopbgr750090.outbound.protection.outlook.com ([40.107.75.90]:62762
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727546AbfHXON5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Aug 2019 10:13:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy7Y42Gnc8FUmvgfGkD/ltBAya2IK6Gt50ZuSTAg6Qd9ZwcvsLlPEERu7SqA/gxYw0++EUMGavmTrqacKFJWJ/Pnrelu6k1MFG46V6cAUbLmpqbrofVw7+rXtVjQ3TRV8HK1PSRk2ip637DdeT7kImQi5o6oDlU3FBIRmASOg3SysSFcSVa+BltMBvLAWhcKDipFBzf4M7H0H9xTH1uZSZa0dHTif2TME769ae677CjAJyK/T3q7DnvneAyJPHOE+o/qT41Y4OzSKaqGGwM+JJGP1eOjTXlJ2jNbTMJRm5CecS+TIYg7dsB0AYyyTC7di5u9q4pYuu4sYdeIhGIsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0/0aXQXLiVGqOBXqqS3IQ6IRsYWA+UfNU5p67qahsg=;
 b=ZCnKBOb5Cdw+LLc7BmrWwjA16f/eHLzp7o7PHz/vTqWSZqN8EdfsWeqNL2gGLKBf1Fbn0SOAKwFxPVG9CY5/BO79UIJjS4RaCRNMsx7GlMYzTFuekq9UwsmQDwt8uVa1Kw9p7T4jiRMWoc+gXfadSE7mr7WTywdLfqel516SLtfCUSqQ5ccY538Pfgc61ZSNcWDtajk2F8WtGnZNr5kXSRmVNFvL13P48Py7cneswywDmDKVequ6g2kKg7uQfm0JcEcCHCTfo9zDe8LGljYMTiqPoc7OAuxQoVajcZexogfyYrP9zpGyXVk630fbN6cHa3cxF/QRzNUj9vrox25MAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0/0aXQXLiVGqOBXqqS3IQ6IRsYWA+UfNU5p67qahsg=;
 b=L31/YJqi6rpkKUDnzUCRfoNAj0Z7LZ5XkivQrfn2VK0LVkKGKNB5cO2Nv+3YkDAcjm39zR7oWlvSzyLYiza8V+Dc2T3PPw63KSRwC74pfe7AkYj/INTqfZ13S656XRP5NbkQDdTc+OQVXHY9/TxALJvJPJhsGQd2/Ozx/aWleYQ=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1736.namprd22.prod.outlook.com (10.165.90.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 14:13:54 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168%5]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 14:13:54 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "john@phrozen.org" <john@phrozen.org>,
        "kishon@ti.com" <kishon@ti.com>,
        Paul Burton <pburton@wavecomp.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hauke@hauke-m.de" <hauke@hauke-m.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ms@dev.tdt.de" <ms@dev.tdt.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] MIPS: lantiq: update the clock alias' for the
 mainline  PCIe PHY driver
Thread-Topic: [PATCH v3 4/4] MIPS: lantiq: update the clock alias' for the
 mainline  PCIe PHY driver
Thread-Index: AQHVWoYpxj9W4cGayUKjpXZeJ7OkUw==
Date:   Sat, 24 Aug 2019 14:13:54 +0000
Message-ID: <CY4PR2201MB1272F47798E4002689E89D01C1A70@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::13) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b194438-00b0-4e69-643d-08d7289d4bb1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1736;
x-ms-traffictypediagnostic: CY4PR2201MB1736:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB1736681D5B2CDFF2430F5BDBC1A70@CY4PR2201MB1736.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(4744005)(256004)(6116002)(4326008)(6916009)(8936002)(446003)(2906002)(5660300002)(6246003)(11346002)(486006)(44832011)(476003)(14444005)(55016002)(42882007)(71190400001)(71200400001)(7416002)(6506007)(386003)(8676002)(7696005)(66446008)(64756008)(81166006)(81156014)(6306002)(66946007)(52116002)(6436002)(99286004)(229853002)(33656002)(74316002)(7736002)(186003)(305945005)(53936002)(54906003)(46003)(316002)(25786009)(9686003)(76176011)(66476007)(66556008)(478600001)(15650500001)(966005)(52536014)(14454004)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1736;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: chcJlaT4MQZPJiAX3eARHy+zWbNjIeLbGA7zvjgfCM1P91Ck917CRdP73atRO97IVrbi57Dy2JE9Pl4ldKvMYf5OflyXo2ZY8Z4PeyJ3IA2IDWwhP/GPMdT0KKxbpL9y3O9BVAd7ssg6mO0GreIV93Wx93tPpH2sxEGAwTCkkDEoLO0g6HN5yyB2A+DVZE8lXmP+L/zQSq19kZdQq0qQZy4qfdMAEUrEcMQzHBFmddDzDu+QPNv+iyt/3l9tQ+MqWIi4yQyRbkQzG+vV5W3FN9otwMnEjQpq2Sdlnkn1FEwU674IUBXO+hlwqDy72ccyT+HIwBdcSXDR0NlK07UW1eMCt65NXV1aTiIK8eh4RuQJDIiJksiOilhOBO/a3Yi7jAfxssJ3vRsPX3MGEoXeWU7mQKPbwkX+Q6PDusVKsrk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b194438-00b0-4e69-643d-08d7289d4bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 14:13:54.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVF8FY3lVQYxzQXCxR/o4h9FLdEFLCUH3ZNNb0UbXMPfHzPZa6nsc3n1Dvj75zaN8FBekjvnM9V/gQK7Rdu+0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1736
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Martin Blumenstingl wrote:
> The mainline PCIe PHY driver has it's own devicetree node. Update the
> clock alias so the mainline driver finds the clocks.
>=20
> The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX300
> and GRX390.
> The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
> GRX390.
> The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
> Lantiq's board support package (called "UGW") names these registers
> "PDI".

Applied to mips-next.

> commit ed90302be64a
> https://git.kernel.org/mips/c/ed90302be64a
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
