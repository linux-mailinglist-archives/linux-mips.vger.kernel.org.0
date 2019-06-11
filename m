Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88AEC4182E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 00:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404453AbfFKWaa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 18:30:30 -0400
Received: from mail-eopbgr750139.outbound.protection.outlook.com ([40.107.75.139]:23190
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392114AbfFKWa3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 18:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbwvLU7YhHs/yPfaAaXzzLr+6kXw8S4JaBGIJI/sBdo=;
 b=Zv7k7lXjynQSmWOerkOmHAFFC7l06rMEOIqHM9H3pcu8eGRktc4CcNn5H+hxb/0LUsLSC5oJIEsXBq+J/+BYRlLojd5E9dt8mkXx7vsVgR2IPyo5uu3isuObjj4A0lt5RXxvF9JXv5BeMWTLBOlg7fTtKYrSWErPZET632D4m+Q=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1014.namprd22.prod.outlook.com (10.171.220.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 22:30:28 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 22:30:28 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Lubomir Rintel <lkundrak@v3.sk>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ralink: Switch pinmux.h to SPDX header
Thread-Topic: [PATCH] MIPS: ralink: Switch pinmux.h to SPDX header
Thread-Index: AQHVICYuHAG+tmtpNEafdvthZyfnxKaXCjsA
Date:   Tue, 11 Jun 2019 22:30:28 +0000
Message-ID: <CY4PR2201MB1272ABE2964D7BE0F3733473C1ED0@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190611072014.2978530-1-lkundrak@v3.sk>
In-Reply-To: <20190611072014.2978530-1-lkundrak@v3.sk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39f8d159-bc7a-4439-7cbd-08d6eebc6761
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY4PR2201MB1014;
x-ms-traffictypediagnostic: CY4PR2201MB1014:
x-microsoft-antispam-prvs: <CY4PR2201MB10145F18723A2B202BCDC407C1ED0@CY4PR2201MB1014.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(366004)(39840400004)(346002)(199004)(189003)(476003)(8676002)(446003)(486006)(4326008)(11346002)(7696005)(2906002)(6506007)(386003)(26005)(52116002)(102836004)(316002)(76176011)(66066001)(68736007)(6916009)(6116002)(99286004)(33656002)(3846002)(55016002)(44832011)(9686003)(186003)(6246003)(305945005)(66476007)(54906003)(52536014)(71200400001)(71190400001)(66556008)(64756008)(66946007)(7736002)(4744005)(66446008)(5660300002)(8936002)(25786009)(14454004)(73956011)(53936002)(74316002)(478600001)(42882007)(229853002)(81166006)(81156014)(6436002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1014;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8AFmCL5EKS9PIg8fR4Yp71R0DJjG3ROhLycekmLDuCRW7UvXI5P+NtbXP57XiosZzDIacm9wcM2fg477/Lhv44nKcG01opdqoh1IGGVPKzxJy1k1ZLuapxWgdcXy50mPy7ZzS2i5LjO4DZKlD63b+N9lAgX72p/5XMcKcP9JFJ5Fy+DonViVH8c0TkSGZ5SPud86mpV/JOA9YQpjgv0YKD+i2ya75YjIyopWvPr0lsombsrdLA2/saRsVPPbZbPIffvoB2BmhpwMoxqujWkR2NhdREjWHy1x4XignHuswbMNDPIwCFclollLNvKS3OYnoIrsfyMA737TpzOps5VkC9vYwUWSHLk4covyz6sQG/IO7nQ2RZwuAMqSVO6y7IuPKhnpwCseHhkPI3HOvpyT4xr60o1sbKUoEO4v70T1tdQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f8d159-bc7a-4439-7cbd-08d6eebc6761
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 22:30:28.1653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1014
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkx1Ym9taXIgUmludGVsIHdyb3RlOg0KPiBUaGUgb3JpZ2luYWwgbGljZW5zZSB0
ZXh0IGhhZCBhIHR5cG8gKCJwdWJsaXNoaGVkIikgd2hpY2ggd291bGQgYmUNCj4gbGlrZWx5IHRv
IGNvbmZ1c2UgYXV0b21hdGVkIGxpY2Vuc2luZyBhdWRpdGluZyB0b29scy4gTGV0J3MganVzdCBz
d2l0Y2gNCj4gdG8gU1BEWCBpbnN0ZWFkIG9mIGZpeGluZyB0aGUgd29yZGluZy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEx1Ym9taXIgUmludGVsIDxsa3VuZHJha0B2My5zaz4NCg0KQXBwbGllZCB0
byBtaXBzLW5leHQuDQoNClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBh
dXRvLWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRo
ZW4gcGxlYXNlIGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
