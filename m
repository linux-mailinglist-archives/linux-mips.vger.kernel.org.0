Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA83315438
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 21:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfEFTMM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 15:12:12 -0400
Received: from mail-eopbgr800104.outbound.protection.outlook.com ([40.107.80.104]:8480
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbfEFTMG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 May 2019 15:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5EqT9N1YG03ukmh5uRf/r+FDHUDmkX2TG3z+AQlKRE=;
 b=Eu9aFlf/f/3CDbJuUrex9+ObEji3M3FCwXJ90GpdCEmKf7jj0BeWuZwGLI7S10czk1H+wII9nyDIUxGjX69KatDSxi2zMx+HYXJCq4nlZDJCUqnjtf0onoXu9rHtrdowItk9Icp4PbFNDdxNfoD3XElUMJnLQCfbfJbU9K9qnXU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1710.namprd22.prod.outlook.com (10.164.206.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 19:12:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 19:12:04 +0000
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
Subject: Re: [PATCH v2 5/5] mips: Manually call fdt_init_reserved_mem() method
Thread-Topic: [PATCH v2 5/5] mips: Manually call fdt_init_reserved_mem()
 method
Thread-Index: AQHVAdjfM+TbrnuU9kCrykpyUKH2oqZee3kA
Date:   Mon, 6 May 2019 19:12:04 +0000
Message-ID: <MWHPR2201MB12770C946CB59879CEF63C5FC1300@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190503175041.7949-6-fancer.lancer@gmail.com>
In-Reply-To: <20190503175041.7949-6-fancer.lancer@gmail.com>
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
x-ms-office365-filtering-correlation-id: 4f5b8ad9-4655-44cc-9c31-08d6d256b929
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1710;
x-ms-traffictypediagnostic: MWHPR2201MB1710:
x-microsoft-antispam-prvs: <MWHPR2201MB1710C4ABE26B3FF897B34206C1300@MWHPR2201MB1710.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39840400004)(366004)(346002)(396003)(189003)(199004)(4744005)(8936002)(6506007)(386003)(66476007)(66556008)(64756008)(66446008)(76176011)(476003)(9686003)(6246003)(229853002)(42882007)(186003)(4326008)(6116002)(81156014)(3846002)(81166006)(53936002)(71190400001)(2906002)(8676002)(73956011)(66946007)(26005)(55016002)(102836004)(71200400001)(44832011)(99286004)(446003)(7736002)(7416002)(14454004)(68736007)(74316002)(52536014)(5660300002)(256004)(305945005)(478600001)(66066001)(52116002)(7696005)(11346002)(25786009)(33656002)(54906003)(6916009)(486006)(6436002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1710;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ig+xGoAZU55lP+EB7OC3/dhiNRGFkC6LpqvxPsJjAbT5gyMt6Or1WfHD+aOYu9oOqJPi+i6T+ws1T0ze5xge2Vt0DbV28CyhErTt3zjHgvVC+H/07KwXtNI8XQt3sITX/fZr3CfL2WDJED1kEZDFiORV+2xBRcftgpaFNQFrF1FCruSpAGMO8TxrkOAXy3GC6Wmb4A9Eojc0PpBS0R5dxWNTvtcfCXPnroz0a0R8gJAf6aM+Ixsm9/gci4cwhL9zbWLjmDlGOPdSY+oIImwVAStwUEmQFzmqyNvv1mDSung8rzzQDH78eK2p7AIHgHa/zZvpdWs76otqOV7meZV3TXrH0m44m4Fcxcm7nj3Q2VVue6yYjJKNsbVFnphQ+xT02hrfXvGn4ajyL5Z18+21pjk4tfQpFm+lfzJOS0cELII=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5b8ad9-4655-44cc-9c31-08d6d256b929
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:12:04.0420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1710
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBTaW5jZSBtZW1ibG9jay1wYXRjaHNldCB3
YXMgaW50cm9kdWNlZCB0aGUgcmVzZXJ2ZWQtbWVtb3J5IG5vZGVzIGFyZQ0KPiBzdXBwb3J0ZWQg
YmVpbmcgZGVjbGFyZWQgaW4gZHQtZmlsZXMuIFNvIHRoZXNlIG5vZGVzIGFyZSBhY3R1YWxseSBw
YXJzZWQNCj4gZHVyaW5nIHRoZSBhcmNoIHNldHVwIHByb2NlZHVyZSB3aGVuIHRoZSBlYXJseV9p
bml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpDQo+IG1ldGhvZCBpcyBjYWxsZWQuIEJ1dCBkdWUg
dG8gdGhlIGFyY2gtc3BlY2lmaWMgYm9vdCBtZW1fbWFwIGNvbnRhaW5lcg0KPiB1dGlsaXphdGlv
biB3ZSBuZWVkIHRvIG1hbnVhbGx5IGNhbGwgdGhlIGZkdF9pbml0X3Jlc2VydmVkX21lbSgpIG1l
dGhvZA0KPiBhZnRlciBhbGwgdGhlIGF2YWlsYWJsZSBhbmQgcmVzZXJ2ZWQgbWVtb3J5IGhhcyBi
ZWVuIG1vdmVkIHRvIG1lbWJsb2NrLg0KPiBUaGUgZmlyc3QgZnVuY3Rpb24gY2FsbCBwZXJmb3Jt
ZWQgYmVmb3JlIGJvb3RtZW1faW5pdCgpIGJ5IHRoZQ0KPiBlYXJseV9pbml0X2ZkdF9zY2FuX3Jl
c2VydmVkX21lbSgpIHJvdXRpbmUgZmFpbHMgZHVlIHRvIHRoZSBsYWNrIG9mIGFueQ0KPiBtZW1i
bG9jayBtZW1vcnkgcmVnaW9ucyB0byBhbGxvY2F0ZSBmcm9tIGF0IHRoYXQgc3RhZ2UuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQoN
CkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVz
c2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29y
cmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQg
aXQuIF0NCg==
