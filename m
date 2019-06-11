Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC3724182A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 00:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404831AbfFKWae (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 18:30:34 -0400
Received: from mail-eopbgr750118.outbound.protection.outlook.com ([40.107.75.118]:58352
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404649AbfFKWad (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 18:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5B52+qUzhodIkDZ1tQGODszKfHGeExdupmahi5GzuY=;
 b=bZfcoOlaTfQMAxxXgViJOcMnAcc0a4/6SvcItkNouoyBfJPZnrrRJvFw2LhgmwFWxGs1C6H8zTSrYm1ULzxPFXzxs+DWdrDNUOn8DIa5U/EzJmv9x8h8cfebKFj1r10eN8urKZdOJ+NPC1mvcAgIQLyaySwK2AmuUvTbuCKVwe8=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1014.namprd22.prod.outlook.com (10.171.220.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 22:30:31 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 22:30:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        James Hartley <james.hartley@sondrel.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: config: Remove left-over BACKLIGHT_LCD_SUPPORT
Thread-Topic: [PATCH] MIPS: config: Remove left-over BACKLIGHT_LCD_SUPPORT
Thread-Index: AQHVGkFPJf9F4hLkTUCvQy6Rap9QnaaXFgiA
Date:   Tue, 11 Jun 2019 22:30:30 +0000
Message-ID: <CY4PR2201MB12720AB0019E238E383A1386C1ED0@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190603191934.20721-1-krzk@kernel.org>
In-Reply-To: <20190603191934.20721-1-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ba017e-806f-4731-c640-08d6eebc690e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY4PR2201MB1014;
x-ms-traffictypediagnostic: CY4PR2201MB1014:
x-microsoft-antispam-prvs: <CY4PR2201MB10141461FE5A1FFEDCF0590FC1ED0@CY4PR2201MB1014.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(366004)(39840400004)(346002)(199004)(189003)(476003)(8676002)(446003)(486006)(4326008)(11346002)(7696005)(2906002)(6506007)(386003)(26005)(52116002)(102836004)(316002)(76176011)(66066001)(68736007)(6916009)(6116002)(99286004)(33656002)(3846002)(55016002)(44832011)(9686003)(186003)(6246003)(305945005)(66476007)(54906003)(52536014)(71200400001)(71190400001)(66556008)(64756008)(66946007)(7736002)(4744005)(66446008)(5660300002)(8936002)(25786009)(14454004)(73956011)(53936002)(74316002)(478600001)(42882007)(229853002)(81166006)(81156014)(6436002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1014;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 98ODSwgoUIjLNyluP0riv1Ll7vNZBm3zIwMK4dJKn8NuNahzofNP56uVMbmvKgudr0IwrASPp0b1GFiGrKP4vGpn/bQPiJu3mdOCOy0H5TNwXQm6dgjbbv62OF5TXgg9eTuYUzz19lM1ERUTV+FL6AMtcb96YUTSqTt+ExB6PSzZl2Fof1VHoYOw2QWxHDQvc4ThcNS4mkoo9vy/FBbRUNhp9jGCCyL0yUpZvjXKiZUtUncN958NkloSRYMgDJduZKuuPLiRcHRmUhVUEujWYyV/in6fbDQuyKcoOHULlgowliXYTq7M8fDJbRQaFr1V5cl3xSMTfcFoiCtqsZHfarVe2Hqqmdov+jKGy701oEyPACN6MQJa7K+k9X+KaqVVVXje7/RcL5E2JtYRlO+ByZKfCotkg8+i4ca5GIGTzqc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ba017e-806f-4731-c640-08d6eebc690e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 22:30:30.9247
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

SGVsbG8sDQoNCktyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFRoZSBDT05GSUdfQkFDS0xJ
R0hUX0xDRF9TVVBQT1JUIHdhcyByZW1vdmVkIGluIGNvbW1pdCA4YzVkYzhkOWYxOWMNCj4gKCJ2
aWRlbzogYmFja2xpZ2h0OiBSZW1vdmUgdXNlbGVzcyBCQUNLTElHSFRfTENEX1NVUFBPUlQga2Vy
bmVsDQo+IHN5bWJvbCIpLiBPcHRpb25zIHByb3RlY3RlZCBieSBDT05GSUdfQkFDS0xJR0hUX0xD
RF9TVVBQT1JUIGFyZSBub3cNCj4gYXZhaWxhYmxlIGRpcmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KDQpBcHBsaWVkIHRv
IG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1
dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhl
biBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
