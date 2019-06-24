Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C23251CF5
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732238AbfFXVQ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:26 -0400
Received: from mail-eopbgr790118.outbound.protection.outlook.com ([40.107.79.118]:38672
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732244AbfFXVQZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpACWdSeDyOAFEhVAjQOfPB68k+i0nOyh9pISRehFoI=;
 b=Xdbs2PP0/A0iO5ZD+sYHgnYKAlRBmhLFvIQifPnPSkizw+sOfSaNSNwcR946NR5qhiaReNgOljhw8LlZZfBgr662yZ21jKFhqj69+LjvthXClwbgXGD7vokYzRXNJ13NBSJ0SLc4yM4H63s5OF9w/Dyyynfc7B6C2YghXvUjKZo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 7/8 v2] MIPS: ralink: mt7628a.dtsi: Add watchdog
 controller DT  node
Thread-Topic: [PATCH 7/8 v2] MIPS: ralink: mt7628a.dtsi: Add watchdog
 controller DT  node
Thread-Index: AQHVKtITBcSsG0gV4USdJ/9qRd4TVw==
Date:   Mon, 24 Jun 2019 21:16:23 +0000
Message-ID: <MWHPR2201MB127744CA8C1910ABA54DBC75C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-7-sr@denx.de>
In-Reply-To: <20190527091323.4582-7-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6de8d880-e0d8-4ecc-ebf2-08d6f8e935fb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB1375CC76C4483B22DBD5FD76C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LQa47MYWLOeQx8LieI8ehrRcKETK0QV2Xur7IbEg7avVq501ftwQwuXBeY3iZhUk/dpaPDWoz2MvCdkvg4KRLZG7gtEdtQlI+Hik9uCCMRFajHmeeBIFjmtvqnBLG24M78yIFqayIfuSagNFFCc2iQoPvsaByCfAMrKicga3HwWk7v6oDDzaXb6trJHqSnMN5nERLqmOc1a1oBsceFi2u3CNK8/o6EOZrdWmNP1n2zQ2TX/VYuItY/ByCnjSdNX6wMyav+2K30/goxmyXyX2l9TnheWf2N7cOp5WeDGGNJksZ8He2Do5cw3oJW8kaYxbHa1T2Y9qJZmCO4tuTzAat5G+NqYFOzJ3HP+IhlWxgIBvK5M5pHFGVl/faSFoiGU4MmA/zvw5JXCc/FH8M95AyKYw4F8M4KmGBRL0NZWVFww=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de8d880-e0d8-4ecc-ebf2-08d6f8e935fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:23.9066
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

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSB3YXRj
aGRvZyBjb250cm9sbGVyIGRlc2NyaXB0aW9uIHRvIHRoZSBNVDc2MjhBIGR0c2kNCj4gZmlsZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4NCj4gQ2M6IFBh
dWwgQnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4NCj4gQ2M6IEhhcnZleSBIdW50IDxoYXJ2
ZXlodW50bmV4dXNAZ21haWwuY29tPg0KPiBDYzogSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4u
b3JnPg0KDQpBcHBsaWVkIHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBU
aGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBp
cyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8g
cmVwb3J0IGl0LiBdDQo=
