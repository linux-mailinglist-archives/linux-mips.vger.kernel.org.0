Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7B41808
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 00:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436784AbfFKWWJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 18:22:09 -0400
Received: from mail-eopbgr790124.outbound.protection.outlook.com ([40.107.79.124]:46880
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2436772AbfFKWWI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 18:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mXryIRRx6t9lD9VOFQ5C5hAGQB7QcTB+79DOL9u7sU=;
 b=p8Z/zWc6McdTQuirDIAAexiENgzLmNwoA19ZdiTn2FaiEqCFMCEg3vnTDlT7Q6rAI3MiJ6jIAFLgwRJQkviTvulBXRvUz6uJ7qCxk83j1ckjb+IX+S2ucbb9LTSegy5r79UVErtdr5A2XHatu5UBUS7nT6f51XsEpBPEvAAtgvQ=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1367.namprd22.prod.outlook.com (10.171.217.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Tue, 11 Jun 2019 22:22:06 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 22:22:06 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <trivial@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH trivial] memory: jz4780-nemc: Grammar s/the its/its/
Thread-Topic: [PATCH trivial] memory: jz4780-nemc: Grammar s/the its/its/
Thread-Index: AQHVHSTkqF1069CarE6SbLFS+Ro7tqaXDecA
Date:   Tue, 11 Jun 2019 22:22:05 +0000
Message-ID: <CY4PR2201MB1272A71C15A3B424B60EB591C1ED0@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190607113343.14828-1-geert+renesas@glider.be>
In-Reply-To: <20190607113343.14828-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3bc6682-c649-4566-ab84-08d6eebb3c37
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1367;
x-ms-traffictypediagnostic: CY4PR2201MB1367:
x-microsoft-antispam-prvs: <CY4PR2201MB136795444DF5792ACC1516DDC1ED0@CY4PR2201MB1367.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(376002)(346002)(396003)(366004)(199004)(189003)(81156014)(446003)(2906002)(8676002)(81166006)(486006)(305945005)(7736002)(478600001)(476003)(11346002)(14454004)(44832011)(66446008)(5660300002)(66556008)(64756008)(66476007)(66946007)(68736007)(52536014)(8936002)(73956011)(6116002)(3846002)(74316002)(256004)(42882007)(71200400001)(71190400001)(26005)(9686003)(6246003)(558084003)(4326008)(102836004)(99286004)(55016002)(25786009)(54906003)(52116002)(6436002)(53936002)(7696005)(316002)(186003)(76176011)(6506007)(386003)(229853002)(66066001)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1367;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ETqTYEy52h3lRIZoZYBzIVXRlTMm6uzg5sB28Dp1WbQ+1x3ANNwQAfCobCKYaJG4GmOCSCUS7Nv/EUQZyaieXJts+ocWH4JI8eRNcpo8GqEr0nFv0l1B7tiB8ZV3xE48a6vpjM7H/bQ6oOcYsh4gSNO38FCgfp2wZVz/GmNK3XZx8Ie2QrKglhfwsYcYwU0593XzQ4aaxTQbx8QY2CsmnL0rmSIaRKrQneEDMLe9l+fVheyQAU6DModEbeth4DEm3yrOZ9fWlJsIPR0PNku2MIi3ldjuMwpyz8s95d0hDo8tOfQHw0G6XCmHbGqYrXpUKWH6aqdUUfN91FFKVoL+a48/OMDSatlVr0MgmipYn61ZbAtZt2dVWVOwhDnE5L/udiNh00Ayqg1VbdyPMbDtE85Kyvat5wz5LAbtWkUs+tg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bc6682-c649-4566-ab84-08d6eebb3c37
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 22:22:05.9092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1367
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KQXBwbGllZCB0byBt
aXBzLW5leHQuDQoNClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRv
LWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4g
cGxlYXNlIGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
