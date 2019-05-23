Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9805227426
	for <lists+linux-mips@lfdr.de>; Thu, 23 May 2019 03:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbfEWB4Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 21:56:24 -0400
Received: from mail-eopbgr750118.outbound.protection.outlook.com ([40.107.75.118]:40777
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727305AbfEWB4Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 May 2019 21:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZosPkpDItWYJYs7S/5qifLmGQFjJFfZr1rMVkVhp04=;
 b=WYrDd8GIlWCRE6qGAMv7JJbVfvWUPVkQlVF5QMmtcvGmabmWV34jCb8yRPptRncEgTGydYW23fWxbXvRA2+RJ/VbhLxUO7yBF/UbSmBcUur721bkE9I6DZSAfqr6O5Z3H8bw8GReEHZMLGu1b7I5AKbVUOzLrYEJ8Ep0My2TwJ4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 01:56:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 01:56:22 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: mark ginvt() as __always_inline
Thread-Topic: [PATCH] MIPS: mark ginvt() as __always_inline
Thread-Index: AQHVD51tB7pkLa0JMU+ha58Nx+HJiaZ39jMA
Date:   Thu, 23 May 2019 01:56:21 +0000
Message-ID: <MWHPR2201MB127737A9DBE2931CCD9347E7C1010@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190521062039.21492-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190521062039.21492-1-yamada.masahiro@socionext.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2002b7a4-6de3-4174-c06a-08d6df21daaf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB11846D49D905CAF72DB32BACC1010@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39850400004)(136003)(366004)(189003)(199004)(486006)(4744005)(52116002)(99286004)(476003)(256004)(6916009)(81166006)(81156014)(6246003)(42882007)(8676002)(76176011)(8936002)(7696005)(53936002)(66946007)(68736007)(66556008)(64756008)(316002)(66446008)(66476007)(73956011)(44832011)(54906003)(71200400001)(186003)(71190400001)(6436002)(33656002)(6116002)(3846002)(26005)(74316002)(5660300002)(6506007)(52536014)(446003)(11346002)(386003)(2906002)(55016002)(229853002)(9686003)(102836004)(4326008)(7736002)(305945005)(66066001)(478600001)(14454004)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jw+WTruddpt6b77XmnCEE0lEiXLZ+mC3MH3jXAiLMtfAKf9jbkr2PNOt0FLHmY2cJLzXkjMQYZLUqpguaWOTP+i3OxNxLUU9FNXvi8Gs6GV1S103hqY5cmnqw/fdhNQRS3nQIr9AfoEZDZ9AdWhU2nYyE7NxlWYf1c2WFKdPzOt2SVnJ3ialqULD4JlMAmziHX/mtI0PIhATS4S4mScSpvcBrfES/Ga4QR6MxE5T8Bl6sjaoT1LNOj25QSRR2tvdzs3DAbRIvxgdIA570xjVbjbYFrIoPpUMvRluxhWWrKhQaY2fG20t2dITU0jk81PTeq88YlhKxo5dQtPJKkrxMJQBP5fa7nDz0L+POj6b9ICj2qvwoZtWDUmhnhjjOL/Di79A5V+AxRGFwMmAxr54UmIAKaf2o+UTWCgz/4w+C0E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2002b7a4-6de3-4174-c06a-08d6df21daaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 01:56:21.9192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1184
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCk1hc2FoaXJvIFlhbWFkYSB3cm90ZToNCj4gVG8gbWVldCB0aGUgJ2knIChpbW1l
ZGlhdGUpIGNvbnN0cmFpbnQgZm9yIHRoZSBhc20gb3BlcmFuZHMsDQo+IHRoaXMgZnVuY3Rpb24g
bXVzdCBiZSBhbHdheXMgaW5saW5lZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlh
bWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQoNCkFwcGxpZWQgdG8gbWlwcy1m
aXhlcy4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2Vu
ZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVh
c2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
