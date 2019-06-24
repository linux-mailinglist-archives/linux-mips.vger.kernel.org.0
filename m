Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFB151CF2
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732214AbfFXVQQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:16 -0400
Received: from mail-eopbgr790137.outbound.protection.outlook.com ([40.107.79.137]:43339
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731729AbfFXVQN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFRSrt0kaEpYNUooKthsj5/OGNwsXz2LtaVtteVrN4g=;
 b=fk47Ys0dgvUMms8JJf5oZjRX9VnoOZa+xPpAHPQssFt4LLEgDWVlalpCAZsfZ6/TZKKJ5hdG4IKEPeinhQLT+1z+2S4jIFsK4DFXFxV3kNyiTQLfT8Qeb8iexsLQjm5iuKMnEk+Q2lsXpN0unyVpb6l4aDMShx5hWCXZk/vvKW4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
Thread-Topic: [PATCH] mips: Remove q-accessors from non-64bit platforms
Thread-Index: AQHVInt4cLa0IUSxeEKd/1SMoCpE8aarXx6A
Date:   Mon, 24 Jun 2019 21:16:10 +0000
Message-ID: <MWHPR2201MB127741C612E43E450EA063D3C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
In-Reply-To: <20190614063341.1672-1-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d75f961-ca82-48ef-78f1-08d6f8e92e37
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB13755E0054FD6B3B4E72B31FC1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(14444005)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZdSGBaPQtFAGytwx6VHs7iWIMIRe6GZ3k5mFho32VCXhuPjBLxATovygKAcbXCoxtqONme0EU/lFehNHYNw0V/qqHdgOaZw2ynn++vRAQSS/1Q3OavwuPRlU15CKSb6PefGXsxBPwKzvyD0aFWF6qvW6FMJzq0ZQmacgdSuqGDp0ns1Ex1qFf5mpCOXuLzCjDRRlqV2qkDMCM93ulYWwSYaV6FWpct7j3BGmDSdN0byoD+BUMFevunXk1d1d92BMVZAFsWXaB+rF8ugZcofWM+4cExnaKFNEzDAL6C96RQ5l2IX5GyHqhgPY9zGXGXMHSD/2jOgtTyXX9lDXngbeARtDN4jZVMsfuxWmvl+XPbtCBnI4togZ666pktP1VpUIocQUdwCMQ1m9BynCLbxDX+hopTLJU241sKX8iStDhO8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d75f961-ca82-48ef-78f1-08d6f8e92e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:10.9182
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

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBUaGVyZSBhcmUgc29tZSBnZW5lcmljIGRy
aXZlcnMgaW4gdGhlIGtlcm5lbCwgd2hpY2ggbWFrZSB1c2Ugb2YgdGhlDQo+IHEtYWNjZXNzb3Jz
IG9yIHRoZWlyIGRlcml2YXRpdmVzLiBXaGlsZSBhdCBjdXJyZW50IGFzbS9pby5oIHRoZSBhY2Nl
c3NvcnMNCj4gYXJlIGRlZmluZWQsIHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIG9ubHkgYXBwbGlj
YWJsZSBlaXRoZXIgZm9yIDY0Yml0DQo+IHN5c3RlbXMsIG9yIGZvciBzeXN0ZW1zIHdpdGggY3B1
X2hhc182NGJpdHMgZmxhZyBzZXQuIE9idmlvdXNseSB0aGVyZQ0KPiBhcmUgTUlQUyBzeXN0ZW1z
IHdoaWNoIGFyZSBuZWl0aGVyIG9mIHRoZXNlLCBidXQgc3RpbGwgbmVlZCB0byBoYXZlDQo+IHRo
b3NlIGRyaXZlcnMgc3VwcG9ydGVkLiBJbiB0aGlzIGNhc2UgdGhlIHNvbHV0aW9uIGlzIHRvIGRl
ZmluZSBzb21lDQo+IGdlbmVyaWMgdmVyc2lvbnMgb2YgdGhlIHEtYWNjZXNzb3JzLCBidXQgd2l0
aCBhIGxpbWl0YXRpb24gdG8gYmUNCj4gbm9uLWF0b21pYy4gU3VjaCBhY2Nlc3NvcnMgYXJlIGRl
ZmluZWQgaW4gdGhlDQo+IGlvLTY0LW5vbmF0b21pYy17aGktbG8sbG8taGl9LmggZmlsZS4gVGhl
IGRyaXZlcnMgd2hpY2ggdXRpbGl6ZSB0aGUNCj4gcS1zdWZmaXhlZCBJTy1tZXRob2RzIGFyZSBz
dXBwb3NlZCB0byBpbmNsdWRlIHRoZSBoZWFkZXIgZmlsZSwgc28NCj4gaW4gY2FzZSBpZiB0aGVz
ZSBhY2Nlc3NvcnMgYXJlbid0IGRlZmluZWQgZm9yIHRoZSBwbGF0Zm9ybSwgdGhlIGdlbmVyaWMN
Cj4gbm9uLWF0b21pYyB2ZXJzaW9ucyBhcmUgdXRpbGl6ZWQuIEN1cnJlbnRseSB0aGUgTUlQUy1z
cGVjaWZpYyBhc20vaW8uaA0KPiBmaWxlIHByb3ZpZGVzIHRoZSBxLWFjY2Vzc29ycyBmb3IgYW55
IE1JUFMgc3lzdGVtIGV2ZW4gZm9yIG9uZXMsIHdoaWNoDQo+IGluIGZhY3QgZG9uJ3Qgc3VwcG9y
dCB0aGVtIGFuZCByYWlzZSBCVUcoKSBpbiBjYXNlIGlmIGFueSBvZiB0aGVtIGlzDQo+IGNhbGxl
ZC4gRHVlIHRvIHRoaXMgdGhlIGdlbmVyaWMgdmVyc2lvbnMgb2YgdGhlIGFjY2Vzc29ycyBhcmUg
bmV2ZXINCj4gdXNlZCB3aGlsZSBhbiBhdHRlbXB0IHRvIGNhbGwgdGhlIElPLW1ldGhvZHMgY2F1
c2VzIHRoZSBrZXJuZWwgQlVHKCkuDQo+IEluIG9yZGVyIHRvIGZpeCB0aGlzIHdlIG5lZWQgdG8g
ZGVmaW5lIHRoZSBxLWFjY2Vzc29ycyBvbmx5IGZvcg0KPiB0aGUgTUlQUyBzeXN0ZW1zLCB3aGlj
aCBhY3R1YWxseSBzdXBwb3J0IHRoZW0sIGFuZCBkb24ndCBkZWZpbmUgdGhlbQ0KPiBvdGhlcndp
c2UsIHNvIHRvIGxldCB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXJzIHRvIHVzZSB0aGUgbm9uLWF0
b21pYw0KPiBxLXN1ZmZpeGVkIGFjY2Vzc29ycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNlcmdl
IFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4NCj4gU3VnZ2VzdGVkLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBDYzogVmFkaW0gVi4gVmxhc292IDx2YWRpbS52bGFz
b3ZAdC1wbGF0Zm9ybXMucnU+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQog
ICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxp
ZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRv
bkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
