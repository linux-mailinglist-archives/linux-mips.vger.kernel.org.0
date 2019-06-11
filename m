Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13E54182C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 00:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404649AbfFKWah (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 18:30:37 -0400
Received: from mail-eopbgr750118.outbound.protection.outlook.com ([40.107.75.118]:58352
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404718AbfFKWag (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 18:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHs4WCFJoCNWGVZh4UTOPAhGgp0lKw/NT9HamZ2eYeE=;
 b=edQYTSnVLCdJKoCsGS1OaIObW3Mx5FMuOdVSgzVDPZf6qAF5aSaz46lOzVJeWAh6XZvRkMHnX0hTicB6+l1FycWIF7tOblLGHRzvYaLoE5XrvWqc44ZG3kmTEqTCFQgmt/lDjEgqxM31j74desA3QsL85EPxVW1Kl11CZQvpBoA=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1014.namprd22.prod.outlook.com (10.171.220.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 22:30:33 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 22:30:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: configs: Remove useless UEVENT_HELPER_PATH
Thread-Topic: [PATCH] MIPS: configs: Remove useless UEVENT_HELPER_PATH
Thread-Index: AQHVGqrQKwfEze7GG0KYKt5bg4AUGqaXFTiA
Date:   Tue, 11 Jun 2019 22:30:33 +0000
Message-ID: <CY4PR2201MB12726C7AAEE8A350CF777839C1ED0@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <1559634891-20075-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1559634891-20075-1-git-send-email-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a16460c-18de-4239-ee4c-08d6eebc6a84
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY4PR2201MB1014;
x-ms-traffictypediagnostic: CY4PR2201MB1014:
x-microsoft-antispam-prvs: <CY4PR2201MB10140D34688189A24DB0431FC1ED0@CY4PR2201MB1014.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(366004)(39840400004)(346002)(199004)(189003)(476003)(8676002)(446003)(486006)(4326008)(11346002)(7696005)(2906002)(6506007)(386003)(26005)(52116002)(102836004)(316002)(76176011)(66066001)(68736007)(6916009)(6116002)(99286004)(33656002)(3846002)(55016002)(44832011)(9686003)(186003)(6246003)(305945005)(66476007)(54906003)(52536014)(71200400001)(71190400001)(66556008)(64756008)(66946007)(7736002)(4744005)(66446008)(5660300002)(8936002)(25786009)(14454004)(73956011)(53936002)(74316002)(478600001)(42882007)(229853002)(81166006)(14444005)(81156014)(6436002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1014;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vEDoYPYD+YXaINEQFGvOYZccLuuwCOUIf+42CRmGjjLRJMT32Rj7+IReUg/0MZY2dmfAZtpRctDbe7Rdppj6O1tcgQn1p0JntI6CO/sgHXEZlhOJHvT2wwYUoPyo3jSO12UaNqDlRFLRTkuX3/wwsenhvo035gssIrDd2qwXUOUwEpLpmhlT77angUqo9z6TElMobW54efH5TWwD4BGfAojlPnHSaew+4UiB5Y9r3VdhHUYo7IqmWtIyB6ngxE/yWG++uXmtUyzTaIy41NH0Urjt01pMf0sqERJvmPNWYdwwyfQaJFk/sWF9C72ZTHQof849+CboHcZdX7dX7lNhSl1R6miRR5Ms1BBFzz6VFVjCLu76TWXRAwFbrrX4bPmm5ydFKVK+LGSUTXDHgTkCISWq7V2KkNdJIIgfxAchCkc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a16460c-18de-4239-ee4c-08d6eebc6a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 22:30:33.2086
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

SGVsbG8sDQoNCktyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFJlbW92ZSB0aGUgQ09ORklH
X1VFVkVOVF9IRUxQRVJfUEFUSCBiZWNhdXNlOg0KPiAxLiBJdCBpcyBkaXNhYmxlZCBzaW5jZSBj
b21taXQgMWJlMDFkNGE1NzE0ICgiZHJpdmVyOiBiYXNlOiBEaXNhYmxlDQo+IENPTkZJR19VRVZF
TlRfSEVMUEVSIGJ5IGRlZmF1bHQiKSBhcyBpdHMgZGVwZW5kZW5jeSAoVUVWRU5UX0hFTFBFUikg
d2FzDQo+IG1hZGUgZGVmYXVsdCB0byAnbicsDQo+IDIuIEl0IGlzIG5vdCByZWNvbW1lbmRlZCAo
aGVscCBtZXNzYWdlOiAiVGhpcyBzaG91bGQgbm90IGJlIHVzZWQgdG9kYXkNCj4gWy4uLl0gY3Jl
YXRlcyBhIGhpZ2ggc3lzdGVtIGxvYWQiKSBhbmQgd2FzIGtlcHQgb25seSBmb3IgYW5jaWVudA0K
PiB1c2VybGFuZCwNCj4gMy4gQ2VydGFpbiB1c2VybGFuZCBzcGVjaWZpY2FsbHkgcmVxdWVzdHMg
aXQgdG8gYmUgZGlzYWJsZWQgKHN5c3RlbWQNCj4gUkVBRE1FOiAiTGVnYWN5IGhvdHBsdWcgc2xv
d3MgZG93biB0aGUgc3lzdGVtIGFuZCBjb25mdXNlcyB1ZGV2IikuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IEFja2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpBcHBsaWVkIHRv
IG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1
dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhl
biBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
