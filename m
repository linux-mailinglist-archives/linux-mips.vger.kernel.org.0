Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EB92E640
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 22:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfE2Ufn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 16:35:43 -0400
Received: from mail-eopbgr780131.outbound.protection.outlook.com ([40.107.78.131]:44166
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726155AbfE2Ufm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 May 2019 16:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSB91ZaL+6mY/s2xC3J6Gts2nm0Q3Y2bpbv/viHLItQ=;
 b=PTaUHT2G1As/gSaVtU4DxMaRco+MX+wRcdlgO5YmEHmQ8wNxgTgg83OpqK/e8aRDmHfue7YtATfiiYqUQuKOdOadaFSCxrbV+TgboZIDe3mLnW22ceq2X3ooKgyNrvypHBRimiqwMurztdRrlOfTDwa13mwcrDZQB8cKjqg8Xt0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1264.namprd22.prod.outlook.com (10.174.162.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 29 May 2019 20:35:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 20:35:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        James Hogan <jhogan@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: replace MBIT_ULL() with BIT_ULL()
Thread-Topic: [PATCH] MIPS: replace MBIT_ULL() with BIT_ULL()
Thread-Index: AQHVEexuZuhoqIDDSEuMMcOiiKAVyaaCmEmA
Date:   Wed, 29 May 2019 20:35:37 +0000
Message-ID: <MWHPR2201MB127776C42A683A107714F54FC11F0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190524045112.21411-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190524045112.21411-1-yamada.masahiro@socionext.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3b302ef-6f2f-4731-215b-08d6e47534d9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1264;
x-ms-traffictypediagnostic: MWHPR2201MB1264:
x-microsoft-antispam-prvs: <MWHPR2201MB12640F7D4AFFAEC725B7F1C5C11F0@MWHPR2201MB1264.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:556;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(396003)(39850400004)(346002)(376002)(199004)(189003)(478600001)(33656002)(25786009)(68736007)(486006)(6116002)(305945005)(52536014)(44832011)(8936002)(4326008)(8676002)(42882007)(11346002)(316002)(186003)(81156014)(81166006)(14454004)(26005)(3846002)(6916009)(74316002)(71190400001)(446003)(2906002)(71200400001)(66556008)(66946007)(476003)(55016002)(4744005)(102836004)(66446008)(64756008)(229853002)(6436002)(66066001)(5660300002)(256004)(9686003)(52116002)(386003)(76176011)(7736002)(53936002)(54906003)(73956011)(6506007)(6246003)(7696005)(66476007)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1264;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fv97Jf9WLys+I4ksvo7wvSm7TK7hzKegL+T4HL/8O8r+gDiI1DeSruvW0lxVc9oXmtOIq6eKfhCNZFHZr3+x2bjnPcYY37BSyB7CnAVhnJd7JMmH4B0+pEo2LQQ87GfCAsX3YkY8fEDUwZcnJcf2HaIvMOkPJWMKFaniIrSxlNuK4TTzxszsxkIikpfEQe/sj+7BhD+iJ6rN77jFF6IeGV+U8o4lS4wiDXvXVHdTOAWdtwN8JWNcmMf9h9wbDm58Qit9H6k5Lp+7xLvHjHCBESiwnWbQoO+wW35R1vx/pawR0cyCY2ZhS+5MG0LWFE6OlkpxKReiatT6pvhT0bL1N9Sy2+bD3p4cnBQLhMGMU/6Ol48TmbKy1bupJmnrampyVwcQT3c4PjHqAn+L6jBC233KohnbUBKeBQeYZz4Pddk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b302ef-6f2f-4731-215b-08d6e47534d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 20:35:37.1528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1264
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCk1hc2FoaXJvIFlhbWFkYSB3cm90ZToNCj4gQ29tbWl0IDhiZDljYjUxZGFhYyAo
ImxvY2tpbmcvYXRvbWljcywgYXNtLWdlbmVyaWM6IE1vdmUgc29tZSBtYWNyb3MNCj4gZnJvbSA8
bGludXgvYml0b3BzLmg+IHRvIGEgbmV3IDxsaW51eC9iaXRzLmg+IGZpbGUiKSBtb3ZlZCBCSVRf
VUxMKCkNCj4gaW50byA8bGludXgvYml0cy5oPi4gSXQgb25seSBpbmNsdWRlcyA8YXNtL2JpdHNw
ZXJsb25nLmg+LCBzbyB0aGVyZSBpcw0KPiBubyBsb25nZXIgImluY2x1ZGUgZmlsZSByZWN1cnNp
b24gaGVsbCIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPg0KDQpBcHBsaWVkIHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtz
LA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3Ug
YmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5i
dXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
