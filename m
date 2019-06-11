Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9AB41827
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2019 00:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392115AbfFKWa2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 18:30:28 -0400
Received: from mail-eopbgr750139.outbound.protection.outlook.com ([40.107.75.139]:23190
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392112AbfFKWa2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 18:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSKch9pAjX7S4XLgSqDkmTqW8yTRUUfmXjtxyR6xbKk=;
 b=CtAwYJF1S9rhGzmI1R1rUvW8Q0lXLb6AgFhjzYIRNVNxBYMuVU8tUWVUNamgbEV9Q0R1Sn2tPsGA465AwP49SZsWppA5g77JatiWtu1sM9xPDlLW2K7mCn0Jz0OqxB/PIpGRAKnYzy+rCq2R46xmFv7380Y5ez7Emv/+/eQhMik=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1014.namprd22.prod.outlook.com (10.171.220.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 22:30:25 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::d571:f49f:6a5c:4962%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 22:30:25 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ftrace: Reword prepare_ftrace_return() comment
 block
Thread-Topic: [PATCH] MIPS: ftrace: Reword prepare_ftrace_return() comment
 block
Thread-Index: AQHVHSVJKYmUWPtEQE6QKD+e1RbfTqaXEDmA
Date:   Tue, 11 Jun 2019 22:30:25 +0000
Message-ID: <CY4PR2201MB127245FB035671563D1BD9ACC1ED0@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190607113640.15191-1-geert+renesas@glider.be>
In-Reply-To: <20190607113640.15191-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de730ac6-6485-49ae-ef90-08d6eebc65d7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY4PR2201MB1014;
x-ms-traffictypediagnostic: CY4PR2201MB1014:
x-microsoft-antispam-prvs: <CY4PR2201MB101476346479E74A434F5E81C1ED0@CY4PR2201MB1014.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(366004)(39840400004)(346002)(199004)(189003)(476003)(8676002)(446003)(486006)(4326008)(11346002)(7696005)(2906002)(6506007)(386003)(26005)(52116002)(102836004)(316002)(76176011)(66066001)(68736007)(6116002)(99286004)(33656002)(3846002)(55016002)(44832011)(9686003)(186003)(6246003)(305945005)(66476007)(54906003)(52536014)(71200400001)(71190400001)(66556008)(64756008)(66946007)(7736002)(66446008)(5660300002)(8936002)(25786009)(14454004)(73956011)(53936002)(74316002)(478600001)(42882007)(229853002)(81166006)(81156014)(558084003)(6436002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1014;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mteBN8MtZBBb0WVB8lS09dzrxDWAROcj5H6loKXUV+T8uR/R3Xvyo9KIjNBjwYwLWWOd03rAQ+gD/6/Tpw5Gr4LdlPnKDJSyMdldjycjDtPxumCvZAIaXVVrEMqehriiOfF1MphEy0cjploBOyB+13nnZdsAWsFUAFUI9LAXUYLbVAToPiLsv71JDLp3AvhWnX9V/NtWgfZW8+YK+AuqylK19Q7f5bOm5AvlWojM3Ao6SvAU71lZckG2LYJTxi04er4IqylXTi40L98ldmYRo3I0Gr2sB7QS2P5icaYfM7m4buf31g2ZkdMBBvXfRMR+pZbOMzlZnf/2/ahdZbatkiclRGNTAJPCRFzlTAMvKTSHSHC5FTAvvkXPxaowLZjuAdzxePdeDiPaT/BzYT6N3qcI1D65m5krO0jCGVLurX0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de730ac6-6485-49ae-ef90-08d6eebc65d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 22:30:25.3630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1014
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gSW1wcm92ZSB0aGUgY29tbWVu
dCBibG9jayBmb3IgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpBcHBsaWVk
IHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2Fz
IGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAg
dGhlbiBwbGVhc2UgZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
