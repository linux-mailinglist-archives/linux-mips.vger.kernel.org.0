Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B65A121FC
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 20:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfEBSfz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 14:35:55 -0400
Received: from mail-eopbgr780131.outbound.protection.outlook.com ([40.107.78.131]:55680
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfEBSfy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 14:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZFSQ4RW0llthYCaxnNvQj3Md1Y7XYCdk5EFtiOWuiA=;
 b=OvwcnDkp0SalNB9YTqdt74hybx1zcx6xF+OOSBvhdhsLiVkhAQshXVmt+E+lGciZU95cMntwY/kOdtmGBuR+Uq2LW4FzPXHszmmp0Vv4Zuf7quA0L8vBQVhkgesDob+LmQUYeBh5WbVNsesGsx/ofMTGeB7Qrr611Vyxysm0XK8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1582.namprd22.prod.outlook.com (10.174.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 18:35:52 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 18:35:52 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 06/12] mips: Use memblock to reserve the __nosave memory
 range
Thread-Topic: [PATCH 06/12] mips: Use memblock to reserve the __nosave memory
 range
Thread-Index: AQHU+ibTUDD9XXZ9F0CHYnQuCXYTiqZYN26A
Date:   Thu, 2 May 2019 18:35:52 +0000
Message-ID: <MWHPR2201MB127795ABB1E9256F75700EAFC1340@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190423224748.3765-7-fancer.lancer@gmail.com>
In-Reply-To: <20190423224748.3765-7-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad277b5-397f-4a43-0d57-08d6cf2d0137
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1582;
x-ms-traffictypediagnostic: MWHPR2201MB1582:
x-microsoft-antispam-prvs: <MWHPR2201MB1582FD11CC678890BA062AB3C1340@MWHPR2201MB1582.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39840400004)(199004)(189003)(33656002)(53936002)(52116002)(9686003)(99286004)(54906003)(229853002)(7696005)(6916009)(6436002)(186003)(4326008)(486006)(6116002)(476003)(3846002)(2906002)(26005)(11346002)(42882007)(102836004)(6506007)(386003)(446003)(44832011)(71190400001)(71200400001)(8676002)(4744005)(66066001)(81166006)(7736002)(478600001)(55016002)(76176011)(74316002)(7416002)(52536014)(316002)(66476007)(66556008)(73956011)(64756008)(66446008)(66946007)(256004)(25786009)(8936002)(81156014)(14454004)(68736007)(5660300002)(305945005)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1582;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6DBa7F+5nJ0wTXdnlJLmHXSUqDyjpKTB7aEtcVxutyHu/nI2CyIdLgS70kyLowQcNGdkq0Pjwnx4nuC1JyQ+WXfAozXt3DxP0bx1AOD3HbtayFhcReGGT07pgnwan60qjWBH4Jn36fuFxmeK9qLhEHDL1ZxF86bOwqQISpEuH9NHNt5d6yVGIQ8JKD/tSIeQNMuotDFF+8R9gdSzF8u+HCLzAehHVMFiXM6OWu1RDC90g5zqmxbch1z2zcOyLRUl3yCkyAwXa2hGOV2pJnpqgBLAgu9jvAPz2NqSXxs1Fndg5vJqwJurNQT+8QRtLVEomvyiip1QmZQk4u75g95Y0DnMPVac3sOsESO3vy1UMt9ojBnVuzlRkJs0o98x+x5aRt1wFJDsX9sKe4bCVkvFS/s3m1D8zE+tFIQi4gQEIFM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad277b5-397f-4a43-0d57-08d6cf2d0137
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:35:52.3059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1582
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBPcmlnaW5hbGx5IGJlZm9yZSBsZWdhY3kg
Ym9vdG1lbSB3YXMgcmVtb3ZlZCwgdGhlIG1lbW9yeSBmb3IgdGhlIHJhbmdlIHdhcw0KPiBjb3Jy
ZWN0bHkgcmVzZXJ2ZWQgYnkgcmVzZXJ2ZV9ib290bWVtX3JlZ2lvbigpLiBCdXQgc2luY2UgbWVt
YmxvY2sgaGFzIGJlZW4NCj4gc2VsZWN0ZWQgZm9yIGVhcmx5IG1lbW9yeSBhbGxvY2F0aW9uIHRo
ZSBmdW5jdGlvbiBjYW4gYmUgdXRpbGl6ZWQgb25seQ0KPiBhZnRlciBwYWdpbmcgaXMgZnVsbHkg
aW5pdGlhbGl6ZWQgKGFzIGl0IGlzIGRvbmUgYnkgbWVtYmxvY2tfZnJlZV9hbGwoKQ0KPiBmdW5j
dGlvbikuIFNvIGNhbGxpbmcgaXQgZnJvbSBhcmNoX21lbV9pbml0KCkgbWV0aG9kIGlzIHByb25l
IHRvIGVycm9ycywNCj4gYW5kIGF0IHRoaXMgc3RhZ2Ugd2UgbmVlZCB0byByZXNlcnZlIHRoZSBt
ZW1vcnkgaW4gdGhlIG1lbWJsb2NrIGFsbG9jYXRvci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNl
cmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4NCg0KQXBwbGllZCB0byBtaXBzLW5l
eHQuDQoNClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVy
YXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxlYXNl
IGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
