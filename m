Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0641E75E39
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2019 07:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfGZFPx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Jul 2019 01:15:53 -0400
Received: from mail-eopbgr780099.outbound.protection.outlook.com ([40.107.78.99]:59840
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726115AbfGZFPx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Jul 2019 01:15:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbb0UdEgrNngRsXctR7N40Ymg6m5johkgXATxcTtlcePdgfmSD1ybegEMFvgqpVPx036Gg01AfjAnbNalt6BnX9Mc5E5xGMOWasCyjDpw8zZEeJ+E0kjCEtWMULeuiYDrep9YmwIz8g1Ow9+ZP3Vm8HVQ7SHrTA29cV3KZJizpB6BoGutbyRe8zuQKIxTesj6Dpj4HibigbxIxApSKunRuHze71g8YbJNjBDhv/qyJjCCMBmBjIIg43op7GKHnOQVRGkwEVSU2SU9c1DW0Yx+SQd3O3CrSXy6yMlOq4GIRxY0sWffLisXUxTfW1XXqdY3IS6bMWZd4+5J2NRtvNwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT5kE2287ahbCQW6jVtsWTbHS9Opiq7uvUkCrp/4spU=;
 b=ST8nSCvNp+w8YOtdT25staltU3EhYFBJnoPvrokwHuQr/ZEDu6fmE1Bp819XKdlTa8aTAP53rqjEIGKWpyp6gjumeaf/Ho6mAnehYVa5FUhD1u4C3S9ggN9AGE3B7479cj0Y+RLbMyQbrSYPV9/2Hlj/5+uvKV/u2Jk8DCjmdL5VM9UP4mMD3s+aOl/V6CQgtsqbpZQ9BcIEPQdpr9/iuOJAQJjReAlv0l9Of5szdf/fjF1oY8WbbIg6Skxe5Woi2izfK+Pqa+Q8/v0x6NxEI+KQytT1rDcpoDUdNQwmhjKyxn7BqP7TkyOAOax3Nu3pbRvLM1+j8eSeRDKjE1ErXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT5kE2287ahbCQW6jVtsWTbHS9Opiq7uvUkCrp/4spU=;
 b=NqzQ6z3KXFYyrIK3ieurseXJa3W1YFT4bUZewF1nON8eCKLwAOLEXLY/ssavN8Y/6GI4LjEEzht34F2Ds7kNVHTJOJCt9EQkS/4VUTIHWDF5ypmVTF4mjDQc0e+hRAnzUcoQ4dkljPCQUMkHQ15lNIVRbiTHYgQ4lGpnxhiLEmw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 05:15:49 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 05:15:49 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     =?windows-1250?Q?Edward_Matijevi=E6?= <motolav@gmail.com>
CC:     "hauke@hauke-m.de" <hauke@hauke-m.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: BCM47XX: Add support for Netgear R6200 V1
Thread-Topic: [PATCH] MIPS: BCM47XX: Add support for Netgear R6200 V1
Thread-Index: AQHVJM1EKus6z3WnUkeVztdrciATg6bcmMMA
Date:   Fri, 26 Jul 2019 05:15:49 +0000
Message-ID: <MWHPR2201MB1277530DE66C1528B65E23B0C1C00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <6e003471-e7bd-6e0a-c00c-7de5e1b01428@gmail.com>
In-Reply-To: <6e003471-e7bd-6e0a-c00c-7de5e1b01428@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:5cfa:8da3:1021:be72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c14daf25-b15b-4e59-50fa-08d711885295
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1088;
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB108811291079F08D89A27476C1C00@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(346002)(366004)(136003)(376002)(199004)(189003)(476003)(8676002)(71200400001)(4326008)(102836004)(74316002)(76176011)(71190400001)(316002)(305945005)(81156014)(7736002)(446003)(486006)(99286004)(4744005)(81166006)(52116002)(6506007)(6116002)(66556008)(8936002)(54906003)(11346002)(186003)(42882007)(46003)(386003)(33656002)(44832011)(68736007)(7696005)(256004)(2906002)(1411001)(14454004)(6916009)(6436002)(478600001)(25786009)(66946007)(66446008)(5660300002)(64756008)(52536014)(6246003)(55016002)(66476007)(229853002)(53936002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1088;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A1iJaUWPMt+aDB3W7jGfjndILQ97bEKu/OFif06sSQbdxNlgx4I2+t7fa2wjJFw/STpCqF4hLkv9+5E45dOMk1Lwv5dzYRdRmz0mvc2Q3FCYDs2ZgJcOeBB4sHaoKBJiqbaCP6gtFyqeNHOt4yxSHtmqFxzsEhKhtPXx4UTIx21Uz43LYYe2dZ4/mu/nzEeT33E+BHEz4/lwAtMLjfb13ZgMcEHRDaXryNW9GzGouBPclyMDz1+XfGJ0oe+/IDs1D5lcSaiLS3Ir0ayXfEvWHtU0xo10JpMAyhSknak+kS5M+o5gKWGiV1HEZDV7rea1FEaAe/ANcpr9F2NaWcUYhu+xY2wum7THvYErc4kbwtoFPIsM3Rfqhho7XL2vehhtcamX0VP19tpe/JDhILjcAS5xsw3q7k5qWska45mBkmw=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14daf25-b15b-4e59-50fa-08d711885295
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 05:15:49.7348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Edward Matijevi=C4=87 wrote:
> The Netgear R6200 v1 uses a BCM4718A1 SOC and a BCM4352/BCM4360 for 5GHz =
wireless.
> This patch adds support for detecting this model board and registers the =
3 buttons.
> I have tested that the device can boot kernels 4.14 and 4.19 under OpenWR=
T.
>=20
> There is one issue that the LEDs on the device are controlled by a 74HC16=
4 that uses bit-banging instead of SPI so it isn't accessible to the kernel=
 without adding a workaround.
> Without any workaround the device on boot will flash all LEDs once then t=
he power LED will remain amber as all other LEDs stay off.
>=20
> I placed my change in board.c in that location because in OpenWRT it woul=
d be above the R6300 V1 in one of their patches.
>=20
> Signed-off-by: Edward Matijevic <motolav@gmail.com>
> Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
