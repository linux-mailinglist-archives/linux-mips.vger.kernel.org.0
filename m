Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C15251CF0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732239AbfFXVQT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:19 -0400
Received: from mail-eopbgr790130.outbound.protection.outlook.com ([40.107.79.130]:28882
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbfFXVQR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xR6JBhrvcX8MGzds9e1+4Xm1THIhWrK5QEfmIC6Yq0=;
 b=PCI86PWdfvODmpGUNNav4/2IgYShz5d44OCnpnBpB3om/t7qry0ttpDK5hYfQ0fAnjkZGzKVUElJI2wbTEwqpbNx4vzDFlqAw8pfA5tEC1j4db8CpeixphsU4vpnRCN9CMf5qdYG/1H8saAqBftj0wr8Dg3b7FSAzNE4Sf775R8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/8 v2] MIPS: ralink: mt7628a.dtsi: Add pinmux DT node
Thread-Topic: [PATCH 2/8 v2] MIPS: ralink: mt7628a.dtsi: Add pinmux DT node
Thread-Index: AQHVFGyBSKmbLZRGL0GzTBosqRQIuqare0IA
Date:   Mon, 24 Jun 2019 21:16:15 +0000
Message-ID: <MWHPR2201MB1277CCC70B6A6D27FB0DA8EEC1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-2-sr@denx.de>
In-Reply-To: <20190527091323.4582-2-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5690843f-3316-4662-eee8-08d6f8e9310b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB1375AE4F6456B9AC827BDC56C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RI0KrNbEQHWXVFuGo7Vizl1E9ibuDpLFr8sjKsjZANSlofU9jm9lcG8M3Vp6vYNKBklW0NYp3OEtALL/4kLr3tjkGvPnsXJwkLEficv9VEWEpJH76dvP1+0WmzZ6iLV3btdXAeUueXMtZh0toOgEXU11vtMNtjBAwZupt9AbmlQ7Ua8wdYdcyA1n+Z1bsGzm6fzDeC/UXc/TVTvJNQMRvnL0C0DYmmnUFa5oWPs6J7pVFruTDfW6qA2MSjxyd9d8zfNEXWapM33BGo50cR6Y0ZCMsTrwH/PWPBKvD46bcZ0XPaXf0tsMWQJwOmD6JPmN10dv+DPCGaRXH3yzIayf2N6kCgRmf5XrakyxJwiST5BK75/f0yIFBJAtICj/TayH4LN67NAccT1me/oVYaeZdujsKV24w8hm8j0FEfpr2Qk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5690843f-3316-4662-eee8-08d6f8e9310b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:15.5849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBwaW5t
dXggRFQgbm9kZSB1c2luZyB0aGUgZ2VuZXJpYyAicGluY3RybC1zaW5nbGUiDQo+IHBpbm11eCBk
cml2ZXIuIEZvciB0aGlzIHRoZSBzeXN0ZW0tY29udHJvbGxlciByZWdpc3RlciBhcmVhIG5lZWRz
IHRvIGJlDQo+IGNoYW5nZWQgdG8gbm90IG92ZXJsYXAgd2l0aCB0aGUgcGlubXV4IHJlZ2lzdGVy
cy4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gd29yayBkb25lIGJ5IEpvaG4gQ3Jpc3Bp
bi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4NCj4gQ2M6
IFBhdWwgQnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4NCj4gQ2M6IEhhcnZleSBIdW50IDxo
YXJ2ZXlodW50bmV4dXNAZ21haWwuY29tPg0KPiBDYzogSm9obiBDcmlzcGluIDxqb2huQHBocm96
ZW4ub3JnPg0KDQpBcHBsaWVkIHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0K
WyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGlu
ZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20g
dG8gcmVwb3J0IGl0LiBdDQo=
