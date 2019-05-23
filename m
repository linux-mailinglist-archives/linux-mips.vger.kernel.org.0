Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714B227428
	for <lists+linux-mips@lfdr.de>; Thu, 23 May 2019 03:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfEWB4l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 21:56:41 -0400
Received: from mail-eopbgr790124.outbound.protection.outlook.com ([40.107.79.124]:6116
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727305AbfEWB4l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 May 2019 21:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX6mKBBE6AI9KQrUCOvCvZumADFFaBDntw/4fPafRYg=;
 b=JoCtAzoGv4x4vq+ngANVJAxPUjH2gIoF7bNlOYfhDJrmAaDOmGGrLkFQzZZI2HveaIcaPrtXQD9jsBrFf5PslvQjZe6b5Mr297lvXBHnwF7BcGOAVCWdyttZ2FC6fuwXuEoWU0uumH/A1ZCs5+0FTumVmSLAasP39ReIdqxEeSQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 01:56:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 01:56:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: remove a space after -I to cope with header search
  paths for VDSO
Thread-Topic: [PATCH] MIPS: remove a space after -I to cope with header search
  paths for VDSO
Thread-Index: AQHVEQrCoGx8zGvyB0+Bd9Ohf8Gjmg==
Date:   Thu, 23 May 2019 01:56:39 +0000
Message-ID: <MWHPR2201MB1277BAB5A48192625EADFAFBC1010@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190521040327.432-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190521040327.432-1-yamada.masahiro@socionext.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 314041cb-c5e1-45b9-5efe-08d6df21dbe6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB11840E7B600B4F6BD3B8D9A6C1010@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39850400004)(136003)(366004)(189003)(199004)(486006)(52116002)(99286004)(476003)(256004)(6916009)(81166006)(81156014)(6246003)(42882007)(8676002)(76176011)(8936002)(7696005)(53936002)(66946007)(68736007)(66556008)(64756008)(316002)(66446008)(66476007)(73956011)(44832011)(54906003)(71200400001)(186003)(71190400001)(6436002)(33656002)(6116002)(3846002)(26005)(74316002)(5660300002)(6506007)(52536014)(446003)(11346002)(386003)(2906002)(55016002)(229853002)(9686003)(102836004)(4326008)(7736002)(305945005)(66066001)(478600001)(14454004)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1isVpDGu+Ck0tHD3S/EEtj+fatHJdZGVLJQ8rKdmoDMBr0f9kCfqjLq8IvLGjWuDa3B5m/jHFxfSvxIw4mGRBOuOPaPL7+N8/x95PnFycmCQ235mQq1Ug2FIgQ+C0VSn+7kL++307p6Cb9wqifSGrh57UAyd82swNVwSujdHPo2hHdrlCX+w7QA8+W+j7zt3YnpJ3mWpduq2KbVUsgbanEP1JGZXeFznEG1VxUdtZu4kDPtDrolF4EVCQjfDA17HonytC4lz6N1len1NbfJZqNAPCoo1Vyk5oFAmgAkBUlowCUatftpDomdn2JefDxNVMAk+B0MVVEKxBDEQl0BJeaoLxJy/6QIwdJAbnID4iUzpWABkG6rAyDRmRy/kaa8xSxahlXU7C965mlNNFqb/QTbyuKkMK4F0HH0czTmS68s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314041cb-c5e1-45b9-5efe-08d6df21dbe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 01:56:39.0914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1184
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCk1hc2FoaXJvIFlhbWFkYSB3cm90ZToNCj4gQ29tbWl0IDljYzM0MmY2YzRhMCAo
InRyZWV3aWRlOiBwcmVmaXggaGVhZGVyIHNlYXJjaCBwYXRocyB3aXRoDQo+ICQoc3JjdHJlZSkv
IikgY2F1c2VkIGEgYnVpbGQgZXJyb3IgZm9yIE1JUFMgVkRTTy4NCj4gDQo+IENDICAgICAgYXJj
aC9taXBzL3Zkc28vZ2V0dGltZW9mZGF5Lm8NCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2Fy
Y2gvbWlwcy92ZHNvL3Zkc28uaDoyNiwNCj4gZnJvbSAuLi9hcmNoL21pcHMvdmRzby9nZXR0aW1l
b2ZkYXkuYzoxMToNCj4gLi4vYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BhZ2UuaDoxMjoxMDogZmF0
YWwgZXJyb3I6IHNwYWNlcy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ICNpbmNsdWRl
IDxzcGFjZXMuaD4NCj4gXn5+fn5+fn5+fg0KPiANCj4gVGhlIGNhdXNlIG9mIHRoZSBlcnJvciBp
cyBhIG1pc3Npbmcgc3BhY2UgYWZ0ZXIgdGhlIGNvbXBpbGVyIGZsYWcgLUkgLg0KPiANCj4gS2J1
aWxkIHVzZWQgdG8gaGF2ZSBhIGdsb2JhbCByZXN0cmljdGlvbiAibm8gc3BhY2UgYWZ0ZXIgLUki
LCBidXQNCj4gY29tbWl0IDQ4ZjZlM2NmNWJjNiAoImtidWlsZDogZG8gbm90IGRyb3AgLUkgd2l0
aG91dCBwYXJhbWV0ZXIiKSBnb3QNCj4gcmlkIG9mIGl0LiBIYXZpbmcgYSBzcGFjZSBhZnRlciAt
SSBpcyBubyBsb25nZXIgYSBiaWcgZGVhbCBhcyBmYXIgYXMNCj4gS2J1aWxkIGlzIGNvbmNlcm5l
ZC4NCj4gDQo+IEl0IGlzIHN0aWxsIGEgYmlnIGRlYWwgZm9yIE1JUFMgYmVjYXVzZSBhcmNoL21p
cHMvdmRzby9NYWtlZmlsZQ0KPiBmaWx0ZXJzIHRoZSBoZWFkZXIgc2VhcmNoIHBhdGhzLCBsaWtl
IHRoaXM6DQo+IA0KPiBjY2ZsYWdzLXZkc28gOj0gICAgICAgICAgICQoZmlsdGVyIC1JJSwkKEtC
VUlMRF9DRkxBR1MpKQ0KPiAuLi4sIHdoaWNoIHJlbGllcyBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0
IHRoZXJlIGlzIG5vIHNwYWNlIGFmdGVyIC1JIC4NCj4gDQo+IEZpeGVzOiA5Y2MzNDJmNmM0YTAg
KCJ0cmVld2lkZTogcHJlZml4IGhlYWRlciBzZWFyY2ggcGF0aHMgd2l0aCAkKHNyY3RyZWUpLyIp
DQo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNv
bT4NCg0KQXBwbGllZCB0byBtaXBzLWZpeGVzLg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRo
aXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlz
IGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byBy
ZXBvcnQgaXQuIF0NCg==
