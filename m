Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE767121F3
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 20:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfEBSft (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 14:35:49 -0400
Received: from mail-eopbgr780134.outbound.protection.outlook.com ([40.107.78.134]:28020
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfEBSft (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 14:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/XmzCjUHCoKTwllZAAgUIsEIG3Zo4aQ59S/+ISYqQA=;
 b=Idkl2BWw46PtdOSdAGsUnnwnyA1zDs+hRfgSuIeDPcHnOB+cUJzHuqDJ90XfLB5Ff4ie/QSx+Bgcqc7eBYglYhemt3gZ+LWScqjw2TLxp5mLgcKxBg3UpnlK2YDBPSE4/FW5EelE0tqKvQqSzSNezRy+paEpRH3g9nQ/2abxb6c=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1582.namprd22.prod.outlook.com (10.174.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 18:35:46 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 18:35:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
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
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Thread-Topic: [PATCH 04/12] mips: Reserve memory for the kernel image
 resources
Thread-Index: AQHU+ibQQIEJaXUkgEWNBapHcAUrdaZYN2eA
Date:   Thu, 2 May 2019 18:35:46 +0000
Message-ID: <MWHPR2201MB1277F3E8F0039C632E3B74AFC1340@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190423224748.3765-5-fancer.lancer@gmail.com>
In-Reply-To: <20190423224748.3765-5-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0026.prod.exchangelabs.com (2603:10b6:a02:80::39)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 595d6150-df1b-4b30-bc9a-08d6cf2cfdef
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1582;
x-ms-traffictypediagnostic: MWHPR2201MB1582:
x-microsoft-antispam-prvs: <MWHPR2201MB158280D2DE2A25DB658FC9F9C1340@MWHPR2201MB1582.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39840400004)(199004)(189003)(33656002)(53936002)(52116002)(9686003)(99286004)(54906003)(229853002)(7696005)(6916009)(6436002)(186003)(4326008)(486006)(6116002)(476003)(3846002)(2906002)(26005)(11346002)(42882007)(102836004)(6506007)(386003)(446003)(44832011)(71190400001)(71200400001)(8676002)(66066001)(81166006)(7736002)(478600001)(55016002)(76176011)(74316002)(7416002)(52536014)(316002)(66476007)(66556008)(73956011)(64756008)(66446008)(66946007)(256004)(14444005)(25786009)(8936002)(81156014)(14454004)(68736007)(5660300002)(305945005)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1582;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v96UwCGNSirMJ6JPCGHer3fEqZ+BEd7ooGhS1HbdanTevwJri6AWiNgZsdMz4GgQvWtNjviEk/qyhVJ4Doxg7KsATBG424kR7nPXP/UKWETBRFjVGbrIAVfYITUZ3M2MOke4AWEtaEnbuwq+HDiYTL1fWtIlWgoBjiyBrUt0XZXe9vwgBkBC3QetkoJ5MeZtJIejwys8/KuEsT2l0AwxxLMGrLeszaRLv7luEcnbjk+XU9MpA1V+bqjMStacMhOBA1e7ucvRUsVGXXCbVjLAFBwOFlfDw8F6TB8zBs0QDZ6j9HP+IzuE7vfz9VhC7pB8YkyLoZSTxUVzLcLoeJE4aZ9CDSRHWxwFvhS5VKBs7CTi/ysL51q5TzzuD6W6L0H3odwJdTdP7rRlz8tOs3Px7cM/7iTynkQRfGdzidvIhKs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595d6150-df1b-4b30-bc9a-08d6cf2cfdef
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:35:46.7833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1582
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBUaGUgcmVzZXJ2ZWRfZW5kIHZhcmlhYmxl
IGhhZCBiZWVuIHVzZWQgYnkgdGhlIGJvb3RtZW1faW5pdCgpIGNvZGUNCj4gdG8gZmluZCBhIGxv
d2VzdCBsaW1pdCBvZiBtZW1vcnkgYXZhaWxhYmxlIGZvciBtZW1tYXAgYmxvYi4gVGhlIG9yaWdp
bmFsDQo+IGNvZGUganVzdCB0cmllZCB0byBmaW5kIGEgZnJlZSBtZW1vcnkgc3BhY2UgaGlnaGVy
IHRoYW4ga2VybmVsIHdhcyBwbGFjZWQuDQo+IFRoaXMgbGltaXRhdGlvbiBzZWVtcyBqdXN0aWZp
ZWQgZm9yIHRoZSBtZW1tYXAgcmFnaW9uIHNlYXJjaCBwcm9jZXNzLCBidXQNCj4gSSBjYW4ndCBz
ZWUgYW55IG9idmlvdXMgcmVhc29uIHRvIHJlc2VydmUgdGhlIHVudXNlZCBzcGFjZSBiZWxvdyBr
ZXJuZWwNCj4gc2VlaW5nIHNvbWUgcGxhdGZvcm1zIHBsYWNlIGl0IG11Y2ggaGlnaGVyIHRoYW4g
c3RhbmRhcmQgMU1CLiBNb3Jlb3Zlcg0KPiB0aGUgUkVMT0NBVElPTiBjb25maWcgZW5hYmxlcyBp
dCB0byBiZSBsb2FkZWQgYXQgYW55IG1lbW9yeSBhZGRyZXNzLg0KPiBTbyBsZXRzIHJlc2VydmUg
dGhlIG1lbW9yeSBvY2N1cGllZCBieSB0aGUga2VybmVsIG9ubHksIGxlYXZpbmcgdGhlIHJlZ2lv
bg0KPiBiZWxvdyBiZWluZyBmcmVlIGZvciBhbGxvY2F0aW9ucy4gQWZ0ZXIgZG9pbmcgdGhpcyB3
ZSBjYW4gbm93IGRpc2NhcmQgdGhlDQo+IGNvZGUgZnJlZWluZyBhIHNwYWNlIGJldHdlZW4ga2Vy
bmVsIF90ZXh0IGFuZCBWTUxJTlVYX0xPQURfQUREUkVTUyBzeW1ib2xzDQo+IHNpbmNlIGl0J3Mg
Z29pbmcgdG8gYmUgZnJlZSBhbnl3YXkgKHVubGVzcyBtYXJrZWQgYXMgcmVzZXJ2ZWQgYnkNCj4g
cGxhdGZvcm1zKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIubGFu
Y2VyQGdtYWlsLmNvbT4NCg0KQXBwbGllZCB0byBtaXBzLW5leHQuDQoNClRoYW5rcywNCiAgICBQ
YXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUg
YW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxlYXNlIGVtYWlsIHBhdWwuYnVydG9uQG1p
cHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
