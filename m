Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1351D45
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfFXVp5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:45:57 -0400
Received: from mail-eopbgr690113.outbound.protection.outlook.com ([40.107.69.113]:50915
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727855AbfFXVp5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S1K9DoUGotL3ZjR2VBVarLi3Q/iPNyngliRDFa4v5c=;
 b=qj0Og56ev7cVUHPPn+00Gh/xbr+rZDeT+1kKBkbg46xH9L6S03ZET5x3eNF5ayn3HuXiG3ihJ0WOTRnfPkllkZANTNYdgOA/u3WeVNcP7a43plSi+dE7j1gFjJjtscarGcKy2y5kzD8DK2C6M1P8lCnB1owQXbCaDixLy3voyW8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:45:55 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:45:54 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Correct path to moved files
Thread-Topic: [PATCH 1/2] MAINTAINERS: Correct path to moved files
Thread-Index: AQHVKtO6mWCxXn0WVkqmIwpKP9EzaqarVryA
Date:   Mon, 24 Jun 2019 21:45:54 +0000
Message-ID: <MWHPR2201MB1277225D41843F4DC67880F6C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190624212752.6816-1-paul@crapouillou.net>
In-Reply-To: <20190624212752.6816-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b84b878a-6769-44d5-b166-08d6f8ed5585
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1022;
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-microsoft-antispam-prvs: <MWHPR2201MB10225B18D9D6E8543E45C1A2C1E00@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(346002)(366004)(136003)(376002)(199004)(189003)(2906002)(52116002)(7696005)(76176011)(33656002)(53936002)(478600001)(99286004)(11346002)(446003)(42882007)(6436002)(74316002)(316002)(14454004)(6246003)(55016002)(66066001)(305945005)(26005)(6916009)(9686003)(4744005)(68736007)(25786009)(6116002)(486006)(476003)(44832011)(81166006)(8936002)(256004)(73956011)(81156014)(54906003)(3846002)(5660300002)(71200400001)(66476007)(186003)(66946007)(7736002)(229853002)(386003)(6506007)(8676002)(4326008)(52536014)(66446008)(66556008)(64756008)(71190400001)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ou8w2ZFtkv7wfHEUn+E6UmCh/y3h2bINMJRa/B3Zn0CzyugPkXOispMert5It3ssWbvHorAn4vAM7AuBV/6kEVJ2ymlMAkDm6l+r0YYbysWY1YnJynExuYwWK3u9z2/C8nk4xMlYPKcXTxU9FwPlXyAS6NGJZ8AumjHIURXZnZiFnkt7Pid6QZaN2y8hUUNT1tnoWmmm4y0whKOmTKQsVMjDe8w5pdRsvqYbutloNJVipu4XBCI0jZbcbJKqPdbORTuHtQbnt4d8Aj7ol4PnFe7RAIzvSleUbt2+W4E4DEh79aQyLoiPbycY0HtNdZzbH94Lz9ii62owoMP9O47RPc43zKxpqTc7TiSh58aCQQ01DlOGR9bPQbDjj77hVeN3ikSbk7z6h75TFmXwn7UpWFam9Heep4gzCRxrI6kEL9o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84b878a-6769-44d5-b166-08d6f8ed5585
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:45:54.8108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClBhdWwgQ2VyY3VlaWwgd3JvdGU6DQo+IFRoZSBkcml2ZXIgd2FzIG1vdmVkIGlu
IGNvbW1pdCAxODM4YTdiMzFmY2IgKCJtdGQ6IHJhd25hbmQ6IE1vdmUNCj4gZHJpdmVycyBmb3Ig
SW5nZW5pYyBTb0NzIHRvIHN1YmZvbGRlciIpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQoNCkFwcGxpZWQgdG8gbWlwcy1maXhlcy4N
Cg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVk
OyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1h
aWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
