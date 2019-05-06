Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19C315437
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 21:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfEFTMD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 15:12:03 -0400
Received: from mail-eopbgr800097.outbound.protection.outlook.com ([40.107.80.97]:54144
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbfEFTMC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 May 2019 15:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUzZ0EhyDjd0UtLhvoYdyeUDf7fj7adV3f7fjLl+hug=;
 b=JA0Qcc+PSP9Gkr04U0uP44iL2ooHyefs6RiDAAHiKHLPDEYSw56j9H7c3BVtJ35X1hYbgIFedHR6+537SlKqoOtF8/raqZ3D9H0+cPWsYsMabkDZDW5SHzv3lTEodZQgebsGQ6ntuocp534ZEhQNKM6z9JT/WDWtGoS45Z/QoiA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1710.namprd22.prod.outlook.com (10.164.206.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 19:11:59 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 19:11:58 +0000
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
        Matt Redfearn <matt.redfearn@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] mips: Perform early low memory test
Thread-Topic: [PATCH v2 2/5] mips: Perform early low memory test
Thread-Index: AQHVAdjcmcLX10lF0kWX2Ye5DuFibqZee3OA
Date:   Mon, 6 May 2019 19:11:58 +0000
Message-ID: <MWHPR2201MB127702A5FA0A923D3ADB5F12C1300@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190503175041.7949-3-fancer.lancer@gmail.com>
In-Reply-To: <20190503175041.7949-3-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba4bbfd-4812-4a03-8abc-08d6d256b5ea
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1710;
x-ms-traffictypediagnostic: MWHPR2201MB1710:
x-microsoft-antispam-prvs: <MWHPR2201MB1710765BEEC67A87CECDC346C1300@MWHPR2201MB1710.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39840400004)(366004)(346002)(396003)(189003)(199004)(4744005)(8936002)(6506007)(386003)(66476007)(66556008)(64756008)(66446008)(76176011)(476003)(9686003)(6246003)(229853002)(42882007)(186003)(4326008)(6116002)(81156014)(3846002)(81166006)(53936002)(71190400001)(2906002)(8676002)(73956011)(66946007)(26005)(55016002)(102836004)(71200400001)(44832011)(99286004)(446003)(7736002)(7416002)(14454004)(68736007)(74316002)(52536014)(5660300002)(256004)(305945005)(478600001)(66066001)(52116002)(7696005)(11346002)(25786009)(33656002)(54906003)(6916009)(486006)(6436002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1710;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6PltcSd6pDSLuIHRWUID8BXBQUpZaLKTQtgIBBhYkJqwErU2LMOsxOFUMibB8YHZo9geTqFysTQeKbSYqmB1zS4gA4lF2igviRYkyL3etn42GexByT46j4CKx2qB2KXDp3yWXLUgnfZyb/bLgBKMNv0F1TsvGSTOAPyFd3Ov1FQoUUMcDDjRN8dBKIY7pLUriSTeL0XIZkLH6gSRFCKRAlIRK4+xShsE8GzPawTVHkH9hAlDXrvF6IZDYMY9lpQvdzXzKOf84kSR2ZPgtoNe3zfG9L49WOFBGSRb6hu7fqprA1+RTdcePxZ3CFNFw2ITm6L7bItbJ2hGsz0LNWVEWDKVhtCGi0EBXjE/sx7My6wDKr4ZN28XqJO4u/yVuK+36zi+IUli5etaRq8Fw3gcKDknNCPJ0iVHhn7M6ppXWZo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba4bbfd-4812-4a03-8abc-08d6d256b5ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:11:58.7917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1710
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBtZW1ibG9jayBzdWJzeXN0ZW0gcHJvdmlk
ZXMgYSBtZXRob2QgdG8gb3B0aW9uYWxseSB0ZXN0IHRoZSBwYXNzZWQNCj4gbWVtb3J5IHJlZ2lv
biBpbiBjYXNlIGlmIGl0IHdhcyByZXF1ZXN0ZWQgdmlhIHNwZWNpYWwga2VybmVsIGJvb3QNCj4g
YXJndW1lbnQuIExldHMgYWRkIHRoZSBmdW5jdGlvbiBhdCB0aGUgYm90dG9tIG9mIHRoZSBhcmNo
X21lbV9pbml0KCkNCj4gbWV0aG9kLiBUZXN0aW5nIGF0IHRoaXMgcG9pbnQgaW4gdGhlIGJvb3Qg
c2VxdWVuY2Ugc2hvdWxkIGJlIHNhZmUgc2luY2UgYWxsDQo+IGNyaXRpY2FsIGFyZWFzIGFyZSBu
b3cgcmVzZXJ2ZWQgYW5kIGEgbWluaW11bSBvZiBhbGxvY2F0aW9ucyBoYXZlIGJlZW4NCj4gZG9u
ZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBNYXR0IFJlZGZlYXJuIDxtYXR0LnJlZGZlYXJuQG1pcHMu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5j
b20+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRo
aXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlz
IGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byBy
ZXBvcnQgaXQuIF0NCg==
