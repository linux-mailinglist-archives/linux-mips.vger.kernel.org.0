Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6E251CEC
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732206AbfFXVQP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:15 -0400
Received: from mail-eopbgr790120.outbound.protection.outlook.com ([40.107.79.120]:52194
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbfFXVQP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNxjQJwkLeg6UOIgRtkBDGNkf42Rsl0uT3i3NMjGPPg=;
 b=W5jm+7uMbP+k3KARHpIcRuq3D3x5jOLUMaYZvrLoU5Ak9lFXJ974PACDfV8Vu7oLjq15+WFr58QZvqxxiwiX75kkaz7rLp0mE6ji0Oc/CzwVuxIBAUBrgC3od3HUg2R0QJxhqixFd+3vuGWiZ8YTk230BWdGPqAKkidmh3ytCyA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPDX GPL-2.0
 license  identifier
Thread-Topic: [PATCH 1/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPDX GPL-2.0
 license  identifier
Thread-Index: AQHVKtINS5AKA7k010+ha6T5IIESqA==
Date:   Mon, 24 Jun 2019 21:16:13 +0000
Message-ID: <MWHPR2201MB1277AD8D90BC13A990E8822FC1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-1-sr@denx.de>
In-Reply-To: <20190527091323.4582-1-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab2a6bd7-4d6b-45d5-1137-08d6f8e92f9a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB13756BD1C91529F5E1E5D584C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WzbDg+ml+V7plNscvgGWOEeRUxAV3r9TJZZBWd8mp1OwOX732QUYENBgKDh34wuLJLD+ZLUGQzT4a1JbTi1hJ5UGoaKLrONBWMjOybIQVZzr9J063MP7aK5j7UR0trZ5uoNr025i4adhhzVOodmFwg4zFCeN/z3LK2yv88yR/QJeAqA9qxb6b4PM5D8o47Re6eGiq+xlWcRrDCB/f3SmL96IoS76IzzWqpEvBBRZYHCudOwc5W0nS+TLse0BGiRbD0D3ihVh8mXUpyQzL1CmxNK+Gk8G8dMSyQsufRYfln3WGn7ycrL8fw7/9TlQ6C3Hq8wVapASpfqywLNL2gjDRxeVGRZ61wkpd0gqFpW69j5erL3PeM/hjE2jIY7rxN6oFJx3XoqjevHAYYR4p2jZLzlpIg00lLQGALvMAsifpyI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2a6bd7-4d6b-45d5-1137-08d6f8e92f9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:13.2100
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

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gQXMgZG9uZSBpbiBjb21taXQgYjI0NDEz
MTgwZjU2ICgiTGljZW5zZSBjbGVhbnVwOiBhZGQgU1BEWCBHUEwtMi4wDQo+IGxpY2Vuc2UgaWRl
bnRpZmllciB0byBmaWxlcyB3aXRoIG5vIGxpY2Vuc2UiKSwgdGhpcyBwYXRjaCBhZGRzIHRoZSBT
UERYDQo+IGxpY2Vuc2UgaWRlbnRpZmllciB0byBtdDc2MjhhLmR0c2ksIHdoaWNoIGlzIGN1cnJl
bnRseSBzdGlsbCBtaXNzaW5nDQo+IHRoaXMgaWRlbnRpZmllci4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4NCj4gQ2M6IFBhdWwgQnVydG9uIDxwYXVsLmJ1
cnRvbkBtaXBzLmNvbT4NCj4gQ2M6IEhhcnZleSBIdW50IDxoYXJ2ZXlodW50bmV4dXNAZ21haWwu
Y29tPg0KPiBDYzogSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4ub3JnPg0KDQpBcHBsaWVkIHRv
IG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1
dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhl
biBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
