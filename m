Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5665615431
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 21:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEFTMA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 15:12:00 -0400
Received: from mail-eopbgr800097.outbound.protection.outlook.com ([40.107.80.97]:54144
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbfEFTMA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 May 2019 15:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywzyqmXunx8o56skT6VEskNZ01rlO6lRLcV+6onBoQE=;
 b=DaML3+9tLrTnqo5M0iPcBuJWfsPPIz2Qft2Ztj30zZaj1h+73AhkSnDAFixX27+vbRlE+xaZwHaUKdp7i1bDSSuCGMyiMYKwJNKMlOTLqr0OIaC9w49e5WJmBSqYYEr0IvTFd/Y1aqwpyxQE0YpJvI8vjJqKfMO3rISmKx5/IDE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1710.namprd22.prod.outlook.com (10.164.206.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 19:11:56 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 19:11:56 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
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
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] mips: Dump memblock regions for debugging
Thread-Topic: [PATCH v2 1/5] mips: Dump memblock regions for debugging
Thread-Index: AQHVAdjcB/jpjwvrqkS8AfzMfrbjNaZee3AA
Date:   Mon, 6 May 2019 19:11:56 +0000
Message-ID: <MWHPR2201MB12772F4F9442C678538DCDE8C1300@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190503175041.7949-2-fancer.lancer@gmail.com>
In-Reply-To: <20190503175041.7949-2-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae46db6c-ae3f-41c5-5948-08d6d256b47a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1710;
x-ms-traffictypediagnostic: MWHPR2201MB1710:
x-microsoft-antispam-prvs: <MWHPR2201MB171059777B73FD9494FAC1C9C1300@MWHPR2201MB1710.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39840400004)(366004)(346002)(396003)(189003)(199004)(4744005)(8936002)(6506007)(386003)(66476007)(66556008)(64756008)(66446008)(76176011)(476003)(9686003)(6246003)(229853002)(42882007)(186003)(4326008)(6116002)(81156014)(3846002)(81166006)(53936002)(71190400001)(2906002)(8676002)(73956011)(66946007)(26005)(55016002)(102836004)(71200400001)(44832011)(99286004)(446003)(7736002)(7416002)(14454004)(68736007)(74316002)(52536014)(5660300002)(256004)(305945005)(478600001)(66066001)(52116002)(7696005)(11346002)(25786009)(33656002)(54906003)(6916009)(486006)(6436002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1710;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oUltihqPwOyOZSMR61nzOEDaWs+iV3X+P7VTZ71Wqq+B8zfe/EEyVvwlDPHRDQK67OL7ApMNFjrBqvA/HCKZ1YJ6rS66yhCrSR6wdiyIKCugk8EKbmyghat/SaQeWEyDw9dWG+z8ZP9987xeANcLLhCCy68/xhNW/Rtmye8h1jHudAITi/4E+GbFmWSa6d9yX/gQPvKmS5QDUJji0Wvr7siwtwQAG4FAbrZT5Gu3bz1CjVt7Z9hVsFiiGC8LMm10ILayY2vIPR3ax7GN301aVLZZE3Jzk+6hZWNBqsMMmk+nCSAk4Y5X2o8V/giPVGom4mt5K2BG/xPKiOgU7Kga801YQraBYV9ehXP4GvbYmx07zbEzYgZkbw9PxO2Yoc9fE0fHDgqaUCCQgBvaS93VXJIMBf5eOdG3ecVkwkIuoMQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae46db6c-ae3f-41c5-5948-08d6d256b47a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:11:56.0674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1710
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBJdCBpcyB1c2VmdWwgdG8gaGF2ZSB0aGUg
d2hvbGUgbWVtYmxvY2sgbWVtb3J5IHNwYWNlIHByaW50ZWQgdG8gY29uc29sZQ0KPiB3aGVuIGJh
c2ljIG1lbWxvY2sgaW5pdGlhbGl6YXRpb25zIGFyZSBkb25lLiBJdCBjYW4gYmUgcGVyZm9ybWVk
IGJ5DQo+IHJlYWR5LXRvLXVzZSBtZXRob2QgbWVtYmxvY2tfZHVtcF9hbGwoKSwgd2hpY2ggcHJp
bnRzIHRoZSBhdmFpbGFibGUNCj4gYW5kIHJlc2VydmVkIG1lbW9yeSBzcGFjZXMgaWYgbWVtYmxv
Y2s9ZGVidWcga2VybmVsIHBhcmFtZXRlciBpcw0KPiBzcGVjaWZpZWQuIExldHMgY2FsbCBpdCBh
dCB0aGUgdmVyeSBlbmQgb2YgYXJjaF9tZW1faW5pdCgpIGZ1bmN0aW9uLA0KPiB3aGVuIGFsbCBt
ZW1ibG9jayBtZW1vcnkgYW5kIHJlc2VydmVkIHJlZ2lvbnMgYXJlIGRlZmluZWQsIGJ1dCBiZWZv
cmUNCj4gYW55IHNlcmlvdXMgYWxsb2NhdGlvbiBpcyBwZXJmb3JtZWQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQoNCkFwcGxpZWQg
dG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMg
YXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0
aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
