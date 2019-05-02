Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D054121F2
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 20:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfEBSfm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 14:35:42 -0400
Received: from mail-eopbgr710095.outbound.protection.outlook.com ([40.107.71.95]:57600
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfEBSfm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 14:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hvinIDlmQctE61IQBaXZbQH1m8+jLMYrUl2s6jlLUE=;
 b=PrRSzjH928STjsjCyqWzNBU11UjGw2GiWUKZ0DA8hWxvGSo1tj0vNMGcbOnVPpeBI3wJ3ChlrhkfjGxhsS8lrvlDv2FakFs460KBUkZkCrL5vJbw1Ku91mIhlUowO5QbyOCc0obXbQG+k0zm3SmYhGGmBmmCbnCmqGUSjWJsk7g=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1582.namprd22.prod.outlook.com (10.174.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 18:35:40 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 18:35:40 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 0/4] MIPS: Exception vector improvements
Thread-Topic: [PATCH 0/4] MIPS: Exception vector improvements
Thread-Index: AQHU/6eHYrWGvpJyA0K+L234LNCFJaZYLF0A
Date:   Thu, 2 May 2019 18:35:40 +0000
Message-ID: <MWHPR2201MB12772A53D994A96DB61C5196C1340@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190430225216.7164-1-paul.burton@mips.com>
In-Reply-To: <20190430225216.7164-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6f7f3a8-c501-4a47-5894-08d6cf2cf9ed
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1582;
x-ms-traffictypediagnostic: MWHPR2201MB1582:
x-microsoft-antispam-prvs: <MWHPR2201MB1582F5526502273F4C236602C1340@MWHPR2201MB1582.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39840400004)(199004)(189003)(33656002)(53936002)(52116002)(9686003)(99286004)(54906003)(229853002)(7696005)(6436002)(6862004)(186003)(4326008)(486006)(6116002)(476003)(3846002)(2906002)(26005)(11346002)(42882007)(102836004)(6506007)(386003)(446003)(44832011)(71190400001)(71200400001)(8676002)(4744005)(66066001)(81166006)(7736002)(478600001)(55016002)(76176011)(74316002)(52536014)(316002)(66476007)(66556008)(73956011)(64756008)(66446008)(66946007)(256004)(14444005)(25786009)(8936002)(81156014)(14454004)(68736007)(5660300002)(305945005)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1582;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UPx577VDFKTZ6qOAgqJ3EGi+X0hpm8z3cf1nP5j8Pael23JnQbY3pvXI1KU/rzRvib3Ns49jTelsrBDI8ebUXBmx0Qwqgda0RgX+kHOI53qfsnca8c8QVpkyTXo+0ELwSaey1poqP4edWzQjCMQ8svY8cob9BFj74kRbZV3dvYNnb9awY/TNq6DIoOq3Ni8b4kujkv+0Gvkec7WjfKkV9Je8zoOARNwKLfHYTEvFVCFW425UfP/0AzRGNTwCEitoJRq66wrW3aaVk326vJz2c+TfQjMMPvmoikFYhWnIxDs02WTqDNw3lJ9uR+ofnBLRaX4loRjdWqzmr2INkBwrQt41Q9WZP8faFyfM87ZZPOFDmG6F7UHN/+iAFLR4w3ZddLFsg14DvCEuZ5jufVhWnbYEVDypd7/+ypT7s8dv40o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f7f3a8-c501-4a47-5894-08d6cf2cf9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:35:40.1578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1582
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClBhdWwgQnVydG9uIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUg
d2F5IHdlIGFsbG9jYXRlIG1lbW9yeSBmb3Igb3VyIGV4Y2VwdGlvbiB2ZWN0b3INCj4gJiBjb25m
aWd1cmUgaXQgaW4gRUJhc2UuDQo+IA0KPiBQYXRjaCAyIGluIHBhcnRpY3VsYXIgaXMgaW1wb3J0
YW50IHByZXBhcmF0aW9uIGZvciBjaGFuZ2VzIGJlaW5nIG1hZGUgYnkNCj4gU2VyZ2UgU2VtaW4g
aW4gaGlzICJtaXBzOiBQb3N0LWJvb3RtZW0tbWVtYmxvY2sgdHJhbnNpdGlvbiBmaXhlcyINCj4g
c2VyaWVzLg0KPiANCj4gUGF1bCBCdXJ0b24gKDQpOg0KPiBNSVBTOiBVc2UgbW5lbWJsb2NrX3Bo
eXNfYWxsb2MoKSBmb3IgZXhjZXB0aW9uIHZlY3Rvcg0KPiBNSVBTOiBBbHdheXMgYWxsb2NhdGUg
ZXhjZXB0aW9uIHZlY3RvciBmb3IgTUlQU3IyKw0KPiBNSVBTOiBTeW5jIGljYWNoZSBmb3Igd2hv
bGUgZXhjZXB0aW9uIHZlY3Rvcg0KPiBNSVBTOiBSZW1vdmUgZHVwbGljYXRlIEVCYXNlIGNvbmZp
Z3VyYXRpb24NCj4gDQo+IGFyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYyB8IDYzICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPiBSZXZpZXdlZC1ieTogU2VyZ2UgU2VtaW4gPGZh
bmNlci5sYW5jZXJAZ21haWwuY29tPg0KPiBUZXN0ZWQtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIu
bGFuY2VyQGdtYWlsLmNvbT4NCg0KU2VyaWVzIGFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFu
a3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlv
dSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVs
LmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
