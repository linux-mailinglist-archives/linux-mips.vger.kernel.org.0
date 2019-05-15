Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652011FC37
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2019 23:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfEOVaS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 May 2019 17:30:18 -0400
Received: from mail-eopbgr790139.outbound.protection.outlook.com ([40.107.79.139]:64608
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726441AbfEOVaS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 May 2019 17:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AHMOLfitipkzC3ZU1bmO5AkZBVaUxpOj/gwzgUY2S0=;
 b=O2UmSMKONRNoNxBl/OmqRMIwOLobZ0YBYurwxvsN1Fu9l2YC7Ecx+x+CGzknsRgLRbpf+LehasXVrGdGk8UNfxql+JzB5CLb0lZKkuOunrsSC/UpARCXZWQBv/hxiusuTPGCtXehdVxFoTOM+zDpbVdx6cO+aFKlM7/gE9MW4M4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1566.namprd22.prod.outlook.com (10.172.63.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 21:30:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 21:30:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Manuel Lauss <manuel.lauss@gmail.com>
CC:     Linux-MIPS <linux-mips@linux-mips.org>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Alchemy: add DMA masks for on-chip ethernet
Thread-Topic: [PATCH] MIPS: Alchemy: add DMA masks for on-chip ethernet
Thread-Index: AQHVCxciI7vOeH2+vECgugz91qCmiqZstJSA
Date:   Wed, 15 May 2019 21:30:14 +0000
Message-ID: <MWHPR2201MB1277B81D3FBC19F2215A4E15C1090@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190515120948.778368-1-manuel.lauss@gmail.com>
In-Reply-To: <20190515120948.778368-1-manuel.lauss@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0593569-0129-4637-52e5-08d6d97c847c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1566;
x-ms-traffictypediagnostic: MWHPR2201MB1566:
x-microsoft-antispam-prvs: <MWHPR2201MB1566B639F36C10EA805F62BAC1090@MWHPR2201MB1566.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(376002)(39850400004)(136003)(346002)(199004)(189003)(33656002)(74316002)(25786009)(81156014)(6116002)(386003)(81166006)(8676002)(8936002)(71200400001)(71190400001)(256004)(68736007)(4326008)(53936002)(76176011)(6246003)(7736002)(446003)(6506007)(7696005)(99286004)(305945005)(102836004)(52116002)(2906002)(476003)(3846002)(44832011)(11346002)(486006)(54906003)(26005)(66446008)(42882007)(6436002)(5660300002)(558084003)(6916009)(14454004)(9686003)(73956011)(316002)(229853002)(55016002)(64756008)(66476007)(66946007)(66556008)(66066001)(52536014)(478600001)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1566;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 69LpemZwgPtDx2asilDjYVXyfAXXhp2DfMv/k7oSaSKQ1QRVQLpqpE5RrPGIPdI1HB5M63kp8BPPH+JHfeON/6NtcBd5JpT3iCzd6kBtgw49Af9fMNYBKRuuVUXZt/Rd64lGRwWGogdfOZzb3HOaYe57iqud291awGv2jB6ZOYhnn12Hkzl+PVRu+bYDeu+m6XTlyQ2xW3jCZfr1O2jR+Xn4QF5jpUvSkbFK6u7VGw2zy+kaoBH1NaMas67I1BYey6B/bCPo5qQtjk3X2YKq+HLNUo0Nt6ubdcxXTkGdSQzw2koJAAXf7t+wWx5p1AoJPqVftpjC5Ub0TZ3AOzmKY23T3XpoN1RsPK+VuRjGKDKRVHIOSKmRAFC5uoHYLsDG7kNF+2wcicL8agrBMkNlhjUkgVVwcI/sR49vviAYK94=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0593569-0129-4637-52e5-08d6d97c847c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 21:30:15.1024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1566
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCk1hbnVlbCBMYXVzcyB3cm90ZToNCj4gTWFrZXMgYXUxMDAwLWV0aCB3b3JrIGFn
YWluLCB0ZXN0ZWQgb24gREIxNTAwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFudWVsIExhdXNz
IDxtYW51ZWwubGF1c3NAZ21haWwuY29tPg0KDQpBcHBsaWVkIHRvIG1pcHMtbmV4dC4NCg0KVGhh
bmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5
b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1
bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
