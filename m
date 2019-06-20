Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1A14DD18
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfFTVyJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:54:09 -0400
Received: from mail-eopbgr770094.outbound.protection.outlook.com ([40.107.77.94]:37957
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726002AbfFTVyJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Jun 2019 17:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKGuZO71j/NAGS4zUWNubda1Z7nw9dNAE9BIBjBbtyQ=;
 b=EsZKToAydvvJb4GL7GNZI6MzBTL72kdhEE5LoHQLuizxY/lI/473RIhIe6jKN4q7G+1Xn4aweSvCJCqcU67IXMfj1kTQqou+I0URBhAqdTJeDpdp1UsQ4cI88WO42Gw8X0I9JKq8qHCUj91zyipTV2JKvBUZSVUn/CWmMXLgKYA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1423.namprd22.prod.outlook.com (10.172.63.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 21:54:07 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.007; Thu, 20 Jun 2019
 21:54:07 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fix build on non-linux hosts
Thread-Topic: [PATCH] MIPS: fix build on non-linux hosts
Thread-Index: AQHVJqh3BK+a+7dX4kuyzcsT9kAQdKalGAqA
Date:   Thu, 20 Jun 2019 21:54:07 +0000
Message-ID: <MWHPR2201MB1277BD79F0138BA297E1277DC1E40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190619140818.44022-1-ldir@darbyshire-bryant.me.uk>
In-Reply-To: <20190619140818.44022-1-ldir@darbyshire-bryant.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.153.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1adc572e-dfec-48ba-9d9e-08d6f5c9d15d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1423;
x-ms-traffictypediagnostic: MWHPR2201MB1423:
x-microsoft-antispam-prvs: <MWHPR2201MB1423637623F25AA7F804AEDAC1E40@MWHPR2201MB1423.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(39850400004)(366004)(396003)(376002)(199004)(189003)(66476007)(6916009)(33656002)(66446008)(8676002)(8936002)(2906002)(54906003)(81156014)(64756008)(66066001)(81166006)(446003)(6246003)(256004)(5660300002)(71190400001)(71200400001)(6436002)(9686003)(3846002)(42882007)(11346002)(6116002)(55016002)(316002)(53936002)(25786009)(7696005)(102836004)(52116002)(386003)(6506007)(52536014)(4326008)(66946007)(76176011)(7736002)(305945005)(68736007)(74316002)(476003)(73956011)(14454004)(44832011)(229853002)(66556008)(186003)(99286004)(478600001)(486006)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1423;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zyQYUnKKG3rVlnGY2Gwp08X+DF52fU99CVO4nBdWOUP/nqpE3wgZP7xDzSPAlbYMi7dah1StxdjuZwL2DleDGezILktW8SNUCPweCFNY+bM0IXHwvGzXkFUagojBNr75Rmlg6pBmUE5Qwv5hVqjVtiv2YU140+pzCL8vN3G7DWXpX/tgDta8jMcsxWmg95GtsHGHolhwlzWX6oOMDZwWMaRKMRn0XjlhnfWHu7ZrebrgUWBYLHBy2s79R4GKeNg6jLGyR+9EgfHr3ocLeLilyDFrq2vd1sydq6arrKrc3wE0/oULfcjjqWv4TU8k3kz5KjuVu29S0HSQ4RLjSB+Q0paD/9oejwws9dbVb0cB7eynor7LZeUbJQ77ima97HmZknz4V0KKeo0DsCG6AhmWenjsK6iCwR+dSfgMswGDL/E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adc572e-dfec-48ba-9d9e-08d6f5c9d15d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 21:54:07.3111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1423
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCktldmluIERhcmJ5c2hpcmUtQnJ5YW50IHdyb3RlOg0KPiBjYWxjX3ZtbGludXpf
bG9hZF9hZGRyLmMgcmVxdWlyZXMgU1pfNjRLIHRvIGJlIGRlZmluZWQgZm9yIGFsaWdubWVudA0K
PiBwdXJwb3Nlcy4gIEl0IGluY2x1ZGVkICIuLi8uLi8uLi8uLi9pbmNsdWRlL2xpbnV4L3NpemVz
LmgiIHRvIGRlZmluZQ0KPiB0aGF0IHNpemUsIGhvd2V2ZXIgInNpemVzLmgiIHRyaWVzIHRvIGlu
Y2x1ZGUgPGxpbnV4L2NvbnN0Lmg+IHdoaWNoDQo+IGFzc3VtZXMgbGludXggc3lzdGVtIGhlYWRl
cnMuICBUaGVzZSBtYXkgbm90IGV4aXN0IGVnLiB0aGUgZm9sbG93aW5nDQo+IGVycm9yIHdhcyBl
bmNvdW50ZXJlZCB3aGVuIGJ1aWxkaW5nIExpbnV4IGZvciBPcGVuV3J0IHVuZGVyIG1hY09TOg0K
PiANCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvbWlwcy9ib290L2NvbXByZXNzZWQvY2Fs
Y192bWxpbnV6X2xvYWRfYWRkci5jOjE2Og0KPiBhcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkLy4u
Ly4uLy4uLy4uL2luY2x1ZGUvbGludXgvc2l6ZXMuaDoxMToxMDogZmF0YWwgZXJyb3I6ICdsaW51
eC9jb25zdC5oJyBmaWxlIG5vdCBmb3VuZA0KPiBefn5+fn5+fn5+DQo+IA0KPiBDaGFuZ2UgbWFr
ZWZpbGUgdG8gZm9yY2UgYnVpbGRpbmcgb24gbG9jYWwgbGludXggaGVhZGVycyBpbnN0ZWFkIG9m
DQo+IHN5c3RlbSBoZWFkZXJzLiAgQWxzbyBjaGFuZ2UgZXllLXdhdGVyaW5nIHJlbGF0aXZlIHJl
ZmVyZW5jZSBpbiBpbmNsdWRlDQo+IGZpbGUgc3BlYy4NCj4gDQo+IFRoYW5rcyB0byBKby1QaGls
aXAgV2ljaCAmIFBldHIgw4XCoHRldGlhciBmb3IgYXNzaXN0YW5jZSBpbiB0cmFja2luZyB0aGlz
DQo+IGRvd24gJiBmaXhpbmcuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEpvLVBoaWxpcHAgV2ljaCA8
am9AbWVpbi5pbz4NCj4gU2lnbmVkLW9mZi1ieTogUGV0ciDDhcKgdGV0aWFyIDx5bmV6ekB0cnVl
LmN6Pg0KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBEYXJieXNoaXJlLUJyeWFudCA8bGRpckBkYXJi
eXNoaXJlLWJyeWFudC5tZS51az4NCg0KQXBwbGllZCB0byBtaXBzLWZpeGVzLg0KDQpUaGFua3Ms
DQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBi
ZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1
cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
