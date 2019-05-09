Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A0E195D5
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 01:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfEIXwz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 19:52:55 -0400
Received: from mail-eopbgr780125.outbound.protection.outlook.com ([40.107.78.125]:53344
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726620AbfEIXwy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 May 2019 19:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN4jAjM1hpug2sClUmlwG3sS+Uczra/Bb5zm3kP9bKA=;
 b=aZ+UJM9PFjVVhALqCyrUWCxSKqs7Xp3AsA4sUVv+nIqf/lxlGksbpbbYIgvAMr+/wPo9POeueMX7Y4R8A10U7dmhS8mPd7KvipkQM+o4v/zuxzjeVALq+bdxoOZfojHKkVJAiaQSKAve/F+cubJa96KCHuMz5crfjC0eD+t9YRM=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1207.namprd22.prod.outlook.com (10.171.210.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 23:52:52 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 23:52:52 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Fix Ingenic SoCs sometimes reporting wrong ISA
Thread-Topic: [PATCH v2] MIPS: Fix Ingenic SoCs sometimes reporting wrong ISA
Thread-Index: AQHVBSLAFcKjp41SXk2MS73G+/VHhKZjelgA
Date:   Thu, 9 May 2019 23:52:52 +0000
Message-ID: <CY4PR2201MB12721916F1A614679A308F7EC1330@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190507221755.3396-1-paul@crapouillou.net>
In-Reply-To: <20190507221755.3396-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0069.namprd08.prod.outlook.com
 (2603:10b6:a03:117::46) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.154.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61e12dc6-fac9-45f4-d4e9-08d6d4d9728c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR2201MB1207;
x-ms-traffictypediagnostic: CY4PR2201MB1207:
x-microsoft-antispam-prvs: <CY4PR2201MB1207CBC081889FA5632EA7E8C1330@CY4PR2201MB1207.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(136003)(376002)(346002)(39850400004)(396003)(366004)(189003)(199004)(2906002)(486006)(53936002)(446003)(6116002)(6246003)(256004)(476003)(11346002)(4326008)(76176011)(74316002)(6436002)(25786009)(186003)(9686003)(3846002)(54906003)(42882007)(55016002)(44832011)(33656002)(71190400001)(71200400001)(305945005)(68736007)(6916009)(316002)(229853002)(102836004)(386003)(6506007)(7736002)(478600001)(4744005)(52536014)(26005)(8936002)(66066001)(66446008)(81166006)(81156014)(8676002)(66946007)(66556008)(64756008)(73956011)(66476007)(99286004)(5660300002)(52116002)(14454004)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1207;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iw9EH6t/TcwsN4QjEdiKxE1OAeRg0/Tp+I1ZSgOaCx6qsDd7oQKZwaLhRVwVcf32HQ7MLty/dkTaKmlRoXvVvSLZq30pvGkVWQ5A6AW/5mRlamw4ifoSjZQHe23lUseUMjylNUDfV0YUh80a7w/2ug0hxfDTSejSCQqg+BlUkK2e27beNyarwWlB+jnqa6B9asqtBj3Kv1abwbhLcawIXAD1j78bJqtsaAw5pJ3CvXQxM9tvYXkqpui1snMVPBaj+PkN7MgFNhV5AS1LywkWN3Ms4cinHF98I3Fc+hz7Vl0qrfBQD4l9x1VX8EMqvDeWFGI102KFO4cr4hOBtMMvLTEy6sWETqO9bJpkHPK3+A7W385zN2xOVGKznfAUKuN4R5E8XE1BsawhcF68RmU07+2JWPbtafAG0L79QbkLllk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e12dc6-fac9-45f4-d4e9-08d6d4d9728c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 23:52:52.5667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1207
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClBhdWwgQ2VyY3VlaWwgd3JvdGU6DQo+IFRoZSBjb25maWcwIHJlZ2lzdGVyIGlu
IHRoZSBYYnVyc3QgQ1BVcyB3aXRoIGEgcHJvY2Vzc29yIElEIG9mDQo+IFBSSURfQ09NUF9JTkdF
TklDX0QwIHJlcG9ydCB0aGVtc2VsdmVzIGFzIE1JUFMzMnIyIGNvbXBhdGlibGUsDQo+IGJ1dCB0
aGV5IGRvbid0IGFjdHVhbGx5IHN1cHBvcnQgdGhpcyBJU0EuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4NCg0KQXBwbGllZCB0byBtaXBz
LW5leHQuDQoNClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdl
bmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxl
YXNlIGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
