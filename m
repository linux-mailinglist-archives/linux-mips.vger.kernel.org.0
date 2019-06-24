Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F4D51CF3
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732243AbfFXVQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:24 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com ([40.107.79.98]:2896
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731729AbfFXVQX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtznb+V9uopP1Gcy2eNnxMVaB0V9A3d2d1MFamP0oJQ=;
 b=cA4Da+ECBt1aPiZjyGxIoeDBzZUDcDNReWmz6OIDT2IvI9wVu0WP0oxQW+LtxRlVGM9kDpdaSl/rlag/xL1sNfUxPVwcTkx5RtUeZTuKqszVEBqN1nGcCjfwIcsjQaHM9/QTyQa6gcYtBsyf2h47lQ+tG5Bgi9IBnIiylrfjCiw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:19 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:19 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 4/8 v2] MIPS: ralink: mt7628a.dtsi: Add GPIO controller DT
  node
Thread-Topic: [PATCH 4/8 v2] MIPS: ralink: mt7628a.dtsi: Add GPIO controller
 DT  node
Thread-Index: AQHVKtIR8jgVkSnJqkCrvQv1j0dEUA==
Date:   Mon, 24 Jun 2019 21:16:19 +0000
Message-ID: <MWHPR2201MB1277980DA8B83D5182F5C318C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-4-sr@denx.de>
In-Reply-To: <20190527091323.4582-4-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c89e5ccb-7def-4abf-b17b-08d6f8e9336f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB13758E7B982CE9E356D81009C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U0RDf6ibauC3tluzRPy+bdWulBJ6kqxwW/Bvaeqb7FjnrqpkKVZPxjmK3tHRDgOEBAvPmforyYvITXgWTRMaXCSaryzOuaAECWsQCLMQl3dKjRYi1WwT9cRV3PjLvRJFpc7C8UUdW2PFjZkt4rFCRcevVSEXC82IZvoaIeSuKL4uMA8FYwVws49ou1AGYtmFTEn0ui9hVigomZqkf47M/KFmSXRdKhhAZ6iUaJ31Q30MdBkWZ/ELEEO0wCQxmAtID2VMyKA2iwryyk8Lzc+70X9MqG6fRX0FYtkLnam3sbHDc3vm3I6y3DQGHsBI9Y8eBeUL3dHkDJWo9wS11bQQAdYoAH+nVcTCfrg0KJuMiAZXRLiKxrf+Ukf82W1lgrXoDZ3tt3HLLG9nbz3vE6eaoyo8h9ys1AFZqoKN7BCngVU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89e5ccb-7def-4abf-b17b-08d6f8e9336f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:19.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBHUElP
IGNvbnRyb2xsZXIgZGVzY3JpcHRpb24gdG8gdGhlIE1UNzYyOEEgZHRzaSBmaWxlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPg0KPiBDYzogUGF1bCBCdXJ0
b24gPHBhdWwuYnVydG9uQG1pcHMuY29tPg0KPiBDYzogSGFydmV5IEh1bnQgPGhhcnZleWh1bnRu
ZXh1c0BnbWFpbC5jb20+DQo+IENjOiBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+DQoN
CkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVz
c2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29y
cmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQg
aXQuIF0NCg==
