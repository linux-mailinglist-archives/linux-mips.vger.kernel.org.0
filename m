Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513E751D3C
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbfFXVoC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:44:02 -0400
Received: from mail-eopbgr750128.outbound.protection.outlook.com ([40.107.75.128]:25833
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727855AbfFXVoC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4OEs0vsC8eDorXO+RWGVo0WSJ8bQpcX9uGYnO1Lyw8=;
 b=GTJym+39Vb9iFbRIBha7SZksVbdnTVAbuR5EMkH9cDwjc1Lq7VgSLXxm1rBGAACBv79fAUmBWOkliVHucFgbNBToG7AptPfuaMnG6lOzfvheLOYNUy3/IHtpRNWyKCR2dIrwAZZgGMFLQN4JlLV91xdY2Ub9m9aemtdWc7reWoo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1117.namprd22.prod.outlook.com (10.174.169.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:43:58 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:43:58 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as Ingenic SoCs maintainer
Thread-Topic: [PATCH 2/2] MAINTAINERS: Add myself as Ingenic SoCs maintainer
Thread-Index: AQHVKtO92m1xBnxCHU+A9T9qLo+G76arVjEA
Date:   Mon, 24 Jun 2019 21:43:57 +0000
Message-ID: <MWHPR2201MB127728FAB05376059E8A3891C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190624212752.6816-2-paul@crapouillou.net>
In-Reply-To: <20190624212752.6816-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79a631e2-92b9-409e-d29d-08d6f8ed0fe7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1117;
x-ms-traffictypediagnostic: MWHPR2201MB1117:
x-microsoft-antispam-prvs: <MWHPR2201MB1117067F650AED78D0C0CA9BC1E00@MWHPR2201MB1117.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(366004)(39840400004)(396003)(376002)(136003)(346002)(199004)(189003)(8936002)(64756008)(66476007)(66556008)(478600001)(8676002)(71200400001)(71190400001)(9686003)(81156014)(68736007)(316002)(6916009)(6436002)(55016002)(7736002)(81166006)(6246003)(33656002)(53936002)(4326008)(305945005)(54906003)(76176011)(6506007)(66066001)(25786009)(26005)(386003)(102836004)(186003)(11346002)(7696005)(52116002)(229853002)(446003)(42882007)(476003)(486006)(44832011)(2906002)(99286004)(14454004)(6116002)(74316002)(4744005)(3846002)(52536014)(256004)(66946007)(73956011)(5660300002)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1117;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IQxU/uTs7BGPjTkeBe9aoQxcbo+BtHDM5adsFmN74PoNDKa9vNXIpuPowLkzOlP4o8MJyb9bL/IWWPEjJmM0ZnPI5W3rEwM4H/4vRdtb/cmOBBeL0A/2P2AG3cZR5KUYOnUNk/kekjYPTkdfItoD0eGqT7Bsfl0Cpl7pbpyYjBSYKLqoNk76CavVQGN4HSkTOe6ORRgcXygDruf2vuwwsXOPSYg96YXKX/nAa/j91PvhZArHS0N8hZZTfjw5uQrdvq3uY/DlxdkueL4GZDCVkkyN2bkY/lQfGOHlhuh+U42XYSz577yI1Vx/aynuxoe1ERBzdaT+MhlxT8JnvbbyL4fqxRWq+/8MVXfBfVE8jhTkxoYntHaAuB0Wz+Kor4TyZyx2kt0wxW123FY5LiTtsA9ZuKMRfOtl8Bh0GvFrRvc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a631e2-92b9-409e-d29d-08d6f8ed0fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:43:57.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1117
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClBhdWwgQ2VyY3VlaWwgd3JvdGU6DQo+IEFkZCBteXNlbGYgYXMgdGhlIG1haW50
YWluZXIgb2YgdGhlIGFyY2ggY29kZSwgZGV2aWNldHJlZSBmaWxlcyBhbmQNCj4gZHJpdmVycyBy
ZWxhdGVkIHRvIHRoZSBKWjQ3eHggZmFtaWx5IG9mIFNvQ3MgZnJvbSBJbmdlbmljLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQoNCkFw
cGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2Fn
ZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVj
dA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQu
IF0NCg==
