Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E371BD8D
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbfEMTDj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 15:03:39 -0400
Received: from mail-eopbgr710110.outbound.protection.outlook.com ([40.107.71.110]:29675
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727849AbfEMTDj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 May 2019 15:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfmTboGgEEyOKt7pd2NcQbw9HiE4NcSY4B+agw2IMqo=;
 b=M4FTs24uyNXwAuknz/M/0dLSu/9CT8jlpJIRHFfkNXpGKPl8z+dge8Ima+8qPYxMaaGThT69QSOLS/HHJaagKp2sfKyyFImdsK/JP2Qh69t6eWzgbQ7TP+BKvo3v3nHP2jEljuWugltrP6jp9xAmBJiZRsEEhqIljEuh51C+7PM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1056.namprd22.prod.outlook.com (10.174.169.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 19:03:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 19:03:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: SGI-IP22: provide missing
 dma_mask/coherent_dma_mask
Thread-Topic: [PATCH] MIPS: SGI-IP22: provide missing
 dma_mask/coherent_dma_mask
Thread-Index: AQHVCX1MMKsR0fJkjUKY7dtOHHuNoKZpaiAA
Date:   Mon, 13 May 2019 19:03:32 +0000
Message-ID: <MWHPR2201MB12778BAEA39402F4A1F390C8C10F0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190513111609.14855-1-tbogendoerfer@suse.de>
In-Reply-To: <20190513111609.14855-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d3532d5-8dbf-4024-e133-08d6d7d5b14f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1056;
x-ms-traffictypediagnostic: MWHPR2201MB1056:
x-microsoft-antispam-prvs: <MWHPR2201MB1056385C8BD82FD9E5E3F3A9C10F0@MWHPR2201MB1056.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(376002)(396003)(366004)(346002)(136003)(199004)(189003)(54906003)(316002)(68736007)(66066001)(99286004)(71190400001)(74316002)(71200400001)(6916009)(305945005)(25786009)(7736002)(44832011)(4744005)(33656002)(256004)(476003)(486006)(446003)(11346002)(26005)(102836004)(186003)(7696005)(42882007)(2906002)(52116002)(6506007)(386003)(76176011)(66446008)(14454004)(81166006)(81156014)(6116002)(4326008)(6246003)(9686003)(478600001)(8676002)(73956011)(8936002)(5660300002)(3846002)(55016002)(229853002)(53936002)(6436002)(66946007)(52536014)(66476007)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1056;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s5oiCUZ2BmtnQ2BH52+hz6kECe54he+himMt7N04HTWgJzHbI0tahyt8Tf31hQHDSeVza/fHJqMypYfqUMIL9romLi/DSIUO8BXBMsjep7O3IwAPjfBsrLSD28ON1Z4vtQn2xxjzAJRH6GmJgOw3r1zWI1G84P2L30VVJxImgg7dNZ1x2fGX9nx5XRSKghvZlzmpqrox0VtpJ3USZ5ZPMQvIn8cXOYU5rQ0JkU4mhRhZtcG2wLHI3Qhpy/djLCIm1Q8wEsmYQkGirlbjXrl7pI0LOCqgAS1c5Q5ZbPV84iKdLA+NuJ7FMDvoeL6OrxBX69F4EHiLHLbSK6irfqk5ksih05ASjJzkHrenAkMT4QMiAFUB//CG4hMAGIMZkZrup/TRHdHYlSEO5cZLlj4+BMuIj97EkcL3Hz3OezqzYGM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3532d5-8dbf-4024-e133-08d6d7d5b14f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 19:03:32.7135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1056
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClRob21hcyBCb2dlbmRvZXJmZXIgd3JvdGU6DQo+IFNldCBkbWFfbWFza3MgZm9y
IFNHSVdEOTMgYW5kIFNHSVNFRVEgb3RoZXJ3aXNlIERNQSBhbGxvY2F0aW9ucyBmYWlscw0KPiBh
bmQgY2F1c2VzIG5vdCB3b3JraW5nIFNDU0kvZXRoZXJuZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0Ym9nZW5kb2VyZmVyQHN1c2UuZGU+DQoNCkFwcGxpZWQg
dG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMg
YXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0
aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
